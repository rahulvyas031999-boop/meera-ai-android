package com.getmeera.android.termux;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import defpackage.AbstractC1509Xm;
import defpackage.C3043hw;
import defpackage.C3328jb1;
import defpackage.InterfaceC2869gw;
import defpackage.O4;
import java.io.File;
import java.util.HashMap;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/termux/TermuxResultReceiver;", "Landroid/content/BroadcastReceiver;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class TermuxResultReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        InterfaceC2869gw interfaceC2869gw;
        int intExtra = intent.getIntExtra("meera_exec_id", -1);
        if (intExtra < 0) {
            return;
        }
        Bundle bundleExtra = intent.getBundleExtra("result");
        HashMap map = C3328jb1.c;
        synchronized (map) {
            interfaceC2869gw = (InterfaceC2869gw) map.get(Integer.valueOf(intExtra));
        }
        if (interfaceC2869gw != null) {
            ((C3043hw) interfaceC2869gw).g0(bundleExtra);
        } else {
            File file = O4.a;
            AbstractC1509Xm.q("TERMUX result for ", intExtra, " with nobody waiting");
        }
    }
}
