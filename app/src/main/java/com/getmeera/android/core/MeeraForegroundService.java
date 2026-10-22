package com.getmeera.android.core;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraManager;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.speech.tts.TextToSpeech;
import androidx.core.app.NotificationCompat;
import com.getmeera.android.MainActivity;
import com.getmeera.android.R;
import com.getmeera.android.automation.MeeraAccessibilityService;
import com.getmeera.android.automation.MeeraNotificationListener;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONObject;

public final class MeeraForegroundService extends Service implements TextToSpeech.OnInitListener {
    public static volatile MeeraForegroundService E4;
    public static volatile boolean isSpeaking = false;
    public static volatile boolean isListening = false;
    public static volatile boolean isStandby = false;
    public String e4 = "Meera so rahi hai 😴 — 'Hey Meera', 'Hello Meera' ya 'Wake up Meera' bolke jagao";

    private TextToSpeech tts;
    private boolean ttsReady = false;
    private SpeechRecognizer speechRecognizer;
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final ExecutorService ioExecutor = Executors.newCachedThreadPool();
    private boolean torchOn = false;

    @Override
    public void onCreate() {
        super.onCreate();
        E4 = this;
        createChannel();
        tts = new TextToSpeech(this, this);
        mainHandler.post(this::initBackgroundSpeechRecognizer);
    }

