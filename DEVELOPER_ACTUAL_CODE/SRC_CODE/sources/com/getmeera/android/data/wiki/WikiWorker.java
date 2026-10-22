package com.getmeera.android.data.wiki;

import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/getmeera/android/data/wiki/WikiWorker;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "params", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class WikiWorker extends CoroutineWorker {
    public WikiWorker(Context context, WorkerParameters workerParameters) {
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
            boolean r0 = r6 instanceof defpackage.C4414pp1
            if (r0 == 0) goto L13
            r0 = r6
            pp1 r0 = (defpackage.C4414pp1) r0
            int r1 = r0.S
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.S = r1
            goto L18
        L13:
            pp1 r0 = new pp1
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.Q
            aD r1 = defpackage.EnumC1705aD.N
            int r2 = r0.S
            r3 = 1
            if (r2 == 0) goto L31
            if (r2 != r3) goto L29
            defpackage.YK1.b(r6)     // Catch: java.lang.Throwable -> L27
            goto L44
        L27:
            r6 = move-exception
            goto L47
        L29:
            java.lang.IllegalStateException r6 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r6.<init>(r0)
            throw r6
        L31:
            defpackage.YK1.b(r6)
            hp1 r6 = new hp1     // Catch: java.lang.Throwable -> L27
            android.content.Context r2 = r5.N     // Catch: java.lang.Throwable -> L27
            r6.<init>(r2)     // Catch: java.lang.Throwable -> L27
            r0.S = r3     // Catch: java.lang.Throwable -> L27
            java.lang.Object r6 = r6.c(r0)     // Catch: java.lang.Throwable -> L27
            if (r6 != r1) goto L44
            return r1
        L44:
            ep1 r6 = (defpackage.C2502ep1) r6     // Catch: java.lang.Throwable -> L27
            goto L4d
        L47:
            JO0 r0 = new JO0
            r0.<init>(r6)
            r6 = r0
        L4d:
            boolean r0 = r6 instanceof defpackage.JO0
            r0 = r0 ^ r3
            if (r0 == 0) goto L8d
            r0 = r6
            ep1 r0 = (defpackage.C2502ep1) r0
            java.io.File r1 = defpackage.O4.a
            int r1 = r0.a
            java.lang.String r2 = r0.d
            if (r2 == 0) goto L67
            java.lang.String r3 = " ("
            java.lang.String r4 = ")"
            java.lang.String r2 = defpackage.AbstractC1771ad0.g(r3, r2, r4)
            goto L68
        L67:
            r2 = 0
        L68:
            if (r2 != 0) goto L6c
            java.lang.String r2 = ""
        L6c:
            java.lang.String r3 = "WIKI worker — attempted="
            java.lang.String r4 = " written="
            java.lang.StringBuilder r1 = defpackage.AbstractC1771ad0.j(r3, r1, r4)
            int r3 = r0.b
            r1.append(r3)
            java.lang.String r3 = " consumed="
            r1.append(r3)
            int r0 = r0.c
            r1.append(r0)
            r1.append(r2)
            java.lang.String r0 = r1.toString()
            defpackage.O4.c(r0)
        L8d:
            java.lang.Throwable r6 = defpackage.KO0.a(r6)
            if (r6 == 0) goto L9e
            java.io.File r0 = defpackage.O4.a
            java.lang.String r6 = r6.getMessage()
            java.lang.String r0 = "WIKI worker failed: "
            defpackage.AbstractC1715aG0.k(r0, r6)
        L9e:
            Oe0 r6 = defpackage.AbstractC0974Pe0.a()
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.data.wiki.WikiWorker.f(kC):java.lang.Object");
    }
}
