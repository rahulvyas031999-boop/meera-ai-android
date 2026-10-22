###### Class com.getmeera.android.telemetry.OpsUploader (com.getmeera.android.telemetry.OpsUploader)
.class public final Lcom/getmeera/android/telemetry/OpsUploader;
.super Landroidx/work/CoroutineWorker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0008B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/getmeera/android/telemetry/OpsUploader;",
        "Landroidx/work/CoroutineWorker;",
        "Landroid/content/Context;",
        "context",
        "Landroidx/work/WorkerParameters;",
        "params",
        "<init>",
        "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V",
        "QG1",
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
.field public static final U:LQG1;

.field public static final V:LWs0;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, LQG1;

    const/16 v1, 0x1b

    invoke-direct {v0, v1}, LQG1;-><init>(I)V

    sput-object v0, Lcom/getmeera/android/telemetry/OpsUploader;->U:LQG1;

    sget-object v0, LWs0;->d:Ljava/util/regex/Pattern;

    const-string v0, "application/json"

    invoke-static {v0}, LXE1;->a(Ljava/lang/String;)LWs0;

    move-result-object v0

    sput-object v0, Lcom/getmeera/android/telemetry/OpsUploader;->V:LWs0;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroidx/work/CoroutineWorker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V

    return-void
.end method


# virtual methods
.method public final f(LkC;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, LwC0;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, LwC0;

    iget v1, v0, LwC0;->S:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, LwC0;->S:I

    goto :goto_18

    :cond_13
    new-instance v0, LwC0;

    invoke-direct {v0, p0, p1}, LwC0;-><init>(Lcom/getmeera/android/telemetry/OpsUploader;LkC;)V

    :goto_18
    iget-object p1, v0, LwC0;->Q:Ljava/lang/Object;

    sget-object v1, LaD;->N:LaD;

    iget v2, v0, LwC0;->S:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2f

    if-ne v2, v3, :cond_27

    invoke-static {p1}, LYK1;->b(Ljava/lang/Object;)V

    goto :goto_43

    :cond_27
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2f
    invoke-static {p1}, LYK1;->b(Ljava/lang/Object;)V

    sget-object p1, LpH;->b:LaF;

    new-instance v2, LxC0;

    const/4 v4, 0x0

    invoke-direct {v2, p0, v4}, LxC0;-><init>(Lcom/getmeera/android/telemetry/OpsUploader;LkC;)V

    iput v3, v0, LwC0;->S:I

    invoke-static {p1, v2, v0}, LLE1;->k(LSC;LHU;LkC;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_43

    return-object v1

    :cond_43
    :goto_43
    return-object p1
.end method
