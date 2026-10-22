package com.getmeera.android.assistant;

import android.content.Intent;
import android.os.Build;
import android.service.voice.VoiceInteractionService;
import com.getmeera.android.core.MeeraForegroundService;

public final class MeeraVoiceInteractionService extends VoiceInteractionService {
    @Override
    public void onReady() {
        super.onReady();
        Intent i = new Intent(this, MeeraForegroundService.class).setAction("com.getmeera.android.USER_START");
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) startForegroundService(i);
        else startService(i);
    }
}
