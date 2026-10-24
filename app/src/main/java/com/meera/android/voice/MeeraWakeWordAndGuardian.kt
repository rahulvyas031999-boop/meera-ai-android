@file:Suppress("unused", "MemberVisibilityCanBePrivate")

package com.meera.android.voice

import android.content.Context
import org.json.JSONArray
import org.tensorflow.lite.Interpreter
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.math.exp
import kotlin.math.sqrt

// ============================================================================
// PHASE 5: ON-DEVICE WAKE-WORD PIPELINE, SILERO VAD SPEECH GATE & VOICE GUARDIAN
// Reconstructed in pure Kotlin from bytecode classes:
//   - LvJ1 & LwJ1 (5-model TFLite WakeWordEngine)
//   - LUg1 (SpeechGate.kt — Silero VAD v4 frame-by-frame LSTM gate)
//   - LC50, LD50, LhI1 (VoiceGuardian speaker verification with ReDimNet2-B6)
// ============================================================================

/**
 * 1. SILERO VAD v4 SPEECH GATE (`LUg1` / `SpeechGate.kt` in bytecode)
 * Drives `assets/guardian/silero_vad.tflite` (650 KB) frame-by-frame while
 * preserving its recurrent LSTM state tensors (`h` and `c`) across 512-sample
 * (32 ms @ 16 kHz) audio frames.
 */
class SpeechGate(context: Context, numThreads: Int = 1) : AutoCloseable {

    companion object {
        const val SAMPLE_RATE = 16000
        const val FRAME_SAMPLES = 512 // 32 ms at 16 kHz
        private const val ASSET_PATH = "guardian/silero_vad.tflite"
    }

    private val interpreter: Interpreter
    // Recurrent LSTM hidden & cell state buffers (2 layers x 1 batch x 64 units)
    private var stateH = Array(2) { Array(1) { FloatArray(64) } }
    private var stateC = Array(2) { Array(1) { FloatArray(64) } }
    private val sampleRateTensor = IntArray(1) { SAMPLE_RATE }

    init {
        val modelBytes = context.assets.open(ASSET_PATH).use { it.readBytes() }
        val directBuffer = ByteBuffer.allocateDirect(modelBytes.size)
            .order(ByteOrder.nativeOrder())
            .apply {
                put(modelBytes)
                rewind()
            }
        val options = Interpreter.Options().apply { setNumThreads(numThreads) }
        interpreter = Interpreter(directBuffer, options)
    }

    fun resetState() {
        stateH = Array(2) { Array(1) { FloatArray(64) } }
        stateC = Array(2) { Array(1) { FloatArray(64) } }
    }

    /**
     * Evaluates a single 512-sample float PCM frame (normalized to [-1f, 1f])
     * and returns the speech probability in [0f, 1f].
     */
    fun speechProbability(pcmFrame512: FloatArray): Float {
        require(pcmFrame512.size == FRAME_SAMPLES) {
            "Silero VAD requires $FRAME_SAMPLES samples per frame, got ${pcmFrame512.size}"
        }
        val inputBatch = arrayOf(pcmFrame512)
        val outProb = Array(1) { FloatArray(1) }
        val outH = Array(2) { Array(1) { FloatArray(64) } }
        val outC = Array(2) { Array(1) { FloatArray(64) } }

        val inputs = arrayOf<Any>(inputBatch, sampleRateTensor, stateH, stateC)
        val outputs = hashMapOf<Int, Any>(
            0 to outProb,
            1 to outH,
            2 to outC
        )

        return try {
            interpreter.runForMultipleInputsOutputs(inputs, outputs)
            stateH = outH
            stateC = outC
            outProb[0][0]
        } catch (_: Throwable) {
            0f
        }
    }

    fun isHumanSpeech(pcmFrame512: FloatArray, threshold: Float = 0.5f): Boolean =
        speechProbability(pcmFrame512) >= threshold

    override fun close() {
        runCatching { interpreter.close() }
    }
}

/**
 * 2. 5-MODEL ON-DEVICE WAKE-WORD ENGINE (`LvJ1` & `LwJ1` in bytecode)
 * Pipeline:
 *   Raw 16kHz PCM -> `melspectrogram.tflite`
 *                 -> `embedding_model.tflite`
 *                 -> `hey_maya.tflite` / `hello_maya.tflite` / `wake_up_maya.tflite`
 */
