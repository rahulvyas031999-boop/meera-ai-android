@file:Suppress("unused", "MemberVisibilityCanBePrivate")

package com.meera.android.voice

import android.content.Context
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONArray
import org.json.JSONObject
import java.io.File
import java.io.FileOutputStream
import java.security.MessageDigest
import java.util.Locale
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean
import kotlin.math.exp

// ============================================================================
// PHASE 6B: SEMANTIC TURN DETECTOR & ADDRESSEE DETECTOR (`TurnDetectorEngine.kt`)
// Reconstructed in pure Kotlin from Maya v5.2.39 bytecode:
//   - Native JNI bridge: `libonnxruntime.so` + `libturndetector_jni.so` (`TurnNative`)
//   - Server Offloaded Models:
//       1. `/models/turn/manifest.json` (`model.onnx` + `pieces.tsv`)
//       2. `/models/addressee/manifest.json` (`model.onnx` + `pieces.tsv`)
//   - Pure Kotlin SentencePiece Unigram Tokenizer reading `pieces.tsv`
//   - Adaptive End-of-Turn (EoT) fusion combining `SpeechGate` acoustic silence
//     with semantic turn completion probability (`pComplete`) and addressee
//     classification (`pAddressedToMeera`).
// ============================================================================

/**
 * JNI Bridge for `libturndetector_jni.so` (`com.meera.android.voice.TurnNative`).
 * Runs the quantized ONNX turn-completion and addressee classification models.
 */
object TurnNative {

    private val nativeLoaded = AtomicBoolean(false)

    val isAvailable: Boolean
        get() = nativeLoaded.get()

    init {
        runCatching {
            System.loadLibrary("onnxruntime")
            System.loadLibrary("turndetector_jni")
            nativeLoaded.set(true)
        }.onFailure {
            nativeLoaded.set(false)
        }
    }

    @JvmStatic
    external fun nativeCreateSession(onnxModelPath: String, numThreads: Int): Long

    @JvmStatic
    external fun nativeScoreTokenIds(
        sessionHandle: Long,
        inputIds: LongArray,
        attentionMask: LongArray
    ): Float

    @JvmStatic
    external fun nativeReleaseSession(sessionHandle: Long)
}

/**
 * Pure Kotlin SentencePiece Unigram / Greedy-Longest-Match Tokenizer backed by `pieces.tsv`.
 * File format of `pieces.tsv`: `<piece>\t<log_prob_score>\t<token_id>` (or `<piece>\t<id>`).
 */
