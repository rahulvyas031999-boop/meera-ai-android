###### Class com.getmeera.android.wallpaper.MeeraWallpaperService (com.getmeera.android.wallpaper.MeeraWallpaperService)
.class public final Lcom/getmeera/android/wallpaper/MeeraWallpaperService;
.super Landroid/service/wallpaper/WallpaperService;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/getmeera/android/wallpaper/MeeraWallpaperService;",
        "Landroid/service/wallpaper/WallpaperService;",
        "<init>",
        "()V",
        "ys0",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/service/wallpaper/WallpaperService;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCreate()V
    .registers 2

    invoke-super {p0}, Landroid/service/wallpaper/WallpaperService;->onCreate()V

    sget-object v0, LO4;->a:Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, LO4;->b(Landroid/content/Context;)V

    return-void
.end method

.method public final onCreateEngine()Landroid/service/wallpaper/WallpaperService$Engine;
    .registers 2

    new-instance v0, Lys0;

    invoke-direct {v0, p0}, Lys0;-><init>(Lcom/getmeera/android/wallpaper/MeeraWallpaperService;)V

    return-object v0
.end method
