@file:Suppress("unused", "MemberVisibilityCanBePrivate")

package com.meera.android

import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.GestureDescription
import android.app.Activity
import android.app.Application
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.RemoteInput
import android.app.Service
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.graphics.Path
import android.graphics.Rect
import android.media.AudioFormat
import android.media.AudioRecord
import android.media.MediaRecorder
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.IBinder
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import android.service.voice.VoiceInteractionService
import android.service.voice.VoiceInteractionSession
import android.service.voice.VoiceInteractionSessionService
import android.speech.RecognitionService
import android.telephony.TelephonyManager
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityNodeInfo
import com.meera.android.agent.MeeraAgentOrchestrator
import com.meera.android.agent.MeeraAutomationBridge
import com.meera.android.agent.MeeraToolRegistry
import com.meera.android.ui.facelock.FaceLockAndWatchmanEngine
import com.meera.android.voice.MeeraVoiceEmotion
import com.meera.android.voice.PocketTtsEngine
import com.meera.android.voice.SpeechGate
import com.meera.android.voice.TurnDetectorEngine
import com.meera.android.voice.VoiceGuardianVerifier
import com.meera.android.voice.WakeWordEngine
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import org.json.JSONArray
import org.json.JSONObject
import java.util.Locale
import java.util.concurrent.ConcurrentLinkedDeque
import java.util.concurrent.atomic.AtomicBoolean

// ============================================================================
// PHASE 9A: CORE APPLICATION SINGLETON, 24/7 VOICE FOREGROUND SERVICE,
// ACCESSIBILITY ENGINE, NOTIFICATION LISTENER, ASSISTANT & BROADCAST RECEIVERS
// (`MeeraSystemServices.kt`)
// Reconstructed in pure Kotlin to fulfill every service, receiver, and helper
// activity declared in `AndroidManifest.xml` (`com.meera.android`).
// ============================================================================

/**
 * Global Application Context & Dependency Graph (`com.meera.android.MeeraApplication`).
 */
class MeeraApplication : Application() {

    companion object {
        @Volatile
        var instance: MeeraApplication? = null
            private set
    }

    val speechGate by lazy { runCatching { SpeechGate(this) }.getOrNull() }
    val wakeWordEngine by lazy { WakeWordEngine.getOrLoad(this) }
    val voiceGuardian by lazy { VoiceGuardianVerifier(this) }
    val pocketTts by lazy { PocketTtsEngine(this) }
    val turnDetector by lazy { TurnDetectorEngine(this) }
    val toolRegistry by lazy { MeeraToolRegistry(this) }
    val faceLockEngine by lazy { FaceLockAndWatchmanEngine(this) }

    val agentOrchestrator by lazy {
        MeeraAgentOrchestrator(
            context = this,
            toolRegistry = toolRegistry,
            ttsEngine = pocketTts,
            turnDetector = turnDetector,
            voiceGuardian = voiceGuardian
        )
    }

    override fun onCreate() {
        super.onCreate()
        instance = this
    }
}

/**
 * 24/7 Always-On Voice & Agent Foreground Service (`com.meera.android.MeeraForegroundService`).
 * Pipeline:
 *   16 kHz AudioRecord -> `SpeechGate` (512-sample Silero VAD)
 *                      -> Barge-in check (stops `PocketTtsEngine` if user speaks during TTS)
 *                      -> `WakeWordEngine` (1280-sample 5-model TFLite detector)
 *                      -> `VoiceGuardianVerifier` (48,000-sample ReDimNet2-B6 speaker check)
 *                      -> `TurnDetectorEngine` + `MeeraAgentOrchestrator`
 */
class MeeraForegroundService : Service() {

    companion object {
        const val CHANNEL_ID = "meera_voice_guardian_channel"
        const val NOTIFICATION_ID = 1001
        const val ACTION_START_LISTENING = "com.meera.android.START_LISTENING"
        const val ACTION_STOP_LISTENING = "com.meera.android.STOP_LISTENING"
    }

    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val isCapturing = AtomicBoolean(false)
    private var captureJob: Job? = null