class SentencePieceTsvTokenizer(
    private val pieceToId: Map<String, Long>,
    private val pieceToScore: Map<String, Float>,
    val unkId: Long = 0L,
    val bosId: Long = 1L,
    val eosId: Long = 2L
) {
    companion object {
        private const val SPIECE_UNDERLINE = "\u2581"

        fun loadFromFile(tsvFile: File): SentencePieceTsvTokenizer {
            if (!tsvFile.exists()) return defaultHinglishFallbackTokenizer()
            val idMap = HashMap<String, Long>(4096)
            val scoreMap = HashMap<String, Float>(4096)
            var indexCounter = 0L

            tsvFile.forEachLine(Charsets.UTF_8) { rawLine ->
                val line = rawLine.trimEnd('\r', '\n')
                if (line.isBlank() || line.startsWith("#")) return@forEachLine
                val parts = line.split('\t')
                when {
                    parts.size >= 3 -> {
                        val piece = parts[0]
                        val score = parts[1].toFloatOrNull() ?: -5.0f
                        val id = parts[2].toLongOrNull() ?: indexCounter
                        idMap[piece] = id
                        scoreMap[piece] = score
                    }
                    parts.size == 2 -> {
                        val piece = parts[0]
                        val secondAsLong = parts[1].toLongOrNull()
                        if (secondAsLong != null) {
                            idMap[piece] = secondAsLong
                            scoreMap[piece] = -1.0f
                        } else {
                            idMap[piece] = indexCounter
                            scoreMap[piece] = parts[1].toFloatOrNull() ?: -5.0f
                        }
                    }
                    parts.size == 1 -> {
                        idMap[parts[0]] = indexCounter
                        scoreMap[parts[0]] = -5.0f
                    }
                }
                indexCounter++
            }

            if (idMap.isEmpty()) return defaultHinglishFallbackTokenizer()

            val unk = idMap["<unk>"] ?: idMap["[UNK]"] ?: 0L
            val bos = idMap["<s>"] ?: idMap["[CLS]"] ?: 1L
            val eos = idMap["</s>"] ?: idMap["[SEP]"] ?: 2L
            return SentencePieceTsvTokenizer(idMap, scoreMap, unk, bos, eos)
        }

        fun defaultHinglishFallbackTokenizer(): SentencePieceTsvTokenizer {
            val baseVocab = listOf(
                "<unk>", "<s>", "</s>", "\u2581", "\u2581meera", "\u2581maya", "\u2581boss",
                "\u2581jaan", "\u2581kya", "\u2581hai", "\u2581ho", "\u2581karo", "\u2581do",
                "\u2581na", "\u2581to", "\u2581aur", "\u2581lekin", "\u2581agar", "\u2581kyunki",
                "\u2581suno", "\u2581ek", "\u2581kaam", "\u2581batao", "\u2581chala", "\u2581band",
                "\u2581call", "\u2581message", "\u2581whatsapp", "\u2581alarm", "\u2581song",
                "\u2581please", "\u2581the", "\u2581to", "\u2581and", "\u2581because", "\u2581wait"
            )
            val idMap = HashMap<String, Long>()
            val scoreMap = HashMap<String, Float>()
            baseVocab.forEachIndexed { idx, token ->
                idMap[token] = idx.toLong()
                scoreMap[token] = -1.0f - idx * 0.05f
            }
            return SentencePieceTsvTokenizer(idMap, scoreMap, 0L, 1L, 2L)
        }
    }

    /**
     * Encodes normalized text using Viterbi dynamic programming over `pieces.tsv` unigram scores
     * (falling back to greedy longest-prefix match when scores are uniform).
     */
    fun encode(text: String, maxTokens: Int = 128, addSpecialTokens: Boolean = true): LongArray {
        val clean = text.trim().lowercase(Locale.ROOT).replace(Regex("""\s+"""), " ")
        if (clean.isEmpty()) {
            return if (addSpecialTokens) longArrayOf(bosId, eosId) else LongArray(0)
        }

        val normalized = SPIECE_UNDERLINE + clean.replace(" ", SPIECE_UNDERLINE)
        val n = normalized.length
        val bestScore = FloatArray(n + 1) { Float.NEGATIVE_INFINITY }
        val bestPrev = IntArray(n + 1) { -1 }
        val bestTokenId = LongArray(n + 1) { unkId }
        bestScore[0] = 0f

        val maxPieceLen = 24
        for (i in 0 until n) {
            if (bestScore[i] == Float.NEGATIVE_INFINITY) continue
            val limit = minOf(n, i + maxPieceLen)
            var matchedAny = false
            for (j in i + 1..limit) {
                val sub = normalized.substring(i, j)
                val tokId = pieceToId[sub]
                if (tokId != null) {
                    matchedAny = true
                    val score = bestScore[i] + (pieceToScore[sub] ?: -3.0f)
                    if (score > bestScore[j]) {
                        bestScore[j] = score
                        bestPrev[j] = i
                        bestTokenId[j] = tokId
                    }
                }
            }
            if (!matchedAny) {
                val nextIdx = i + 1
                val fallbackScore = bestScore[i] - 12.0f
                if (fallbackScore > bestScore[nextIdx]) {
                    bestScore[nextIdx] = fallbackScore
                    bestPrev[nextIdx] = i
                    bestTokenId[nextIdx] = unkId
                }
            }
        }

        val reversedIds = ArrayList<Long>()
        var cur = n
        while (cur > 0) {
            reversedIds.add(bestTokenId[cur])
            val prev = bestPrev[cur]
            cur = if (prev >= 0) prev else cur - 1
        }
        reversedIds.reverse()

        val payloadCap = if (addSpecialTokens) (maxTokens - 2).coerceAtLeast(1) else maxTokens
        val trimmed = if (reversedIds.size > payloadCap) {
            reversedIds.takeLast(payloadCap)
        } else {
            reversedIds
        }

        return if (addSpecialTokens) {
            LongArray(trimmed.size + 2) { idx ->
                when (idx) {
                    0 -> bosId
                    trimmed.size + 1 -> eosId
                    else -> trimmed[idx - 1]
                }
            }
        } else {
            LongArray(trimmed.size) { idx -> trimmed[idx] }
        }
    }
}

