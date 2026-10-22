package androidx.compose.foundation.gestures;

import defpackage.C0699Kw0;
import defpackage.C3279jH;
import defpackage.CD0;
import defpackage.InterfaceC0569Iv0;
import defpackage.InterfaceC2442eT0;
import defpackage.InterfaceC4918sk;
import defpackage.PS0;
import defpackage.QS0;
import defpackage.SC0;
import defpackage.VE;

/* JADX INFO: loaded from: classes.dex */
public abstract class a {
    public static final PS0 a = new PS0();
    public static final C3279jH b = new C3279jH(1);
    public static final QS0 c = new QS0();

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static final java.lang.Object a(defpackage.C4180oT0 r11, long r12, defpackage.InterfaceC3438kC r14) throws java.lang.Throwable {
        /*
            boolean r0 = r14 instanceof defpackage.RS0
            if (r0 == 0) goto L13
            r0 = r14
            RS0 r0 = (defpackage.RS0) r0
            int r1 = r0.T
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.T = r1
            goto L18
        L13:
            RS0 r0 = new RS0
            r0.<init>(r14)
        L18:
            java.lang.Object r14 = r0.S
            aD r1 = defpackage.EnumC1705aD.N
            int r2 = r0.T
            r3 = 1
            if (r2 == 0) goto L35
            if (r2 != r3) goto L2d
            YL0 r11 = r0.R
            oT0 r12 = r0.Q
            defpackage.YK1.b(r14)
            r14 = r11
            r11 = r12
            goto L56
        L2d:
            java.lang.IllegalStateException r11 = new java.lang.IllegalStateException
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            r11.<init>(r12)
            throw r11
        L35:
            defpackage.YK1.b(r14)
            YL0 r14 = new YL0
            r14.<init>()
            qx0 r2 = defpackage.EnumC4611qx0.N
            SS0 r10 = new SS0
            r9 = 0
            r4 = r10
            r5 = r11
            r6 = r12
            r8 = r14
            r4.<init>(r5, r6, r8, r9)
            r0.Q = r11
            r0.R = r14
            r0.T = r3
            java.lang.Object r12 = r11.e(r2, r10, r0)
            if (r12 != r1) goto L56
            goto L61
        L56:
            float r12 = r14.N
            long r11 = r11.g(r12)
            FA0 r1 = new FA0
            r1.<init>(r11)
        L61:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.gestures.a.a(oT0, long, kC):java.lang.Object");
    }

    public static final InterfaceC0569Iv0 b(InterfaceC0569Iv0 interfaceC0569Iv0, InterfaceC2442eT0 interfaceC2442eT0, SC0 sc0, CD0 cd0, boolean z, boolean z2, VE ve, C0699Kw0 c0699Kw0, InterfaceC4918sk interfaceC4918sk) {
        return interfaceC0569Iv0.j(new ScrollableElement(interfaceC4918sk, ve, c0699Kw0, sc0, cd0, interfaceC2442eT0, z, z2));
    }
}
