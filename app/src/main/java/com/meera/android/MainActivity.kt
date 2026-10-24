@file:Suppress("unused", "MemberVisibilityCanBePrivate")

package com.meera.android

import android.Manifest
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import com.meera.android.agent.LlmConfig
import com.meera.android.agent.LlmProvider
import com.meera.android.agent.MeeraAgentOrchestrator
import com.meera.android.ui.facelock.FaceLockActivity
import com.meera.android.ui.facelock.WatchmanActivity
import com.meera.android.voice.MeeraVoiceEmotion
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.launch
import org.json.JSONObject
import kotlin.math.cos
import kotlin.math.sin

// ============================================================================
// PHASE 9B: JETPACK COMPOSE UI SCREENS, AUDIO-REACTIVE ORB HUD & DATASTORE
// (`MainActivity.kt`)
// Reconstructed in pure Kotlin from Maya v5.2.39 UI + Boss Brain Orb design:
//   - Jetpack `DataStore<Preferences>` persistent settings (`MeeraSettingsStore`)
//   - 42-Particle Audio-Reactive Harmonic Orb (`MeeraReactiveOrbCanvas`)
//   - 5-Tab Navigation:
//       1. Home (Live Zero-Beep Stream, Orb HUD, Quick Chat & Barge-In Status)
//       2. Scan & Security (FaceLock YuNet+SFace, Intruder Watchman, Screen Vision)
//       3. 327 Tools & Macros Explorer
//       4. Voices, 14 Emotions & Boss Memory Vault
//       5. Multi-LLM & API Key Setup Modal (`Aoede` / `Kore` / `Despina` / `Leda` / `Zephyr`)
// ============================================================================

private val Context.meeraDataStore by preferencesDataStore(name = "meera_user_settings")

data class MeeraUserSettings(
    val llmProviderId: String = "gemini",
    val apiKey: String = "",
    val modelName: String = "gemini-2.5-flash",
    val voiceCharacter: String = "Aoede",
    val defaultEmotionId: String = "romantic",
    val backendUrl: String = "https://api.meera.ai",
    val zeroBeepAlwaysOn: Boolean = true
)

class MeeraSettingsRepository(private val context: Context) {
    companion object {
        private val KEY_PROVIDER = stringPreferencesKey("llm_provider")
        private val KEY_API_KEY = stringPreferencesKey("llm_api_key")
        private val KEY_MODEL = stringPreferencesKey("llm_model")
        private val KEY_VOICE = stringPreferencesKey("tts_voice_character")
        private val KEY_EMOTION = stringPreferencesKey("default_emotion_id")
        private val KEY_BACKEND = stringPreferencesKey("backend_url")
        private val KEY_ZERO_BEEP = booleanPreferencesKey("zero_beep_always_on")
    }

    val settingsFlow: Flow<MeeraUserSettings> = context.meeraDataStore.data.map { prefs ->
        MeeraUserSettings(
            llmProviderId = prefs[KEY_PROVIDER] ?: "gemini",
            apiKey = prefs[KEY_API_KEY] ?: "",
            modelName = prefs[KEY_MODEL] ?: "gemini-2.5-flash",
            voiceCharacter = prefs[KEY_VOICE] ?: "Aoede",
            defaultEmotionId = prefs[KEY_EMOTION] ?: "romantic",
            backendUrl = prefs[KEY_BACKEND] ?: "https://api.meera.ai",
            zeroBeepAlwaysOn = prefs[KEY_ZERO_BEEP] ?: true
        )
    }

    suspend fun saveSettings(updated: MeeraUserSettings) {
        context.meeraDataStore.edit { prefs ->
            prefs[KEY_PROVIDER] = updated.llmProviderId
            prefs[KEY_API_KEY] = updated.apiKey
            prefs[KEY_MODEL] = updated.modelName
            prefs[KEY_VOICE] = updated.voiceCharacter
            prefs[KEY_EMOTION] = updated.defaultEmotionId
            prefs[KEY_BACKEND] = updated.backendUrl
            prefs[KEY_ZERO_BEEP] = updated.zeroBeepAlwaysOn
        }
    }
}

