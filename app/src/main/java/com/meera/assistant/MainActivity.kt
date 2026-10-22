package com.meera.assistant

import android.Manifest
import android.app.AppOpsManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.PowerManager
import android.provider.Settings
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.compose.setContent
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.core.FastOutSlowInEasing
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
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
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableFloatStateOf
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
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalView
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.core.app.NotificationManagerCompat
import androidx.core.content.ContextCompat
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.compose.LifecycleEventEffect
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import kotlin.math.cos
import kotlin.math.sin

private val BG = Color(0xFF06080F)
private val BLOBS = listOf(Color(0xFF22D3EE), Color(0xFF8B5CF6), Color(0xFFEC4899))
private val httpClient = OkHttpClient()

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme(colorScheme = darkColorScheme()) {
                Surface(modifier = Modifier.fillMaxSize(), color = BG) { App() }
            }
        }
    }
}

// ------------------------------------------------------------ permissions helpers
// 9 normal permissions. Badalni ho to bas is list me edit karo.
private fun runtimePerms(): List<Pair<String, String>> {
    val l = mutableListOf(
        Manifest.permission.RECORD_AUDIO to "Mic (awaaz)",
        Manifest.permission.CAMERA to "Camera / torch",
        Manifest.permission.READ_CONTACTS to "Contacts",
        Manifest.permission.CALL_PHONE to "Call karna",
        Manifest.permission.SEND_SMS to "SMS bhejna",
        Manifest.permission.READ_SMS to "SMS padhna",
        Manifest.permission.READ_PHONE_STATE to "Phone state",
        Manifest.permission.ACCESS_FINE_LOCATION to "Location",
    )
    if (Build.VERSION.SDK_INT >= 33) {
        l.add(Manifest.permission.POST_NOTIFICATIONS to "Notifications")
    }
    return l
}

private fun granted(ctx: Context, p: String) =
    ContextCompat.checkSelfPermission(ctx, p) == PackageManager.PERMISSION_GRANTED

private fun usageAllowed(c: Context): Boolean {
    val ops = c.getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
    @Suppress("DEPRECATION")
    val mode = ops.checkOpNoThrow(
        AppOpsManager.OPSTR_GET_USAGE_STATS, android.os.Process.myUid(), c.packageName
    )
    return mode == AppOpsManager.MODE_ALLOWED
}

private class SpecialPerm(
    val label: String,
    val isOn: (Context) -> Boolean,
    val intent: (Context) -> Intent,
)

// 5 system-level permissions (Settings screen se on hoti hain)
private fun specialPerms(): List<SpecialPerm> = listOf(
    SpecialPerm(
        "Display over other apps",
        { c -> Settings.canDrawOverlays(c) },
        { c -> Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:${c.packageName}")) }
    ),
    SpecialPerm(
        "Accessibility (screen padhna / tap)",
        { c ->
            Settings.Secure.getString(
                c.contentResolver, Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES
            )?.contains(c.packageName) == true
        },
        { _ -> Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS) }
    ),
    SpecialPerm(
        "Notification access",
        { c -> NotificationManagerCompat.getEnabledListenerPackages(c).contains(c.packageName) },
        { _ -> Intent("android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS") }
    ),
    SpecialPerm(
        "Battery optimization band (background me chalne ke liye)",
        { c ->
            (c.getSystemService(Context.POWER_SERVICE) as PowerManager)
                .isIgnoringBatteryOptimizations(c.packageName)
        },
        { c ->
            Intent(
                Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
                Uri.parse("package:${c.packageName}")
            )
        }
    ),
    SpecialPerm(
        "Usage access (kaun sa app khula hai)",
        { c -> usageAllowed(c) },
        { _ -> Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS) }
    ),
)

private fun validateKey(key: String): Boolean = try {
    val req = Request.Builder()
        .url("https://generativelanguage.googleapis.com/v1beta/models?key=$key")
        .build()
    httpClient.newCall(req).execute().use { it.isSuccessful }
} catch (e: Exception) {
    Log.e("Meera", "key check fail", e)
    false
}

