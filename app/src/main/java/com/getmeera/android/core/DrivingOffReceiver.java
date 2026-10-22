package com.getmeera.android.core;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public final class DrivingOffReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        context.getSharedPreferences("meera_settings", 0).edit().putBoolean("driving_mode", false).apply();
    }
}
