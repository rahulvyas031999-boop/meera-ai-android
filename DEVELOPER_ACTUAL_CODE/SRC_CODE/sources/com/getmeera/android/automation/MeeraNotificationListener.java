package com.getmeera.android.automation;

import android.app.Notification;
import android.content.ComponentName;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import defpackage.AbstractC0392Gc;
import defpackage.AbstractC3088iA1;
import defpackage.AbstractC4256ov;
import defpackage.C2230dE0;
import defpackage.C5054tW;
import defpackage.C5764xc;
import defpackage.DU;
import defpackage.JU;
import defpackage.SV0;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/getmeera/android/automation/MeeraNotificationListener;", "Landroid/service/notification/NotificationListenerService;", "<init>", "()V", "QG1", "app_release"}, k = 1, mv = {1, 9, 0})
public final class MeeraNotificationListener extends NotificationListenerService {
    public static volatile DU N;
    public static volatile JU O;
    public static volatile C2230dE0 Q;
    public static volatile MeeraNotificationListener X;
    public static volatile boolean Y;
    public static volatile long Z;
    public static final Set P = SV0.k("com.whatsapp", "com.whatsapp.w4b", "org.telegram.messenger", "com.google.android.apps.messaging", "com.android.mms", "com.google.android.dialer", "com.android.dialer", "com.samsung.android.dialer", "com.instagram.android", "org.thoughtcrime.securesms");
    public static final List R = AbstractC4256ov.g("incoming call", "ongoing call", "call in progress", "calling", "missed call", "dialing", "unknown", "private number", "no caller id", "tap to return to call", "voice call", "video call");
    public static final C5764xc S = new C5764xc();
    public static final C5764xc T = new C5764xc();
    public static final C5764xc U = new C5764xc();
    public static final LinkedHashMap V = new LinkedHashMap();
    public static final LinkedHashMap W = new LinkedHashMap();
    public static final Set a0 = SV0.k("new message", "new messages", "message", "messages", "checking for new messages", "you may have new messages", "sending message", "waiting for messages", "waiting for message", "naya message", "naye message");

    /* JADX WARN: Removed duplicated region for block: B:132:0x0214  */
    /* JADX WARN: Removed duplicated region for block: B:230:0x03d2  */
    /* JADX WARN: Removed duplicated region for block: B:249:0x0409  */
    /* JADX WARN: Removed duplicated region for block: B:252:0x040d  */
    /* JADX WARN: Removed duplicated region for block: B:253:0x040f  */
    /* JADX WARN: Removed duplicated region for block: B:259:0x041f  */
    /* JADX WARN: Removed duplicated region for block: B:330:0x04f1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final void a(android.service.notification.StatusBarNotification r23, boolean r24) {
        /*
            Method dump skipped, instruction units count: 1358
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.automation.MeeraNotificationListener.a(android.service.notification.StatusBarNotification, boolean):void");
    }

    public final void b() {
        StatusBarNotification[] activeNotifications;
        try {
            activeNotifications = getActiveNotifications();
        } catch (Exception e) {
            e.getMessage();
            activeNotifications = null;
        }
        if (activeNotifications == null) {
            return;
        }
        Iterator it = AbstractC0392Gc.x(activeNotifications, new C5054tW(13)).iterator();
        while (it.hasNext()) {
            try {
                a((StatusBarNotification) it.next(), false);
            } catch (Throwable unused) {
            }
        }
    }

    @Override // android.service.notification.NotificationListenerService, android.app.Service
    public final void onDestroy() {
        Y = false;
        if (X == this) {
            X = null;
        }
        super.onDestroy();
    }

    @Override // android.service.notification.NotificationListenerService
    public final void onListenerConnected() {
        X = this;
        Y = true;
        b();
    }

    @Override // android.service.notification.NotificationListenerService
    public final void onListenerDisconnected() {
        Y = false;
        if (X == this) {
            X = null;
        }
        try {
            NotificationListenerService.requestRebind(new ComponentName(this, (Class<?>) MeeraNotificationListener.class));
        } catch (Throwable unused) {
        }
    }

    @Override // android.service.notification.NotificationListenerService
    public final void onNotificationPosted(StatusBarNotification statusBarNotification) {
        if (statusBarNotification == null) {
            return;
        }
        try {
            a(statusBarNotification, true);
        } catch (Throwable th) {
            statusBarNotification.getPackageName();
            th.getMessage();
        }
    }

    @Override // android.service.notification.NotificationListenerService
    public final void onNotificationRemoved(StatusBarNotification statusBarNotification) {
        if (statusBarNotification == null) {
            return;
        }
        try {
            Notification notification = statusBarNotification.getNotification();
            if (AbstractC3088iA1.b(notification != null ? notification.category : null, "call")) {
                Q = null;
            }
        } catch (Throwable th) {
            th.getMessage();
        }
    }
}
