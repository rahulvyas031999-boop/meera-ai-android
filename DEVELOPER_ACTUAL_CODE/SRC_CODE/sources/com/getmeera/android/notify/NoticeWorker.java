package com.getmeera.android.notify;

import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/getmeera/android/notify/NoticeWorker;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "params", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class NoticeWorker extends CoroutineWorker {
    public NoticeWorker(Context context, WorkerParameters workerParameters) {
        super(context, workerParameters);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // androidx.work.CoroutineWorker
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final java.lang.Object f(defpackage.InterfaceC3438kC r5) throws java.lang.Throwable {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.C0513Hz0
            if (r0 == 0) goto L13
            r0 = r5
            Hz0 r0 = (defpackage.C0513Hz0) r0
            int r1 = r0.S
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.S = r1
            goto L18
        L13:
            Hz0 r0 = new Hz0
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.Q
            aD r1 = defpackage.EnumC1705aD.N
            int r2 = r0.S
            r3 = 1
            if (r2 == 0) goto L31
            if (r2 != r3) goto L29
            defpackage.YK1.b(r5)     // Catch: java.lang.Throwable -> L27
            goto L45
        L27:
            r5 = move-exception
            goto L48
        L29:
            java.lang.IllegalStateException r5 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r5.<init>(r0)
            throw r5
        L31:
            defpackage.YK1.b(r5)
            XW r5 = defpackage.C0449Gz0.k     // Catch: java.lang.Throwable -> L27
            android.content.Context r2 = r4.N     // Catch: java.lang.Throwable -> L27
            Gz0 r5 = r5.w(r2)     // Catch: java.lang.Throwable -> L27
            r0.S = r3     // Catch: java.lang.Throwable -> L27
            java.lang.Object r5 = r5.b(r3, r0)     // Catch: java.lang.Throwable -> L27
            if (r5 != r1) goto L45
            return r1
        L45:
            fh1 r5 = defpackage.C2652fh1.a     // Catch: java.lang.Throwable -> L27
            goto L4e
        L48:
            JO0 r0 = new JO0
            r0.<init>(r5)
            r5 = r0
        L4e:
            java.lang.Throwable r5 = defpackage.KO0.a(r5)
            if (r5 == 0) goto L5a
            Ne0 r5 = new Ne0
            r5.<init>()
            return r5
        L5a:
            Oe0 r5 = defpackage.AbstractC0974Pe0.a()
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.notify.NoticeWorker.f(kC):java.lang.Object");
    }
}
