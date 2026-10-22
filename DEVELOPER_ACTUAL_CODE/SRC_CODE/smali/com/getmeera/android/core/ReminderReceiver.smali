###### Class com.getmeera.android.core.ReminderReceiver (com.getmeera.android.core.ReminderReceiver)
.class public final Lcom/getmeera/android/core/ReminderReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/core/ReminderReceiver;",
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
    .registers 12

    const/4 v0, 0x0

    const-string v1, "reminder_text"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_9b

    invoke-static {v1}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x1

    xor-int/2addr v2, v3

    const/4 v4, 0x0

    if-eqz v2, :cond_13

    goto :goto_14

    :cond_13
    move-object v1, v4

    :goto_14
    if-nez v1, :cond_18

    goto/16 :goto_9b

    :cond_18
    const-string v2, "reminder_id"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {p2, v2, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v5

    :try_start_22
    invoke-static {v5, v6, p1}, LOK1;->b(JLandroid/content/Context;)Z

    move-result v3
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_26} :catch_26

    :catch_26
    if-nez v3, :cond_29

    return-void

    :cond_29
    const-string p2, "notification"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/app/NotificationManager;

    new-instance v2, Landroid/app/NotificationChannel;

    const-string v3, "meera_reminders"

    const-string v7, "Meera reminders"

    const/4 v8, 0x4

    invoke-direct {v2, v3, v7, v8}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {p2, v2}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    new-instance v2, Landroid/content/Intent;

    const-class v7, Lcom/getmeera/android/MainActivity;

    invoke-direct {v2, p1, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v7, 0x4000000

    invoke-static {p1, v0, v2, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    new-instance v7, LKz0;

    invoke-direct {v7, p1, v3}, LKz0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iget-object p1, v7, LKz0;->p:Landroid/app/Notification;

    const v3, 0x108005e

    iput v3, p1, Landroid/app/Notification;->icon:I

    const-string p1, "Meera ka reminder \ud83d\udc95"

    invoke-static {p1}, LKz0;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, v7, LKz0;->e:Ljava/lang/CharSequence;

    invoke-static {v1}, LKz0;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, v7, LKz0;->f:Ljava/lang/CharSequence;

    new-instance p1, LEq1;

    const/16 v3, 0x9

    invoke-direct {p1, v3, v0}, LEq1;-><init>(IZ)V

    invoke-static {v1}, LKz0;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, p1, LEq1;->P:Ljava/lang/Object;

    invoke-virtual {v7, p1}, LKz0;->e(LEq1;)V

    const/16 p1, 0x10

    invoke-virtual {v7, p1}, LKz0;->d(I)V

    iput-object v2, v7, LKz0;->g:Landroid/app/PendingIntent;

    invoke-virtual {v7}, LKz0;->b()Landroid/app/Notification;

    move-result-object p1

    const v2, 0x7fffffff

    int-to-long v2, v2

    rem-long/2addr v5, v2

    long-to-int v2, v5

    invoke-virtual {p2, v2, p1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :try_start_89
    sget-object p1, Lcom/getmeera/android/core/MeeraForegroundService;->j4:Lgz1;

    sget-object p1, Lcom/getmeera/android/core/MeeraForegroundService;->E4:Lcom/getmeera/android/core/MeeraForegroundService;

    if-nez p1, :cond_90

    goto :goto_9b

    :cond_90
    iget-object p2, p1, Lcom/getmeera/android/core/MeeraForegroundService;->N:LiC;

    new-instance v2, Lvl0;

    invoke-direct {v2, v4, p1, v1}, Lvl0;-><init>(LkC;Lcom/getmeera/android/core/MeeraForegroundService;Ljava/lang/String;)V

    const/4 p1, 0x3

    invoke-static {p2, v4, v0, v2, p1}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;
    :try_end_9b
    .catchall {:try_start_89 .. :try_end_9b} :catchall_9b

    :catchall_9b
    :cond_9b
    :goto_9b
    return-void
.end method
