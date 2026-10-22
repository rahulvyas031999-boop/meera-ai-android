###### Class com.getmeera.android.termux.TermuxResultReceiver (com.getmeera.android.termux.TermuxResultReceiver)
.class public final Lcom/getmeera/android/termux/TermuxResultReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/termux/TermuxResultReceiver;",
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

    const-string p1, "meera_exec_id"

    const/4 v0, -0x1

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    if-gez p1, :cond_a

    return-void

    :cond_a
    const-string v0, "result"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2

    sget-object v0, Ljb1;->c:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgw;
    :try_end_1d
    .catchall {:try_start_13 .. :try_end_1d} :catchall_30

    monitor-exit v0

    if-nez v1, :cond_2a

    sget-object p2, LO4;->a:Ljava/io/File;

    const-string p2, "TERMUX result for "

    const-string v0, " with nobody waiting"

    invoke-static {p2, p1, v0}, LXm;->q(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_2f

    :cond_2a
    check-cast v1, Lhw;

    invoke-virtual {v1, p2}, Lh70;->g0(Ljava/lang/Object;)Z

    :goto_2f
    return-void

    :catchall_30
    move-exception p1

    monitor-exit v0

    throw p1
.end method