class MainActivity : ComponentActivity() {

    private val settingsRepo by lazy { MeeraSettingsRepository(applicationContext) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        requestEssentialRuntimePermissions()

        setContent {
            val darkColors = darkColorScheme(
                primary = Color(0xFFA855F7),
                secondary = Color(0xFFEC4899),
                tertiary = Color(0xFF10B981),
                background = Color(0xFF06070E),
                surface = Color(0xFF090D16)
            )
            MaterialTheme(colorScheme = darkColors) {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = Color(0xFF06070E)
                ) {
                    MeeraMainAppScreen(
                        activity = this,
                        settingsRepo = settingsRepo
                    )
                }
            }
        }
    }

    private fun requestEssentialRuntimePermissions() {
        val needed = mutableListOf(
            Manifest.permission.RECORD_AUDIO,
            Manifest.permission.CAMERA,
            Manifest.permission.READ_CONTACTS,
            Manifest.permission.CALL_PHONE,
            Manifest.permission.SEND_SMS,
            Manifest.permission.ACCESS_FINE_LOCATION
        )
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            needed.add(Manifest.permission.POST_NOTIFICATIONS)
        }
        val missing = needed.filter {
            ContextCompat.checkSelfPermission(this, it) != PackageManager.PERMISSION_GRANTED
        }
        if (missing.isNotEmpty()) {
            ActivityCompat.requestPermissions(this, missing.toTypedArray(), 101)
        }
    }
}

