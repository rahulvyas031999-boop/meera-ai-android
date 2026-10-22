###### Class com.getmeera.android.core.BootReceiver (com.getmeera.android.core.BootReceiver)
.class public final Lcom/getmeera/android/core/BootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/core/BootReceiver;",
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
    .registers 5

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_50

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x6a8ae6a1

    if-eq v0, v1, :cond_2c

    const v1, 0x2f94f923

    if-eq v0, v1, :cond_23

    const v1, 0x6789a577    # 1.300033E24f

    if-eq v0, v1, :cond_1a

    goto :goto_50

    :cond_1a
    const-string v0, "android.intent.action.MY_PACKAGE_REPLACED"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_50

    goto :goto_35

    :cond_23
    const-string v0, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_35

    goto :goto_50

    :cond_2c
    const-string v0, "android.intent.action.QUICKBOOT_POWERON"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_35

    goto :goto_50

    :cond_35
    :goto_35
    :try_start_35
    invoke-static {p1}, LBu1;->c(Landroid/content/Context;)V
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_38} :catch_38

    :catch_38
    :try_start_38
    invoke-static {p1}, Lbj0;->a(Landroid/content/Context;)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_3b} :catch_3b

    :catch_3b
    :try_start_3b
    invoke-static {p1}, LOK1;->c(Landroid/content/Context;)V
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3e} :catch_3e

    :catch_3e
    :try_start_3e
    sget-object p2, Lcom/getmeera/android/core/MeeraForegroundService;->j4:Lgz1;

    new-instance p2, Landroid/content/Intent;

    const-class v0, Lcom/getmeera/android/core/MeeraForegroundService;

    invoke-direct {p2, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "com.getmeera.android.BOOT_STANDBY"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    invoke-static {p1, p2}, Lgz1;->W(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_50} :catch_50

    :catch_50
    :cond_50
    :goto_50
    return-void
.end method
