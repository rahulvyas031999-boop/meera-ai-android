package com.meera.assistant

import android.annotation.SuppressLint
import android.content.Context
import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioRecord
import android.media.AudioTrack
import android.media.MediaRecorder
import android.media.audiofx.AcousticEchoCanceler
import android.media.audiofx.NoiseSuppressor
import android.util.Base64
import android.util.Log
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import okhttp3.WebSocket
import okhttp3.WebSocketListener
import okio.ByteString
import org.json.JSONArray
import org.json.JSONObject
import java.util.concurrent.LinkedBlockingQueue
import java.util.concurrent.TimeUnit
import kotlin.concurrent.thread
import kotlin.math.sqrt

// Gemini Live API se seedha audio ki baat-cheet (mic -> Gemini -> speaker).
class LiveClient(
    private val ctx: Context,
    private val apiKey: String,
    private val persona: Persona,
    private val onStatus: (String) -> Unit,
    private val onLevel: (Float) -> Unit,
    private val onRunning: (Boolean) -> Unit,
) {
    companion object {
        const val TAG = "Meera"

        // Model ka naam badalta rehta hai. ai.google.dev ke Live API docs me check karo.
        const val MODEL = "models/gemini-3.1-flash-live-preview"
        private const val IN_RATE = 16000
        private const val OUT_RATE = 24000
    }

    private val http = OkHttpClient.Builder().pingInterval(20, TimeUnit.SECONDS).build()
    private val audioManager = ctx.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    private val playQueue = LinkedBlockingQueue<ByteArray>()
    private var ws: WebSocket? = null
    private var rec: AudioRecord? = null
    private var track: AudioTrack? = null
    private var micThread: Thread? = null
    private var playThread: Thread? = null
    private var oldMode = AudioManager.MODE_NORMAL

    @Volatile
    private var running = false

    fun isRunning() = running

    @Suppress("DEPRECATION")
    fun start() {
        if (running) return
        running = true
        onRunning(true)
        onStatus("Connecting...")
        oldMode = audioManager.mode
        audioManager.mode = AudioManager.MODE_IN_COMMUNICATION
        audioManager.isSpeakerphoneOn = true

        val url = "wss://generativelanguage.googleapis.com/ws/" +
            "google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent" +
            "?key=$apiKey"
        ws = http.newWebSocket(Request.Builder().url(url).build(), object : WebSocketListener() {
            override fun onOpen(webSocket: WebSocket, response: Response) {
                webSocket.send(setupJson())
            }

            override fun onMessage(webSocket: WebSocket, text: String) {
                handle(text)
            }

            override fun onMessage(webSocket: WebSocket, bytes: ByteString) {
                handle(bytes.utf8())
            }

            override fun onClosing(webSocket: WebSocket, code: Int, reason: String) {
                Log.i(TAG, "closing $code $reason")
                stop("Band hua ($code) $reason")
            }

            override fun onFailure(webSocket: WebSocket, t: Throwable, response: Response?) {
                Log.e(TAG, "ws fail: ${response?.code}", t)
                stop("Error: ${t.message}")
            }
        })
    }

    private fun setupJson(): String {
        val voice = JSONObject().put(
            "voiceConfig",
            JSONObject().put("prebuiltVoiceConfig", JSONObject().put("voiceName", persona.voice))
        )
        val gen = JSONObject()
            .put("responseModalities", JSONArray().put("AUDIO"))
            .put("speechConfig", voice)
        val sys = JSONObject().put(
            "parts", JSONArray().put(JSONObject().put("text", persona.prompt))
        )
        return JSONObject().put(
            "setup",
            JSONObject()
                .put("model", MODEL)
                .put("generationConfig", gen)
                .put("systemInstruction", sys)
        ).toString()
    }

    private fun handle(text: String) {
        try {
            val j = JSONObject(text)
            if (j.has("setupComplete")) {
                onStatus("Listening... bolo")
                startAudio()
                return
            }
            val sc = j.optJSONObject("serverContent") ?: return
            if (sc.optBoolean("interrupted")) {
                playQueue.clear()
                track?.pause()
                track?.flush()
                track?.play()
            }
            val parts = sc.optJSONObject("modelTurn")?.optJSONArray("parts")
            if (parts != null) {
                for (i in 0 until parts.length()) {
                    val data = parts.getJSONObject(i).optJSONObject("inlineData")?.optString("data")
                    if (!data.isNullOrEmpty()) {
                        playQueue.add(Base64.decode(data, Base64.DEFAULT))
                    }
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "handle fail: $text", e)
        }
    }

    @SuppressLint("MissingPermission")
    private fun startAudio() {
        if (!running) return
        try {
            val minIn = AudioRecord.getMinBufferSize(
                IN_RATE, AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT
            )
            val r = AudioRecord(
                MediaRecorder.AudioSource.VOICE_COMMUNICATION,
                IN_RATE,
                AudioFormat.CHANNEL_IN_MONO,
                AudioFormat.ENCODING_PCM_16BIT,
                maxOf(minIn, 3200) * 2
            )
            if (r.state != AudioRecord.STATE_INITIALIZED) {
                stop("Mic start nahi hua")
                return
            }
            if (AcousticEchoCanceler.isAvailable()) {
                AcousticEchoCanceler.create(r.audioSessionId)?.setEnabled(true)
            }
            if (NoiseSuppressor.isAvailable()) {
                NoiseSuppressor.create(r.audioSessionId)?.setEnabled(true)
            }
            rec = r

            val minOut = AudioTrack.getMinBufferSize(
                OUT_RATE, AudioFormat.CHANNEL_OUT_MONO, AudioFormat.ENCODING_PCM_16BIT
            )
            val t = AudioTrack.Builder()
                .setAudioAttributes(
                    AudioAttributes.Builder()
                        .setUsage(AudioAttributes.USAGE_VOICE_COMMUNICATION)
                        .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                        .build()
                )
                .setAudioFormat(
                    AudioFormat.Builder()
                        .setSampleRate(OUT_RATE)
                        .setChannelMask(AudioFormat.CHANNEL_OUT_MONO)
                        .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                        .build()
                )
                .setBufferSizeInBytes(minOut * 4)
                .setTransferMode(AudioTrack.MODE_STREAM)
                .build()
            track = t
            t.play()
            r.startRecording()

            micThread = thread(name = "meera-mic") {
                val buf = ByteArray(3200)
                while (running) {
                    val n = r.read(buf, 0, buf.size)
                    if (n > 0) {
                        onLevel(rms(buf, n))
                        sendAudio(buf, n)
                    } else if (n < 0) {
                        Log.e(TAG, "mic read error $n")
                        break
                    }
                }
            }
            playThread = thread(name = "meera-play") {
                while (running) {
                    val chunk = playQueue.poll(200, TimeUnit.MILLISECONDS) ?: continue
                    onLevel(rms(chunk, chunk.size))
                    track?.write(chunk, 0, chunk.size)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "startAudio fail", e)
            stop("Audio error: ${e.message}")
        }
    }

    private fun sendAudio(buf: ByteArray, n: Int) {
        val b64 = Base64.encodeToString(buf, 0, n, Base64.NO_WRAP)
        val msg = JSONObject().put(
            "realtimeInput",
            JSONObject().put(
                "audio",
                JSONObject().put("data", b64).put("mimeType", "audio/pcm;rate=16000")
            )
        )
        ws?.send(msg.toString())
    }

    private fun rms(b: ByteArray, n: Int): Float {
        var sum = 0.0
        var i = 0
        while (i + 1 < n) {
            val v = ((b[i].toInt() and 0xFF) or (b[i + 1].toInt() shl 8)).toShort().toInt()
            sum += v.toDouble() * v.toDouble()
            i += 2
        }
        val r = sqrt(sum / maxOf(1, n / 2))
        return (r / 8000.0).coerceIn(0.0, 1.0).toFloat()
    }

    @Synchronized
    fun stop(msg: String = "Mic dabao aur bolo") {
        if (!running) return
        running = false
        try { rec?.stop() } catch (e: Exception) { Log.e(TAG, "rec stop", e) }
        try { micThread?.join(300) } catch (e: Exception) { Log.e(TAG, "mic join", e) }
        try { rec?.release() } catch (e: Exception) { Log.e(TAG, "rec release", e) }
        rec = null
        playQueue.clear()
        try { playThread?.join(300) } catch (e: Exception) { Log.e(TAG, "play join", e) }
        try {
            track?.stop()
            track?.release()
        } catch (e: Exception) {
            Log.e(TAG, "track release", e)
        }
        track = null
        try { ws?.close(1000, "bye") } catch (e: Exception) { Log.e(TAG, "ws close", e) }
        ws = null
        audioManager.mode = oldMode
        onLevel(0f)
        onStatus(msg)
        onRunning(false)
    }
}
