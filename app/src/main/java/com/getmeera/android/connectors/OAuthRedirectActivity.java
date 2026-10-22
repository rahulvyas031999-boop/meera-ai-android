package com.getmeera.android.connectors;

import android.app.Activity;
import android.os.Bundle;

public final class OAuthRedirectActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        finish();
    }
}