class WakeWordEngine(
    val melInterpreter: Interpreter,
    val embeddingInterpreter: Interpreter,
    val heyMeeraInterpreter: Interpreter,
    val helloMeeraInterpreter: Interpreter,
    val wakeUpMeeraInterpreter: Interpreter
) : AutoCloseable {

    data class DetectionResult(
        val triggered: Boolean,
        val wakePhrase: String,
        val confidence: Float
    )

    companion object {
        private const val WAKEWORD_DIR = "wakeword"
        private const val MEL_MODEL = "wakeword/melspectrogram.tflite"
        private const val EMBED_MODEL = "wakeword/embedding_model.tflite"
        private const val HEY_MODEL = "wakeword/hey_maya.tflite"
        private const val HELLO_MODEL = "wakeword/hello_maya.tflite"
        private const val WAKE_UP_MODEL = "wakeword/wake_up_maya.tflite"

        @Volatile
        private var cachedInstance: WakeWordEngine? = null

        private fun loadAssetInterpreter(
            context: Context,
            assetPath: String,
            options: Interpreter.Options
        ): Interpreter {
            val bytes = context.assets.open(assetPath).use { it.readBytes() }
            val buffer = ByteBuffer.allocateDirect(bytes.size)
                .order(ByteOrder.nativeOrder())
                .apply {
                    put(bytes)
                    rewind()
                }
            return Interpreter(buffer, options)
        }

        /**
         * Reconstructs `LvJ1.b(Context): LwJ1` from bytecode.
         */
        fun getOrLoad(context: Context, threads: Int = 2): WakeWordEngine? {
            cachedInstance?.let { return it }
            return synchronized(this) {
                cachedInstance ?: runCatching {
                    val assetList = context.assets.list(WAKEWORD_DIR) ?: emptyArray()
                    if (!assetList.contains("hello_maya.tflite")) return@runCatching null

                    val opts = Interpreter.Options().apply { setNumThreads(threads) }
                    val mel = loadAssetInterpreter(context, MEL_MODEL, opts)
                    val emb = loadAssetInterpreter(context, EMBED_MODEL, opts)
                    val hey = loadAssetInterpreter(context, HEY_MODEL, opts)
                    val wakeUp = loadAssetInterpreter(context, WAKE_UP_MODEL, opts)
                    val hello = loadAssetInterpreter(context, HELLO_MODEL, opts)

                    mel.resizeInput(0, intArrayOf(1, 1280))
                    mel.allocateTensors()

                    WakeWordEngine(mel, emb, hey, hello, wakeUp).also { cachedInstance = it }
                }.getOrNull()
            }
        }
    }

    // Rolling feature windows for openWakeWord-style 2-stage embedding pipeline
    private val melBuffer = ArrayDeque<FloatArray>(76)
    private val embeddingBuffer = ArrayDeque<FloatArray>(16)

    /**
     * Feeds a 1280-sample (80 ms @ 16 kHz) 16-bit PCM chunk into the 3-stage TFLite graph.
     */
    fun processPcmChunk1280(pcm1280: FloatArray, threshold: Float = 0.65f): DetectionResult {
        require(pcm1280.size == 1280) { "Expected 1280 samples (80 ms @ 16 kHz)" }

        // Stage 1: Mel-Spectrogram extraction (1 x 1280 -> 5 mel frames x 32 bins)
        val melInput = arrayOf(pcm1280)
        val melOut = Array(1) { Array(1) { Array(5) { FloatArray(32) } } }
        melInterpreter.run(melInput, melOut)

        for (frameIdx in 0 until 5) {
            val row = melOut[0][0][frameIdx]
            val transformed = FloatArray(32) { i -> (row[i] / 10.0f) + 2.0f }
            if (melBuffer.size >= 76) melBuffer.removeFirst()
            melBuffer.addLast(transformed)
        }

        if (melBuffer.size < 76) {
            return DetectionResult(false, "", 0f)
        }

        // Stage 2: 76x32x1 Mel window -> 96-dim audio embedding (`embedding_model.tflite`)
        val embInput = Array(1) {
            Array(76) { r ->
                val melRow = melBuffer.elementAt(r)
                Array(32) { c -> floatArrayOf(melRow[c]) }
            }
        }
        val embOut = Array(1) { Array(1) { Array(1) { FloatArray(96) } } }
        embeddingInterpreter.run(embInput, embOut)

        if (embeddingBuffer.size >= 16) embeddingBuffer.removeFirst()
        embeddingBuffer.addLast(embOut[0][0][0])

        if (embeddingBuffer.size < 16) {
            return DetectionResult(false, "", 0f)
        }

        // Stage 3: 16x96 embedding window -> Wake-Word Classifiers
        val classifierInput = Array(1) {
            Array(16) { step -> embeddingBuffer.elementAt(step) }
        }

        val scoreHey = runClassifier(heyMeeraInterpreter, classifierInput)
        val scoreHello = runClassifier(helloMeeraInterpreter, classifierInput)
        val scoreWakeUp = runClassifier(wakeUpMeeraInterpreter, classifierInput)

        val best = maxOf(
            "hey_meera" to scoreHey,
            "hello_meera" to scoreHello,
            "wake_up_meera" to scoreWakeUp,
            compareBy { it.second }
        )

        if (best.second >= threshold) {
            embeddingBuffer.clear()
            return DetectionResult(true, best.first, best.second)
        }
        return DetectionResult(false, best.first, best.second)
    }

    private fun runClassifier(classifier: Interpreter, input: Array<Array<FloatArray>>): Float {
        val out = Array(1) { FloatArray(1) }
        return try {
            classifier.run(input, out)
            out[0][0]
        } catch (_: Throwable) {
            0f
        }
    }

    override fun close() {
        runCatching { melInterpreter.close() }
        runCatching { embeddingInterpreter.close() }
        runCatching { heyMeeraInterpreter.close() }
        runCatching { helloMeeraInterpreter.close() }
        runCatching { wakeUpMeeraInterpreter.close() }
    }
}

