package com.getmeera.android;

import android.app.Application;
import android.content.Context;
import defpackage.AbstractC2645ff0;
import defpackage.AbstractC3986nK1;
import defpackage.AbstractC4323pH;
import defpackage.AbstractC4855sK1;
import defpackage.AbstractC6094zU;
import defpackage.C1951bf0;
import defpackage.C2230dE0;
import defpackage.C2471ef0;
import defpackage.C2837gl0;
import defpackage.C3011hl0;
import defpackage.E61;
import defpackage.ExecutorC1711aF;
import defpackage.JO0;
import defpackage.LE1;
import defpackage.LX0;
import defpackage.O4;
import defpackage.Q50;
import defpackage.WI1;
import defpackage.WZ0;
import java.io.File;
import java.lang.Thread;
import java.util.Set;
import kotlin.Metadata;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/MeeraApplication;", "Landroid/app/Application;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class MeeraApplication extends Application {
    public static volatile Context N;

    @Override // android.app.Application
    public final void onCreate() {
        Object jo0;
        Object jo02;
        String string;
        String string2;
        super.onCreate();
        N = getApplicationContext();
        if (!WI1.a) {
            WI1.a = true;
            final Context applicationContext = getApplicationContext();
            final Thread.UncaughtExceptionHandler defaultUncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: nC0
                @Override // java.lang.Thread.UncaughtExceptionHandler
                public final void uncaughtException(Thread thread, Throwable th) {
                    try {
                        WI1.b(applicationContext, thread.getName(), th);
                    } catch (Throwable unused) {
                    }
                    Thread.UncaughtExceptionHandler uncaughtExceptionHandler = defaultUncaughtExceptionHandler;
                    if (uncaughtExceptionHandler != null) {
                        uncaughtExceptionHandler.uncaughtException(thread, th);
                    }
                }
            });
        }
        int[] iArr = Q50.a;
        String strD = Q50.d(this);
        if (strD != null && !strD.equalsIgnoreCase((String) Q50.b.getValue())) {
            Q50.c = true;
        }
        Q50.b(this);
        try {
            LX0 lx0D = LX0.f.d(this);
            String str = "";
            if (lx0D.q() && (string2 = lx0D.m().getString("prompt_bundle_json", null)) != null) {
                str = string2;
            }
            if (str.length() > 0) {
                AbstractC4855sK1.b(str);
            }
        } catch (Throwable unused) {
        }
        try {
            String str2 = WZ0.a;
            LX0 lx0D2 = LX0.f.d(this);
            String str3 = "";
            if (lx0D2.q() && (string = lx0D2.m().getString("skill_bundle_json", null)) != null) {
                str3 = string;
            }
            WZ0.a(str3);
        } catch (Throwable unused2) {
        }
        try {
            Set set = AbstractC6094zU.a;
            try {
                jo02 = getApplicationContext().getSharedPreferences("meera_free_tools", 0).getString("names", null);
            } catch (Throwable th) {
                jo02 = new JO0(th);
            }
            if (jo02 instanceof JO0) {
                jo02 = null;
            }
            String str4 = (String) jo02;
            if (str4 != null) {
                AbstractC6094zU.b = AbstractC6094zU.a(E61.d0(str4, new char[]{','}, 0, 6));
            }
        } catch (Throwable unused3) {
        }
        try {
            C2471ef0 c2471ef0 = AbstractC2645ff0.a;
            try {
                jo0 = getApplicationContext().getSharedPreferences("meera_live_remote", 0).getString("config", null);
            } catch (Throwable th2) {
                jo0 = new JO0(th2);
            }
            if (jo0 instanceof JO0) {
                jo0 = null;
            }
            String str5 = (String) jo0;
            if (str5 != null) {
                try {
                    AbstractC2645ff0.a = AbstractC2645ff0.c(new JSONObject(str5));
                } catch (Throwable unused4) {
                }
            }
            C2230dE0 c2230dE0B = AbstractC2645ff0.b(this);
            long jLongValue = ((Number) c2230dE0B.N).longValue();
            long jLongValue2 = ((Number) c2230dE0B.O).longValue();
            C1951bf0 c1951bf0 = C1951bf0.j;
            synchronized (c1951bf0) {
                c1951bf0.b = jLongValue;
                c1951bf0.c = jLongValue2;
            }
        } catch (Throwable unused5) {
        }
        ExecutorC1711aF executorC1711aF = AbstractC4323pH.b;
        LE1.g(AbstractC3986nK1.a(executorC1711aF), null, 0, new C2837gl0(this, null), 3);
        LE1.g(AbstractC3986nK1.a(executorC1711aF), null, 0, new C3011hl0(this, null), 3);
    }

    @Override // android.app.Application, android.content.ComponentCallbacks2
    public final void onTrimMemory(int i) {
        super.onTrimMemory(i);
        if (i < 15) {
            return;
        }
        try {
            File file = O4.a;
            O4.c("MEM trim level=" + i + " — avatar GL released");
        } catch (Throwable unused) {
        }
    }
}
