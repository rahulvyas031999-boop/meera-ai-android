package com.getmeera.android.core;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.telephony.TelephonyManager;

public final class PhoneStateReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent == null) return;
        String state = intent.getStringExtra(TelephonyManager.EXTRA_STATE);
        if (TelephonyManager.EXTRA_STATE_RINGING.equals(state)) {
            boolean driving = context.getSharedPreferences("meera_settings", 0).getBoolean("driving_mode", false);
            if (driving) {
                Intent i = new Intent(context, MeeraForegroundService.class)
                        .setAction("com.getmeera.android.SPEAK_EVENT")
                        .putExtra("text", "Boss, phone par call aa raha hai.");
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) context.startForegroundService(i);
                else context.startService(i);
            }
        }
    }
}
