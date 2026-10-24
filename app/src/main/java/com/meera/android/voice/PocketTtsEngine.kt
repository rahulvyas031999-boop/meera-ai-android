@file:Suppress("unused", "MemberVisibilityCanBePrivate")

package com.meera.android.voice

import android.content.Context
import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTrack
import android.os.Bundle
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import android.util.Base64
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.currentCoroutineContext
import kotlinx.coroutines.delay
import kotlinx.coroutines.ensureActive
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import kotlinx.coroutines.withContext
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONArray
import org.json.JSONObject
import java.io.File
import java.io.FileOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import java.util.Locale
import java.util.UUID
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean
import kotlin.coroutines.resume
import kotlin.math.sqrt

// ============================================================================
// PHASE 6A: ON-DEVICE NEURAL TTS ENGINE (`PocketTtsEngine.kt`)
// Reconstructed in pure Kotlin from Maya v5.2.39 bytecode:
//   - Native JNI bridge: `libonnxruntime.so` + `libpockettts_jni.so` (`PocketTtsNative`)
//   - Server OTA Voice Pack Manager: `/models/tts/dost/v2/` (`.mvp` graphs + 14 emotion voices)
//   - 3-Tier Synthesis Pipeline:
//       Tier 1: On-Device Neural TTS (`PocketTtsNative` 24 kHz streaming PCM)
//       Tier 2: Cloud Neural TTS (`/tts/v1/speak` & Gemini 2.5 Flash Preview TTS `Aoede` 24 kHz)
//       Tier 3: Android System `TextToSpeech` (`hi-IN` / `en-IN`) zero-latency offline fallback
//   - Real-time AudioTrack PCM streamer with Lip-Sync RMS telemetry & instant Barge-In abort
// ============================================================================

/**
 * JNI Bridge for `libpockettts_jni.so` (`com.meera.android.voice.PocketTtsNative`).
 * Wraps the native ONNX/MVP flow-matching neural speech synthesizer.
 */
object PocketTtsNative {

    private val nativeLoaded = AtomicBoolean(false)

    val isAvailable: Boolean
        get() = nativeLoaded.get()

    init {
        runCatching {
            System.loadLibrary("onnxruntime")
            System.loadLibrary("pockettts_jni")
            nativeLoaded.set(true)
        }.onFailure {
            nativeLoaded.set(false)
        }
    }

    @JvmStatic
    external fun nativeInit(
        mvpGraphPath: String,
        voicesDirPath: String,
        tokensPath: String,
        numThreads: Int
    ): Long

    @JvmStatic
    external fun nativeSetEmotionVoice(
        handle: Long,
        emotionId: String,
        speakerEmbedding: FloatArray,
        speed: Float,
        pitchShift: Float,
        energyScale: Float
    ): Boolean

    @JvmStatic
    external fun nativeSynthesizeStream(
        handle: Long,
        normalizedText: String,
        emotionId: String,
        speed: Float,
        chunkCallback: PcmChunkCallback
    ): Int

    @JvmStatic
    external fun nativeSynthesizeFull(
        handle: Long,
        normalizedText: String,
        emotionId: String,
        speed: Float
    ): FloatArray?

    @JvmStatic
    external fun nativeAbort(handle: Long)

    @JvmStatic
    external fun nativeRelease(handle: Long)

    fun interface PcmChunkCallback {
        /**
         * Invoked from native C++ thread as each 24 kHz float PCM chunk is decoded.
         * Return `false` to immediately abort synthesis (barge-in).
         */
        fun onChunk(pcm24k: FloatArray, isFinalChunk: Boolean): Boolean
    }
}

/**
 * 14 Expressive Emotion Voice Styles supported by `/models/tts/dost/v2/`
 * and Gemini `Aoede` / `Kore` / `Despina` / `Leda` / `Zephyr` voice profiles.
 */
