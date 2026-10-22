package com.getmeera.android.telemetry;

import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import defpackage.C1458Ws0;
import defpackage.QG1;
import defpackage.XE1;
import java.util.regex.Pattern;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0001\bB\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\t"}, d2 = {"Lcom/getmeera/android/telemetry/OpsUploader;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "params", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "QG1", "app_release"}, k = 1, mv = {1, 9, 0})
public final class OpsUploader extends CoroutineWorker {
    public static final QG1 U = new QG1(27);
    public static final C1458Ws0 V;

    static {
        Pattern pattern = C1458Ws0.d;
        V = XE1.a("application/json");
    }

    public OpsUploader(Context context, WorkerParameters workerParameters) {
        super(context, workerParameters);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // androidx.work.CoroutineWorker
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final java.lang.Object f(defpackage.InterfaceC3438kC r6) throws java.lang.Throwable {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.C5526wC0
            if (r0 == 0) goto L13
            r0 = r6
            wC0 r0 = (defpackage.C5526wC0) r0
            int r1 = r0.S
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.S = r1
            goto L18
        L13:
            wC0 r0 = new wC0
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.Q
            aD r1 = defpackage.EnumC1705aD.N
            int r2 = r0.S
            r3 = 1
            if (r2 == 0) goto L2f
            if (r2 != r3) goto L27
            defpackage.YK1.b(r6)
            goto L43
        L27:
            java.lang.IllegalStateException r6 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r6.<init>(r0)
            throw r6
        L2f:
            defpackage.YK1.b(r6)
            aF r6 = defpackage.AbstractC4323pH.b
            xC0 r2 = new xC0
            r4 = 0
            r2.<init>(r5, r4)
            r0.S = r3
            java.lang.Object r6 = defpackage.LE1.k(r6, r2, r0)
            if (r6 != r1) goto L43
            return r1
        L43:
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.telemetry.OpsUploader.f(kC):java.lang.Object");
    }
}
