###### Class com.getmeera.android.MainActivity (com.getmeera.android.MainActivity)
.class public final Lcom/getmeera/android/MainActivity;
.super Lxw;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/MainActivity;",
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
.field public static volatile j0:Z

.field public static final k0:LO51;

.field public static final l0:LO51;


# instance fields
.field public h0:LAd0;

.field public final i0:Lb2;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    invoke-static {v0}, LLz1;->a(Ljava/lang/Object;)LO51;

    move-result-object v0

    sput-object v0, Lcom/getmeera/android/MainActivity;->k0:LO51;

    sput-object v0, Lcom/getmeera/android/MainActivity;->l0:LO51;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lxw;-><init>()V

    new-instance v0, LW1;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, LW1;-><init>(I)V

    new-instance v1, Lc2;

    const/16 v2, 0xe

    invoke-direct {v1, p0, v2}, Lc2;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0, v0, v1}, Lxw;->k(LW1;Lc2;)Lb2;

    move-result-object v0

    iput-object v0, p0, Lcom/getmeera/android/MainActivity;->i0:Lb2;

    return-void
.end method


# virtual methods
.method public final l(Landroid/content/Intent;)V
    .registers 11

    if-nez p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.SEND"

    invoke-static {v0, v1}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_18

    const-string v2, "android.intent.action.SEND_MULTIPLE"

    invoke-static {v0, v2}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_18

    return-void

    :cond_18
    invoke-static {v0, v1}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "android.intent.extra.STREAM"

    if-eqz v0, :cond_2b

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    invoke-static {v0}, Lov;->h(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :cond_29
    :goto_29
    move-object v7, v0

    goto :goto_3c

    :cond_2b
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_36

    invoke-static {v0}, Lnv;->C(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_37

    :cond_36
    move-object v0, v1

    :goto_37
    if-nez v0, :cond_29

    sget-object v0, LnL;->N:LnL;

    goto :goto_29

    :goto_3c
    const-string v0, "android.intent.extra.TEXT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4d

    invoke-static {v0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4e

    :cond_4d
    move-object v0, v1

    :goto_4e
    if-nez v0, :cond_52

    const-string v0, ""

    :cond_52
    move-object v5, v0

    const-string v0, "android.intent.action.MAIN"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_62

    return-void

    :cond_62
    :try_start_62
    invoke-virtual {p0}, Landroid/app/Activity;->getReferrer()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_6f

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p1
    :try_end_6c
    .catchall {:try_start_62 .. :try_end_6c} :catchall_6d

    goto :goto_77

    :catchall_6d
    move-exception p1

    goto :goto_71

    :cond_6f
    move-object p1, v1

    goto :goto_77

    :goto_71
    new-instance v0, LJO0;

    invoke-direct {v0, p1}, LJO0;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v0

    :goto_77
    nop

    instance-of v0, p1, LJO0;

    if-eqz v0, :cond_7d

    move-object p1, v1

    :cond_7d
    move-object v6, p1

    check-cast v6, Ljava/lang/String;

    sget-object p1, Lcom/getmeera/android/MainActivity;->k0:LO51;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "chat"

    invoke-virtual {p1, v1, v0}, LO51;->j(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-static {p0}, Lbs1;->j(LRd0;)LLd0;

    move-result-object p1

    new-instance v0, LAg0;

    const/4 v8, 0x0

    move-object v3, v0

    move-object v4, p0

    invoke-direct/range {v3 .. v8}, LAg0;-><init>(Lcom/getmeera/android/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;LkC;)V

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-static {p1, v1, v3, v0, v2}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    return-void
.end method

.method public final m()V
    .registers 3

    sget-object v0, Lcom/getmeera/android/core/MeeraForegroundService;->j4:Lgz1;

    sget-object v0, LC40;->a:LWs0;

    invoke-static {}, LC40;->a()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x0

    goto :goto_1c

    :cond_c
    sget-object v0, LLX0;->f:LbW0;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, LbW0;->d(Landroid/content/Context;)LLX0;

    move-result-object v0

    invoke-virtual {v0}, LLX0;->p()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_1c
    if-eqz v0, :cond_22

    invoke-static {p0}, Lgz1;->N(Landroid/content/Context;)V

    return-void

    :cond_22
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/getmeera/android/core/MeeraForegroundService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "com.getmeera.android.USER_START"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {p0, v0}, Lgz1;->W(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public final n()V
    .registers 4

    const-string v0, "android.permission.RECORD_AUDIO"

    invoke-static {p0, v0}, LVJ1;->c(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_c

    invoke-virtual {p0}, Lcom/getmeera/android/MainActivity;->m()V

    goto :goto_2b

    :cond_c
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lov;->i([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_1f

    const-string v1, "android.permission.POST_NOTIFICATIONS"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1f
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/getmeera/android/MainActivity;->i0:Lb2;

    invoke-virtual {v1, v0}, Lb2;->c(Ljava/lang/Object;)V

    :goto_2b
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 13

    const/4 v0, 0x2

    const/4 v1, 0x1

    invoke-super {p0, p1}, Lxw;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v2, 0x0

    invoke-static {p1, v2}, LrE1;->c(Landroid/view/Window;Z)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    new-instance v4, Lsa0;

    invoke-direct {v4, v3}, Lsa0;-><init>(Landroid/view/View;)V

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1e

    if-lt v3, v5, :cond_2a

    new-instance v3, LTp1;

    invoke-direct {v3, p1, v4}, LTp1;-><init>(Landroid/view/Window;Lsa0;)V

    goto :goto_2f

    :cond_2a
    new-instance v3, LRp1;

    invoke-direct {v3, p1, v4}, LRp1;-><init>(Landroid/view/Window;Lsa0;)V

    :goto_2f
    invoke-virtual {v3}, LtE1;->g()V

    invoke-virtual {v3}, LtE1;->j()V

    sget-object p1, LLX0;->f:LbW0;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p1, v3}, LbW0;->d(Landroid/content/Context;)LLX0;

    move-result-object p1

    sget-object v3, LAd0;->n:Lnw0;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnw0;->s(Landroid/content/Context;)LAd0;

    move-result-object v3

    iput-object v3, p0, Lcom/getmeera/android/MainActivity;->h0:LAd0;

    sget-object v3, LQ50;->a:[I

    invoke-static {p0}, LQ50;->e(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_58

    goto :goto_bd

    :cond_58
    sget-object v4, LQ50;->b:La91;

    invoke-virtual {v4}, La91;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    div-int/2addr v5, v0

    new-array v6, v5, [B

    move v7, v2

    :goto_68
    if-ge v7, v5, :cond_87

    mul-int/lit8 v8, v7, 0x2

    invoke-virtual {v4, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x10

    invoke-static {v9, v10}, Ljava/lang/Character;->digit(CI)I

    move-result v9

    shl-int/lit8 v9, v9, 0x4

    add-int/2addr v8, v1

    invoke-virtual {v4, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8, v10}, Ljava/lang/Character;->digit(CI)I

    move-result v8

    add-int/2addr v8, v9

    int-to-byte v8, v8

    aput-byte v8, v6, v7

    add-int/2addr v7, v1

    goto :goto_68

    :cond_87
    invoke-static {v6}, LQ50;->c([B)[B

    move-result-object v4

    invoke-static {v4}, LQ50;->f([B)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_96

    goto :goto_bb

    :cond_96
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_9a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_bb

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    sget-object v6, LQ50;->a:[I

    invoke-static {v5}, LQ50;->c([B)[B

    move-result-object v5

    invoke-static {v5}, LQ50;->c([B)[B

    move-result-object v5

    invoke-static {v5}, LQ50;->f([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9a

    goto :goto_bd

    :cond_bb
    :goto_bb
    sput-boolean v1, LQ50;->c:Z

    :goto_bd
    invoke-static {p0}, Lbs1;->j(LRd0;)LLd0;

    move-result-object v3

    sget-object v4, LpH;->b:LaF;

    new-instance v5, LBg0;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, LBg0;-><init>(Lcom/getmeera/android/MainActivity;LkC;)V

    invoke-static {v3, v4, v2, v5, v0}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_e6

    const-string v3, "open_route"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_db

    goto :goto_e6

    :cond_db
    sget-object v5, Lcom/getmeera/android/MainActivity;->k0:LO51;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5, v6, v4}, LO51;->j(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {v0, v3}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :cond_e6
    :goto_e6
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/getmeera/android/MainActivity;->l(Landroid/content/Intent;)V

    invoke-static {p0}, Lbs1;->j(LRd0;)LLd0;

    move-result-object v0

    new-instance v3, LCg0;

    invoke-direct {v3, p0, v6}, LCg0;-><init>(Lcom/getmeera/android/MainActivity;LkC;)V

    const/4 v4, 0x3

    invoke-static {v0, v6, v2, v3, v4}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    new-instance v0, Le5;

    const/16 v2, 0xf

    invoke-direct {v0, v2, p1, p0}, Le5;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    new-instance p1, LFw;

    const v2, -0x772226e

    invoke-direct {p1, v2, v0, v1}, LFw;-><init>(ILjava/lang/Object;Z)V

    invoke-static {p0, p1}, Lyw;->a(Lxw;LFw;)V

    return-void
.end method

.method public final onNewIntent(Landroid/content/Intent;)V
    .registers 6

    invoke-super {p0, p1}, Lxw;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    const-string v0, "open_route"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_f

    goto :goto_1b

    :cond_f
    sget-object v2, Lcom/getmeera/android/MainActivity;->k0:LO51;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v1}, LO51;->j(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :goto_1b
    invoke-virtual {p0, p1}, Lcom/getmeera/android/MainActivity;->l(Landroid/content/Intent;)V

    return-void
.end method

.method public final onPause()V
    .registers 2

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    const/4 v0, 0x0

    sput-boolean v0, Lcom/getmeera/android/MainActivity;->j0:Z

    return-void
.end method

.method public final onResume()V
    .registers 6

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/getmeera/android/MainActivity;->j0:Z

    iget-object v0, p0, Lcom/getmeera/android/MainActivity;->h0:LAd0;

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    invoke-static {p0}, Lbs1;->j(LRd0;)LLd0;

    move-result-object v0

    new-instance v2, LDg0;

    invoke-direct {v2, p0, v1}, LDg0;-><init>(Lcom/getmeera/android/MainActivity;LkC;)V

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-static {v0, v1, v4, v2, v3}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    :cond_19
    iget-object v0, p0, Lcom/getmeera/android/MainActivity;->h0:LAd0;

    if-nez v0, :cond_1e

    goto :goto_1f

    :cond_1e
    move-object v1, v0

    :goto_1f
    iget-object v0, v1, LAd0;->g:LO51;

    invoke-virtual {v0}, LO51;->getValue()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, LBd0;->P:LBd0;

    if-ne v0, v1, :cond_36

    const-string v0, "android.permission.RECORD_AUDIO"

    invoke-static {p0, v0}, LVJ1;->c(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_36

    sget-object v0, Lcom/getmeera/android/core/MeeraForegroundService;->j4:Lgz1;

    invoke-static {p0}, Lgz1;->F(Landroid/content/Context;)V

    :cond_36
    return-void
.end method

.method public final onStart()V
    .registers 4

    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    sget-object v0, LwP;->c:LO51;

    invoke-virtual {v0}, LO51;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, LO51;->j(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method

.method public final onStop()V
    .registers 14

    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    const-class v0, Landroid/os/PowerManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v0

    if-nez v0, :cond_19

    sget-object v0, LwP;->a:LwP;

    invoke-virtual {v0}, LwP;->d()V

    goto :goto_7c

    :cond_19
    sget-object v0, LwP;->a:LwP;

    sget-object v1, LvP;->b:LjK1;

    invoke-virtual {v1, p0}, LjK1;->y(Landroid/content/Context;)LvP;

    move-result-object v1

    invoke-virtual {v1}, LvP;->b()LtP;

    move-result-object v1

    monitor-enter v0

    :try_start_26
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sget-object v4, LsP;->O:LsP;

    sget-object v5, LsP;->P:LsP;

    sget-object v6, LsP;->Q:LsP;

    filled-new-array {v4, v5, v6}, [LsP;

    move-result-object v4

    invoke-static {v4}, Lov;->g([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LsP;

    sget-object v6, LwP;->b:Ljava/util/HashMap;

    iget-object v7, v5, LsP;->N:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    if-nez v6, :cond_55

    goto :goto_3c

    :cond_55
    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    iget-object v5, v5, LsP;->N:Ljava/lang/String;

    sget-object v8, LuP;->a:Ljava/util/Set;

    cmp-long v8, v6, v2

    if-lez v8, :cond_63

    const/4 v8, 0x1

    goto :goto_64

    :cond_63
    const/4 v8, 0x0

    :goto_64
    const-wide/16 v9, 0x0

    if-nez v8, :cond_69

    goto :goto_75

    :cond_69
    iget-wide v11, v1, LtP;->O:J

    cmp-long v8, v11, v9

    if-gtz v8, :cond_70

    goto :goto_75

    :cond_70
    add-long/2addr v11, v2

    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    :goto_75
    invoke-static {v9, v10, v5}, LwP;->e(JLjava/lang/String;)V
    :try_end_78
    .catchall {:try_start_26 .. :try_end_78} :catchall_79

    goto :goto_3c

    :catchall_79
    move-exception v1

    goto :goto_7d

    :cond_7b
    monitor-exit v0

    :goto_7c
    return-void

    :goto_7d
    :try_start_7d
    monitor-exit v0
    :try_end_7e
    .catchall {:try_start_7d .. :try_end_7e} :catchall_79

    throw v1
.end method

.method public final onWindowFocusChanged(Z)V
    .registers 5

    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_2d

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lsa0;

    invoke-direct {v1, v0}, Lsa0;-><init>(Landroid/view/View;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v0, v2, :cond_22

    new-instance v0, LTp1;

    invoke-direct {v0, p1, v1}, LTp1;-><init>(Landroid/view/Window;Lsa0;)V

    goto :goto_27

    :cond_22
    new-instance v0, LRp1;

    invoke-direct {v0, p1, v1}, LRp1;-><init>(Landroid/view/Window;Lsa0;)V

    :goto_27
    invoke-virtual {v0}, LtE1;->g()V

    invoke-virtual {v0}, LtE1;->j()V

    :cond_2d
    return-void
.end method
