package com.getmeera.android.ui.facelock;

import android.content.Intent;
import android.os.Bundle;
import defpackage.AbstractActivityC5824xw;
import defpackage.AbstractC1476Xb;
import defpackage.AbstractC3088iA1;
import defpackage.AbstractC5998yw;
import defpackage.AbstractC6168zu1;
import defpackage.C0378Fw;
import defpackage.C1739aP;
import defpackage.C4086nw0;
import defpackage.C4315pE0;
import defpackage.M61;
import defpackage.YO;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/ui/facelock/FaceLockActivity;", "Lxw;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class FaceLockActivity extends AbstractActivityC5824xw {
    public static final /* synthetic */ int k0 = 0;
    public final C4315pE0 h0;
    public final C4315pE0 i0;
    public boolean j0;

    public FaceLockActivity() {
        C4086nw0 c4086nw0 = C4086nw0.T;
        this.h0 = AbstractC6168zu1.g("", c4086nw0);
        this.i0 = AbstractC6168zu1.g("", c4086nw0);
    }

    public static final void l(FaceLockActivity faceLockActivity) {
        faceLockActivity.getClass();
        try {
            faceLockActivity.startActivity(new Intent("android.intent.action.MAIN").addCategory("android.intent.category.HOME").addFlags(268435456));
        } catch (Throwable unused) {
        }
        faceLockActivity.finish();
    }

    public final String m() {
        return (String) this.h0.getValue();
    }

    public final void n(Intent intent) {
        String stringExtra = intent != null ? intent.getStringExtra("pkg") : null;
        if (stringExtra == null) {
            stringExtra = "";
        }
        this.h0.setValue(stringExtra);
        String stringExtra2 = intent != null ? intent.getStringExtra("label") : null;
        this.i0.setValue(stringExtra2 != null ? stringExtra2 : "");
        if (M61.w(m())) {
            finish();
        }
    }

    @Override // defpackage.AbstractActivityC5824xw, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        n(getIntent());
        a().a(this, new YO(this));
        AbstractC5998yw.a(this, new C0378Fw(-811746688, new C1739aP(this, 1), true));
    }

    @Override // android.app.Activity
    public final void onDestroy() {
        if (!this.j0) {
            String str = AbstractC1476Xb.a;
            AbstractC1476Xb.b = null;
            AbstractC1476Xb.d = null;
        }
        super.onDestroy();
    }

    @Override // defpackage.AbstractActivityC5824xw, android.app.Activity
    public final void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        n(intent);
    }

    @Override // android.app.Activity
    public final void onPause() {
        String str = AbstractC1476Xb.a;
        if (AbstractC3088iA1.b(AbstractC1476Xb.d, m())) {
            AbstractC1476Xb.d = null;
        }
        super.onPause();
    }

    @Override // android.app.Activity
    public final void onResume() {
        super.onResume();
        String str = AbstractC1476Xb.a;
        AbstractC1476Xb.d = m();
    }

    @Override // android.app.Activity
    public final void onStop() {
        if (!this.j0) {
            String str = AbstractC1476Xb.a;
            AbstractC1476Xb.b = null;
            AbstractC1476Xb.d = null;
        }
        super.onStop();
    }
}