@Composable
fun MeeraMainAppScreen(
    activity: ComponentActivity,
    settingsRepo: MeeraSettingsRepository
) {
    val app = remember { MeeraApplication.instance ?: (activity.application as MeeraApplication) }
    val scope = rememberCoroutineScope()

    val userSettings by settingsRepo.settingsFlow.collectAsState(initial = MeeraUserSettings())
    val ttsTelemetry by app.pocketTts.telemetry.collectAsState()
    val agentState by app.agentOrchestrator.agentState.collectAsState()

    var selectedTab by remember { mutableIntStateOf(0) }
    var isZeroBeepLive by remember { mutableStateOf(false) }
    var statusHeadline by remember { mutableStateOf("नमस्ते Boss! मैं मीरा हूँ 💖") }
    var statusSubtitle by remember { mutableStateOf("🎤 दबाएं — माइक कभी अपने आप बंद नहीं होगा!") }
    var textCommandInput by remember { mutableStateOf("") }
    var showApiSetupModal by remember { mutableStateOf(false) }

    // Synchronize LLM settings into MeeraAgentOrchestrator whenever DataStore updates
    LaunchedEffect(userSettings) {
        val provider = LlmProvider.entries.firstOrNull { it.id == userSettings.llmProviderId }
            ?: LlmProvider.GEMINI
        app.agentOrchestrator.configureLlm(
            primary = LlmConfig(
                provider = provider,
                apiKey = userSettings.apiKey,
                modelName = userSettings.modelName
            )
        )
    }

    Scaffold(
        containerColor = Color(0xFF06070E),
        topBar = {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .background(Color(0xFF0B0F1B))
                    .padding(horizontal = 14.dp, vertical = 12.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Box(
                    modifier = Modifier
                        .clip(RoundedCornerShape(8.dp))
                        .background(Color(0x18FFFFFF))
                        .clickable { showApiSetupModal = true }
                        .padding(horizontal = 12.dp, vertical = 6.dp)
                ) {
                    Text("☰", color = Color(0xFFE2E8F0), fontSize = 18.sp)
                }

                Text(
                    text = "✨ Meera AI (${userSettings.voiceCharacter} + 327 Tools)",
                    color = Color.White,
                    fontWeight = FontWeight.Bold,
                    fontSize = 15.sp
                )

                Box(
                    modifier = Modifier
                        .clip(RoundedCornerShape(20.dp))
                        .background(
                            Brush.horizontalGradient(
                                listOf(Color(0xFF10B981), Color(0xFF059669))
                            )
                        )
                        .clickable { showApiSetupModal = true }
                        .padding(horizontal = 12.dp, vertical = 6.dp)
                ) {
                    Text("🔑 API Key", color = Color.White, fontSize = 12.sp, fontWeight = FontWeight.Bold)
                }
            }
        },
        bottomBar = {
            MeeraBottomNavigationBar(
                selectedTab = selectedTab,
                isZeroBeepLive = isZeroBeepLive,
                onSelectTab = { tab ->
                    if (tab == 2) {
                        // Reset memory / chat history shortcut
                        scope.launch {
                            app.agentOrchestrator.clearConversationHistory()
                            statusSubtitle = "मेमोरी रीसेट हो गई! नई बातचीत शुरू करें।"
                        }
                    } else {
                        selectedTab = tab
                    }
                },
                onToggleZeroBeepMic = {
                    if (userSettings.apiKey.isBlank()) {
                        showApiSetupModal = true
                    } else {
                        isZeroBeepLive = !isZeroBeepLive
                        val svcIntent = Intent(activity, MeeraForegroundService::class.java).apply {
                            action = if (isZeroBeepLive) {
                                MeeraForegroundService.ACTION_START_LISTENING
                            } else {
                                MeeraForegroundService.ACTION_STOP_LISTENING
                            }
                        }
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                            activity.startForegroundService(svcIntent)
                        } else {
                            activity.startService(svcIntent)
                        }
                        statusHeadline = if (isZeroBeepLive) {
                            "मीरा सुन रही है (${userSettings.voiceCharacter} Mode)"
                        } else {
                            "कॉल बंद हो गई"
                        }
                    }
                }
            )
        }
    ) { innerPadding ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(innerPadding)
        ) {
            when (selectedTab) {
                0 -> MeeraHomeStageTab(
                    isZeroBeepLive = isZeroBeepLive,
                    isSpeaking = ttsTelemetry.isSpeaking,
                    rmsVolume = ttsTelemetry.rmsVolume,
                    agentState = agentState,
                    statusHeadline = statusHeadline,
                    statusSubtitle = statusSubtitle,
                    textCommandInput = textCommandInput,
                    onTextChange = { textCommandInput = it },
                    onSendCommand = {
                        val query = textCommandInput.trim()
                        if (query.isNotEmpty()) {
                            textCommandInput = ""
                            statusHeadline = "मीरा सोच रही है..."
                            scope.launch {
                                val outcome = app.agentOrchestrator.processUserTurn(
                                    userTranscript = query,
                                    autoSpeakReply = true,
                                    onToolProgress = { toolName ->
                                        statusHeadline = "⚙️ Tool: $toolName"
                                    }
                                )
                                statusHeadline = "मीरा (${userSettings.voiceCharacter}) बोल रही है 💖"
                                statusSubtitle = outcome.spokenReply
                            }
                        }
                    },
                    onOrbTap = {
                        if (ttsTelemetry.isSpeaking) {
                            app.pocketTts.stopSpeaking()
                        } else if (userSettings.apiKey.isBlank()) {
                            showApiSetupModal = true
                        }
                    }
                )
                1 -> MeeraSecurityAndScanTab(activity = activity, app = app)
                3 -> MeeraVoicesAndToolsTab(
                    app = app,
                    currentSettings = userSettings,
                    onOpenApiModal = { showApiSetupModal = true }
                )
            }
        }
    }

    if (showApiSetupModal) {
        MeeraApiSetupModal(
            current = userSettings,
            onDismiss = { showApiSetupModal = false },
            onSave = { updated ->
                scope.launch {
                    settingsRepo.saveSettings(updated)
                    statusHeadline = "मीरा तैयार है (${updated.voiceCharacter})"
                    showApiSetupModal = false
                }
            }
        )
    }
}