enum class MeeraVoiceEmotion(
    val id: String,
    val defaultSpeed: Float,
    val defaultPitch: Float,
    val energyScale: Float,
    val geminiVoiceName: String,
    val stylePromptHint: String
) {
    NEUTRAL("neutral", 1.02f, 1.00f, 1.00f, "Aoede", "natural, warm Hinglish tone"),
    HAPPY("happy", 1.06f, 1.08f, 1.12f, "Aoede", "cheerful, smiling, upbeat tone"),
    ROMANTIC("romantic", 0.95f, 1.04f, 0.90f, "Kore", "soft, affectionate, loving girlfriend tone"),
    CARING("caring", 0.96f, 1.02f, 0.92f, "Leda", "gentle, soothing, deeply caring tone"),
    PLAYFUL("playful", 1.08f, 1.10f, 1.10f, "Despina", "playful, teasing, lively tone"),
    TEASING("teasing", 1.04f, 1.07f, 1.05f, "Despina", "lighthearted nakhra and playful teasing"),
    SAD("sad", 0.90f, 0.94f, 0.82f, "Leda", "soft, slightly hurt, emotional tone"),
    ANGRY("angry", 1.05f, 1.06f, 1.18f, "Despina", "cute possessive annoyance, firm tone"),
    WHISPER("whisper", 0.92f, 0.98f, 0.68f, "Kore", "intimate, quiet late-night whisper"),
    EXCITED("excited", 1.12f, 1.12f, 1.22f, "Zephyr", "high energy, thrilled, enthusiastic"),
    EMPATHETIC("empathetic", 0.94f, 1.00f, 0.88f, "Leda", "calm, understanding, reassuring"),
    SLEEPY("sleepy", 0.88f, 0.95f, 0.75f, "Kore", "drowsy, cozy, slow bedtime voice"),
    JEALOUS("jealous", 1.06f, 1.09f, 1.14f, "Despina", "possessive, cute jealous girlfriend tone"),
    BOSSY("bossy", 1.03f, 1.03f, 1.10f, "Aoede", "confident, authoritative yet affectionate");

    companion object {
        fun fromId(raw: String?): MeeraVoiceEmotion {
            if (raw.isNullOrBlank()) return NEUTRAL
            val clean = raw.trim().lowercase(Locale.ROOT)
            return entries.firstOrNull { it.id == clean } ?: NEUTRAL
        }
    }
}

/**
 * Production On-Device + Cloud + System Neural TTS Engine (`PocketTtsEngine`).
 */
