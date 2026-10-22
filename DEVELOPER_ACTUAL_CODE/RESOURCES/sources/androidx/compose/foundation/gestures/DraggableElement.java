package androidx.compose.foundation.gestures;

import defpackage.AbstractC0208De1;
import defpackage.AbstractC0505Hv0;
import defpackage.AbstractC0952Ov0;
import defpackage.AbstractC3088iA1;
import defpackage.C0699Kw0;
import defpackage.IU;
import defpackage.JH;
import defpackage.RI;
import defpackage.SC0;
import defpackage.SI;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/gestures/DraggableElement;", "LOv0;", "LRI;", "foundation_release"}, k = 1, mv = {1, 8, 0})
public final class DraggableElement extends AbstractC0952Ov0 {
    public final SI b;
    public final SC0 c;
    public final boolean d;
    public final C0699Kw0 e;
    public final boolean f;
    public final IU g;
    public final IU h;
    public final boolean i;

    public DraggableElement(SI si, SC0 sc0, boolean z, C0699Kw0 c0699Kw0, boolean z2, IU iu, IU iu2, boolean z3) {
        this.b = si;
        this.c = sc0;
        this.d = z;
        this.e = c0699Kw0;
        this.f = z2;
        this.g = iu;
        this.h = iu2;
        this.i = z3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || DraggableElement.class != obj.getClass()) {
            return false;
        }
        DraggableElement draggableElement = (DraggableElement) obj;
        return AbstractC3088iA1.b(this.b, draggableElement.b) && this.c == draggableElement.c && this.d == draggableElement.d && AbstractC3088iA1.b(this.e, draggableElement.e) && this.f == draggableElement.f && AbstractC3088iA1.b(this.g, draggableElement.g) && AbstractC3088iA1.b(this.h, draggableElement.h) && this.i == draggableElement.i;
    }

    public final int hashCode() {
        int iF = AbstractC0208De1.f((this.c.hashCode() + (this.b.hashCode() * 31)) * 31, 31, this.d);
        C0699Kw0 c0699Kw0 = this.e;
        return Boolean.hashCode(this.i) + ((this.h.hashCode() + ((this.g.hashCode() + AbstractC0208De1.f((iF + (c0699Kw0 != null ? c0699Kw0.hashCode() : 0)) * 31, 31, this.f)) * 31)) * 31);
    }

    @Override // defpackage.AbstractC0952Ov0
    public final AbstractC0505Hv0 l() {
        JH jh = JH.S;
        boolean z = this.d;
        C0699Kw0 c0699Kw0 = this.e;
        SC0 sc0 = this.c;
        RI ri = new RI(jh, z, c0699Kw0, sc0);
        ri.k0 = this.b;
        ri.l0 = sc0;
        ri.m0 = this.f;
        ri.n0 = this.g;
        ri.o0 = this.h;
        ri.p0 = this.i;
        return ri;
    }

    @Override // defpackage.AbstractC0952Ov0
    public final void m(AbstractC0505Hv0 abstractC0505Hv0) {
        boolean z;
        boolean z2;
        RI ri = (RI) abstractC0505Hv0;
        JH jh = JH.S;
        SI si = ri.k0;
        SI si2 = this.b;
        if (AbstractC3088iA1.b(si, si2)) {
            z = false;
        } else {
            ri.k0 = si2;
            z = true;
        }
        SC0 sc0 = ri.l0;
        SC0 sc02 = this.c;
        if (sc0 != sc02) {
            ri.l0 = sc02;
            z = true;
        }
        boolean z3 = ri.p0;
        boolean z4 = this.i;
        if (z3 != z4) {
            ri.p0 = z4;
            z2 = true;
        } else {
            z2 = z;
        }
        ri.n0 = this.g;
        ri.o0 = this.h;
        ri.m0 = this.f;
        ri.Y0(jh, this.d, this.e, sc02, z2);
    }
}
