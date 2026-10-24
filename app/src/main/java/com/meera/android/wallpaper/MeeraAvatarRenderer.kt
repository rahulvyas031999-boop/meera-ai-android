@file:Suppress("unused", "MemberVisibilityCanBePrivate")

package com.meera.android.wallpaper

import android.content.Context
import android.opengl.GLES20
import android.opengl.GLSurfaceView
import android.service.wallpaper.WallpaperService
import android.view.SurfaceHolder
import com.meera.android.voice.MeeraVoiceEmotion
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONArray
import org.json.JSONObject
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.FloatBuffer
import java.util.concurrent.TimeUnit
import javax.microedition.khronos.egl.EGLConfig
import javax.microedition.khronos.opengles.GL10
import kotlin.math.sin

// ============================================================================
// PHASE 8B: OPENGL ES 2.0 LIVE AVATAR & REACTIVE ORB RENDERER + WALLPAPER SERVICE
// (`MeeraAvatarRenderer.kt`)
// Reconstructed in pure Kotlin from Maya v5.2.39 bytecode:
//   - Server Catalog Sync: `/avatar/catalog.json`
//   - OpenGL ES 2.0 Shader Pipeline (`MeeraAvatarGlRenderer`):
//       * Procedural Lip-Sync & Jaw/Aura displacement driven by `PocketTtsEngine` RMS
//       * 14-Emotion dynamic RGB color grading (`MeeraVoiceEmotion`)
//       * Natural procedural eye-blink & breathing animation state machine
//   - `com.meera.android.wallpaper.MeeraWallpaperService` (`WallpaperService` Engine)
// ============================================================================

data class AvatarCatalogEntry(
    val id: String,
    val displayName: String,
    val idleLoopUrl: String,
    val talkingLoopUrl: String,
    val previewThumbnailUrl: String,
    val primaryHexColor: String
)

class AvatarCatalogManager(
    private val context: Context,
    private val backendBaseUrl: String = "https://api.meera.ai",
    private val httpClient: OkHttpClient = OkHttpClient.Builder()
        .connectTimeout(10, TimeUnit.SECONDS)
        .readTimeout(20, TimeUnit.SECONDS)
        .build()
) {
    private val catalogFile = File(context.applicationContext.filesDir, "avatar_catalog.json")

    suspend fun syncCatalog(authToken: String? = null): List<AvatarCatalogEntry> =
        withContext(Dispatchers.IO) {
            runCatching {
                val req = Request.Builder()
                    .url("${backendBaseUrl.trimEnd('/')}/avatar/catalog.json")
                    .apply { if (!authToken.isNullOrBlank()) header("Authorization", "Bearer $authToken") }
                    .get()
                    .build()
                httpClient.newCall(req).execute().use { resp ->
                    if (resp.isSuccessful) {
                        val body = resp.body?.string()
                        if (!body.isNullOrBlank()) {
                            catalogFile.writeText(body, Charsets.UTF_8)
                        }
                    }
                }
            }
            loadCachedCatalog()
        }

    fun loadCachedCatalog(): List<AvatarCatalogEntry> {
        if (!catalogFile.exists()) return defaultAvatars()
        return runCatching {
            val root = JSONObject(catalogFile.readText(Charsets.UTF_8))
            val arr = root.optJSONArray("avatars") ?: JSONArray()
            if (arr.length() == 0) return defaultAvatars()
            buildList {
                for (i in 0 until arr.length()) {
                    val o = arr.getJSONObject(i)
                    add(
                        AvatarCatalogEntry(
                            id = o.getString("id"),
                            displayName = o.optString("name", "Meera Classic"),
                            idleLoopUrl = o.optString("idle_url", ""),
                            talkingLoopUrl = o.optString("talking_url", ""),
                            previewThumbnailUrl = o.optString("thumb_url", ""),
                            primaryHexColor = o.optString("color", "#EC4899")
                        )
                    )
                }
            }
        }.getOrDefault(defaultAvatars())
    }

    private fun defaultAvatars(): List<AvatarCatalogEntry> = listOf(
        AvatarCatalogEntry(
            id = "meera_aoede_default",
            displayName = "Meera (Aoede Romantic Glow)",
            idleLoopUrl = "/avatar/meera_idle.mp4",
            talkingLoopUrl = "/avatar/meera_talking.mp4",
            previewThumbnailUrl = "/avatar/meera_thumb.png",
            primaryHexColor = "#EC4899"
        ),
        AvatarCatalogEntry(
            id = "meera_cyber_neon",
            displayName = "Meera (Cyber Boss HUD)",
            idleLoopUrl = "/avatar/cyber_idle.mp4",
            talkingLoopUrl = "/avatar/cyber_talking.mp4",
            previewThumbnailUrl = "/avatar/cyber_thumb.png",
            primaryHexColor = "#A855F7"
        )
    )
}