/**
 * Combined Semantic Turn Detector & Addressee Detector (`TurnDetectorEngine`).
 */
class TurnDetectorEngine(
    private val context: Context,
    private val backendBaseUrl: String = "https://api.meera.ai",
    private val httpClient: OkHttpClient = defaultHttpClient()
) : AutoCloseable {

    companion object {
        private const val TURN_REL_DIR = "models/turn"
        private const val ADDRESSEE_REL_DIR = "models/addressee"
        private const val ONNX_FILE = "model.onnx"
        private const val PIECES_FILE = "pieces.tsv"

        // Adaptive Silence Thresholds (in milliseconds)
        const val MIN_SILENCE_COMPLETE_MS = 280L    // Fast response when sentence is clearly complete
        const val DEFAULT_SILENCE_MS = 720L         // Standard conversational pause
        const val MAX_SILENCE_INCOMPLETE_MS = 1650L // Wait longer when user trails off mid-thought ("ek kaam karo...")

        // Hinglish & Hindi trailing conjunctions / hesitation markers indicating an incomplete turn
        private val TRAILING_HESITATION_SUFFIXES = setOf(
            "aur", "lekin", "magar", "par", "ki", "kyunki", "to", "toh", "na", "सुनो",
            "और", "लेकिन", "मगर", "क्योंकि", "तो", "कि", "एक काम", "अच्छा सुनो",
            "and", "but", "because", "so", "or", "if", "when", "uh", "umm", "hmm", "wait"
        )

        // Strong terminal verbs / commands in Hinglish & Hindi indicating a completed turn
        private val TERMINAL_COMPLETION_SUFFIXES = setOf(
            "karo", "kar do", "kardo", "batao", "bata do", "chala do", "chalao", "laga do",
            "lagao", "band karo", "bhej do", "bhejo", "suna do", "sunao", "kholo", "khol do",
            "dikhao", "hai", "hain", "tha", "thi", "hoga", "हैं", "है", "करो", "दो", "बताओ",
            "चलाओ", "लगाओ", "बंद करो", "भेजो", "खोलो", "दिखाओ", "please", "now"
        )

        private val DIRECT_ADDRESS_MARKERS = setOf(
            "meera", "maya", "मीरा", "माया", "hey meera", "hello meera", "oyee", "sun", "suno",
            "meri jaan", "baby", "babu", "assistant", "tum", "aap", "तुम", "आप"
        )

        private fun defaultHttpClient(): OkHttpClient =
            OkHttpClient.Builder()
                .connectTimeout(10, TimeUnit.SECONDS)
                .readTimeout(20, TimeUnit.SECONDS)
                .build()
    }

    data class TurnDecision(
        val isTurnComplete: Boolean,
        val completionProbability: Float,
        val addressedProbability: Float,
        val isAddressedToMeera: Boolean,
        val requiredSilenceMs: Long,
        val observedSilenceMs: Long,
        val reason: String
    )

    private val syncMutex = Mutex()
    private val turnDir = File(context.applicationContext.filesDir, TURN_REL_DIR)
    private val addresseeDir = File(context.applicationContext.filesDir, ADDRESSEE_REL_DIR)

    @Volatile
    private var turnSessionHandle: Long = 0L

    @Volatile
    private var addresseeSessionHandle: Long = 0L

    @Volatile
    private var turnTokenizer: SentencePieceTsvTokenizer =
        SentencePieceTsvTokenizer.defaultHinglishFallbackTokenizer()

    @Volatile
    private var addresseeTokenizer: SentencePieceTsvTokenizer =
        SentencePieceTsvTokenizer.defaultHinglishFallbackTokenizer()

    /**
     * Downloads `/models/turn/manifest.json` and `/models/addressee/manifest.json`
     * (`model.onnx` + `pieces.tsv`) and initializes native ONNX Runtime sessions.
     */
    suspend fun syncAndLoadModels(authToken: String? = null, numThreads: Int = 2): Boolean =
        syncMutex.withLock {
            withContext(Dispatchers.IO) {
                turnDir.mkdirs()
                addresseeDir.mkdirs()

                runCatching {
                    syncModelFolder("/models/turn/manifest.json", "/models/turn", turnDir, authToken)
                    syncModelFolder("/models/addressee/manifest.json", "/models/addressee", addresseeDir, authToken)
                }

                val turnPieces = File(turnDir, PIECES_FILE)
                if (turnPieces.exists()) {
                    turnTokenizer = SentencePieceTsvTokenizer.loadFromFile(turnPieces)
                }
                val addresseePieces = File(addresseeDir, PIECES_FILE)
                if (addresseePieces.exists()) {
                    addresseeTokenizer = SentencePieceTsvTokenizer.loadFromFile(addresseePieces)
                }

                if (TurnNative.isAvailable) {
                    val turnOnnx = File(turnDir, ONNX_FILE)
                    if (turnOnnx.exists()) {
                        if (turnSessionHandle != 0L) {
                            runCatching { TurnNative.nativeReleaseSession(turnSessionHandle) }
                        }
                        turnSessionHandle = runCatching {
                            TurnNative.nativeCreateSession(turnOnnx.absolutePath, numThreads)
                        }.getOrDefault(0L)
                    }

                    val addrOnnx = File(addresseeDir, ONNX_FILE)
                    if (addrOnnx.exists()) {
                        if (addresseeSessionHandle != 0L) {
                            runCatching { TurnNative.nativeReleaseSession(addresseeSessionHandle) }
                        }
                        addresseeSessionHandle = runCatching {
                            TurnNative.nativeCreateSession(addrOnnx.absolutePath, numThreads)
                        }.getOrDefault(0L)
                    }
                }
                true
            }
        }

    private fun syncModelFolder(
        manifestEndpoint: String,
        basePrefix: String,
        targetFolder: File,
        authToken: String?
    ) {
        val reqBuilder = Request.Builder()
            .url("${backendBaseUrl.trimEnd('/')}$manifestEndpoint")
            .get()
        if (!authToken.isNullOrBlank()) {
            reqBuilder.header("Authorization", "Bearer $authToken")
        }

        httpClient.newCall(reqBuilder.build()).execute().use { resp ->
            if (!resp.isSuccessful) return
            val manifest = JSONObject(resp.body?.string() ?: return)
            val filesArr = manifest.optJSONArray("files") ?: JSONArray()

            for (i in 0 until filesArr.length()) {
                val obj = filesArr.getJSONObject(i)
                val name = obj.getString("path")
                val sha = obj.optString("sha256", "")
                val url = obj.optString("url").ifBlank {
                    "${backendBaseUrl.trimEnd('/')}$basePrefix/$name"
                }
                val dest = File(targetFolder, name)
                dest.parentFile?.mkdirs()
                if (dest.exists() && sha.isNotEmpty() && sha256Hex(dest) == sha) continue

                val tmp = File(dest.parentFile, "${dest.name}.tmp")
                httpClient.newCall(Request.Builder().url(url).get().build()).execute().use { r ->
                    if (!r.isSuccessful) return@use
                    r.body?.byteStream()?.use { inp ->
                        FileOutputStream(tmp).use { out -> inp.copyTo(out) }
                    }
                    if (sha.isEmpty() || sha256Hex(tmp) == sha) {
                        tmp.renameTo(dest)
                    } else {
                        tmp.delete()
                    }
                }
            }
        }
    }

    /**
     * Computes the semantic probability `[0f, 1f]` that `transcript` represents a finished
     * conversational turn rather than a mid-sentence pause.
     */
    fun predictTurnCompletionProbability(
        transcript: String,
        lastAssistantQuestion: String? = null
    ): Float {
        val clean = transcript.trim()
        if (clean.isEmpty()) return 0f

        // 1. Native ONNX Runtime inference if loaded
        val handle = turnSessionHandle
        if (handle != 0L && TurnNative.isAvailable) {
            val combinedInput = if (!lastAssistantQuestion.isNullOrBlank()) {
                "${lastAssistantQuestion.trim()} </s> $clean"
            } else {
                clean
            }
            val inputIds = turnTokenizer.encode(combinedInput, maxTokens = 96)
            val mask = LongArray(inputIds.size) { 1L }
            val onnxProb = runCatching {
                TurnNative.nativeScoreTokenIds(handle, inputIds, mask)
            }.getOrDefault(-1f)
            if (onnxProb in 0f..1f) {
                return blendWithLinguisticPriors(clean, onnxProb)
            }
        }

        // 2. Pure Kotlin Linguistic & Structural Turn Classifier fallback
        return computeLinguisticTurnCompletion(clean)
    }

    /**
     * Predicts the probability `[0f, 1f]` that the utterance was spoken *to Meera*
     * (rather than background side-chatter with another person in the room).
     */
    fun predictAddressedToMeeraProbability(
        transcript: String,
        wakeWordTriggered: Boolean,
        isOwnerVoiceVerified: Boolean,
        msSinceLastAssistantTurn: Long
    ): Float {
        if (wakeWordTriggered) return 0.99f
        val clean = transcript.trim()
        if (clean.isEmpty()) return 0f

        var baseScore = 0.50f
        val handle = addresseeSessionHandle
        if (handle != 0L && TurnNative.isAvailable) {
            val ids = addresseeTokenizer.encode(clean, maxTokens = 64)
            val mask = LongArray(ids.size) { 1L }
            val onnxScore = runCatching {
                TurnNative.nativeScoreTokenIds(handle, ids, mask)
            }.getOrDefault(-1f)
            if (onnxScore in 0f..1f) {
                baseScore = onnxScore
            }
        } else {
            baseScore = computeHeuristicAddresseeScore(clean)
        }

        // Boost if inside active follow-up conversation window (< 18 seconds after Meera spoke)
        if (msSinceLastAssistantTurn in 0..18_000L) {
            baseScore += 0.22f
        }
        // Boost if VoiceGuardian verified the primary Owner's voiceprint
        if (isOwnerVoiceVerified) {
            baseScore += 0.14f
        }

        return baseScore.coerceIn(0.01f, 0.99f)
    }

    /**
     * Evaluates whether the user has finished their turn by combining:
     *   - `SpeechGate` continuous silence duration (`observedSilenceMs`)
     *   - Semantic turn completion probability (`pComplete`)
     *   - Addressee probability (`pAddressed`)
     */
    fun evaluateEndOfTurn(
        partialTranscript: String,
        observedSilenceMs: Long,
        wakeWordTriggered: Boolean = false,
        isOwnerVoiceVerified: Boolean = true,
        msSinceLastAssistantTurn: Long = 5_000L,
        lastAssistantQuestion: String? = null,
        addresseeThreshold: Float = 0.52f
    ): TurnDecision {
        val clean = partialTranscript.trim()
        if (clean.isEmpty()) {
            return TurnDecision(
                isTurnComplete = false,
                completionProbability = 0f,
                addressedProbability = 0f,
                isAddressedToMeera = false,
                requiredSilenceMs = DEFAULT_SILENCE_MS,
                observedSilenceMs = observedSilenceMs,
                reason = "empty_transcript"
            )
        }

        val pComplete = predictTurnCompletionProbability(clean, lastAssistantQuestion)
        val pAddressed = predictAddressedToMeeraProbability(
            transcript = clean,
            wakeWordTriggered = wakeWordTriggered,
            isOwnerVoiceVerified = isOwnerVoiceVerified,
            msSinceLastAssistantTurn = msSinceLastAssistantTurn
        )

        // Dynamically interpolate required silence window:
        // High pComplete (0.85+) -> ~320 ms silence needed
        // Medium pComplete (0.55) -> ~750 ms silence needed
        // Low pComplete (<0.30, trailing conjunction) -> ~1500+ ms silence needed
        val requiredSilenceMs = when {
            pComplete >= 0.82f -> MIN_SILENCE_COMPLETE_MS
            pComplete <= 0.30f -> MAX_SILENCE_INCOMPLETE_MS
            else -> {
                val t = (0.82f - pComplete) / (0.82f - 0.30f)
                (MIN_SILENCE_COMPLETE_MS + t * (MAX_SILENCE_INCOMPLETE_MS - MIN_SILENCE_COMPLETE_MS)).toLong()
            }
        }

        val isAddressed = pAddressed >= addresseeThreshold
        val silenceSatisfied = observedSilenceMs >= requiredSilenceMs
        val isComplete = silenceSatisfied && isAddressed

        val reason = when {
            !isAddressed -> "ignored_side_speech(pAddressed=${"%.2f".format(pAddressed)})"
            !silenceSatisfied -> "waiting_for_silence(${observedSilenceMs}ms/${requiredSilenceMs}ms, pComplete=${"%.2f".format(pComplete)})"
            else -> "turn_committed(pComplete=${"%.2f".format(pComplete)}, pAddressed=${"%.2f".format(pAddressed)})"
        }

        return TurnDecision(
            isTurnComplete = isComplete,
            completionProbability = pComplete,
            addressedProbability = pAddressed,
            isAddressedToMeera = isAddressed,
            requiredSilenceMs = requiredSilenceMs,
            observedSilenceMs = observedSilenceMs,
            reason = reason
        )
    }

    private fun blendWithLinguisticPriors(text: String, onnxProb: Float): Float {
        val prior = computeLinguisticTurnCompletion(text)
        return (0.72f * onnxProb + 0.28f * prior).coerceIn(0.01f, 0.99f)
    }

    private fun computeLinguisticTurnCompletion(text: String): Float {
        val lower = text.lowercase(Locale.ROOT).trim()
        val words = lower.split(Regex("""\s+""")).filter { it.isNotBlank() }
        if (words.isEmpty()) return 0f

        var logit = 0.15f

        // Explicit terminal punctuation
        if (lower.endsWith("?") || lower.endsWith("!") || lower.endsWith("।") || lower.endsWith(".")) {
            logit += 1.45f
        }
        if (lower.endsWith("...") || lower.endsWith("…") || lower.endsWith(",")) {
            logit -= 1.65f
        }

        val lastWord = words.last().trimEnd('.', ',', '?', '!', '।')
        val lastTwoWords = if (words.size >= 2) "${words[words.size - 2]} $lastWord" else lastWord

        if (TRAILING_HESITATION_SUFFIXES.contains(lastWord) || TRAILING_HESITATION_SUFFIXES.contains(lastTwoWords)) {
            logit -= 1.55f
        }
        if (TERMINAL_COMPLETION_SUFFIXES.contains(lastWord) || TERMINAL_COMPLETION_SUFFIXES.contains(lastTwoWords)) {
            logit += 1.25f
        }

        // Single-word wake call like "Meera" or "Suno" without command often precedes a clause
        if (words.size == 1 && DIRECT_ADDRESS_MARKERS.contains(lastWord)) {
            logit -= 1.10f
        } else if (words.size >= 3) {
            logit += 0.35f
        }

        return (1.0f / (1.0f + exp(-logit))).coerceIn(0.05f, 0.98f)
    }

    private fun computeHeuristicAddresseeScore(text: String): Float {
        val lower = text.lowercase(Locale.ROOT)
        var score = 0.52f
        for (marker in DIRECT_ADDRESS_MARKERS) {
            if (lower.contains(marker)) {
                score += 0.32f
                break
            }
        }
        for (suffix in TERMINAL_COMPLETION_SUFFIXES) {
            if (lower.endsWith(suffix)) {
                score += 0.12f
                break
            }
        }
        return score.coerceIn(0.05f, 0.98f)
    }

    private fun sha256Hex(file: File): String {
        val digest = MessageDigest.getInstance("SHA-256")
        file.inputStream().use { inp ->
            val buf = ByteArray(8192)
            var r: Int
            while (inp.read(buf).also { r = it } != -1) {
                digest.update(buf, 0, r)
            }
        }
        return digest.digest().joinToString("") { "%02x".format(it) }
    }

    override fun close() {
        if (turnSessionHandle != 0L && TurnNative.isAvailable) {
            runCatching { TurnNative.nativeReleaseSession(turnSessionHandle) }
            turnSessionHandle = 0L
        }
        if (addresseeSessionHandle != 0L && TurnNative.isAvailable) {
            runCatching { TurnNative.nativeReleaseSession(addresseeSessionHandle) }
            addresseeSessionHandle = 0L
        }
    }
}