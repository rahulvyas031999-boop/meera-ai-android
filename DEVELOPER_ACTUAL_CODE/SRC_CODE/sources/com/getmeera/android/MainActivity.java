package com.getmeera.android;

import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.os.SystemClock;
import android.view.Window;
import com.getmeera.android.core.MeeraForegroundService;
import defpackage.AbstractActivityC5824xw;
import defpackage.AbstractC3088iA1;
import defpackage.AbstractC4082nv;
import defpackage.AbstractC4256ov;
import defpackage.AbstractC4323pH;
import defpackage.AbstractC4663rE1;
import defpackage.AbstractC5011tE1;
import defpackage.AbstractC5214uP;
import defpackage.AbstractC5998yw;
import defpackage.C0012Ad0;
import defpackage.C0021Ag0;
import defpackage.C0085Bg0;
import defpackage.C0149Cg0;
import defpackage.C0213Dg0;
import defpackage.C0378Fw;
import defpackage.C1458Ws0;
import defpackage.C1846b2;
import defpackage.C1991bs1;
import defpackage.C2019c2;
import defpackage.C2375e5;
import defpackage.C2880gz1;
import defpackage.C3987nL;
import defpackage.C40;
import defpackage.C4889sa0;
import defpackage.C5388vP;
import defpackage.C5562wP;
import defpackage.E61;
import defpackage.EnumC0076Bd0;
import defpackage.EnumC4866sP;
import defpackage.EnumC5040tP;
import defpackage.JO0;
import defpackage.LE1;
import defpackage.LX0;
import defpackage.Lz1;
import defpackage.O51;
import defpackage.Q50;
import defpackage.Rp1;
import defpackage.Tp1;
import defpackage.VJ1;
import defpackage.W1;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/MainActivity;", "Lxw;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class MainActivity extends AbstractActivityC5824xw {
    public static volatile boolean j0;
    public static final O51 k0;
    public static final O51 l0;
    public C0012Ad0 h0;
    public final C1846b2 i0 = k(new W1(5), new C2019c2(this, 14));

    static {
        O51 o51A = Lz1.a(null);
        k0 = o51A;
        l0 = o51A;
    }

    public final void l(Intent intent) {
        List listC;
        Object jo0;
        if (intent == null) {
            return;
        }
        String action = intent.getAction();
        if (AbstractC3088iA1.b(action, "android.intent.action.SEND") || AbstractC3088iA1.b(action, "android.intent.action.SEND_MULTIPLE")) {
            if (AbstractC3088iA1.b(action, "android.intent.action.SEND")) {
                listC = AbstractC4256ov.h(intent.getParcelableExtra("android.intent.extra.STREAM"));
            } else {
                ArrayList parcelableArrayListExtra = intent.getParcelableArrayListExtra("android.intent.extra.STREAM");
                listC = parcelableArrayListExtra != null ? AbstractC4082nv.C(parcelableArrayListExtra) : null;
                if (listC == null) {
                    listC = C3987nL.N;
                }
            }
            List list = listC;
            String stringExtra = intent.getStringExtra("android.intent.extra.TEXT");
            String string = stringExtra != null ? E61.q0(stringExtra).toString() : null;
            if (string == null) {
                string = "";
            }
            String str = string;
            intent.setAction("android.intent.action.MAIN");
            intent.removeExtra("android.intent.extra.STREAM");
            if (list.isEmpty()) {
                return;
            }
            try {
                Uri referrer = getReferrer();
                jo0 = referrer != null ? referrer.getHost() : null;
            } catch (Throwable th) {
                jo0 = new JO0(th);
            }
            if (jo0 instanceof JO0) {
                jo0 = null;
            }
            String str2 = (String) jo0;
            O51 o51 = k0;
            o51.getClass();
            o51.j(null, "chat");
            LE1.g(C1991bs1.j(this), null, 0, new C0021Ag0(this, str, str2, list, null), 3);
        }
    }

    public final void m() {
        C2880gz1 c2880gz1 = MeeraForegroundService.j4;
        C1458Ws0 c1458Ws0 = C40.a;
        if (C40.a() ? false : !LX0.f.d(getApplicationContext()).p()) {
            C2880gz1.N(this);
        } else {
            C2880gz1.W(this, new Intent(this, (Class<?>) MeeraForegroundService.class).setAction("com.getmeera.android.USER_START"));
        }
    }

    public final void n() {
        if (VJ1.c(this, "android.permission.RECORD_AUDIO") == 0) {
            m();
            return;
        }
        ArrayList arrayListI = AbstractC4256ov.i("android.permission.RECORD_AUDIO");
        if (Build.VERSION.SDK_INT >= 33) {
            arrayListI.add("android.permission.POST_NOTIFICATIONS");
        }
        this.i0.c(arrayListI.toArray(new String[0]));
    }

    @Override // defpackage.AbstractActivityC5824xw, android.app.Activity
    public final void onCreate(Bundle bundle) {
        String stringExtra;
        super.onCreate(bundle);
        AbstractC4663rE1.c(getWindow(), false);
        Window window = getWindow();
        C4889sa0 c4889sa0 = new C4889sa0(getWindow().getDecorView());
        AbstractC5011tE1 tp1 = Build.VERSION.SDK_INT >= 30 ? new Tp1(window, c4889sa0) : new Rp1(window, c4889sa0);
        tp1.g();
        tp1.j();
        LX0 lx0D = LX0.f.d(getApplicationContext());
        this.h0 = C0012Ad0.n.s(getApplicationContext());
        int[] iArr = Q50.a;
        List<byte[]> listE = Q50.e(this);
        if (!listE.isEmpty()) {
            String str = (String) Q50.b.getValue();
            int length = str.length() / 2;
            byte[] bArr = new byte[length];
            for (int i = 0; i < length; i++) {
                int i2 = i * 2;
                bArr[i] = (byte) (Character.digit(str.charAt(i2 + 1), 16) + (Character.digit(str.charAt(i2), 16) << 4));
            }
            String strF = Q50.f(Q50.c(bArr));
            if (listE.isEmpty()) {
                Q50.c = true;
            } else {
                for (byte[] bArr2 : listE) {
                    int[] iArr2 = Q50.a;
                    if (Q50.f(Q50.c(Q50.c(bArr2))).equalsIgnoreCase(strF)) {
                        break;
                    }
                }
                Q50.c = true;
            }
        }
        LE1.g(C1991bs1.j(this), AbstractC4323pH.b, 0, new C0085Bg0(this, null), 2);
        Intent intent = getIntent();
        if (intent != null && (stringExtra = intent.getStringExtra("open_route")) != null) {
            O51 o51 = k0;
            o51.getClass();
            o51.j(null, stringExtra);
            intent.removeExtra("open_route");
        }
        l(getIntent());
        LE1.g(C1991bs1.j(this), null, 0, new C0149Cg0(this, null), 3);
        AbstractC5998yw.a(this, new C0378Fw(-124920430, new C2375e5(15, lx0D, this), true));
    }

    @Override // defpackage.AbstractActivityC5824xw, android.app.Activity
    public final void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        String stringExtra = intent.getStringExtra("open_route");
        if (stringExtra != null) {
            O51 o51 = k0;
            o51.getClass();
            o51.j(null, stringExtra);
            intent.removeExtra("open_route");
        }
        l(intent);
    }

    @Override // android.app.Activity
    public final void onPause() {
        super.onPause();
        j0 = false;
    }

    @Override // android.app.Activity
    public final void onResume() {
        super.onResume();
        j0 = true;
        if (this.h0 != null) {
            LE1.g(C1991bs1.j(this), null, 0, new C0213Dg0(this, null), 3);
        }
        C0012Ad0 c0012Ad0 = this.h0;
        if ((c0012Ad0 != null ? c0012Ad0 : null).g.getValue() == EnumC0076Bd0.P && VJ1.c(this, "android.permission.RECORD_AUDIO") == 0) {
            C2880gz1 c2880gz1 = MeeraForegroundService.j4;
            C2880gz1.F(this);
        }
    }

    @Override // android.app.Activity
    public final void onStart() {
        super.onStart();
        O51 o51 = C5562wP.c;
        o51.j(null, Integer.valueOf(((Number) o51.getValue()).intValue() + 1));
    }

    @Override // android.app.Activity
    public final void onStop() {
        super.onStop();
        PowerManager powerManager = (PowerManager) getSystemService(PowerManager.class);
        if (powerManager != null && !powerManager.isInteractive()) {
            C5562wP.a.d();
            return;
        }
        C5562wP c5562wP = C5562wP.a;
        EnumC5040tP enumC5040tPB = C5388vP.b.y(this).b();
        synchronized (c5562wP) {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            for (EnumC4866sP enumC4866sP : AbstractC4256ov.g(EnumC4866sP.SETTINGS, EnumC4866sP.CHATS, EnumC4866sP.MEMORIES)) {
                Long l = (Long) C5562wP.b.get(enumC4866sP.N);
                if (l != null) {
                    long jLongValue = l.longValue();
                    String str = enumC4866sP.N;
                    Set set = AbstractC5214uP.a;
                    long jMin = 0;
                    if (jLongValue > jElapsedRealtime) {
                        long j = enumC5040tPB.O;
                        if (j > 0) {
                            jMin = Math.min(jLongValue, j + jElapsedRealtime);
                        }
                    }
                    C5562wP.e(jMin, str);
                }
            }
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        if (z) {
            Window window = getWindow();
            C4889sa0 c4889sa0 = new C4889sa0(getWindow().getDecorView());
            AbstractC5011tE1 tp1 = Build.VERSION.SDK_INT >= 30 ? new Tp1(window, c4889sa0) : new Rp1(window, c4889sa0);
            tp1.g();
            tp1.j();
        }
    }
}
