package com.getmeera.android.core;

import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import defpackage.AbstractC3088iA1;
import defpackage.C4503qJ;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/core/DrivingOffReceiver;", "Landroid/content/BroadcastReceiver;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class DrivingOffReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if (AbstractC3088iA1.b(intent.getAction(), "com.getmeera.android.DRIVING_OFF")) {
            C4503qJ.c.m(context).a(false);
            try {
                ((NotificationManager) context.getApplicationContext().getSystemService("notification")).cancel(10);
            } catch (Exception unused) {
            }
        }
    }
}
