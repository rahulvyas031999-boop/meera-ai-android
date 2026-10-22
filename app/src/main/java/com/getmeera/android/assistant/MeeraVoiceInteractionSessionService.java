package com.getmeera.android.assistant;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.service.voice.VoiceInteractionSession;
import android.service.voice.VoiceInteractionSessionService;
import com.getmeera.android.core.MeeraForegroundService;

public final class MeeraVoiceInteractionSessionService extends VoiceInteractionSessionService {
    @Override
    public VoiceInteractionSession onNewSession(Bundle args) {
        return new MeeraSession(this);
    }

    private static final class MeeraSession extends VoiceInteractionSession {
        MeeraSession(Context context) {
            super(context);
        }

        @Override
        public void onShow(Bundle args, int showFlags) {
            super.onShow(args, showFlags);
            Context ctx = getContext();
            Intent i = new Intent(ctx, MeeraForegroundService.class).setAction("com.getmeera.android.ASSIST_WAKE");
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) ctx.startForegroundService(i);
            else ctx.startService(i);
            hide();
        }
    }
}
