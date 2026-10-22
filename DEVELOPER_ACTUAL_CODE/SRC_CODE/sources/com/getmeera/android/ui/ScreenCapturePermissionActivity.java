package com.getmeera.android.ui;

import android.media.projection.MediaProjectionManager;
import android.os.Bundle;
import defpackage.AbstractActivityC5824xw;
import defpackage.C1846b2;
import defpackage.C2019c2;
import defpackage.W1;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/ui/ScreenCapturePermissionActivity;", "Lxw;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class ScreenCapturePermissionActivity extends AbstractActivityC5824xw {
    public static final /* synthetic */ int i0 = 0;
    public final C1846b2 h0 = k(new W1(7), new C2019c2(this, 20));

    @Override // defpackage.AbstractActivityC5824xw, android.app.Activity
    public final void onCreate(Bundle bundle) throws Exception {
        super.onCreate(bundle);
        this.h0.c(((MediaProjectionManager) getSystemService("media_projection")).createScreenCaptureIntent());
    }
}