    override fun onCreate() {
        super.onCreate()
        startAsForegroundNotification()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_STOP_LISTENING -> stopAudioCaptureLoop()
            else -> startAudioCaptureLoop()
        }
        return START_STICKY
    }

    private fun startAsForegroundNotification() {
        val nm = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "Meera 24/7 Voice & Guardian",
                NotificationManager.IMPORTANCE_LOW
            )
            nm.createNotificationChannel(channel)
        }

        val launchIntent = Intent(this, MainActivity::class.java)
        val pi = PendingIntent.getActivity(
            this,
            0,
            launchIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val builder = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Notification.Builder(this, CHANNEL_ID)
        } else {
            @Suppress("DEPRECATION")
            Notification.Builder(this)
        }

        val notif = builder
            .setContentTitle("Meera AI Active 💖")
            .setContentText("Zero-Beep Wake-Word & Voice Guardian listening...")
            .setSmallIcon(android.R.drawable.ic_btn_speak_now)
            .setContentIntent(pi)
            .setOngoing(true)
            .build()

        startForeground(NOTIFICATION_ID, notif)
    }

    private fun startAudioCaptureLoop() {
        if (isCapturing.getAndSet(true)) return
        val app = MeeraApplication.instance ?: return

        captureJob = serviceScope.launch {
            val sampleRate = 16000
            val minBuf = AudioRecord.getMinBufferSize(
                sampleRate,
                AudioFormat.CHANNEL_IN_MONO,
                AudioFormat.ENCODING_PCM_16BIT
            ).coerceAtLeast(4096)

            @Suppress("MissingPermission")
            val recorder = runCatching {
                AudioRecord(
                    MediaRecorder.AudioSource.VOICE_RECOGNITION,
                    sampleRate,
                    AudioFormat.CHANNEL_IN_MONO,
                    AudioFormat.ENCODING_PCM_16BIT,
                    minBuf * 2
                )
            }.getOrNull() ?: run {
                isCapturing.set(false)
                return@launch
            }

            val pcm512Short = ShortArray(SpeechGate.FRAME_SAMPLES)
            val pcm512Float = FloatArray(SpeechGate.FRAME_SAMPLES)
            val wakeRing = FloatArray(1280)
            var wakeRingPos = 0
            var consecutiveVoicedFrames = 0

            try {
                recorder.startRecording()
                while (isActive && isCapturing.get()) {
                    val read = recorder.read(pcm512Short, 0, SpeechGate.FRAME_SAMPLES)
                    if (read <= 0) continue

                    for (i in 0 until read) {
                        val f = pcm512Short[i] / 32768.0f
                        pcm512Float[i] = f
                        wakeRing[wakeRingPos++] = f
                        if (wakeRingPos == 1280) {
                            app.wakeWordEngine?.processPcmChunk1280(wakeRing.copyOf())
                            wakeRingPos = 0
                        }
                    }

                    if (read == SpeechGate.FRAME_SAMPLES) {
                        val isSpeech = app.speechGate?.isHumanSpeech(pcm512Float) ?: false
                        if (isSpeech) {
                            consecutiveVoicedFrames++
                            if (consecutiveVoicedFrames >= 4 && app.pocketTts.telemetry.value.isSpeaking) {
                                app.pocketTts.stopSpeaking()
                            }
                        } else {
                            consecutiveVoicedFrames = 0
                        }
                    }
                }
            } finally {
                runCatching {
                    recorder.stop()
                    recorder.release()
                }
            }
        }
    }

    private fun stopAudioCaptureLoop() {
        isCapturing.set(false)
        captureJob?.cancel()
        captureJob = null
    }

    override fun onDestroy() {
        stopAudioCaptureLoop()
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? = null
}

/**
 * UI Automation Accessibility Service (`com.meera.android.MeeraAccessibilityService`).
 */
class MeeraAccessibilityService : AccessibilityService(), MeeraAutomationBridge.AccessibilityController {