@Composable
private fun MeeraHomeStageTab(
    isZeroBeepLive: Boolean,
    isSpeaking: Boolean,
    rmsVolume: Float,
    agentState: MeeraAgentOrchestrator.AgentState,
    statusHeadline: String,
    statusSubtitle: String,
    textCommandInput: String,
    onTextChange: (String) -> Unit,
    onSendCommand: () -> Unit,
    onOrbTap: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        // Live Zero-Beep Badge
        Box(
            modifier = Modifier
                .clip(RoundedCornerShape(20.dp))
                .background(if (isZeroBeepLive) Color(0x3310B981) else Color(0x15FFFFFF))
                .border(
                    width = 1.dp,
                    color = if (isZeroBeepLive) Color(0xFF10B981) else Color.Transparent,
                    shape = RoundedCornerShape(20.dp)
                )
                .padding(horizontal = 14.dp, vertical = 5.dp)
        ) {
            Text(
                text = if (isZeroBeepLive) "● ZERO-BEEP MIC ALWAYS ON" else "● ZERO-BEEP STREAM OFF",
                color = if (isZeroBeepLive) Color(0xFF34D399) else Color(0xFF94A3B8),
                fontSize = 11.sp,
                fontWeight = FontWeight.Bold
            )
        }

        Spacer(modifier = Modifier.height(18.dp))

        // 42-Particle Audio-Reactive Orb Canvas (Exact match to Boss Brain Orb)
        Box(
            modifier = Modifier
                .size(196.dp)
                .clip(CircleShape)
                .border(2.dp, Color(0x88EC4899), CircleShape)
                .clickable { onOrbTap() },
            contentAlignment = Alignment.Center
        ) {
            MeeraReactiveOrbCanvas(
                isSpeaking = isSpeaking,
                isListening = isZeroBeepLive,
                rmsVolume = rmsVolume
            )
        }

        Spacer(modifier = Modifier.height(20.dp))

        Text(
            text = statusHeadline,
            color = Color(0xFFF8FAFC),
            fontSize = 19.sp,
            fontWeight = FontWeight.Bold,
            textAlign = TextAlign.Center
        )

        Spacer(modifier = Modifier.height(8.dp))

        Text(
            text = statusSubtitle,
            color = Color(0xFFCBD5E1),
            fontSize = 14.sp,
            textAlign = TextAlign.Center,
            modifier = Modifier
                .fillMaxWidth(0.9f)
                .padding(vertical = 4.dp)
        )

        Spacer(modifier = Modifier.height(18.dp))

        // Direct Hinglish Command / Chat Bar for testing all 327 tools + conversation
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            OutlinedTextField(
                value = textCommandInput,
                onValueChange = onTextChange,
                placeholder = { Text("बोलिए या लिखिए Boss (e.g. टॉर्च जलाओ / गाना चलाओ)...", fontSize = 13.sp) },
                modifier = Modifier.weight(1f),
                singleLine = true
            )
            Spacer(modifier = Modifier.width(8.dp))
            Button(
                onClick = onSendCommand,
                colors = ButtonDefaults.buttonColors(containerColor = Color(0xFFA855F7))
            ) {
                Text("Send", color = Color.White, fontWeight = FontWeight.Bold)
            }
        }
    }
}

@Composable
private fun MeeraReactiveOrbCanvas(
    isSpeaking: Boolean,
    isListening: Boolean,
    rmsVolume: Float
) {
    val infiniteTransition = rememberInfiniteTransition(label = "orb_phase")
    val phase by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = (Math.PI * 20).toFloat(),
        animationSpec = infiniteRepeatable(
            animation = tween(durationMillis = 16000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "orb_angle"
    )

    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2f
        val centerY = size.height / 2f
        val baseRadius = size.minDimension * 0.27f
        val dynamicWave = if (isSpeaking) {
            24f + rmsVolume * 38f
        } else {
            minOf(26f, rmsVolume * 32f + 6f)
        }

        val dotColor = when {
            isSpeaking -> Color(0xFFEC4899)
            isListening -> Color(0xFF34D399)
            else -> Color(0xFF60A5FA)
        }

        for (i in 0 until 42) {
            val rad = baseRadius + sin(phase + i) * dynamicWave
            val x = centerX + cos(i * 0.3f + phase) * rad
            val y = centerY + sin(i * 0.5f + phase) * rad
            drawCircle(
                color = dotColor,
                radius = 4.2.dp.toPx(),
                center = Offset(x, y)
            )
        }
    }
}

