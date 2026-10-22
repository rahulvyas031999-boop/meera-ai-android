package com.getmeera.android.termux;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.getmeera.android.core.MeeraForegroundService;

public final class TermuxResultReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent == null) return;
        Bundle resultBundle = intent.getBundleExtra("result");
        if (resultBundle != null && MeeraForegroundService.E4 != null) {
            String stdout = resultBundle.getString("stdout", "");
            if (!stdout.isEmpty()) {
                MeeraForegroundService.E4.speakOut("Termux command poora ho gaya Boss.");
            }
        }
    }
}