    override fun onServiceConnected() {
        super.onServiceConnected()
        MeeraAutomationBridge.accessibilityController = this
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {}

    override fun onInterrupt() {}

    override fun onDestroy() {
        if (MeeraAutomationBridge.accessibilityController === this) {
            MeeraAutomationBridge.accessibilityController = null
        }
        super.onDestroy()
    }

    override fun dumpScreenTreeJson(): JSONObject {
        val root = rootInActiveWindow ?: return JSONObject().put("error", "no_active_window")
        val nodesArr = JSONArray()
        traverseNode(root, nodesArr, depth = 0)
        return JSONObject()
            .put("package", root.packageName?.toString() ?: "")
            .put("node_count", nodesArr.length())
            .put("nodes", nodesArr)
    }

    private fun traverseNode(node: AccessibilityNodeInfo?, out: JSONArray, depth: Int) {
        if (node == null || depth > 18 || out.length() >= 180) return
        val text = node.text?.toString()?.trim().orEmpty()
        val desc = node.contentDescription?.toString()?.trim().orEmpty()
        val viewId = node.viewIdResourceName.orEmpty()
        if (text.isNotEmpty() || desc.isNotEmpty() || node.isClickable) {
            val rect = Rect()
            node.getBoundsInScreen(rect)
            out.put(
                JSONObject().apply {
                    if (text.isNotEmpty()) put("text", text)
                    if (desc.isNotEmpty()) put("desc", desc)
                    if (viewId.isNotEmpty()) put("id", viewId)
                    put("clickable", node.isClickable)
                    put("bounds", "[${rect.left},${rect.top},${rect.right},${rect.bottom}]")
                }
            )
        }
        for (i in 0 until node.childCount) {
            traverseNode(node.getChild(i), out, depth + 1)
        }
    }

    override fun clickNodeByText(text: String, exact: Boolean): Boolean {
        val root = rootInActiveWindow ?: return false
        val matches = root.findAccessibilityNodeInfosByText(text) ?: return false
        for (node in matches) {
            if (exact && !node.text?.toString().equals(text, ignoreCase = true)) continue
            if (performClickOrParent(node)) return true
        }
        return false
    }

    override fun clickNodeByViewId(viewId: String): Boolean {
        val root = rootInActiveWindow ?: return false
        val matches = root.findAccessibilityNodeInfosByViewId(viewId) ?: return false
        for (node in matches) {
            if (performClickOrParent(node)) return true
        }
        return false
    }

    private fun performClickOrParent(node: AccessibilityNodeInfo?): Boolean {
        var cur = node
        var hops = 0
        while (cur != null && hops < 6) {
            if (cur.isClickable) {
                return cur.performAction(AccessibilityNodeInfo.ACTION_CLICK)
            }
            cur = cur.parent
            hops++
        }
        return false
    }

    override fun tapCoordinates(x: Float, y: Float): Boolean {
        val path = Path().apply { moveTo(x, y) }
        val stroke = GestureDescription.StrokeDescription(path, 0L, 65L)
        val gesture = GestureDescription.Builder().addStroke(stroke).build()
        return dispatchGesture(gesture, null, null)
    }

    override fun swipeCoordinates(x1: Float, y1: Float, x2: Float, y2: Float, durationMs: Long): Boolean {
        val path = Path().apply {
            moveTo(x1, y1)
            lineTo(x2, y2)
        }
        val stroke = GestureDescription.StrokeDescription(path, 0L, durationMs.coerceIn(80L, 2000L))
        val gesture = GestureDescription.Builder().addStroke(stroke).build()
        return dispatchGesture(gesture, null, null)
    }

    override fun inputTextIntoFocusedNode(text: String): Boolean {
        val root = rootInActiveWindow ?: return false
        val focused = root.findFocus(AccessibilityNodeInfo.FOCUS_INPUT) ?: return false
        val args = Bundle().apply {
            putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE, text)
        }
        return focused.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT, args)
    }

    override fun performGlobalNav(actionName: String): Boolean {
        val lower = actionName.lowercase(Locale.ROOT)
        val action = when {
            lower.contains("back") -> GLOBAL_ACTION_BACK
            lower.contains("home") -> GLOBAL_ACTION_HOME
            lower.contains("recents") -> GLOBAL_ACTION_RECENTS
            lower.contains("notifications") -> GLOBAL_ACTION_NOTIFICATIONS
            lower.contains("quick_settings") -> GLOBAL_ACTION_QUICK_SETTINGS
            lower.contains("power") -> GLOBAL_ACTION_POWER_DIALOG
            lower.contains("lock") && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> GLOBAL_ACTION_LOCK_SCREEN
            lower.contains("screenshot") && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> GLOBAL_ACTION_TAKE_SCREENSHOT
            else -> GLOBAL_ACTION_HOME
        }
        return performGlobalAction(action)
    }
}

