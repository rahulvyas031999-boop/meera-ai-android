package com.getmeera.android.marketing;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import defpackage.A31;
import defpackage.AbstractC1963bj0;
import defpackage.AbstractC2926hE1;
import defpackage.AbstractC3088iA1;
import defpackage.AbstractC4082nv;
import defpackage.C0027Ai0;
import defpackage.C5609wi0;
import defpackage.C5783xi0;
import defpackage.C6131zi0;
import defpackage.LE1;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/getmeera/android/marketing/MarketingAlarmReceiver;", "Landroid/content/BroadcastReceiver;", "<init>", "()V", "fE1", "app_release"}, k = 1, mv = {1, 9, 0})
public final class MarketingAlarmReceiver extends BroadcastReceiver {
    public static final /* synthetic */ int a = 0;

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        int iA;
        Context applicationContext = context.getApplicationContext();
        if (AbstractC3088iA1.b(intent.getAction(), "com.getmeera.android.marketing.DAILY_TRENDS")) {
            AbstractC1963bj0.a(applicationContext);
            if (applicationContext.getApplicationContext().getSharedPreferences("meera_marketing", 0).getBoolean("trends_daily", false) && applicationContext.getApplicationContext().getSharedPreferences("meera_marketing", 0).getInt("trends_last_day", -1) != (iA = A31.a())) {
                LE1.g(AbstractC1963bj0.a, null, 0, new C6131zi0(applicationContext, iA, null), 3);
                return;
            }
            return;
        }
        if (AbstractC3088iA1.b(intent.getAction(), "com.getmeera.android.marketing.FOLLOWUPS_DUE")) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            applicationContext.getApplicationContext().getSharedPreferences("meera_marketing", 0).edit().putLong("followups_announced_at", jCurrentTimeMillis).apply();
            AbstractC1963bj0.a(applicationContext);
            LE1.g(AbstractC1963bj0.a, null, 0, new C5609wi0(applicationContext, jCurrentTimeMillis, null), 3);
            return;
        }
        if (AbstractC3088iA1.b(intent.getAction(), "com.getmeera.android.marketing.WEEKLY_NUMBERS")) {
            AbstractC1963bj0.a(applicationContext);
            if (applicationContext.getApplicationContext().getSharedPreferences("meera_marketing", 0).getBoolean("weekly_summary", false)) {
                LE1.g(AbstractC1963bj0.a, null, 0, new C0027Ai0(applicationContext, null), 3);
                return;
            }
            return;
        }
        if (AbstractC3088iA1.b(intent.getAction(), "com.getmeera.android.marketing.CALENDAR_DUE")) {
            long jCurrentTimeMillis2 = System.currentTimeMillis();
            List listE = AbstractC2926hE1.e(applicationContext);
            ArrayList arrayList = new ArrayList();
            for (Object obj : listE) {
                if (((Number) obj).longValue() > jCurrentTimeMillis2) {
                    arrayList.add(obj);
                }
            }
            applicationContext.getApplicationContext().getSharedPreferences("meera_marketing", 0).edit().putString("calendar_upcoming", AbstractC4082nv.L(AbstractC4082nv.b0(AbstractC4082nv.Z(arrayList), 40), ",", null, null, null, 62)).apply();
            AbstractC1963bj0.a(applicationContext);
            LE1.g(AbstractC1963bj0.a, null, 0, new C5783xi0(applicationContext, null), 3);
        }
    }
}
