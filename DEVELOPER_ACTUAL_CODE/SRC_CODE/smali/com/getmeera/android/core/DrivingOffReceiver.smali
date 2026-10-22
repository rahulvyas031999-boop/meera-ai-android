###### Class com.getmeera.android.core.DrivingOffReceiver (com.getmeera.android.core.DrivingOffReceiver)
.class public final Lcom/getmeera/android/core/DrivingOffReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/core/DrivingOffReceiver;",
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
    .registers 4

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    const-string v0, "com.getmeera.android.DRIVING_OFF"

    invoke-static {p2, v0}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_d

    return-void

    :cond_d
    sget-object p2, LqJ;->c:LfM1;

    invoke-virtual {p2, p1}, LfM1;->m(Landroid/content/Context;)LqJ;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, LqJ;->a(Z)V

    :try_start_17
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "notification"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    const/16 p2, 0xa

    invoke-virtual {p1, p2}, Landroid/app/NotificationManager;->cancel(I)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_28} :catch_28

    :catch_28
    return-void
.end method
