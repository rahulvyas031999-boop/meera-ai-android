package com.getmeera.android.ui;

import android.app.Activity;
import android.app.KeyguardManager;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import defpackage.C0061Ax0;
import defpackage.C3043hw;
import defpackage.C5724xK0;
import defpackage.CI0;
import defpackage.InterfaceC2869gw;
import defpackage.KeyguardManagerKeyguardDismissCallbackC4216oh1;
import defpackage.O4;
import defpackage.Yu1;
import java.io.File;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/getmeera/android/ui/UnlockActivity;", "Landroid/app/Activity;", "<init>", "()V", "xK0", "app_release"}, k = 1, mv = {1, 9, 0})
public final class UnlockActivity extends Activity {
    public static volatile InterfaceC2869gw P;
    public static volatile boolean R;
    public InterfaceC2869gw N;
    public static final C5724xK0 O = new C5724xK0(6);
    public static final C0061Ax0 Q = Yu1.a();

    /* JADX WARN: Removed duplicated region for block: B:14:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final void a(java.lang.String r6) {
        /*
            r5 = this;
            boolean r0 = r5.isFinishing()
            if (r0 == 0) goto L7
            return
        L7:
            r0 = 0
            r1 = 1
            r2 = 0
            java.lang.String r3 = "keyguard"
            java.lang.Object r3 = r5.getSystemService(r3)     // Catch: java.lang.Exception -> L22
            boolean r4 = r3 instanceof android.app.KeyguardManager     // Catch: java.lang.Exception -> L22
            if (r4 == 0) goto L17
            android.app.KeyguardManager r3 = (android.app.KeyguardManager) r3     // Catch: java.lang.Exception -> L22
            goto L18
        L17:
            r3 = r0
        L18:
            if (r3 == 0) goto L22
            boolean r3 = r3.isKeyguardLocked()     // Catch: java.lang.Exception -> L22
            if (r3 != r1) goto L22
            r3 = r1
            goto L23
        L22:
            r3 = r2
        L23:
            r1 = r1 ^ r3
            java.io.File r3 = defpackage.O4.a
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            java.lang.String r4 = "UNLOCK result="
            r3.<init>(r4)
            r3.append(r1)
            java.lang.String r4 = " ("
            r3.append(r4)
            r3.append(r6)
            java.lang.String r6 = ")"
            r3.append(r6)
            java.lang.String r6 = r3.toString()
            defpackage.O4.c(r6)
            gw r6 = r5.N
            if (r6 == 0) goto L51
            java.lang.Boolean r1 = java.lang.Boolean.valueOf(r1)
            hw r6 = (defpackage.C3043hw) r6
            r6.g0(r1)
        L51:
            gw r6 = com.getmeera.android.ui.UnlockActivity.P
            gw r1 = r5.N
            if (r6 != r1) goto L59
            com.getmeera.android.ui.UnlockActivity.P = r0
        L59:
            r5.finish()
            r5.overridePendingTransition(r2, r2)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.ui.UnlockActivity.a(java.lang.String):void");
    }

    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.N = P;
        if (Build.VERSION.SDK_INT >= 27) {
            setShowWhenLocked(true);
            setTurnScreenOn(true);
        }
        getWindow().addFlags(2621568);
        try {
            PowerManager powerManager = (PowerManager) getSystemService("power");
            if (!powerManager.isInteractive()) {
                PowerManager.WakeLock wakeLockNewWakeLock = powerManager.newWakeLock(805306394, "meera:unlock");
                wakeLockNewWakeLock.acquire(10000L);
                wakeLockNewWakeLock.release();
            }
        } catch (Throwable unused) {
        }
        Object systemService = getSystemService("keyguard");
        KeyguardManager keyguardManager = systemService instanceof KeyguardManager ? (KeyguardManager) systemService : null;
        if (keyguardManager == null || !keyguardManager.isKeyguardLocked()) {
            a("already unlocked");
            return;
        }
        boolean z = R;
        File file = O4.a;
        O4.c("UNLOCK requested (secure=" + keyguardManager.isDeviceSecure() + ", standAside=" + z + ")");
        keyguardManager.requestDismissKeyguard(this, new KeyguardManagerKeyguardDismissCallbackC4216oh1(this));
        if (z) {
            getWindow().getDecorView().postDelayed(new CI0(this, 15), 600L);
        }
    }

    @Override // android.app.Activity
    public final void onDestroy() {
        boolean z = false;
        try {
            Object systemService = getSystemService("keyguard");
            KeyguardManager keyguardManager = systemService instanceof KeyguardManager ? (KeyguardManager) systemService : null;
            if (keyguardManager != null) {
                if (keyguardManager.isKeyguardLocked()) {
                    z = true;
                }
            }
        } catch (Exception unused) {
        }
        boolean z2 = true ^ z;
        InterfaceC2869gw interfaceC2869gw = this.N;
        if (interfaceC2869gw != null) {
            ((C3043hw) interfaceC2869gw).g0(Boolean.valueOf(z2));
        }
        if (P == this.N) {
            P = null;
        }
        super.onDestroy();
    }
}
