package androidx.compose.foundation.gestures;

import defpackage.AbstractC0208De1;
import defpackage.AbstractC0505Hv0;
import defpackage.AbstractC0952Ov0;
import defpackage.AbstractC2428eM1;
import defpackage.AbstractC3088iA1;
import defpackage.C0699Kw0;
import defpackage.C2046cB;
import defpackage.C2269dT0;
import defpackage.C4180oT0;
import defpackage.CD0;
import defpackage.InterfaceC2442eT0;
import defpackage.InterfaceC4918sk;
import defpackage.NQ0;
import defpackage.PS0;
import defpackage.SC0;
import defpackage.VE;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/gestures/ScrollableElement;", "LOv0;", "LdT0;", "foundation_release"}, k = 1, mv = {1, 8, 0})
final class ScrollableElement extends AbstractC0952Ov0 {
    public final InterfaceC2442eT0 b;
    public final SC0 c;
    public final CD0 d;
    public final boolean e;
    public final boolean f;
    public final VE g;
    public final C0699Kw0 h;
    public final InterfaceC4918sk i;

    public ScrollableElement(InterfaceC4918sk interfaceC4918sk, VE ve, C0699Kw0 c0699Kw0, SC0 sc0, CD0 cd0, InterfaceC2442eT0 interfaceC2442eT0, boolean z, boolean z2) {
        this.b = interfaceC2442eT0;
        this.c = sc0;
        this.d = cd0;
        this.e = z;
        this.f = z2;
        this.g = ve;
        this.h = c0699Kw0;
        this.i = interfaceC4918sk;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ScrollableElement)) {
            return false;
        }
        ScrollableElement scrollableElement = (ScrollableElement) obj;
        return AbstractC3088iA1.b(this.b, scrollableElement.b) && this.c == scrollableElement.c && AbstractC3088iA1.b(this.d, scrollableElement.d) && this.e == scrollableElement.e && this.f == scrollableElement.f && AbstractC3088iA1.b(this.g, scrollableElement.g) && AbstractC3088iA1.b(this.h, scrollableElement.h) && AbstractC3088iA1.b(this.i, scrollableElement.i);
    }

    public final int hashCode() {
        int iHashCode = (this.c.hashCode() + (this.b.hashCode() * 31)) * 31;
        CD0 cd0 = this.d;
        int iF = AbstractC0208De1.f(AbstractC0208De1.f((iHashCode + (cd0 != null ? cd0.hashCode() : 0)) * 31, 31, this.e), 31, this.f);
        VE ve = this.g;
        int iHashCode2 = (iF + (ve != null ? ve.hashCode() : 0)) * 31;
        C0699Kw0 c0699Kw0 = this.h;
        int iHashCode3 = (iHashCode2 + (c0699Kw0 != null ? c0699Kw0.hashCode() : 0)) * 31;
        InterfaceC4918sk interfaceC4918sk = this.i;
        return iHashCode3 + (interfaceC4918sk != null ? interfaceC4918sk.hashCode() : 0);
    }

    @Override // defpackage.AbstractC0952Ov0
    public final AbstractC0505Hv0 l() {
        boolean z = this.e;
        boolean z2 = this.f;
        InterfaceC2442eT0 interfaceC2442eT0 = this.b;
        CD0 cd0 = this.d;
        VE ve = this.g;
        SC0 sc0 = this.c;
        return new C2269dT0(this.i, ve, this.h, sc0, cd0, interfaceC2442eT0, z, z2);
    }

    @Override // defpackage.AbstractC0952Ov0
    public final void m(AbstractC0505Hv0 abstractC0505Hv0) {
        boolean z;
        boolean z2;
        C2269dT0 c2269dT0 = (C2269dT0) abstractC0505Hv0;
        boolean z3 = c2269dT0.e0;
        boolean z4 = this.e;
        boolean z5 = false;
        if (z3 != z4) {
            c2269dT0.q0.O = z4;
            c2269dT0.n0.a0 = z4;
            z = true;
        } else {
            z = false;
        }
        VE ve = this.g;
        VE ve2 = ve == null ? c2269dT0.o0 : ve;
        C4180oT0 c4180oT0 = c2269dT0.p0;
        InterfaceC2442eT0 interfaceC2442eT0 = c4180oT0.a;
        InterfaceC2442eT0 interfaceC2442eT02 = this.b;
        if (!AbstractC3088iA1.b(interfaceC2442eT0, interfaceC2442eT02)) {
            c4180oT0.a = interfaceC2442eT02;
            z5 = true;
        }
        CD0 cd0 = this.d;
        c4180oT0.b = cd0;
        SC0 sc0 = c4180oT0.d;
        SC0 sc02 = this.c;
        if (sc0 != sc02) {
            c4180oT0.d = sc02;
            z5 = true;
        }
        boolean z6 = c4180oT0.e;
        boolean z7 = this.f;
        if (z6 != z7) {
            c4180oT0.e = z7;
            z2 = true;
        } else {
            z2 = z5;
        }
        c4180oT0.c = ve2;
        c4180oT0.f = c2269dT0.m0;
        C2046cB c2046cB = c2269dT0.r0;
        c2046cB.a0 = sc02;
        c2046cB.c0 = z7;
        c2046cB.d0 = this.i;
        c2269dT0.k0 = cd0;
        c2269dT0.l0 = ve;
        PS0 ps0 = a.a;
        NQ0 nq0 = NQ0.a0;
        SC0 sc03 = c4180oT0.d;
        SC0 sc04 = SC0.N;
        c2269dT0.Y0(nq0, z4, this.h, sc03 == sc04 ? sc04 : SC0.O, z2);
        if (z) {
            c2269dT0.s0 = null;
            c2269dT0.t0 = null;
            AbstractC2428eM1.b(c2269dT0);
        }
    }
}
