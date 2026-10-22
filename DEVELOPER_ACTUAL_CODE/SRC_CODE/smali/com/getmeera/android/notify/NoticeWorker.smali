###### Class com.getmeera.android.notify.NoticeWorker (com.getmeera.android.notify.NoticeWorker)
.class public final Lcom/getmeera/android/notify/NoticeWorker;
.super Landroidx/work/CoroutineWorker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/getmeera/android/notify/NoticeWorker;",
        "Landroidx/work/CoroutineWorker;",
        "Landroid/content/Context;",
        "context",
        "Landroidx/work/WorkerParameters;",
        "params",
        "<init>",
        "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V",
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
.method public constructor <init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroidx/work/CoroutineWorker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V

    return-void
.end method


# virtual methods
.method public final f(LkC;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, LHz0;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, LHz0;

    iget v1, v0, LHz0;->S:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, LHz0;->S:I

    goto :goto_18

    :cond_13
    new-instance v0, LHz0;

    invoke-direct {v0, p0, p1}, LHz0;-><init>(Lcom/getmeera/android/notify/NoticeWorker;LkC;)V

    :goto_18
    iget-object p1, v0, LHz0;->Q:Ljava/lang/Object;

    sget-object v1, LaD;->N:LaD;

    iget v2, v0, LHz0;->S:I

    const/4 v3, 0x1

    if-eqz v2, :cond_31

    if-ne v2, v3, :cond_29

    :try_start_23
    invoke-static {p1}, LYK1;->b(Ljava/lang/Object;)V
    :try_end_26
    .catchall {:try_start_23 .. :try_end_26} :catchall_27

    goto :goto_45

    :catchall_27
    move-exception p1

    goto :goto_48

    :cond_29
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_31
    invoke-static {p1}, LYK1;->b(Ljava/lang/Object;)V

    :try_start_34
    sget-object p1, LGz0;->k:LXW;

    iget-object v2, p0, LQe0;->N:Landroid/content/Context;

    invoke-virtual {p1, v2}, LXW;->w(Landroid/content/Context;)LGz0;

    move-result-object p1

    iput v3, v0, LHz0;->S:I

    invoke-virtual {p1, v3, v0}, LGz0;->b(ZLkC;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_45

    return-object v1

    :cond_45
    :goto_45
    sget-object p1, Lfh1;->a:Lfh1;
    :try_end_47
    .catchall {:try_start_34 .. :try_end_47} :catchall_27

    goto :goto_4e

    :goto_48
    new-instance v0, LJO0;

    invoke-direct {v0, p1}, LJO0;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v0

    :goto_4e
    invoke-static {p1}, LKO0;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_5a

    new-instance p1, LNe0;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    return-object p1

    :cond_5a
    invoke-static {}, LPe0;->a()LOe0;

    move-result-object p1

    return-object p1
.end method