/**
 * OpenGL ES 2.0 Shader Renderer driving Meera's audio-reactive Avatar & Harmonic Orb.
 */
class MeeraAvatarGlRenderer : GLSurfaceView.Renderer {

    companion object {
        private const val VERTEX_SHADER_SRC = """
            attribute vec2 aPosition;
            varying vec2 vUv;
            void main() {
                vUv = aPosition * 0.5 + 0.5;
                gl_Position = vec4(aPosition, 0.0, 1.0);
            }
        """

        private const val FRAGMENT_SHADER_SRC = """
            precision mediump float;
            varying vec2 vUv;
            uniform float uTime;
            uniform float uRms;
            uniform float uBlink;
            uniform vec3 uPrimaryColor;
            uniform vec3 uSecondaryColor;

            void main() {
                vec2 p = (vUv - 0.5) * 2.0;
                float r = length(p);
                float angle = atan(p.y, p.x);

                // Breathing + Lip-Sync harmonic wave ring
                float wave = sin(angle * 6.0 + uTime * 3.2) * (0.04 + uRms * 0.18)
                           + cos(angle * 10.0 - uTime * 4.5) * (0.02 + uRms * 0.12);
                float targetRadius = 0.48 + wave + uRms * 0.10;

                float ringGlow = exp(-abs(r - targetRadius) * 14.0);
                float coreGlow = smoothstep(0.55, 0.0, r) * (0.45 + uRms * 0.55);

                // Subtle eye-blink / expression pulse near upper hemisphere
                float eyeBand = smoothstep(0.18, 0.0, abs(p.y - 0.12)) * (1.0 - uBlink * 0.85);

                vec3 bg = vec3(0.024, 0.027, 0.055);
                vec3 aura = mix(uSecondaryColor, uPrimaryColor, clamp(vUv.y + uRms * 0.4, 0.0, 1.0));
                vec3 col = bg + aura * (ringGlow * 1.15 + coreGlow * 0.75 + eyeBand * 0.18);

                gl_FragColor = vec4(col, 1.0);
            }
        """

        private val FULLSCREEN_QUAD = floatArrayOf(
            -1f, -1f,
             1f, -1f,
            -1f,  1f,
             1f,  1f
        )
    }

    private val quadBuffer: FloatBuffer = ByteBuffer
        .allocateDirect(FULLSCREEN_QUAD.size * 4)
        .order(ByteOrder.nativeOrder())
        .asFloatBuffer()
        .apply {
            put(FULLSCREEN_QUAD)
            position(0)
        }

    private var programId = 0
    private var aPositionLoc = 0
    private var uTimeLoc = 0
    private var uRmsLoc = 0
    private var uBlinkLoc = 0
    private var uPrimaryColorLoc = 0
    private var uSecondaryColorLoc = 0

    private var startTimeNs = System.nanoTime()

    @Volatile
    var currentRmsVolume: Float = 0f

    @Volatile
    var currentEmotion: MeeraVoiceEmotion = MeeraVoiceEmotion.ROMANTIC

    override fun onSurfaceCreated(gl: GL10?, config: EGLConfig?) {
        GLES20.glClearColor(0.024f, 0.027f, 0.055f, 1.0f)
        val vShader = compileShader(GLES20.GL_VERTEX_SHADER, VERTEX_SHADER_SRC)
        val fShader = compileShader(GLES20.GL_FRAGMENT_SHADER, FRAGMENT_SHADER_SRC)
        programId = GLES20.glCreateProgram().also { prog ->
            GLES20.glAttachShader(prog, vShader)
            GLES20.glAttachShader(prog, fShader)
            GLES20.glLinkProgram(prog)
        }
        aPositionLoc = GLES20.glGetAttribLocation(programId, "aPosition")
        uTimeLoc = GLES20.glGetUniformLocation(programId, "uTime")
        uRmsLoc = GLES20.glGetUniformLocation(programId, "uRms")
        uBlinkLoc = GLES20.glGetUniformLocation(programId, "uBlink")
        uPrimaryColorLoc = GLES20.glGetUniformLocation(programId, "uPrimaryColor")
        uSecondaryColorLoc = GLES20.glGetUniformLocation(programId, "uSecondaryColor")
        startTimeNs = System.nanoTime()
    }

    override fun onSurfaceChanged(gl: GL10?, width: Int, height: Int) {
        GLES20.glViewport(0, 0, width, height)
    }