@Composable
private fun MeeraSecurityAndScanTab(
    activity: ComponentActivity,
    app: MeeraApplication
) {
    val scope = rememberCoroutineScope()
    var lastStatus by remember { mutableStateOf("YuNet (640x640) + SFace (112x112) Biometric Engine Ready") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        Text(
            text = "🛡️ FaceLock, Watchman & Vision",
            color = Color.White,
            fontSize = 18.sp,
            fontWeight = FontWeight.Bold
        )
        Text(text = lastStatus, color = Color(0xFF94A3B8), fontSize = 13.sp)

        Button(
            onClick = {
                activity.startActivity(Intent(activity, FaceLockActivity::class.java))
            },
            modifier = Modifier.fillMaxWidth(),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFFA855F7))
        ) {
            Text("🔒 Launch FaceLock Shield Activity")
        }

        Button(
            onClick = {
                activity.startActivity(Intent(activity, WatchmanActivity::class.java))
            },
            modifier = Modifier.fillMaxWidth(),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF10B981))
        ) {
            Text("👁️ Launch Intruder Watchman Activity")
        }

        Button(
            onClick = {
                scope.launch {
                    val ok = app.faceLockEngine.syncAndLoadModels()
                    lastStatus = if (ok) "Models synced & loaded!" else "Using built-in geometric face fallback until server sync"
                }
            },
            modifier = Modifier.fillMaxWidth(),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFFec4899))
        ) {
            Text("⬇️ Sync YuNet + SFace Models (/models/face/v1/)")
        }
    }
}