// ------------------------------------------------------------ screens
@Composable
fun App() {
    val ctx = LocalContext.current
    var stage by remember {
        mutableIntStateOf(
            when {
                SecureStore.getKey(ctx) == null -> 0
                runtimePerms().all { granted(ctx, it.first) } -> 2
                else -> 1
            }
        )
    }
    when (stage) {
        0 -> KeyScreen { stage = 1 }
        1 -> PermScreen { stage = 2 }
        else -> Dashboard()
    }
}

@Composable
fun KeyScreen(onDone: () -> Unit) {
    val ctx = LocalContext.current
    val scope = rememberCoroutineScope()
    var key by remember { mutableStateOf("") }
    var msg by remember { mutableStateOf("") }
    var busy by remember { mutableStateOf(false) }

    Column(
        Modifier.fillMaxSize().padding(24.dp),
        verticalArrangement = Arrangement.Center
    ) {
        Text("Meera AI", fontSize = 32.sp, fontWeight = FontWeight.Bold)
        Spacer(Modifier.height(8.dp))
        Text("Pehle apni Gemini API key daalo. Ye phone me encrypted save hoti hai.")
        Spacer(Modifier.height(16.dp))
        OutlinedTextField(
            value = key,
            onValueChange = { key = it.trim() },
            label = { Text("Gemini API key") },
            singleLine = true,
            visualTransformation = PasswordVisualTransformation(),
            modifier = Modifier.fillMaxWidth()
        )
        Spacer(Modifier.height(8.dp))
        Button(
            onClick = {
                busy = true
                msg = ""
                scope.launch {
                    val ok = withContext(Dispatchers.IO) { validateKey(key) }
                    busy = false
                    if (ok) {
                        SecureStore.saveKey(ctx, key)
                        onDone()
                    } else {
                        msg = "Key sahi nahi lagi ya internet nahi hai."
                    }
                }
            },
            enabled = key.isNotEmpty() && !busy,
            modifier = Modifier.fillMaxWidth()
        ) { Text(if (busy) "Check ho raha hai..." else "Save karo") }
        TextButton(onClick = {
            ctx.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("https://aistudio.google.com/apikey")))
        }) { Text("Free API key lo (Google AI Studio)") }
        if (msg.isNotEmpty()) Text(msg, color = Color(0xFFFF8A80))
    }
}

@Composable
fun PermScreen(onDone: () -> Unit) {
    val ctx = LocalContext.current
    val rt = remember { runtimePerms() }
    val specials = remember { specialPerms() }
    var tick by remember { mutableIntStateOf(0) }
    LifecycleEventEffect(Lifecycle.Event.ON_RESUME) { tick++ }
    val launcher = rememberLauncherForActivityResult(
        ActivityResultContracts.RequestMultiplePermissions()
    ) { tick++ }
    val refresh = tick // is se recomposition hota hai

    Column(
        Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(24.dp)
    ) {
        Text("Permissions ($refresh)", fontSize = 28.sp, fontWeight = FontWeight.Bold)
        Spacer(Modifier.height(16.dp))
        Text("1) Normal permissions", fontWeight = FontWeight.SemiBold)
        Spacer(Modifier.height(8.dp))
        rt.forEach { (p, label) ->
            Text((if (granted(ctx, p)) "✅ " else "⬜ ") + label)
        }
        Spacer(Modifier.height(8.dp))
        Button(
            onClick = { launcher.launch(rt.map { it.first }.toTypedArray()) },
            modifier = Modifier.fillMaxWidth()
        ) { Text("Sab allow karo") }

        Spacer(Modifier.height(24.dp))
        Text("2) System-level permissions (Settings me jaake)", fontWeight = FontWeight.SemiBold)
        Spacer(Modifier.height(8.dp))
        specials.forEach { s ->
            val on = s.isOn(ctx)
            Row(
                Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text((if (on) "✅ " else "⬜ ") + s.label, Modifier.weight(1f))
                if (!on) {
                    TextButton(onClick = { ctx.startActivity(s.intent(ctx)) }) { Text("Kholo") }
                }
            }
        }
        Spacer(Modifier.height(24.dp))
        Button(onClick = onDone, modifier = Modifier.fillMaxWidth()) { Text("Aage badho") }
    }
}