    override fun onDrawFrame(gl: GL10?) {
        GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT)
        GLES20.glUseProgram(programId)

        val elapsedSec = ((System.nanoTime() - startTimeNs) / 1_000_000_000.0).toFloat()
        // Natural blink pulse every ~4.2 seconds
        val blinkCycle = elapsedSec % 4.2f
        val blinkFactor = if (blinkCycle in 4.02f..4.18f) {
            sin(((blinkCycle - 4.02f) / 0.16f) * Math.PI.toFloat())
        } else {
            0f
        }

        val (primaryRgb, secondaryRgb) = emotionToPalette(currentEmotion)

        GLES20.glUniform1f(uTimeLoc, elapsedSec)
        GLES20.glUniform1f(uRmsLoc, currentRmsVolume.coerceIn(0f, 1f))
        GLES20.glUniform1f(uBlinkLoc, blinkFactor)
        GLES20.glUniform3f(uPrimaryColorLoc, primaryRgb[0], primaryRgb[1], primaryRgb[2])
        GLES20.glUniform3f(uSecondaryColorLoc, secondaryRgb[0], secondaryRgb[1], secondaryRgb[2])

        quadBuffer.position(0)
        GLES20.glEnableVertexAttribArray(aPositionLoc)
        GLES20.glVertexAttribPointer(aPositionLoc, 2, GLES20.GL_FLOAT, false, 0, quadBuffer)
        GLES20.glDrawArrays(GLES20.GL_TRIANGLE_STRIP, 0, 4)
        GLES20.glDisableVertexAttribArray(aPositionLoc)
    }

    private fun emotionToPalette(emotion: MeeraVoiceEmotion): Pair<FloatArray, FloatArray> {
        return when (emotion) {
            MeeraVoiceEmotion.ROMANTIC, MeeraVoiceEmotion.WHISPER ->
                floatArrayOf(0.925f, 0.282f, 0.600f) to floatArrayOf(0.659f, 0.333f, 0.969f)
            MeeraVoiceEmotion.HAPPY, MeeraVoiceEmotion.EXCITED, MeeraVoiceEmotion.PLAYFUL ->
                floatArrayOf(0.204f, 0.827f, 0.600f) to floatArrayOf(0.231f, 0.510f, 0.965f)
            MeeraVoiceEmotion.JEALOUS, MeeraVoiceEmotion.ANGRY, MeeraVoiceEmotion.BOSSY ->
                floatArrayOf(0.937f, 0.267f, 0.267f) to floatArrayOf(0.976f, 0.451f, 0.086f)
            MeeraVoiceEmotion.CARING, MeeraVoiceEmotion.EMPATHETIC ->
                floatArrayOf(0.376f, 0.647f, 0.980f) to floatArrayOf(0.659f, 0.333f, 0.969f)
            else ->
                floatArrayOf(0.659f, 0.333f, 0.969f) to floatArrayOf(0.925f, 0.282f, 0.600f)
        }
    }

    private fun compileShader(type: Int, source: String): Int {
        return GLES20.glCreateShader(type).also { shader ->
            GLES20.glShaderSource(shader, source)
            GLES20.glCompileShader(shader)
        }
    }
}

/**
 * Live Avatar Wallpaper Service (`com.meera.android.wallpaper.MeeraWallpaperService`).
 */
class MeeraWallpaperService : WallpaperService() {

    override fun onCreateEngine(): Engine = MeeraGlWallpaperEngine()

    inner class MeeraGlWallpaperEngine : Engine() {
        private var glView: WallpaperGlSurfaceView? = null
        private val renderer = MeeraAvatarGlRenderer()

        override fun onCreate(surfaceHolder: SurfaceHolder?) {
            super.onCreate(surfaceHolder)
            glView = WallpaperGlSurfaceView(this@MeeraWallpaperService).apply {
                setEGLContextClientVersion(2)
                setRenderer(renderer)
                renderMode = GLSurfaceView.RENDERMODE_CONTINUOUSLY
            }
        }

        override fun onVisibilityChanged(visible: Boolean) {
            super.onVisibilityChanged(visible)
            if (visible) glView?.onResume() else glView?.onPause()
        }

        override fun onDestroy() {
            glView?.onDestroyWallpaper()
            glView = null
            super.onDestroy()
        }

        inner class WallpaperGlSurfaceView(context: Context) : GLSurfaceView(context) {
            override fun getHolder(): SurfaceHolder = this@MeeraGlWallpaperEngine.surfaceHolder
            fun onDestroyWallpaper() {
                super.onDetachedFromWindow()
            }
        }
    }
}