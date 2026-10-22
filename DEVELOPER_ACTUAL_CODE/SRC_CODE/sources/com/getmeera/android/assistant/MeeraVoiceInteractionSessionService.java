package com.getmeera.android.assistant;

import android.os.Bundle;
import android.service.voice.VoiceInteractionSession;
import android.service.voice.VoiceInteractionSessionService;
import defpackage.C3032hs0;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/getmeera/android/assistant/MeeraVoiceInteractionSessionService;", "Landroid/service/voice/VoiceInteractionSessionService;", "<init>", "()V", "app_release"}, k = 1, mv = {1, 9, 0})
public final class MeeraVoiceInteractionSessionService extends VoiceInteractionSessionService {
    @Override // android.service.voice.VoiceInteractionSessionService
    public final VoiceInteractionSession onNewSession(Bundle bundle) {
        return new C3032hs0(this);
    }
}
