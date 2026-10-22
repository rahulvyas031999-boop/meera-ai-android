package com.getmeera.android.core;

import android.R;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.getmeera.android.MainActivity;
import com.google.crypto.tink.shaded.protobuf.Reader;
import defpackage.C0705Kz0;
import defpackage.C2880gz1;
import defpackage.C5444vl0;
import defpackage.Eq1;
import defpackage.LE1;
import defpackage.M61;
import defpackage.OK1;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/core/ReminderReceiver;", "Landroid/content/BroadcastReceiver;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class ReminderReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        String stringExtra = intent.getStringExtra("reminder_text");
        if (stringExtra != null) {
            boolean zB = true;
            if (!(!M61.w(stringExtra))) {
                stringExtra = null;
            }
            if (stringExtra == null) {
                return;
            }
            long longExtra = intent.getLongExtra("reminder_id", System.currentTimeMillis());
            try {
                zB = OK1.b(longExtra, context);
            } catch (Exception unused) {
            }
            if (zB) {
                NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
                notificationManager.createNotificationChannel(new NotificationChannel("meera_reminders", "Meera reminders", 4));
                PendingIntent activity = PendingIntent.getActivity(context, 0, new Intent(context, (Class<?>) MainActivity.class), 67108864);
                C0705Kz0 c0705Kz0 = new C0705Kz0(context, "meera_reminders");
                c0705Kz0.p.icon = R.drawable.ic_popup_reminder;
                c0705Kz0.e = C0705Kz0.c("Meera ka reminder 💕");
                c0705Kz0.f = C0705Kz0.c(stringExtra);
                Eq1 eq1 = new Eq1(9, false);
                eq1.P = C0705Kz0.c(stringExtra);
                c0705Kz0.e(eq1);
                c0705Kz0.d(16);
                c0705Kz0.g = activity;
                notificationManager.notify((int) (longExtra % ((long) Reader.READ_DONE)), c0705Kz0.b());
                try {
                    C2880gz1 c2880gz1 = MeeraForegroundService.j4;
                    MeeraForegroundService meeraForegroundService = MeeraForegroundService.E4;
                    if (meeraForegroundService == null) {
                        return;
                    }
                    LE1.g(meeraForegroundService.N, null, 0, new C5444vl0(null, meeraForegroundService, stringExtra), 3);
                } catch (Throwable unused2) {
                }
            }
        }
    }
}
