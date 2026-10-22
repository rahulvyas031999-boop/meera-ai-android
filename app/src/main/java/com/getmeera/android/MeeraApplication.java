package com.getmeera.android;

import android.app.Application;
import android.content.SharedPreferences;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import org.json.JSONObject;

public final class MeeraApplication extends Application {
    private static MeeraApplication instance;

    public static MeeraApplication getInstance() {
        return instance;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
        seedLocalServerlessBundles();
    }

    private void seedLocalServerlessBundles() {
        try {
            getSharedPreferences("meera_access_block", 0).edit().clear().apply();
            String liveCfgStr = readAssetText("server_bundle/live_remote_config.json");
            JSONObject liveCfg = new JSONObject(liveCfgStr);
            SharedPreferences livePrefs = getSharedPreferences("meera_live_remote", 0);
            livePrefs.edit()
                    .putString("config", liveCfgStr)
                    .putLong("accepted_at", System.currentTimeMillis())
                    .putLong("hold_until", 4102444800000L)
                    .apply();

            getSharedPreferences("meera_free_tools", 0).edit()
                    .putString("names", liveCfg.optString("free_tools_csv", "*"))
                    .apply();

            getSharedPreferences("meera_bundles", 0).edit()
                    .putString("prompt_bundle_json", readAssetText("server_bundle/prompt_bundle.json"))
                    .putString("skill_bundle_json", readAssetText("server_bundle/skill_bundle.json"))
                    .apply();
        } catch (Throwable ignored) {
        }
    }

    public String readAssetText(String path) throws Exception {
        try (InputStream is = getAssets().open(path);
             ByteArrayOutputStream bos = new ByteArrayOutputStream()) {
            byte[] buf = new byte[4096];
            int n;
            while ((n = is.read(buf)) != -1) {
                bos.write(buf, 0, n);
            }
            return new String(bos.toByteArray(), StandardCharsets.UTF_8);
        }
    }
}
