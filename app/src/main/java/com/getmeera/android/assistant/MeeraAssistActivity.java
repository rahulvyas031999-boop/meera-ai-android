package com.getmeera.android.assistant;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import com.getmeera.android.core.MeeraForegroundService;

public final class MeeraAssistActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent i = new Intent(this, MeeraForegroundService.class).setAction("com.getmeera.android.ASSIST_WAKE");
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) startForegroundService(i);
        else startService(i);
        finish();
    }
}
