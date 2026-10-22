###### Class com.getmeera.android.data.wiki.WikiWorker (com.getmeera.android.data.wiki.WikiWorker)
.class public final Lcom/getmeera/android/data/wiki/WikiWorker;
.super Landroidx/work/CoroutineWorker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/getmeera/android/data/wiki/WikiWorker;",
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
    .registers 7

    instance-of v0, p1, Lpp1;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lpp1;

    iget v1, v0, Lpp1;->S:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lpp1;->S:I

    goto :goto_18

    :cond_13
    new-instance v0, Lpp1;

    invoke-direct {v0, p0, p1}, Lpp1;-><init>(Lcom/getmeera/android/data/wiki/WikiWorker;LkC;)V

    :goto_18
    iget-object p1, v0, Lpp1;->Q:Ljava/lang/Object;

    sget-object v1, LaD;->N:LaD;

    iget v2, v0, Lpp1;->S:I

    const/4 v3, 0x1

    if-eqz v2, :cond_31

    if-ne v2, v3, :cond_29

    :try_start_23
    invoke-static {p1}, LYK1;->b(Ljava/lang/Object;)V
    :try_end_26
    .catchall {:try_start_23 .. :try_end_26} :catchall_27

    goto :goto_44

    :catchall_27
    move-exception p1

    goto :goto_47

    :cond_29
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_31
    invoke-static {p1}, LYK1;->b(Ljava/lang/Object;)V

    :try_start_34
    new-instance p1, Lhp1;

    iget-object v2, p0, LQe0;->N:Landroid/content/Context;

    invoke-direct {p1, v2}, Lhp1;-><init>(Landroid/content/Context;)V

    iput v3, v0, Lpp1;->S:I

    invoke-virtual {p1, v0}, Lhp1;->c(LkC;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_44

    return-object v1

    :cond_44
    :goto_44
    check-cast p1, Lep1;
    :try_end_46
    .catchall {:try_start_34 .. :try_end_46} :catchall_27

    goto :goto_4d

    :goto_47
    new-instance v0, LJO0;

    invoke-direct {v0, p1}, LJO0;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v0

    :goto_4d
    nop

    instance-of v0, p1, LJO0;

    xor-int/2addr v0, v3

    if-eqz v0, :cond_8d

    move-object v0, p1

    check-cast v0, Lep1;

    sget-object v1, LO4;->a:Ljava/io/File;

    iget v1, v0, Lep1;->a:I

    iget-object v2, v0, Lep1;->d:Ljava/lang/String;

    if-eqz v2, :cond_67

    const-string v3, " ("

    const-string v4, ")"

    invoke-static {v3, v2, v4}, Lad0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_68

    :cond_67
    const/4 v2, 0x0

    :goto_68
    if-nez v2, :cond_6c

    const-string v2, ""

    :cond_6c
    const-string v3, "WIKI worker \u2014 attempted="

    const-string v4, " written="

    invoke-static {v3, v1, v4}, Lad0;->j(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, v0, Lep1;->b:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " consumed="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v0, Lep1;->c:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LO4;->c(Ljava/lang/String;)V

    :cond_8d
    invoke-static {p1}, LKO0;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_9e

    sget-object v0, LO4;->a:Ljava/io/File;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "WIKI worker failed: "

    invoke-static {v0, p1}, LaG0;->k(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9e
    invoke-static {}, LPe0;->a()LOe0;

    move-result-object p1

    return-object p1
.end method