    private void createChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationManager nm = getSystemService(NotificationManager.class);
            if (nm != null) {
                nm.createNotificationChannel(new NotificationChannel(
                        "meera_session",
                        getString(R.string.notification_channel_name),
                        NotificationManager.IMPORTANCE_LOW
                ));
            }
        }
    }

    @Override
    public void onInit(int status) {
        if (status == TextToSpeech.SUCCESS && tts != null) {
            int res = tts.setLanguage(new Locale("hi", "IN"));
            if (res == TextToSpeech.LANG_MISSING_DATA || res == TextToSpeech.LANG_NOT_SUPPORTED) {
                tts.setLanguage(Locale.US);
            }
            tts.setPitch(1.12f);
            tts.setSpeechRate(1.02f);
            ttsReady = true;
        }
    }

    public void speakOut(String text) {
        if (text == null || text.trim().isEmpty()) return;
        mainHandler.post(() -> {
            if (ttsReady && tts != null) {
                isSpeaking = true;
                tts.speak(text, TextToSpeech.QUEUE_FLUSH, null, "meera_utt_" + System.currentTimeMillis());
                mainHandler.postDelayed(() -> isSpeaking = false, Math.max(1500L, text.length() * 65L));
            }
        });
    }

    private void initBackgroundSpeechRecognizer() {
        try {
            if (!SpeechRecognizer.isRecognitionAvailable(this)) return;
            if (speechRecognizer != null) {
                speechRecognizer.destroy();
            }
            speechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
            speechRecognizer.setRecognitionListener(new RecognitionListener() {
                @Override public void onReadyForSpeech(Bundle params) { isListening = true; }
                @Override public void onBeginningOfSpeech() {}
                @Override public void onRmsChanged(float rmsdB) {}
                @Override public void onBufferReceived(byte[] buffer) {}
                @Override public void onEndOfSpeech() { isListening = false; }
                @Override public void onError(int error) {
                    isListening = false;
                    if (!MainActivity.j0) {
                        mainHandler.postDelayed(MeeraForegroundService.this::startContinuousListeningIfBackground, 2500L);
                    }
                }
                @Override
                public void onResults(Bundle results) {
                    isListening = false;
                    ArrayList<String> matches = results.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION);
                    if (matches != null && !matches.isEmpty()) {
                        handleRecognizedSpeech(matches.get(0));
                    }
                    if (!MainActivity.j0) {
                        mainHandler.postDelayed(MeeraForegroundService.this::startContinuousListeningIfBackground, 1200L);
                    }
                }
                @Override public void onPartialResults(Bundle partialResults) {}
                @Override public void onEvent(int eventType, Bundle params) {}
            });
        } catch (Throwable ignored) {
        }
    }

    private void startContinuousListeningIfBackground() {
        if (MainActivity.j0 || isSpeaking) return;
        try {
            if (speechRecognizer == null) initBackgroundSpeechRecognizer();
            if (speechRecognizer == null) return;
            Intent intent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
            intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM);
            intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "hi-IN");
            intent.putExtra(RecognizerIntent.EXTRA_MAX_RESULTS, 1);
            speechRecognizer.startListening(intent);
        } catch (Throwable ignored) {
        }
    }

    public void handleRecognizedSpeech(String transcript) {
        if (transcript == null || transcript.trim().isEmpty()) return;
        String lower = transcript.toLowerCase(Locale.ROOT).trim();

        if (isStandby) {
            if (lower.contains("meera") || lower.contains("mira") || lower.contains("मीरा")) {
                isStandby = false;
                updateNotification("Meera is listening 💕");
                speakOut("Haan Boss, bolo? Main sun rahi hoon.");
            }
            return;
        }

        if (lower.contains("so jao") || lower.contains("go to sleep")) {
            executeSystemTool("go_to_sleep", new JSONObject());
            return;
        }
        askGeminiWithToolsAsync(transcript);
    }

    private void askGeminiWithToolsAsync(final String userText) {
        ioExecutor.execute(() -> {
            try {
                SharedPreferences prefs = getSharedPreferences("meera_settings", 0);
                String apiKey = prefs.getString("gemini_api_key", "");
                if (apiKey == null || apiKey.isEmpty()) {
                    speakOut("Boss, pehle Meera app khol kar apni Gemini API key save kar lo.");
                    return;
                }
                String urlStr = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=" + apiKey;
                HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
                conn.setConnectTimeout(15000);
                conn.setReadTimeout(20000);
                conn.setDoOutput(true);

                JSONObject payload = new JSONObject();
                JSONObject sysInst = new JSONObject();
                sysInst.put("parts", new JSONArray().put(new JSONObject().put("text",
                        "Tum Meera ho, Boss ki pyaari Hinglish AI girlfriend aur assistant. " +
                        "Agar user koi action bole (app open, screen read, tap, whatsapp, torch, time), " +
                        "to JSON format me {"tool":"tool_name","args":{...},"say":"Hinglish reply"} do. " +
                        "Warna normal 1-2 line Hinglish me pyaar se jawab do.")));
                payload.put("system_instruction", sysInst);

                JSONArray contents = new JSONArray();
                JSONObject userMsg = new JSONObject();
                userMsg.put("role", "user");
                userMsg.put("parts", new JSONArray().put(new JSONObject().put("text", userText)));
                contents.put(userMsg);
                payload.put("contents", contents);

                byte[] body = payload.toString().getBytes(StandardCharsets.UTF_8);
                try (OutputStream os = conn.getOutputStream()) {
                    os.write(body);
                }

                StringBuilder sb = new StringBuilder();
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
                    String line;
                    while ((line = br.readLine()) != null) sb.append(line);
                }

                JSONObject resJson = new JSONObject(sb.toString());
                String modelText = resJson.getJSONArray("candidates")
                        .getJSONObject(0)
                        .getJSONObject("content")
                        .getJSONArray("parts")
                        .getJSONObject(0)
                        .optString("text", "")
                        .trim();

                if (modelText.contains(""tool"")) {
                    int start = modelText.indexOf("{");
                    int end = modelText.lastIndexOf("}");
                    if (start >= 0 && end > start) {
                        JSONObject toolObj = new JSONObject(modelText.substring(start, end + 1));
                        String toolName = toolObj.optString("tool", "");
                        JSONObject args = toolObj.optJSONObject("args");
                        if (args == null) args = new JSONObject();
                        String say = toolObj.optString("say", "Haan Boss, abhi karti hoon.");
                        speakOut(say);
                        executeSystemTool(toolName, args);
                        return;
                    }
                }
                speakOut(modelText);
            } catch (Exception e) {
                speakOut("Haan Boss, main sun rahi hoon, dobara bolo?");
            }
        });
    }

    public String executeSystemTool(String toolName, JSONObject args) {
        if (toolName == null) return "Unknown tool";
        try {
            switch (toolName) {
                case "open_app_by_name":
                    return openAppByName(args.optString("name", ""));

                case "tap_text":
                    if (MeeraAccessibilityService.Q != null) {
                        boolean ok = MeeraAccessibilityService.Q.tapTextOnScreen(args.optString("text", ""));
                        return ok ? "Tapped: " + args.optString("text", "") : "Text not found on screen";
                    }
                    return "Please enable Meera Accessibility Service first";

                case "tap_coordinates":
                    if (MeeraAccessibilityService.Q != null) {
                        boolean ok = MeeraAccessibilityService.Q.tapCoordinates(args.optInt("x", 500), args.optInt("y", 500));
                        return ok ? "Tapped coordinates" : "Failed to tap coordinates";
                    }
                    return "Accessibility Service not active";

                case "type_text":
                    if (MeeraAccessibilityService.Q != null) {
                        boolean ok = MeeraAccessibilityService.Q.typeTextIntoFocusedField(args.optString("text", ""));
                        return ok ? "Typed text" : "No editable field focused";
                    }
                    return "Accessibility Service not active";

                case "read_screen_text":
                    if (MeeraAccessibilityService.Q != null) {
                        String screen = MeeraAccessibilityService.Q.readAllScreenText();
                        speakOut(screen.isEmpty() ? "Screen par koi text nahi mila." : "Screen par likha hai: " + screen);
                        return screen;
                    }
                    speakOut("Boss, pehle Accessibility Service on kar do taaki main screen padh sakun.");
                    return "Accessibility Service not active";

                case "go_back":
                    if (MeeraAccessibilityService.Q != null) {
                        MeeraAccessibilityService.Q.performBackAction();
                        return "Pressed Back";
                    }
                    return "Accessibility Service not active";

                case "wait":
                    Thread.sleep(Math.min(10, Math.max(1, args.optInt("seconds", 1))) * 1000L);
                    return "Waited";

                case "wait_for_screen_text":
                    if (MeeraAccessibilityService.Q != null) {
                        boolean matched = MeeraAccessibilityService.Q.waitForScreenText(
                                args.optString("text", ""),
                                args.optString("mode", "appear"),
                                args.optInt("timeout_seconds", 5)
                        );
                        return matched ? "Condition met" : "Timeout waiting for screen text";
                    }
                    return "Accessibility Service not active";

                case "whatsapp_send_message":
                    return sendWhatsAppMessage(args.optString("contact", ""), args.optString("message", ""));

                case "reply_to_voice_note":
                    if (MeeraNotificationListener.X != null) {
                        boolean sent = MeeraNotificationListener.X.replyToLatestNotification(args.optString("reply_text", ""));
                        return sent ? "Replied to latest WhatsApp notification" : "No active WhatsApp notification to reply to";
                    }
                    return "Notification Listener not enabled";

                case "record_macro":
                    if (MeeraAccessibilityService.Q != null) {
                        MeeraAccessibilityService.Q.startMacroRecording(args.optString("task_name", "default"));
                        return "Macro recording started";
                    }
                    return "Accessibility Service not active";

                case "save_macro":
                    if (MeeraAccessibilityService.Q != null) {
                        MeeraAccessibilityService.Q.saveMacroRecording(args.optString("task_name", "default"));
                        return "Macro saved";
                    }
                    return "Accessibility Service not active";

                case "undo_last_step":
                    if (MeeraAccessibilityService.Q != null) {
                        MeeraAccessibilityService.Q.undoLastMacroStep();
                        return "Undid last macro step";
                    }
                    return "Accessibility Service not active";

                case "smart_home_control":
                    return controlSmartHomeOrDevice(args.optString("target", ""), args.optString("action", ""));

                case "get_current_time":
                    String nowStr = new SimpleDateFormat("hh:mm a, dd MMMM yyyy", Locale.getDefault()).format(new Date());
                    speakOut("Boss, abhi time hai " + nowStr);
                    return nowStr;

                case "go_to_sleep":
                    isStandby = true;
                    updateNotification(e4);
                    speakOut("Thik hai Jaan, main thodi der aaram kar rahi hoon. Jab zaroorat ho to Hey Meera bol dena.");
                    return "Standby mode active";

                default:
                    return "Executed: " + toolName;
            }
        } catch (Exception e) {
            return "Tool error: " + e.getMessage();
        }
    }

    private String openAppByName(String appQuery) {
        if (appQuery == null || appQuery.trim().isEmpty()) return "App name empty";
        String q = appQuery.toLowerCase(Locale.ROOT).trim();
        PackageManager pm = getPackageManager();

        String directPkg = null;
        if (q.contains("whatsapp")) directPkg = "com.whatsapp";
        else if (q.contains("youtube")) directPkg = "com.google.android.youtube";
        else if (q.contains("instagram")) directPkg = "com.instagram.android";
        else if (q.contains("chrome")) directPkg = "com.android.chrome";
        else if (q.contains("settings") || q.contains("setting")) {
            Intent s = new Intent(android.provider.Settings.ACTION_SETTINGS);
            s.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(s);
            return "Opened Settings";
        }

        if (directPkg != null) {
            Intent launch = pm.getLaunchIntentForPackage(directPkg);
            if (launch != null) {
                launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(launch);
                return "Opened " + appQuery;
            }
        }

        List<ApplicationInfo> apps = pm.getInstalledApplications(PackageManager.GET_META_DATA);
        for (ApplicationInfo app : apps) {
            String label = String.valueOf(pm.getApplicationLabel(app)).toLowerCase(Locale.ROOT);
            if (label.contains(q) || app.packageName.toLowerCase(Locale.ROOT).contains(q)) {
                Intent launch = pm.getLaunchIntentForPackage(app.packageName);
                if (launch != null) {
                    launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    startActivity(launch);
                    return "Opened " + pm.getApplicationLabel(app);
                }
            }
        }
        return "App not found: " + appQuery;
    }

    private String sendWhatsAppMessage(String contact, String message) {
        try {
            String digits = contact.replaceAll("[^0-9+]", "");
            Intent i = new Intent(Intent.ACTION_VIEW);
            if (digits.length() >= 10) {
                if (!digits.startsWith("+") && digits.length() == 10) digits = "91" + digits;
                String url = "https://api.whatsapp.com/send?phone=" + digits + "&text=" + Uri.encode(message);
                i.setData(Uri.parse(url));
            } else {
                i.setAction(Intent.ACTION_SEND);
                i.setType("text/plain");
                i.putExtra(Intent.EXTRA_TEXT, message);
            }
            i.setPackage("com.whatsapp");
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(i);

            mainHandler.postDelayed(() -> {
                if (MeeraAccessibilityService.Q != null) {
                    MeeraAccessibilityService.Q.tapTextOnScreen("Send");
                }
            }, 2200L);
            return "Opening WhatsApp to send message";
        } catch (Exception e) {
            return "WhatsApp error: " + e.getMessage();
        }
    }

    private String controlSmartHomeOrDevice(String target, String action) {
        String t = target.toLowerCase(Locale.ROOT);
        String a = action.toLowerCase(Locale.ROOT);
        if (t.contains("torch") || t.contains("flash") || t.contains("light")) {
            try {
                CameraManager cm = (CameraManager) getSystemService(Context.CAMERA_SERVICE);
                if (cm != null && cm.getCameraIdList().length > 0) {
                    String camId = cm.getCameraIdList()[0];
                    boolean nextState = a.contains("on") || (a.contains("toggle") && !torchOn);
                    cm.setTorchMode(camId, nextState);
                    torchOn = nextState;
                    return "Flashlight " + (torchOn ? "ON" : "OFF");
                }
            } catch (CameraAccessException ignored) {
            }
        }
        AudioManager am = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        if (am != null && t.contains("volume")) {
            int dir = a.contains("down") ? AudioManager.ADJUST_LOWER : AudioManager.ADJUST_RAISE;
            am.adjustVolume(dir, AudioManager.FLAG_SHOW_UI);
            return "Volume adjusted";
        }
        return "Smart device command sent: " + target + " -> " + action;
    }

    private void updateNotification(String statusText) {
        Intent openIntent = new Intent(this, MainActivity.class);
        PendingIntent pi = PendingIntent.getActivity(
                this, 0, openIntent, PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT
        );
        Notification notification = new NotificationCompat.Builder(this, "meera_session")
                .setContentTitle("Meera AI (24/7 Companion)")
                .setContentText(statusText)
                .setSmallIcon(R.drawable.ic_stat_meera)
                .setContentIntent(pi)
                .setOngoing(true)
                .build();
        startForeground(1001, notification);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        String action = intent != null ? intent.getAction() : "";
        String statusText = "Meera is listening 💕 (24/7 Active)";

        if ("com.getmeera.android.SLEEP".equals(action)) {
            isStandby = true;
            statusText = e4;
        } else if ("com.getmeera.android.ASSIST_WAKE".equals(action)) {
            isStandby = false;
            speakOut("Haan Boss, bolo?");
            mainHandler.postDelayed(this::startContinuousListeningIfBackground, 1400L);
        } else if ("com.getmeera.android.SPEAK_EVENT".equals(action) && intent != null) {
            String msg = intent.getStringExtra("text");
            if (msg != null) speakOut(msg);
        } else {
            mainHandler.postDelayed(this::startContinuousListeningIfBackground, 2000L);
        }

        updateNotification(statusText);
        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        if (speechRecognizer != null) speechRecognizer.destroy();
        if (tts != null) tts.shutdown();
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