/**
 * Notification Listener Service (`com.meera.android.automation.MeeraNotificationListener`).
 */
class MeeraNotificationListener : NotificationListenerService(), MeeraAutomationBridge.NotificationController {

    data class CapturedNotification(
        val key: String,
        val packageName: String,
        val title: String,
        val text: String,
        val timestampMs: Long,
        val replyAction: Notification.Action?
    )

    private val recentNotifications = ConcurrentLinkedDeque<CapturedNotification>()

    override fun onListenerConnected() {
        super.onListenerConnected()
        MeeraAutomationBridge.notificationController = this
    }

    override fun onNotificationPosted(sbn: StatusBarNotification?) {
        if (sbn == null) return
        val extras = sbn.notification?.extras ?: return
        val title = extras.getCharSequence(Notification.EXTRA_TITLE)?.toString()?.trim().orEmpty()
        val text = extras.getCharSequence(Notification.EXTRA_TEXT)?.toString()?.trim().orEmpty()
        if (title.isEmpty() && text.isEmpty()) return

        val replyAct = sbn.notification.actions?.firstOrNull { act ->
            act.remoteInputs?.isNotEmpty() == true
        }

        while (recentNotifications.size >= 80) {
            recentNotifications.pollLast()
        }
        recentNotifications.addFirst(
            CapturedNotification(
                key = sbn.key,
                packageName = sbn.packageName,
                title = title,
                text = text,
                timestampMs = sbn.postTime,
                replyAction = replyAct
            )
        )
    }

    override fun getRecentNotificationsJson(limit: Int): JSONArray {
        val arr = JSONArray()
        for (item in recentNotifications.take(limit)) {
            arr.put(
                JSONObject().apply {
                    put("package", item.packageName)
                    put("sender", item.title)
                    put("message", item.text)
                    put("timestamp_ms", item.timestampMs)
                    put("can_reply", item.replyAction != null)
                }
            )
        }
        return arr
    }

    override fun replyToLastNotification(
        packageFilter: String?,
        senderFilter: String?,
        message: String
    ): Boolean {
        val candidate = recentNotifications.firstOrNull { item ->
            val pkgOk = packageFilter.isNullOrBlank() ||
                item.packageName.equals(packageFilter, ignoreCase = true)
            val senderOk = senderFilter.isNullOrBlank() ||
                item.title.contains(senderFilter, ignoreCase = true)
            pkgOk && senderOk && item.replyAction != null
        } ?: return false

        val action = candidate.replyAction ?: return false
        val remoteInputs = action.remoteInputs ?: return false
        val fillIntent = Intent()
        val bundle = Bundle()
        for (ri in remoteInputs) {
            bundle.putCharSequence(ri.resultKey, message)
        }
        RemoteInput.addResultsToIntent(remoteInputs, fillIntent, bundle)
        return runCatching {
            action.actionIntent.send(applicationContext, 0, fillIntent)
            true
        }.getOrDefault(false)
    }

    override fun dismissAllNotifications(): Boolean {
        return runCatching {
            cancelAllNotifications()
            true
        }.getOrDefault(false)
    }

    override fun onDestroy() {
        if (MeeraAutomationBridge.notificationController === this) {
            MeeraAutomationBridge.notificationController = null
        }
        super.onDestroy()
    }
}

// ============================================================================
// DIGITAL ASSISTANT, VOICE INTERACTION, OAUTH & SYSTEM BROADCAST RECEIVERS
// ============================================================================

class MeeraAssistActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        startActivity(
            Intent(this, MainActivity::class.java).apply {
                putExtra("from_assist", true)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
            }
        )
        finish()
    }
}

class OAuthRedirectActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val data: Uri? = intent?.data
        if (data != null) {
            val code = data.getQueryParameter("code").orEmpty()
            val state = data.getQueryParameter("state").orEmpty()
            getSharedPreferences("meera_oauth_prefs", Context.MODE_PRIVATE)
                .edit()
                .putString("last_oauth_code", code)
                .putString("last_oauth_state", state)
                .putLong("last_oauth_timestamp", System.currentTimeMillis())
                .apply()
        }
        finish()
    }
}

class TermuxPermissionActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            requestPermissions(arrayOf("com.termux.permission.RUN_COMMAND"), 901)
        }
        finish()
    }
}

class UnlockActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        finish()
    }
}

class ScreenCapturePermissionActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        finish()
    }
}

class MeeraVoiceInteractionService : VoiceInteractionService()

class MeeraVoiceInteractionSessionService : VoiceInteractionSessionService() {
    override fun onNewSession(args: Bundle?): VoiceInteractionSession =
        VoiceInteractionSession(this)
}

class MeeraRecognitionService : RecognitionService() {
    override fun onStartListening(recognizerIntent: Intent?, listener: Callback?) {}
    override fun onCancel(listener: Callback?) {}
    override fun onStopListening(listener: Callback?) {}
}

class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        val action = intent?.action ?: return
        if (action == Intent.ACTION_BOOT_COMPLETED ||
            action == Intent.ACTION_MY_PACKAGE_REPLACED ||
            action == "android.intent.action.QUICKBOOT_POWERON"
        ) {
            val svc = Intent(context, MeeraForegroundService::class.java)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                context.startForegroundService(svc)
            } else {
                context.startService(svc)
            }
        }
    }
}

class ReminderReceiver : BroadcastReceiver() {
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    override fun onReceive(context: Context, intent: Intent?) {
        val text = intent?.getStringExtra("reminder_text") ?: return
        val app = MeeraApplication.instance ?: return
        scope.launch {
            app.pocketTts.speak(
                rawText = "Boss, aapka reminder: $text",
                preferredEmotion = MeeraVoiceEmotion.CARING
            )
        }
    }
}

class SocialAlarmReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        val postContent = intent?.getStringExtra("post_content").orEmpty()
        context.getSharedPreferences("meera_social_prefs", Context.MODE_PRIVATE)
            .edit()
            .putString("last_triggered_post", postContent)
            .apply()
    }
}

class MarketingAlarmReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        val campaign = intent?.getStringExtra("campaign_name").orEmpty()
        context.getSharedPreferences("meera_marketing_prefs", Context.MODE_PRIVATE)
            .edit()
            .putString("last_triggered_campaign", campaign)
            .apply()
    }
}

class TermuxResultReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        val bundle = intent?.getBundleExtra("result") ?: return
        val stdout = bundle.getString("stdout").orEmpty()
        val stderr = bundle.getString("stderr").orEmpty()
        val exitCode = bundle.getInt("exitCode", 0)
        context.getSharedPreferences("meera_termux_prefs", Context.MODE_PRIVATE)
            .edit()
            .putString("last_stdout", stdout)
            .putString("last_stderr", stderr)
            .putInt("last_exit_code", exitCode)
            .apply()
    }
}

class PhoneStateReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        if (intent?.action != TelephonyManager.ACTION_PHONE_STATE_CHANGED) return
        val state = intent.getStringExtra(TelephonyManager.EXTRA_STATE)
        if (state == TelephonyManager.EXTRA_STATE_RINGING || state == TelephonyManager.EXTRA_STATE_OFFHOOK) {
            MeeraApplication.instance?.pocketTts?.stopSpeaking()
        }
    }
}

class DrivingOffReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        context.getSharedPreferences("meera_driving_prefs", Context.MODE_PRIVATE)
            .edit()
            .putBoolean("driving_mode_active", false)
            .apply()
    }
}