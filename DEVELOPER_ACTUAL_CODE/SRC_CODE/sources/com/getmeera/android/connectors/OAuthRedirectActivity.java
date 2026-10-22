package com.getmeera.android.connectors;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;
import defpackage.AbstractC0341Fg0;
import defpackage.AbstractC3986nK1;
import defpackage.AbstractC4082nv;
import defpackage.AbstractC4323pH;
import defpackage.C0852Ng0;
import defpackage.C2753gF;
import defpackage.C3955nA0;
import defpackage.LE1;
import defpackage.M61;
import defpackage.O4;
import java.io.File;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/connectors/OAuthRedirectActivity;", "Landroid/app/Activity;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class OAuthRedirectActivity extends Activity {
    public static final /* synthetic */ int N = 0;

    public final void a(Intent intent) {
        try {
            try {
                b(intent);
            } catch (Exception e) {
                File file = O4.a;
                O4.c("CONNECTOR oauth redirect unreadable: " + e.getMessage());
            }
        } finally {
            finish();
        }
    }

    public final void b(Intent intent) {
        Uri data;
        if (intent == null || (data = intent.getData()) == null) {
            return;
        }
        if (!data.isHierarchical()) {
            O4.c("CONNECTOR oauth redirect ignored — not a hierarchical URI");
            return;
        }
        String queryParameter = data.getQueryParameter("error");
        if (queryParameter != null && !M61.w(queryParameter)) {
            File file = O4.a;
            O4.c("CONNECTOR oauth redirect declined: ".concat(queryParameter));
            c("Connect cancel ho gaya");
            return;
        }
        String queryParameter2 = data.getQueryParameter("code");
        String queryParameter3 = data.getQueryParameter("state");
        String str = queryParameter3 == null ? "" : queryParameter3;
        if (queryParameter2 == null || M61.w(queryParameter2)) {
            c("Connect adhoora reh gaya — dobara try karo");
            return;
        }
        List<String> pathSegments = data.getPathSegments();
        String str2 = pathSegments != null ? (String) AbstractC4082nv.N(pathSegments) : null;
        String str3 = str2 == null ? "" : str2;
        C0852Ng0 c0852Ng0 = new C0852Ng0();
        String queryParameter4 = data.getQueryParameter("picked_file_ids");
        if (queryParameter4 != null) {
            if (!(!M61.w(queryParameter4))) {
                queryParameter4 = null;
            }
            if (queryParameter4 != null) {
                c0852Ng0.put("picked_file_ids", queryParameter4);
            }
        }
        C0852Ng0 c0852Ng0B = c0852Ng0.b();
        C2753gF c2753gF = AbstractC4323pH.a;
        LE1.g(AbstractC3986nK1.a(AbstractC0341Fg0.a), null, 0, new C3955nA0(this, str3, queryParameter2, str, c0852Ng0B, null), 3);
    }

    public final void c(String str) {
        Toast.makeText(getApplicationContext(), str, 0).show();
    }

    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        a(getIntent());
    }

    @Override // android.app.Activity
    public final void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        a(intent);
    }
}
