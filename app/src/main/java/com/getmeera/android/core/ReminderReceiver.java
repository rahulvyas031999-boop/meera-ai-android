package com.getmeera.android.core;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

public final class ReminderReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        String msg = intent != null ? intent.getStringExtra("reminder_text") : "Boss, aapka reminder time ho gaya hai!";
        Intent i = new Intent(context, MeeraForegroundService.class)
                .setAction("com.getmeera.android.SPEAK_EVENT")
                .putExtra("text", msg != null ? msg : "Boss, aapka reminder hai!");
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) context.startForegroundService(i);
        else context.startService(i);
    }
}
