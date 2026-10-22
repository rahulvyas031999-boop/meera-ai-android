package com.getmeera.android.ui.facelock;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.TextView;

public final class FaceLockActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER);
        root.setBackgroundColor(Color.parseColor("#06070E"));
        TextView tv = new TextView(this);
        tv.setText("🛡️ Meera AI FaceLock Security Active");
        tv.setTextColor(Color.parseColor("#38BDF8"));
        tv.setTextSize(18f);
        root.addView(tv);
        setContentView(root);
    }
}
