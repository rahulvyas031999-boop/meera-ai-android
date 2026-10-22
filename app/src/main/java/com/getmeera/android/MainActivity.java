package com.getmeera.android;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.webkit.JavascriptInterface;
import android.webkit.PermissionRequest;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import com.getmeera.android.core.MeeraForegroundService;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

public final class MainActivity extends AppCompatActivity {
    public static volatile boolean j0 = false;
    private WebView webView;

    @SuppressLint({"SetJavaScriptEnabled", "AddJavascriptInterface"})
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        j0 = true;

        requestNeededPermissions();
        startMeeraService("com.getmeera.android.USER_START");

        webView = new WebView(this);
        webView.setBackgroundColor(Color.parseColor("#06070E"));
        WebSettings ws = webView.getSettings();
        ws.setJavaScriptEnabled(true);
        ws.setDomStorageEnabled(true);
        ws.setMediaPlaybackRequiresUserGesture(false);
        ws.setAllowFileAccess(true);
        ws.setAllowContentAccess(true);

        webView.addJavascriptInterface(new AndroidMeeraBridge(), "AndroidMeera");
        webView.setWebViewClient(new WebViewClient());
        webView.setWebChromeClient(new WebChromeClient() {
            @Override
            public void onPermissionRequest(final PermissionRequest request) {
                runOnUiThread(() -> request.grant(request.getResources()));
            }
        });

        setContentView(webView);
        webView.loadUrl("file:///android_asset/meera_live_ui.html");
    }

    private void requestNeededPermissions() {
        List<String> needed = new ArrayList<>();
        String[] perms = new String[]{
                Manifest.permission.RECORD_AUDIO,
                Manifest.permission.CAMERA,
                Manifest.permission.CALL_PHONE,
                Manifest.permission.READ_CONTACTS,
                Manifest.permission.READ_PHONE_STATE
        };
        for (String p : perms) {
            if (ContextCompat.checkSelfPermission(this, p) != PackageManager.PERMISSION_GRANTED) {
                needed.add(p);
            }
        }
        if (Build.VERSION.SDK_INT >= 33) {
            if (ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS)
                    != PackageManager.PERMISSION_GRANTED) {
                needed.add(Manifest.permission.POST_NOTIFICATIONS);
            }
        }
        if (!needed.isEmpty()) {
            ActivityCompat.requestPermissions(this, needed.toArray(new String[0]), 101);
        }
    }

    private void startMeeraService(String action) {
        Intent serviceIntent = new Intent(this, MeeraForegroundService.class).setAction(action);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(serviceIntent);
        } else {
            startService(serviceIntent);
        }
    }

    public final class AndroidMeeraBridge {
        @JavascriptInterface
        public String getApiKey() {
            return getSharedPreferences("meera_settings", 0).getString("gemini_api_key", "");
        }

        @JavascriptInterface
        public void saveConfig(String apiKey, String model, String voice) {
            getSharedPreferences("meera_settings", 0).edit()
                    .putString("gemini_api_key", apiKey != null ? apiKey.trim() : "")
                    .putString("gemini_model", model != null ? model.trim() : "gemini-2.0-flash-exp")
                    .putString("meera_voice", voice != null ? voice.trim() : "Aoede")
                    .apply();
            runOnUiThread(() -> {
                Toast.makeText(MainActivity.this, "Meera AI 24/7 Engine Updated! 💕", Toast.LENGTH_SHORT).show();
                startMeeraService("com.getmeera.android.USER_START");
            });
        }

        @JavascriptInterface
        public String executeTool(String toolName, String argsJson) {
            try {
                JSONObject args = (argsJson == null || argsJson.isEmpty()) ? new JSONObject() : new JSONObject(argsJson);
                if (MeeraForegroundService.E4 != null) {
                    return MeeraForegroundService.E4.executeSystemTool(toolName, args);
                }
                return "MeeraForegroundService starting...";
            } catch (Exception e) {
                return "Error: " + e.getMessage();
            }
        }

        @JavascriptInterface
        public void speakHinglish(String text) {
            if (MeeraForegroundService.E4 != null) {
                MeeraForegroundService.E4.speakOut(text);
            }
        }

        @JavascriptInterface
        public void triggerBackgroundListen() {
            runOnUiThread(() -> startMeeraService("com.getmeera.android.ASSIST_WAKE"));
        }

        @JavascriptInterface
        public void requestAllPermissions() {
            runOnUiThread(MainActivity.this::requestNeededPermissions);
        }

        @JavascriptInterface
        public void openAccessibilitySettings() {
            runOnUiThread(() -> {
                Intent i = new Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS);
                i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(i);
            });
        }

        @JavascriptInterface
        public void openNotificationListenerSettings() {
            runOnUiThread(() -> {
                Intent i = new Intent("android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS");
                i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(i);
            });
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        startMeeraService("com.getmeera.android.USER_START");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        j0 = false;
    }
}
