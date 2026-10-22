package com.getmeera.android.assistant;

import android.content.Intent;
import android.os.Build;
import android.speech.RecognitionService;
import com.getmeera.android.core.MeeraForegroundService;

public final class MeeraRecognitionService extends RecognitionService {
    @Override
    protected void onStartListening(Intent recognizerIntent, Callback listener) {
        Intent i = new Intent(this, MeeraForegroundService.class).setAction("com.getmeera.android.ASSIST_WAKE");
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) startForegroundService(i);
        else startService(i);
    }

    @Override
    protected void onCancel(Callback listener) {}

    @Override
    protected void onStopListening(Callback listener) {}
}