class PocketTtsEngine(
    private val context: Context,
    private val backendBaseUrl: String = "https://api.meera.ai",
    private val httpClient: OkHttpClient = defaultHttpClient()
) : AutoCloseable {

    companion object {
        const val SAMPLE_RATE_24K = 24000
        private const val MODEL_REL_DIR = "models/tts/dost/v2"
        private const val MVP_GRAPH_FILE = "dost_v2_flow.mvp"
        private const val TOKENS_FILE = "tokens.txt"
        private const val MANIFEST_ENDPOINT = "/models/tts/dost/v2/manifest.json"
        private const val CLOUD_TTS_ENDPOINT = "/tts/v1/speak"
        private const val GEMINI_TTS_MODEL = "gemini-2.5-flash-preview-tts"

        private val EMOTION_TAG_REGEX = Regex("""\[(?:EMOTION|MOOD|VOICE)\s*:\s*([a-zA-Z_]+)\s*]""", RegexOption.IGNORE_CASE)
        private val EMOJI_STRIP_REGEX = Regex("""[\uD83C-\uDBFF\uDC00-\uDFFF\u2600-\u27BF]+""")
        private val MARKDOWN_STRIP_REGEX = Regex("""[*_~`#><]+""")

        private fun defaultHttpClient(): OkHttpClient =
            OkHttpClient.Builder()
                .connectTimeout(10, TimeUnit.SECONDS)
                .readTimeout(25, TimeUnit.SECONDS)
                .writeTimeout(15, TimeUnit.SECONDS)
                .build()
    }

    data class TtsTelemetry(
        val isSpeaking: Boolean = false,
        val currentEmotion: MeeraVoiceEmotion = MeeraVoiceEmotion.NEUTRAL,
        val activeTier: SynthesisTier = SynthesisTier.IDLE,
        val rmsVolume: Float = 0f,
        val currentUtterance: String = ""
    )

    enum class SynthesisTier {
        IDLE,
        ON_DEVICE_POCKET_TTS,
        GEMINI_AOEDE_LIVE_TTS,
        MEERA_BACKEND_TTS,
        ANDROID_SYSTEM_TTS
    }

    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val initMutex = Mutex()

    private val _telemetry = MutableStateFlow(TtsTelemetry())
    val telemetry: StateFlow<TtsTelemetry> = _telemetry.asStateFlow()

    private val modelDir = File(context.applicationContext.filesDir, MODEL_REL_DIR)
    private val voicesDir = File(modelDir, "voices")

    @Volatile
    private var nativeHandle: Long = 0L

    @Volatile
    private var activeAudioTrack: AudioTrack? = null

    @Volatile
    private var activeSpeechJob: Job? = null

    private val abortRequested = AtomicBoolean(false)
    private val voiceEmbeddings = HashMap<MeeraVoiceEmotion, FloatArray>()

    // Android System TTS fallback
    @Volatile
    private var systemTts: TextToSpeech? = null
    private val systemTtsReady = AtomicBoolean(false)

    init {
        initSystemTtsFallback()
    }

    private fun initSystemTtsFallback() {
        runCatching {
            systemTts = TextToSpeech(context.applicationContext) { status ->
                if (status == TextToSpeech.SUCCESS) {
                    val hiLocale = Locale("hi", "IN")
                    val res = systemTts?.setLanguage(hiLocale)
                    if (res == TextToSpeech.LANG_MISSING_DATA || res == TextToSpeech.LANG_NOT_SUPPORTED) {
                        systemTts?.setLanguage(Locale("en", "IN"))
                    }
                    systemTts?.setPitch(1.12f)
                    systemTts?.setSpeechRate(1.02f)
                    systemTtsReady.set(true)
                }
            }
        }
    }

    /**
     * Synchronizes `/models/tts/dost/v2/` `.mvp` neural graph and 14 emotion voice embeddings
     * from the backend server, verifying SHA-256 digests before atomic installation.
     */
    suspend fun syncAndInitializeModels(authToken: String? = null, numThreads: Int = 2): Boolean =
        initMutex.withLock {
            withContext(Dispatchers.IO) {
                if (!modelDir.exists()) modelDir.mkdirs()
                if (!voicesDir.exists()) voicesDir.mkdirs()

                // 1. Attempt OTA manifest sync if files are missing
                val mvpFile = File(modelDir, MVP_GRAPH_FILE)
                val tokensFile = File(modelDir, TOKENS_FILE)
                if (!mvpFile.exists() || !tokensFile.exists()) {
                    runCatching { downloadManifestAssets(authToken) }
                }

                // 2. Load 14 emotion speaker embedding vectors (`.bin` float32 arrays)
                for (emotion in MeeraVoiceEmotion.entries) {
                    val binFile = File(voicesDir, "${emotion.id}.bin")
                    val vec = if (binFile.exists() && binFile.length() >= 256) {
                        readFloatEmbeddingFile(binFile)
                    } else {
                        buildDeterministicEmotionEmbedding(emotion)
                    }
                    voiceEmbeddings[emotion] = vec
                }

                // 3. Initialize JNI PocketTtsNative if `.mvp` graph and JNI library are present
                if (PocketTtsNative.isAvailable && mvpFile.exists() && tokensFile.exists()) {
                    if (nativeHandle != 0L) {
                        runCatching { PocketTtsNative.nativeRelease(nativeHandle) }
                        nativeHandle = 0L
                    }
                    nativeHandle = runCatching {
                        PocketTtsNative.nativeInit(
                            mvpGraphPath = mvpFile.absolutePath,
                            voicesDirPath = voicesDir.absolutePath,
                            tokensPath = tokensFile.absolutePath,
                            numThreads = numThreads
                        )
                    }.getOrDefault(0L)
                }

                nativeHandle != 0L || systemTtsReady.get()
            }
        }

    private fun downloadManifestAssets(authToken: String?) {
        val reqBuilder = Request.Builder()
            .url("${backendBaseUrl.trimEnd('/')}$MANIFEST_ENDPOINT")
            .get()
        if (!authToken.isNullOrBlank()) {
            reqBuilder.header("Authorization", "Bearer $authToken")
        }

        httpClient.newCall(reqBuilder.build()).execute().use { resp ->
            if (!resp.isSuccessful) return
            val bodyStr = resp.body?.string() ?: return
            val manifest = JSONObject(bodyStr)
            val filesArr = manifest.optJSONArray("files") ?: JSONArray()

            for (i in 0 until filesArr.length()) {
                val item = filesArr.getJSONObject(i)
                val relPath = item.getString("path")
                val downloadUrl = item.optString("url").ifBlank {
                    "${backendBaseUrl.trimEnd('/')}/models/tts/dost/v2/$relPath"
                }
                val expectedSha256 = item.optString("sha256", "")
                val targetFile = File(modelDir, relPath)
                targetFile.parentFile?.mkdirs()

                if (targetFile.exists() && expectedSha256.isNotEmpty() && sha256Hex(targetFile) == expectedSha256) {
                    continue
                }

                val tmpFile = File(targetFile.parentFile, "${targetFile.name}.tmp")
                val fileReq = Request.Builder().url(downloadUrl).get().build()
                httpClient.newCall(fileReq).execute().use { fileResp ->
                    if (!fileResp.isSuccessful) return@use
                    fileResp.body?.byteStream()?.use { input ->
                        FileOutputStream(tmpFile).use { output ->
                            input.copyTo(output)
                        }
                    }
                    if (expectedSha256.isEmpty() || sha256Hex(tmpFile) == expectedSha256) {
                        tmpFile.renameTo(targetFile)
                    } else {
                        tmpFile.delete()
                    }
                }
            }
        }
    }

    /**
     * Parses inline emotion markers (e.g. `[EMOTION:romantic]`) and cleans raw LLM text
     * for clean Hinglish/Hindi TTS pronunciation.
     */
    fun extractEmotionAndCleanText(
        rawText: String,
        fallbackEmotion: MeeraVoiceEmotion = MeeraVoiceEmotion.NEUTRAL
    ): Pair<MeeraVoiceEmotion, String> {
        var detectedEmotion = fallbackEmotion
        val match = EMOTION_TAG_REGEX.find(rawText)
        if (match != null) {
            detectedEmotion = MeeraVoiceEmotion.fromId(match.groupValues[1])
        }

        val cleaned = rawText
            .replace(EMOTION_TAG_REGEX, "")
            .replace(EMOJI_STRIP_REGEX, "")
            .replace(MARKDOWN_STRIP_REGEX, "")
            .replace(Regex("""\s+"""), " ")
            .trim()

        return detectedEmotion to cleaned
    }

    /**
     * Immediately interrupts any ongoing speech synthesis and flushes the hardware AudioTrack.
     * Invoked automatically when `SpeechGate` detects user barge-in during playback.
     */
    fun stopSpeaking() {
        abortRequested.set(true)
        if (nativeHandle != 0L && PocketTtsNative.isAvailable) {
            runCatching { PocketTtsNative.nativeAbort(nativeHandle) }
        }
        activeSpeechJob?.cancel()
        activeSpeechJob = null

        runCatching {
            activeAudioTrack?.let { track ->
                if (track.playState == AudioTrack.PLAYSTATE_PLAYING) {
                    track.pause()
                    track.flush()
                }
                track.release()
            }
        }
        activeAudioTrack = null
        runCatching { systemTts?.stop() }

        _telemetry.value = TtsTelemetry(
            isSpeaking = false,
            currentEmotion = _telemetry.value.currentEmotion,
            activeTier = SynthesisTier.IDLE,
            rmsVolume = 0f,
            currentUtterance = ""
        )
    }

    /**
     * Synthesizes and plays an utterance using the 3-tier fallback pipeline:
     *   1. On-Device `PocketTtsNative` (`.mvp` + 14 emotion embeddings)
     *   2. Gemini `Aoede` / `Kore` 24 kHz Live TTS or Meera Backend `/tts/v1/speak`
     *   3. Android System `TextToSpeech` (`hi-IN`)
     */
    suspend fun speak(
        rawText: String,
        preferredEmotion: MeeraVoiceEmotion? = null,
        geminiApiKey: String? = null,
        preferredGeminiVoice: String? = null,
        backendAuthToken: String? = null,
        onRmsLevel: ((Float) -> Unit)? = null
    ) {
        stopSpeaking()
        abortRequested.set(false)

        val (emotion, cleanText) = extractEmotionAndCleanText(
            rawText,
            preferredEmotion ?: MeeraVoiceEmotion.NEUTRAL
        )
        if (cleanText.isBlank()) return

        withContext(Dispatchers.IO) {
            try {
                // Tier 1: On-Device PocketTTS JNI Engine
                if (nativeHandle != 0L && PocketTtsNative.isAvailable) {
                    val ok = speakWithOnDevicePocketTts(cleanText, emotion, onRmsLevel)
                    if (ok || abortRequested.get()) return@withContext
                }

                // Tier 2A: Gemini 2.5 Flash Preview TTS (Aoede / Kore / Despina 24 kHz PCM)
                if (!geminiApiKey.isNullOrBlank()) {
                    val voiceName = preferredGeminiVoice ?: emotion.geminiVoiceName
                    val ok = speakWithGeminiAoedeTts(cleanText, emotion, geminiApiKey, voiceName, onRmsLevel)
                    if (ok || abortRequested.get()) return@withContext
                }

                // Tier 2B: Meera Backend `/tts/v1/speak`
                if (!backendAuthToken.isNullOrBlank()) {
                    val ok = speakWithBackendTts(cleanText, emotion, backendAuthToken, onRmsLevel)
                    if (ok || abortRequested.get()) return@withContext
                }

                // Tier 3: Android System TextToSpeech (`hi-IN` / `en-IN`)
                speakWithSystemTts(cleanText, emotion, onRmsLevel)
            } finally {
                _telemetry.value = _telemetry.value.copy(
                    isSpeaking = false,
                    activeTier = SynthesisTier.IDLE,
                    rmsVolume = 0f
                )
                onRmsLevel?.invoke(0f)
            }
        }
    }

    private suspend fun speakWithOnDevicePocketTts(
        cleanText: String,
        emotion: MeeraVoiceEmotion,
        onRmsLevel: ((Float) -> Unit)?
    ): Boolean {
        val handle = nativeHandle
        if (handle == 0L) return false

        val embedding = voiceEmbeddings[emotion] ?: buildDeterministicEmotionEmbedding(emotion)
        runCatching {
            PocketTtsNative.nativeSetEmotionVoice(
                handle = handle,
                emotionId = emotion.id,
                speakerEmbedding = embedding,
                speed = emotion.defaultSpeed,
                pitchShift = emotion.defaultPitch,
                energyScale = emotion.energyScale
            )
        }

        val track = createStreamingAudioTrack24k() ?: return false
        activeAudioTrack = track
        track.play()

        _telemetry.value = TtsTelemetry(
            isSpeaking = true,
            currentEmotion = emotion,
            activeTier = SynthesisTier.ON_DEVICE_POCKET_TTS,
            rmsVolume = 0f,
            currentUtterance = cleanText
        )

        var wroteSamples = false
        val status = runCatching {
            PocketTtsNative.nativeSynthesizeStream(
                handle = handle,
                normalizedText = cleanText,
                emotionId = emotion.id,
                speed = emotion.defaultSpeed
            ) { pcmChunk, _ ->
                if (abortRequested.get()) return@nativeSynthesizeStream false
                if (pcmChunk.isNotEmpty()) {
                    wroteSamples = true
                    val rms = computeRms(pcmChunk)
                    _telemetry.value = _telemetry.value.copy(rmsVolume = rms)
                    onRmsLevel?.invoke(rms)
                    writeFloatPcmToTrack(track, pcmChunk)
                }
                !abortRequested.get()
            }
        }.getOrDefault(-1)

        runCatching {
            track.stop()
            track.release()
        }
        if (activeAudioTrack === track) activeAudioTrack = null
        return status == 0 && wroteSamples
    }

    private suspend fun speakWithGeminiAoedeTts(
        cleanText: String,
        emotion: MeeraVoiceEmotion,
        apiKey: String,
        voiceName: String,
        onRmsLevel: ((Float) -> Unit)?
    ): Boolean {
        currentCoroutineContext().ensureActive()
        val url = "https://generativelanguage.googleapis.com/v1beta/models/$GEMINI_TTS_MODEL:generateContent?key=$apiKey"

        val payload = JSONObject().apply {
            put(
                "contents",
                JSONArray().put(
                    JSONObject().put(
                        "parts",
                        JSONArray().put(JSONObject().put("text", cleanText))
                    )
                )
            )
            put(
                "generationConfig",
                JSONObject().apply {
                    put("responseModalities", JSONArray().put("AUDIO"))
                    put(
                        "speechConfig",
                        JSONObject().put(
                            "voiceConfig",
                            JSONObject().put(
                                "prebuiltVoiceConfig",
                                JSONObject().put("voiceName", voiceName)
                            )
                        )
                    )
                }
            )
        }

        val request = Request.Builder()
            .url(url)
            .post(payload.toString().toRequestBody("application/json; charset=utf-8".toMediaType()))
            .build()

        val pcmBytes: ByteArray = runCatching {
            httpClient.newCall(request).execute().use { resp ->
                if (!resp.isSuccessful) return false
                val body = resp.body?.string() ?: return false
                val json = JSONObject(body)
                val base64Audio = json
                    .optJSONArray("candidates")
                    ?.optJSONObject(0)
                    ?.optJSONObject("content")
                    ?.optJSONArray("parts")
                    ?.optJSONObject(0)
                    ?.optJSONObject("inlineData")
                    ?.optString("data", "")
                    ?: ""
                if (base64Audio.isBlank()) return false
                Base64.decode(base64Audio, Base64.DEFAULT)
            }
        }.getOrNull() ?: return false

        _telemetry.value = TtsTelemetry(
            isSpeaking = true,
            currentEmotion = emotion,
            activeTier = SynthesisTier.GEMINI_AOEDE_LIVE_TTS,
            rmsVolume = 0f,
            currentUtterance = cleanText
        )

        return playRawPcm16Le24k(pcmBytes, onRmsLevel)
    }

    private suspend fun speakWithBackendTts(
        cleanText: String,
        emotion: MeeraVoiceEmotion,
        authToken: String,
        onRmsLevel: ((Float) -> Unit)?
    ): Boolean {
        currentCoroutineContext().ensureActive()
        val payload = JSONObject().apply {
            put("text", cleanText)
            put("emotion", emotion.id)
            put("speed", emotion.defaultSpeed.toDouble())
            put("pitch", emotion.defaultPitch.toDouble())
            put("sample_rate", SAMPLE_RATE_24K)
            put("format", "pcm_s16le")
        }

        val request = Request.Builder()
            .url("${backendBaseUrl.trimEnd('/')}$CLOUD_TTS_ENDPOINT")
            .header("Authorization", "Bearer $authToken")
            .post(payload.toString().toRequestBody("application/json; charset=utf-8".toMediaType()))
            .build()

        val pcmBytes = runCatching {
            httpClient.newCall(request).execute().use { resp ->
                if (!resp.isSuccessful) return false
                resp.body?.bytes()
            }
        }.getOrNull() ?: return false

        if (pcmBytes.size < 64) return false

        _telemetry.value = TtsTelemetry(
            isSpeaking = true,
            currentEmotion = emotion,
            activeTier = SynthesisTier.MEERA_BACKEND_TTS,
            rmsVolume = 0f,
            currentUtterance = cleanText
        )

        return playRawPcm16Le24k(pcmBytes, onRmsLevel)
    }

    private suspend fun playRawPcm16Le24k(
        pcm16LeBytes: ByteArray,
        onRmsLevel: ((Float) -> Unit)?
    ): Boolean {
        val track = createStreamingAudioTrack24k() ?: return false
        activeAudioTrack = track
        track.play()

        // Stream in 4800-byte (100 ms @ 24 kHz 16-bit mono) slices for responsive barge-in & lip-sync
        val chunkBytes = 4800
        var offset = 0
        try {
            while (offset < pcm16LeBytes.size && !abortRequested.get()) {
                currentCoroutineContext().ensureActive()
                val len = minOf(chunkBytes, pcm16LeBytes.size - offset)
                val rms = computeRmsFromPcm16Le(pcm16LeBytes, offset, len)
                _telemetry.value = _telemetry.value.copy(rmsVolume = rms)
                onRmsLevel?.invoke(rms)

                val written = track.write(pcm16LeBytes, offset, len)
                if (written < 0) break
                offset += len
            }
            return offset > 0
        } finally {
            runCatching {
                track.stop()
                track.release()
            }
            if (activeAudioTrack === track) activeAudioTrack = null
        }
    }

    private suspend fun speakWithSystemTts(
        cleanText: String,
        emotion: MeeraVoiceEmotion,
        onRmsLevel: ((Float) -> Unit)?
    ): Boolean {
        val tts = systemTts ?: return false
        if (!systemTtsReady.get()) return false

        _telemetry.value = TtsTelemetry(
            isSpeaking = true,
            currentEmotion = emotion,
            activeTier = SynthesisTier.ANDROID_SYSTEM_TTS,
            rmsVolume = 0.35f,
            currentUtterance = cleanText
        )

        tts.setPitch(emotion.defaultPitch)
        tts.setSpeechRate(emotion.defaultSpeed)

        val utteranceId = "meera_utt_${UUID.randomUUID()}"
        val pulseJob = scope.launch {
            var tick = 0
            while (isActive && !abortRequested.get()) {
                val simulatedRms = 0.25f + 0.35f * kotlin.math.abs(kotlin.math.sin(tick * 0.45f))
                _telemetry.value = _telemetry.value.copy(rmsVolume = simulatedRms)
                onRmsLevel?.invoke(simulatedRms)
                tick++
                delay(50L)
            }
        }

        return try {
            suspendCancellableCoroutine { cont ->
                tts.setOnUtteranceProgressListener(object : UtteranceProgressListener() {
                    override fun onStart(id: String?) {}
                    override fun onDone(id: String?) {
                        if (cont.isActive) cont.resume(true)
                    }

                    @Deprecated("Deprecated in Java")
                    override fun onError(id: String?) {
                        if (cont.isActive) cont.resume(false)
                    }

                    override fun onError(id: String?, errorCode: Int) {
                        if (cont.isActive) cont.resume(false)
                    }
                })
                val params = Bundle().apply {
                    putFloat(TextToSpeech.Engine.KEY_PARAM_VOLUME, 1.0f)
                }
                val res = tts.speak(cleanText, TextToSpeech.QUEUE_FLUSH, params, utteranceId)
                if (res != TextToSpeech.SUCCESS && cont.isActive) {
                    cont.resume(false)
                }
            }
        } finally {
            pulseJob.cancel()
        }
    }

    private fun createStreamingAudioTrack24k(): AudioTrack? = runCatching {
        val minBuf = AudioTrack.getMinBufferSize(
            SAMPLE_RATE_24K,
            AudioFormat.CHANNEL_OUT_MONO,
            AudioFormat.ENCODING_PCM_16BIT
        ).coerceAtLeast(4800)

        AudioTrack.Builder()
            .setAudioAttributes(
                AudioAttributes.Builder()
                    .setUsage(AudioAttributes.USAGE_ASSISTANT)
                    .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                    .build()
            )
            .setAudioFormat(
                AudioFormat.Builder()
                    .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                    .setSampleRate(SAMPLE_RATE_24K)
                    .setChannelMask(AudioFormat.CHANNEL_OUT_MONO)
                    .build()
            )
            .setBufferSizeInBytes(minBuf * 2)
            .setTransferMode(AudioTrack.MODE_STREAM)
            .build()
    }.getOrNull()

    private fun writeFloatPcmToTrack(track: AudioTrack, floatPcm: FloatArray) {
        val pcm16 = ShortArray(floatPcm.size) { i ->
            val clamped = floatPcm[i].coerceIn(-1.0f, 1.0f)
            (clamped * 32767.0f).toInt().toShort()
        }
        track.write(pcm16, 0, pcm16.size)
    }

    private fun computeRms(samples: FloatArray): Float {
        if (samples.isEmpty()) return 0f
        var sumSq = 0f
        for (s in samples) sumSq += s * s
        return sqrt(sumSq / samples.size).coerceIn(0f, 1f)
    }

    private fun computeRmsFromPcm16Le(bytes: ByteArray, offset: Int, length: Int): Float {
        val sampleCount = length / 2
        if (sampleCount <= 0) return 0f
        var sumSq = 0.0
        var idx = offset
        val end = offset + sampleCount * 2
        while (idx < end) {
            val lo = bytes[idx].toInt() and 0xFF
            val hi = bytes[idx + 1].toInt()
            val sample = ((hi shl 8) or lo).toShort() / 32768.0
            sumSq += sample * sample
            idx += 2
        }
        return sqrt(sumSq / sampleCount).toFloat().coerceIn(0f, 1f)
    }

    private fun readFloatEmbeddingFile(file: File): FloatArray {
        val bytes = file.readBytes()
        val buf = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
        val count = bytes.size / 4
        return FloatArray(count) { buf.float }
    }

    private fun buildDeterministicEmotionEmbedding(emotion: MeeraVoiceEmotion): FloatArray {
        val dim = 256
        val seed = emotion.id.hashCode()
        val raw = FloatArray(dim) { i ->
            val phase = (i + 1) * 0.073f + (seed and 0xFF) * 0.019f
            kotlin.math.sin(phase) * emotion.energyScale + kotlin.math.cos(phase * 0.5f) * (emotion.defaultPitch - 1.0f)
        }
        var normSq = 0f
        for (v in raw) normSq += v * v
        val norm = sqrt(normSq.coerceAtLeast(1e-8f))
        return FloatArray(dim) { i -> raw[i] / norm }
    }

    private fun sha256Hex(file: File): String {
        val digest = MessageDigest.getInstance("SHA-256")
        file.inputStream().use { input ->
            val buf = ByteArray(8192)
            var read: Int
            while (input.read(buf).also { read = it } != -1) {
                digest.update(buf, 0, read)
            }
        }
        return digest.digest().joinToString("") { "%02x".format(it) }
    }

    override fun close() {
        stopSpeaking()
        if (nativeHandle != 0L && PocketTtsNative.isAvailable) {
            runCatching { PocketTtsNative.nativeRelease(nativeHandle) }
            nativeHandle = 0L
        }
        runCatching { systemTts?.shutdown() }
        systemTts = null
    }
}
