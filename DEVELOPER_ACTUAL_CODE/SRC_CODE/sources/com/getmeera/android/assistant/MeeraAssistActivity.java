package com.getmeera.android.assistant;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import com.getmeera.android.core.MeeraForegroundService;
import defpackage.C2880gz1;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/assistant/MeeraAssistActivity;", "Landroid/app/Activity;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class MeeraAssistActivity extends Activity {
    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        C2880gz1 c2880gz1 = MeeraForegroundService.j4;
        C2880gz1.W(this, new Intent(this, (Class<?>) MeeraForegroundService.class).setAction("com.getmeera.android.ASSIST_WAKE").putExtra("extra_text", (String) null));
        finish();
    }
}
