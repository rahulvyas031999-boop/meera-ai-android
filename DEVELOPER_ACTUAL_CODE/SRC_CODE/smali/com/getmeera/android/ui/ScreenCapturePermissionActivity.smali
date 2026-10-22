###### Class com.getmeera.android.ui.ScreenCapturePermissionActivity (com.getmeera.android.ui.ScreenCapturePermissionActivity)
.class public final Lcom/getmeera/android/ui/ScreenCapturePermissionActivity;
.super Lxw;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/ui/ScreenCapturePermissionActivity;",
        "Lxw;",
        "<init>",
        "()V",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
.end annotation


# static fields
.field public static final synthetic i0:I


# instance fields
.field public final h0:Lb2;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lxw;-><init>()V

    new-instance v0, LW1;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, LW1;-><init>(I)V

    new-instance v1, Lc2;

    const/16 v2, 0x14

    invoke-direct {v1, p0, v2}, Lc2;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0, v0, v1}, Lxw;->k(LW1;Lc2;)Lb2;

    move-result-object v0

    iput-object v0, p0, Lcom/getmeera/android/ui/ScreenCapturePermissionActivity;->h0:Lb2;

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1}, Lxw;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "media_projection"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/projection/MediaProjectionManager;

    invoke-virtual {p1}, Landroid/media/projection/MediaProjectionManager;->createScreenCaptureIntent()Landroid/content/Intent;

    move-result-object p1

    iget-object v0, p0, Lcom/getmeera/android/ui/ScreenCapturePermissionActivity;->h0:Lb2;

    invoke-virtual {v0, p1}, Lb2;->c(Ljava/lang/Object;)V

    return-void
.end method
