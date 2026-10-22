###### Class com.getmeera.android.ui.facelock.FaceLockActivity (com.getmeera.android.ui.facelock.FaceLockActivity)
.class public final Lcom/getmeera/android/ui/facelock/FaceLockActivity;
.super Lxw;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/ui/facelock/FaceLockActivity;",
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
.field public static final synthetic k0:I


# instance fields
.field public final h0:LpE0;

.field public final i0:LpE0;

.field public j0:Z


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lxw;-><init>()V

    sget-object v0, Lnw0;->T:Lnw0;

    const-string v1, ""

    invoke-static {v1, v0}, Lzu1;->g(Ljava/lang/Object;LQ21;)LpE0;

    move-result-object v2

    iput-object v2, p0, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->h0:LpE0;

    invoke-static {v1, v0}, Lzu1;->g(Ljava/lang/Object;LQ21;)LpE0;

    move-result-object v0

    iput-object v0, p0, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->i0:LpE0;

    return-void
.end method

.method public static final l(Lcom/getmeera/android/ui/facelock/FaceLockActivity;)V
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_3
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.HOME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_19

    :catchall_19
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method


# virtual methods
.method public final m()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->h0:LpE0;

    invoke-virtual {v0}, LpE0;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final n(Landroid/content/Intent;)V
    .registers 6

    const/4 v0, 0x0

    if-eqz p1, :cond_a

    const-string v1, "pkg"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_b

    :cond_a
    move-object v1, v0

    :goto_b
    const-string v2, ""

    if-nez v1, :cond_10

    move-object v1, v2

    :cond_10
    iget-object v3, p0, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->h0:LpE0;

    invoke-virtual {v3, v1}, LpE0;->setValue(Ljava/lang/Object;)V

    if-eqz p1, :cond_1d

    const-string v0, "label"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1d
    if-nez v0, :cond_20

    goto :goto_21

    :cond_20
    move-object v2, v0

    :goto_21
    iget-object p1, p0, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->i0:LpE0;

    invoke-virtual {p1, v2}, LpE0;->setValue(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->m()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_33

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_33
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1}, Lxw;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->n(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lxw;->a()LjB0;

    move-result-object p1

    new-instance v0, LYO;

    invoke-direct {v0, p0}, LYO;-><init>(Lcom/getmeera/android/ui/facelock/FaceLockActivity;)V

    invoke-virtual {p1, p0, v0}, LjB0;->a(LRd0;LbB0;)V

    new-instance p1, LaP;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, LaP;-><init>(Lcom/getmeera/android/ui/facelock/FaceLockActivity;I)V

    new-instance v0, LFw;

    const v1, -0x30624580

    const/4 v2, 0x1

    invoke-direct {v0, v1, p1, v2}, LFw;-><init>(ILjava/lang/Object;Z)V

    invoke-static {p0, v0}, Lyw;->a(Lxw;LFw;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-boolean v0, p0, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->j0:Z

    if-nez v0, :cond_b

    sget-object v0, LXb;->a:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, LXb;->b:Ljava/lang/String;

    sput-object v0, LXb;->d:Ljava/lang/String;

    :cond_b
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public final onNewIntent(Landroid/content/Intent;)V
    .registers 2

    invoke-super {p0, p1}, Lxw;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->n(Landroid/content/Intent;)V

    return-void
.end method

.method public final onPause()V
    .registers 3

    sget-object v0, LXb;->a:Ljava/lang/String;

    sget-object v0, LXb;->d:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->m()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    sput-object v0, LXb;->d:Ljava/lang/String;

    :cond_11
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method public final onResume()V
    .registers 2

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    sget-object v0, LXb;->a:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->m()Ljava/lang/String;

    move-result-object v0

    sput-object v0, LXb;->d:Ljava/lang/String;

    return-void
.end method

.method public final onStop()V
    .registers 2

    iget-boolean v0, p0, Lcom/getmeera/android/ui/facelock/FaceLockActivity;->j0:Z

    if-nez v0, :cond_b

    sget-object v0, LXb;->a:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, LXb;->b:Ljava/lang/String;

    sput-object v0, LXb;->d:Ljava/lang/String;

    :cond_b
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method
