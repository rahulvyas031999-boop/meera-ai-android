package com.getmeera.android.wallpaper;

import android.service.wallpaper.WallpaperService;
import defpackage.C5987ys0;
import defpackage.O4;
import java.io.File;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/getmeera/android/wallpaper/MeeraWallpaperService;", "Landroid/service/wallpaper/WallpaperService;", "<init>", "()V", "ys0", "app_release"}, k = 1, mv = {1, 9, 0})
public final class MeeraWallpaperService extends WallpaperService {
    @Override // android.service.wallpaper.WallpaperService, android.app.Service
    public final void onCreate() {
        super.onCreate();
        File file = O4.a;
        O4.b(getApplicationContext());
    }

    @Override // android.service.wallpaper.WallpaperService
    public final WallpaperService.Engine onCreateEngine() {
        return new C5987ys0(this);
    }
}