@Composable
fun Dashboard() {
    val ctx = LocalContext.current
    val view = LocalView.current
    var persona by remember {
        mutableStateOf(PERSONAS.firstOrNull { it.name == SecureStore.getPersona(ctx) } ?: PERSONAS[0])
    }
    var status by remember { mutableStateOf("Mic dabao aur bolo") }
    var level by remember { mutableFloatStateOf(0f) }
    var running by remember { mutableStateOf(false) }
    var client by remember { mutableStateOf<LiveClient?>(null) }

    fun startLive() {
        val key = SecureStore.getKey(ctx) ?: return
        val c = LiveClient(
            ctx, key, persona,
            onStatus = { status = it },
            onLevel = { level = it },
            onRunning = { running = it }
        )
        client = c
        c.start()
    }

    val micLauncher = rememberLauncherForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { ok -> if (ok) startLive() else status = "Mic ki permission chahiye" }

    fun toggle() {
        if (running) {
            client?.stop()
        } else if (!granted(ctx, Manifest.permission.RECORD_AUDIO)) {
            micLauncher.launch(Manifest.permission.RECORD_AUDIO)
        } else {
            startLive()
        }
    }

    DisposableEffect(Unit) {
        view.keepScreenOn = true
        onDispose {
            view.keepScreenOn = false
            client?.stop()
        }
    }

    Column(
        Modifier.fillMaxSize().padding(24.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.SpaceBetween
    ) {
        Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
            PERSONAS.forEach { p ->
                val sel = p.name == persona.name
                Box(
                    Modifier
                        .clip(RoundedCornerShape(50))
                        .background(if (sel) Color(0xFF3B82F6) else Color(0x22FFFFFF))
                        .clickable {
                            if (!sel) {
                                client?.stop()
                                persona = p
                                SecureStore.savePersona(ctx, p.name)
                            }
                        }
                        .padding(horizontal = 18.dp, vertical = 10.dp)
                ) { Text(p.name, color = Color.White) }
            }
        }

        Orb(level = level, active = running)

        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Text(status, color = Color(0xFFB0B8C8))
            Spacer(Modifier.height(16.dp))
            Box(
                Modifier
                    .size(84.dp)
                    .clip(CircleShape)
                    .background(if (running) Color(0xFFEF4444) else Color(0xFF3B82F6))
                    .clickable { toggle() },
                contentAlignment = Alignment.Center
            ) { Text(if (running) "■" else "🎤", fontSize = 32.sp) }
            Spacer(Modifier.height(16.dp))
        }
    }
}

@Composable
fun Orb(level: Float, active: Boolean) {
    val t = rememberInfiniteTransition(label = "orb")
    val rot by t.animateFloat(
        initialValue = 0f,
        targetValue = 360f,
        animationSpec = infiniteRepeatable(tween(12000, easing = LinearEasing)),
        label = "rot"
    )
    val breathe by t.animateFloat(
        initialValue = 0.96f,
        targetValue = 1.04f,
        animationSpec = infiniteRepeatable(
            tween(2500, easing = FastOutSlowInEasing), RepeatMode.Reverse
        ),
        label = "breathe"
    )
    val lv by animateFloatAsState(if (active) level else 0f, tween(80), label = "lv")

    Canvas(Modifier.size(300.dp)) {
        val c = center
        val base = size.minDimension / 2f * 0.6f
        val r = base * breathe * (1f + lv * 0.4f)

        drawCircle(
            Brush.radialGradient(listOf(Color(0x5533E1FF), Color.Transparent), center = c, radius = r * 1.9f),
            r * 1.9f, c
        )
        for (i in 0 until 3) {
            val a = Math.toRadians((rot * (1f + i * 0.4f) + i * 120f).toDouble())
            val off = Offset(
                c.x + (cos(a) * r * 0.25).toFloat(),
                c.y + (sin(a) * r * 0.25).toFloat()
            )
            drawCircle(
                Brush.radialGradient(
                    listOf(BLOBS[i].copy(alpha = 0.85f), Color.Transparent),
                    center = off, radius = r
                ),
                r, off
            )
        }
        drawCircle(Color.White.copy(alpha = 0.08f), r, c)
        drawCircle(Color.White.copy(alpha = 0.35f), r, c, style = Stroke(2.dp.toPx()))
    }
}
