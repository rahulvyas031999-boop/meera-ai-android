package com.getmeera.android.core;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

public final class MicCaptureReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        Intent i = new Intent(context, MeeraForegroundService.class).setAction("com.getmeera.android.ASSIST_WAKE");
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) context.startForegroundService(i);
        else context.startService(i);
    }
}
