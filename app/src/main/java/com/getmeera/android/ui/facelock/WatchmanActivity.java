package com.getmeera.android.ui.facelock;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.TextView;

public final class WatchmanActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER);
        root.setBackgroundColor(Color.parseColor("#06070E"));
        TextView tv = new TextView(this);
        tv.setText("👁️ Meera AI 24/7 Watchman Mode Active");
        tv.setTextColor(Color.parseColor("#4ADE80"));
        tv.setTextSize(18f);
        root.addView(tv);
        setContentView(root);
    }
}