/**
 * 3. VOICE GUARDIAN SPEAKER VERIFIER (`LC50`, `LhI1` & `assets/guardian/README.txt`)
 * Uses the server-downloaded `rdn2b6s.tflite` (ReDimNet2-B6, 3-second concatenated
 * voiced audio window) + `cohort_rdn2b6s.bin` for AS-Norm cohort calibration and
 * logistic scoring (`logisticA = 3.6055`, `logisticB = 2.785`).
 */
class VoiceGuardianVerifier(private val context: Context) {

    enum class TrustRole(val id: String) {
        OWNER("owner"),
        TRUSTED("trusted"),
        GUEST("guest")
    }

    data class VoiceProfile(
        val id: String,
        val name: String,
        val role: TrustRole,
        val modelId: String,
        val centroidEmbedding: FloatArray,
        val sampleCount: Int
    )

    data class VerificationVerdict(
        val matchedProfile: VoiceProfile?,
        val probability: Float,
        val rawCosine: Float,
        val isOwner: Boolean
    )

    companion object {
        const val MODEL_ID_POWERFUL = "rdn2b6s"
        const val WINDOW_SECONDS = 3
        const val REQUIRED_VOICED_SAMPLES = 16000 * WINDOW_SECONDS // 48,000 samples (3.0 s)
        private const val LOGISTIC_A = 3.6055f
        private const val LOGISTIC_B = 2.785f
    }

    private val profilesFile = File(context.applicationContext.filesDir, "guardian_profiles.json")
    private val backupProfilesFile = File(context.applicationContext.filesDir, "guardian_profiles.json.bak")

    /**
     * Concatenates ONLY human-voiced frames (gated by `SpeechGate`) and repeats/tiles
     * short voiced utterances to fill the 3-second (48,000-sample) window—never zero-padding!
     */
    fun buildVoicedWindow(voicedSamples: FloatArray, targetSamples: Int = REQUIRED_VOICED_SAMPLES): FloatArray {
        require(voicedSamples.isNotEmpty()) { "Voiced samples cannot be empty" }
        val result = FloatArray(targetSamples)
        var pos = 0
        while (pos < targetSamples) {
            val copyLen = minOf(voicedSamples.size, targetSamples - pos)
            System.arraycopy(voicedSamples, 0, result, pos, copyLen)
            pos += copyLen
        }
        return result
    }

    fun l2Normalize(vec: FloatArray): FloatArray {
        var sumSq = 0f
        for (v in vec) sumSq += v * v
        val norm = sqrt(sumSq.coerceAtLeast(1e-12f))
        return FloatArray(vec.size) { i -> vec[i] / norm }
    }

    fun cosineSimilarity(a: FloatArray, b: FloatArray): Float {
        val len = minOf(a.size, b.size)
        var dot = 0f
        for (i in 0 until len) dot += a[i] * b[i]
        return dot
    }

    fun scoreToProbability(score: Float, a: Float = LOGISTIC_A, b: Float = LOGISTIC_B): Float {
        val z = a * score - b
        return (1.0f / (1.0f + exp(-z)))
    }

    fun loadProfiles(): List<VoiceProfile> {
        val raw = runCatching { profilesFile.readText() }.getOrNull()
            ?: runCatching { backupProfilesFile.readText() }.getOrNull()
            ?: return emptyList()

        return runCatching {
            val arr = JSONArray(raw)
            buildList {
                for (i in 0 until arr.length()) {
                    val obj = arr.getJSONObject(i)
                    val embArr = obj.getJSONArray("embedding")
                    val emb = FloatArray(embArr.length()) { k -> embArr.getDouble(k).toFloat() }
                    add(
                        VoiceProfile(
                            id = obj.getString("id"),
                            name = obj.getString("name"),
                            role = TrustRole.entries.firstOrNull { it.id == obj.optString("role") } ?: TrustRole.OWNER,
                            modelId = obj.optString("modelId", MODEL_ID_POWERFUL),
                            centroidEmbedding = l2Normalize(emb),
                            sampleCount = obj.optInt("sampleCount", 1)
                        )
                    )
                }
            }
        }.getOrElse {
            runCatching { profilesFile.copyTo(File("${profilesFile.absolutePath}.corrupt"), overwrite = true) }
            emptyList()
        }
    }
}