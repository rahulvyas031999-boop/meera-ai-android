###### Class com.getmeera.android.core.MicCaptureReceiver (com.getmeera.android.core.MicCaptureReceiver)
.class public final Lcom/getmeera/android/core/MicCaptureReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/core/MicCaptureReceiver;",
        "Landroid/content/BroadcastReceiver;",
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


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9

    const-string v0, "wakedumps"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.getmeera.android.CAPTURE_MIC"

    invoke-static {v1, v2}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    return-void

    :cond_f
    const-string v1, "dumps"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "seconds"

    if-eqz v3, :cond_4b

    const/4 v3, 0x0

    invoke-virtual {p2, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, LOS;->g:Z

    :try_start_20
    invoke-virtual {p1, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    if-nez v3, :cond_2f

    new-instance v3, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v3, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :cond_2f
    new-instance v0, Ljava/io/File;

    const-string v5, ".enabled"

    invoke-direct {v0, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    if-eqz v1, :cond_41

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    const-string v1, "1"

    invoke-static {v0, v1}, LsR;->o(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_44

    :cond_41
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_44
    .catchall {:try_start_20 .. :try_end_44} :catchall_44

    :catchall_44
    :goto_44
    invoke-virtual {p2, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4b

    return-void

    :cond_4b
    const/16 v0, 0x258

    invoke-virtual {p2, v4, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    :try_start_51
    sget-object v0, Lcom/getmeera/android/core/MeeraForegroundService;->j4:Lgz1;

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/getmeera/android/core/MeeraForegroundService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v4, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p2

    invoke-static {p1, p2}, Lgz1;->W(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_65} :catch_65

    :catch_65
    return-void
.end method