@Composable
private fun MeeraVoicesAndToolsTab(
    app: MeeraApplication,
    currentSettings: MeeraUserSettings,
    onOpenApiModal: () -> Unit
) {
    val allTools = remember { app.toolRegistry.getAllTools() }
    val scope = rememberCoroutineScope()

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "🛠️ Registered Tools (${allTools.size} / 327)",
                color = Color.White,
                fontSize = 17.sp,
                fontWeight = FontWeight.Bold
            )
            TextButton(onClick = onOpenApiModal) {
                Text("Change Voice (${currentSettings.voiceCharacter})", color = Color(0xFFEC4899))
            }
        }

        Spacer(modifier = Modifier.height(8.dp))

        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(allTools) { tool ->
                Card(
                    colors = CardDefaults.cardColors(containerColor = Color(0xFF111827)),
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable {
                            scope.launch {
                                app.toolRegistry.executeTool(tool.name, JSONObject())
                            }
                        }
                ) {
                    Column(modifier = Modifier.padding(12.dp)) {
                        Text(
                            text = "${tool.name}  •  [${tool.category.title}]",
                            color = Color(0xFFC084FC),
                            fontSize = 13.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = tool.description,
                            color = Color(0xFFCBD5E1),
                            fontSize = 12.sp
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun MeeraBottomNavigationBar(
    selectedTab: Int,
    isZeroBeepLive: Boolean,
    onSelectTab: (Int) -> Unit,
    onToggleZeroBeepMic: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .background(Color(0xFF090D16))
            .padding(horizontal = 10.dp, vertical = 12.dp),
        horizontalArrangement = Arrangement.SpaceAround,
        verticalAlignment = Alignment.CenterVertically
    ) {
        NavBarItem(icon = "🏠", label = "Home", active = selectedTab == 0) { onSelectTab(0) }
        NavBarItem(icon = "📷", label = "Scan", active = selectedTab == 1) { onSelectTab(1) }

        // Center Floating Mic Orb Button
        Box(
            modifier = Modifier
                .size(64.dp)
                .clip(CircleShape)
                .background(
                    Brush.linearGradient(
                        if (isZeroBeepLive) {
                            listOf(Color(0xFFEF4444), Color(0xFFF97316))
                        } else {
                            listOf(Color(0xFFA855F7), Color(0xFFEC4899))
                        }
                    )
                )
                .border(3.dp, Color(0xFF06070E), CircleShape)
                .clickable { onToggleZeroBeepMic() },
            contentAlignment = Alignment.Center
        ) {
            Text(text = if (isZeroBeepLive) "⏹️" else "🎤", fontSize = 24.sp)
        }

        NavBarItem(icon = "🧠", label = "Reset", active = false) { onSelectTab(2) }
        NavBarItem(icon = "🗣️", label = "Voices", active = selectedTab == 3) { onSelectTab(3) }
    }
}

@Composable
private fun NavBarItem(
    icon: String,
    label: String,
    active: Boolean,
    onClick: () -> Unit
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = Modifier
            .clickable { onClick() }
            .padding(horizontal = 8.dp, vertical = 4.dp)
    ) {
        Text(text = icon, fontSize = 18.sp)
        Text(
            text = label,
            fontSize = 11.sp,
            color = if (active) Color(0xFFC084FC) else Color(0xFF94A3B8),
            fontWeight = if (active) FontWeight.Bold else FontWeight.Normal
        )
    }
}

@Composable
private fun MeeraApiSetupModal(
    current: MeeraUserSettings,
    onDismiss: () -> Unit,
    onSave: (MeeraUserSettings) -> Unit
) {
    var apiKey by remember { mutableStateOf(current.apiKey) }
    var modelName by remember { mutableStateOf(current.modelName) }
    var voiceName by remember { mutableStateOf(current.voiceCharacter) }
    var emotionId by remember { mutableStateOf(current.defaultEmotionId) }

    val voices = listOf("Aoede", "Despina", "Kore", "Leda", "Zephyr")
    val emotions = MeeraVoiceEmotion.entries.map { it.id }

    AlertDialog(
        onDismissRequest = onDismiss,
        containerColor = Color(0xFF111827),
        title = {
            Text("🔑 Meera AI सेटअप", color = Color(0xFFF3E8FF), fontWeight = FontWeight.Bold)
        },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
                OutlinedTextField(
                    value = apiKey,
                    onValueChange = { apiKey = it },
                    label = { Text("Gemini / LLM API Key") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = modelName,
                    onValueChange = { modelName = it },
                    label = { Text("Working Brain Model (e.g. gemini-2.5-flash)") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                Text("Meera Voice Character (Tap to cycle):", color = Color(0xFF94A3B8), fontSize = 12.sp)
                Button(
                    onClick = {
                        val nextIdx = (voices.indexOf(voiceName) + 1) % voices.size
                        voiceName = voices[nextIdx]
                    },
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF1F2937))
                ) {
                    Text("Voice: $voiceName", color = Color.White)
                }

                Text("Default Emotion Preset (14 Moods):", color = Color(0xFF94A3B8), fontSize = 12.sp)
                Button(
                    onClick = {
                        val nextIdx = (emotions.indexOf(emotionId) + 1) % emotions.size
                        emotionId = emotions[nextIdx]
                    },
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF1F2937))
                ) {
                    Text("Emotion: $emotionId", color = Color.White)
                }
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    onSave(
                        current.copy(
                            apiKey = apiKey.trim(),
                            modelName = modelName.trim().ifBlank { "gemini-2.5-flash" },
                            voiceCharacter = voiceName,
                            defaultEmotionId = emotionId
                        )
                    )
                },
                colors = ButtonDefaults.buttonColors(containerColor = Color(0xFFEC4899))
            ) {
                Text("Save & Continue", color = Color.White, fontWeight = FontWeight.Bold)
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel", color = Color(0xFF94A3B8))
            }
        }
    )
}