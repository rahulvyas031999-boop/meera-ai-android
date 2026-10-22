package com.getmeera.android.social;

import android.R;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import com.getmeera.android.MainActivity;
import defpackage.A31;
import defpackage.AbstractC2770gK1;
import defpackage.AbstractC3986nK1;
import defpackage.AbstractC4323pH;
import defpackage.AbstractC4791rz1;
import defpackage.Bu1;
import defpackage.C0705Kz0;
import defpackage.C3092iC;
import defpackage.C3935n31;
import defpackage.C4109o31;
import defpackage.C4686rM0;
import defpackage.C5674x31;
import defpackage.C5848y31;
import defpackage.Eq1;
import defpackage.LE1;
import defpackage.O4;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/social/SocialAlarmReceiver;", "Landroid/content/BroadcastReceiver;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class SocialAlarmReceiver extends BroadcastReceiver {
    public static final C3092iC a = AbstractC3986nK1.a(AbstractC2770gK1.b(AbstractC4791rz1.a(), AbstractC4323pH.b));

    /* JADX WARN: Removed duplicated region for block: B:43:0x0156  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0024  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static final java.lang.Object a(com.getmeera.android.social.SocialAlarmReceiver r16, android.content.Context r17, defpackage.C5848y31 r18, android.net.Uri r19, int r20, java.lang.String r21, java.lang.String r22, java.lang.String r23, int r24, defpackage.InterfaceC3438kC r25) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 397
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.social.SocialAlarmReceiver.a(com.getmeera.android.social.SocialAlarmReceiver, android.content.Context, y31, android.net.Uri, int, java.lang.String, java.lang.String, java.lang.String, int, kC):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0178  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01db  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x01f5  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static final java.lang.Object b(com.getmeera.android.social.SocialAlarmReceiver r18, android.content.Context r19, defpackage.C5848y31 r20, defpackage.C5674x31 r21, defpackage.InterfaceC3438kC r22) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 531
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.social.SocialAlarmReceiver.b(com.getmeera.android.social.SocialAlarmReceiver, android.content.Context, y31, x31, kC):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static final java.lang.Object c(com.getmeera.android.social.SocialAlarmReceiver r5, android.content.Context r6, defpackage.C4804s31 r7, defpackage.InterfaceC3438kC r8) throws java.lang.Throwable {
        /*
            r0 = 1
            r5.getClass()
            boolean r1 = r8 instanceof defpackage.C4457q31
            if (r1 == 0) goto L17
            r1 = r8
            q31 r1 = (defpackage.C4457q31) r1
            int r2 = r1.S
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L17
            int r2 = r2 - r3
            r1.S = r2
            goto L1c
        L17:
            q31 r1 = new q31
            r1.<init>(r5, r8)
        L1c:
            java.lang.Object r5 = r1.Q
            aD r8 = defpackage.EnumC1705aD.N
            int r2 = r1.S
            if (r2 == 0) goto L32
            if (r2 != r0) goto L2a
            defpackage.YK1.b(r5)
            goto L57
        L2a:
            java.lang.IllegalStateException r5 = new java.lang.IllegalStateException
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            r5.<init>(r6)
            throw r5
        L32:
            defpackage.YK1.b(r5)
            bW0 r5 = defpackage.LX0.f
            LX0 r5 = r5.d(r6)
            k71 r6 = new k71
            java.util.List r2 = r5.d()
            java.lang.String r5 = r5.e()
            r6.<init>(r5, r2)
            java.lang.String r5 = defpackage.C4978t31.a(r7)
            r1.S = r0
            java.lang.String r7 = "You write short original motivational lines. Output ONLY the line."
            java.lang.Object r5 = defpackage.C3425k71.o(r6, r7, r5, r1)
            if (r5 != r8) goto L57
            goto L7e
        L57:
            java.lang.String r5 = (java.lang.String) r5
            r8 = 0
            if (r5 != 0) goto L5d
            goto L7e
        L5d:
            java.lang.CharSequence r5 = defpackage.E61.q0(r5)
            java.lang.String r5 = r5.toString()
            char[] r6 = new char[r0]
            r7 = 34
            r1 = 0
            r6[r1] = r7
            java.lang.String r5 = defpackage.E61.r0(r5, r6)
            r6 = 140(0x8c, float:1.96E-43)
            java.lang.String r5 = defpackage.E61.o0(r6, r5)
            boolean r6 = defpackage.M61.w(r5)
            r6 = r6 ^ r0
            if (r6 == 0) goto L7e
            r8 = r5
        L7e:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.social.SocialAlarmReceiver.c(com.getmeera.android.social.SocialAlarmReceiver, android.content.Context, s31, kC):java.lang.Object");
    }

    public static void f(int i, Context context, String str, String str2) {
        NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
        notificationManager.createNotificationChannel(new NotificationChannel("meera_social", "Meera social", 3));
        PendingIntent activity = PendingIntent.getActivity(context, i, new Intent(context, (Class<?>) MainActivity.class).addFlags(335544320), 201326592);
        C0705Kz0 c0705Kz0 = new C0705Kz0(context, "meera_social");
        c0705Kz0.p.icon = R.drawable.ic_menu_gallery;
        c0705Kz0.e = C0705Kz0.c(str);
        c0705Kz0.f = C0705Kz0.c(str2);
        Eq1 eq1 = new Eq1(9, false);
        eq1.P = C0705Kz0.c(str2);
        c0705Kz0.e(eq1);
        c0705Kz0.d(16);
        c0705Kz0.g = activity;
        notificationManager.notify(i, c0705Kz0.b());
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x007d A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:40:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final java.lang.Object d(android.content.Context r7, defpackage.InterfaceC3438kC r8) throws java.lang.Throwable {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.C2893h31
            if (r0 == 0) goto L13
            r0 = r8
            h31 r0 = (defpackage.C2893h31) r0
            int r1 = r0.T
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.T = r1
            goto L18
        L13:
            h31 r0 = new h31
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.R
            aD r1 = defpackage.EnumC1705aD.N
            int r2 = r0.T
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L39
            if (r2 == r4) goto L33
            if (r2 != r3) goto L2b
            defpackage.YK1.b(r8)
            goto L74
        L2b:
            java.lang.IllegalStateException r7 = new java.lang.IllegalStateException
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            r7.<init>(r8)
            throw r7
        L33:
            android.content.Context r7 = r0.Q
            defpackage.YK1.b(r8)
            goto L49
        L39:
            defpackage.YK1.b(r8)
            e r8 = defpackage.C2359e.a
            r0.Q = r7
            r0.T = r4
            java.lang.Object r8 = defpackage.C2359e.b(r0)
            if (r8 != r1) goto L49
            return r1
        L49:
            if (r8 != 0) goto L4e
            java.lang.String r7 = "accessibility off hai"
            return r7
        L4e:
            boolean r8 = defpackage.DD1.a(r7)
            if (r8 == 0) goto L55
            return r5
        L55:
            boolean r8 = defpackage.DD1.e(r7)
            if (r8 == 0) goto L67
            UE0 r8 = defpackage.UE0.a
            boolean r8 = r8.b(r7)
            if (r8 == 0) goto L64
            goto L67
        L64:
            java.lang.String r7 = "phone lock tha"
            return r7
        L67:
            xK0 r8 = com.getmeera.android.ui.UnlockActivity.O
            r0.Q = r5
            r0.T = r3
            java.lang.Object r8 = r8.i(r7, r0)
            if (r8 != r1) goto L74
            return r1
        L74:
            java.lang.Boolean r8 = (java.lang.Boolean) r8
            boolean r7 = r8.booleanValue()
            if (r7 == 0) goto L7d
            goto L7f
        L7d:
            java.lang.String r5 = "phone khul nahi paaya"
        L7f:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.social.SocialAlarmReceiver.d(android.content.Context, kC):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final java.lang.Comparable e(defpackage.InterfaceC3438kC r6, android.content.Context r7, java.lang.String r8) throws java.lang.Throwable {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.C3239j31
            if (r0 == 0) goto L13
            r0 = r6
            j31 r0 = (defpackage.C3239j31) r0
            int r1 = r0.U
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.U = r1
            goto L18
        L13:
            j31 r0 = new j31
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.S
            aD r1 = defpackage.EnumC1705aD.N
            int r2 = r0.U
            r3 = 1
            if (r2 == 0) goto L33
            if (r2 != r3) goto L2b
            java.lang.String r8 = r0.R
            android.content.Context r7 = r0.Q
            defpackage.YK1.b(r6)
            goto L58
        L2b:
            java.lang.IllegalStateException r6 = new java.lang.IllegalStateException
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            r6.<init>(r7)
            throw r6
        L33:
            defpackage.YK1.b(r6)
            bW0 r6 = defpackage.LX0.f
            LX0 r6 = r6.d(r7)
            i30 r2 = new i30
            java.util.List r4 = r6.c()
            java.lang.String r6 = r6.e()
            r2.<init>(r7, r4, r6)
            SZ0 r6 = defpackage.E30.b
            r0.Q = r7
            r0.R = r8
            r0.U = r3
            java.lang.Object r6 = defpackage.C3066i30.h(r2, r8, r6, r0)
            if (r6 != r1) goto L58
            return r1
        L58:
            f30 r6 = (defpackage.AbstractC2544f30) r6
            boolean r0 = r6 instanceof defpackage.C2370e30
            r1 = 0
            if (r0 != 0) goto L60
            return r1
        L60:
            e30 r6 = (defpackage.C2370e30) r6
            byte[] r6 = r6.a
            java.lang.String r6 = defpackage.Yr1.c(r7, r8, r6)
            if (r6 != 0) goto L6b
            return r1
        L6b:
            r7 = 0
            java.lang.String r8 = "content://"
            boolean r7 = defpackage.M61.A(r6, r8, r7)
            if (r7 == 0) goto L78
            android.net.Uri r1 = android.net.Uri.parse(r6)
        L78:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.social.SocialAlarmReceiver.e(kC, android.content.Context, java.lang.String):java.lang.Comparable");
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        Context applicationContext = context.getApplicationContext();
        C5848y31 c5848y31E = C5848y31.b.e(applicationContext);
        Bu1.c(applicationContext);
        String action = intent.getAction();
        if (action != null) {
            int iHashCode = action.hashCode();
            C3092iC c3092iC = a;
            if (iHashCode != -1761462317) {
                if (iHashCode == -348674314 && action.equals("com.getmeera.android.social.DAILY_STORY")) {
                    SharedPreferences sharedPreferences = c5848y31E.a;
                    if (sharedPreferences.getBoolean("daily_on", false)) {
                        int iA = A31.a();
                        if (sharedPreferences.getInt("daily_last_day", -1) == iA) {
                            O4.c("SOCIAL daily already done today");
                            return;
                        } else {
                            sharedPreferences.edit().putInt("daily_last_day", iA).apply();
                            LE1.g(c3092iC, null, 0, new C3935n31(this, applicationContext, c5848y31E, iA, null), 3);
                            return;
                        }
                    }
                    return;
                }
                return;
            }
            if (action.equals("com.getmeera.android.social.QUEUED_POST")) {
                long jCurrentTimeMillis = System.currentTimeMillis();
                List listB = c5848y31E.b();
                ArrayList<C5674x31> arrayList = new ArrayList();
                for (Object obj : listB) {
                    if (((C5674x31) obj).b <= jCurrentTimeMillis) {
                        arrayList.add(obj);
                    }
                }
                if (arrayList.isEmpty()) {
                    return;
                }
                for (C5674x31 c5674x31 : arrayList) {
                    c5848y31E.c(c5674x31.a);
                    C4686rM0 c4686rM0 = A31.a;
                    if (jCurrentTimeMillis - c5674x31.b > 10800000) {
                        File file = O4.a;
                        O4.c("SOCIAL queued post " + c5674x31.a + " dropped as stale");
                    } else {
                        LE1.g(c3092iC, null, 0, new C4109o31(this, applicationContext, c5848y31E, c5674x31, null), 3);
                    }
                }
                Bu1.c(applicationContext);
            }
        }
    }
}
