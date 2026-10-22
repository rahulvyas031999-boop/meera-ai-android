###### Class com.getmeera.android.ui.UnlockActivity (com.getmeera.android.ui.UnlockActivity)
.class public final Lcom/getmeera/android/ui/UnlockActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/getmeera/android/ui/UnlockActivity;",
        "Landroid/app/Activity;",
        "<init>",
        "()V",
        "xK0",
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
.field public static final O:LxK0;

.field public static volatile P:Lgw;

.field public static final Q:LAx0;

.field public static volatile R:Z


# instance fields
.field public N:Lgw;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, LxK0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, LxK0;-><init>(I)V

    sput-object v0, Lcom/getmeera/android/ui/UnlockActivity;->O:LxK0;

    invoke-static {}, LYu1;->a()LAx0;

    move-result-object v0

    sput-object v0, Lcom/getmeera/android/ui/UnlockActivity;->Q:LAx0;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 7

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_a
    const-string v3, "keyguard"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Landroid/app/KeyguardManager;

    if-eqz v4, :cond_17

    check-cast v3, Landroid/app/KeyguardManager;

    goto :goto_18

    :cond_17
    move-object v3, v0

    :goto_18
    if-eqz v3, :cond_22

    invoke-virtual {v3}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v3
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_1e} :catch_22

    if-ne v3, v1, :cond_22

    move v3, v1

    goto :goto_23

    :catch_22
    :cond_22
    move v3, v2

    :goto_23
    xor-int/2addr v1, v3

    sget-object v3, LO4;->a:Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "UNLOCK result="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LO4;->c(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/getmeera/android/ui/UnlockActivity;->N:Lgw;

    if-eqz p1, :cond_51

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    check-cast p1, Lhw;

    invoke-virtual {p1, v1}, Lh70;->g0(Ljava/lang/Object;)Z

    :cond_51
    sget-object p1, Lcom/getmeera/android/ui/UnlockActivity;->P:Lgw;

    iget-object v1, p0, Lcom/getmeera/android/ui/UnlockActivity;->N:Lgw;

    if-ne p1, v1, :cond_59

    sput-object v0, Lcom/getmeera/android/ui/UnlockActivity;->P:Lgw;

    :cond_59
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    invoke-virtual {p0, v2, v2}, Landroid/app/Activity;->overridePendingTransition(II)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    sget-object p1, Lcom/getmeera/android/ui/UnlockActivity;->P:Lgw;

    iput-object p1, p0, Lcom/getmeera/android/ui/UnlockActivity;->N:Lgw;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1b

    if-lt p1, v0, :cond_13

    invoke-static {p0}, LWJ;->c(Lcom/getmeera/android/ui/UnlockActivity;)V

    invoke-static {p0}, LWJ;->d(Lcom/getmeera/android/ui/UnlockActivity;)V

    :cond_13
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const v0, 0x280080

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    :try_start_1d
    const-string p1, "power"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    invoke-virtual {p1}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v0

    if-eqz v0, :cond_2c

    goto :goto_3d

    :cond_2c
    const-string v0, "meera:unlock"

    const v1, 0x3000001a

    invoke-virtual {p1, v1, v0}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    const-wide/16 v0, 0x2710

    invoke-virtual {p1, v0, v1}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    invoke-virtual {p1}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_3d
    .catchall {:try_start_1d .. :try_end_3d} :catchall_3d

    :catchall_3d
    :goto_3d
    const-string p1, "keyguard"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Landroid/app/KeyguardManager;

    if-eqz v0, :cond_4a

    check-cast p1, Landroid/app/KeyguardManager;

    goto :goto_4b

    :cond_4a
    const/4 p1, 0x0

    :goto_4b
    if-eqz p1, :cond_99

    invoke-virtual {p1}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v0

    if-nez v0, :cond_54

    goto :goto_99

    :cond_54
    sget-boolean v0, Lcom/getmeera/android/ui/UnlockActivity;->R:Z

    sget-object v1, LO4;->a:Ljava/io/File;

    invoke-virtual {p1}, Landroid/app/KeyguardManager;->isDeviceSecure()Z

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "UNLOCK requested (secure="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", standAside="

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, LO4;->c(Ljava/lang/String;)V

    new-instance v1, Loh1;

    invoke-direct {v1, p0}, Loh1;-><init>(Lcom/getmeera/android/ui/UnlockActivity;)V

    invoke-virtual {p1, p0, v1}, Landroid/app/KeyguardManager;->requestDismissKeyguard(Landroid/app/Activity;Landroid/app/KeyguardManager$KeyguardDismissCallback;)V

    if-eqz v0, :cond_98

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    new-instance v0, LCI0;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, LCI0;-><init>(Ljava/lang/Object;I)V

    const-wide/16 v1, 0x258

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_98
    return-void

    :cond_99
    :goto_99
    const-string p1, "already unlocked"

    invoke-virtual {p0, p1}, Lcom/getmeera/android/ui/UnlockActivity;->a(Ljava/lang/String;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_3
    const-string v3, "keyguard"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Landroid/app/KeyguardManager;

    if-eqz v4, :cond_10

    check-cast v3, Landroid/app/KeyguardManager;

    goto :goto_11

    :cond_10
    move-object v3, v0

    :goto_11
    if-eqz v3, :cond_1a

    invoke-virtual {v3}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v3
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_17} :catch_1a

    if-ne v3, v1, :cond_1a

    move v2, v1

    :catch_1a
    :cond_1a
    xor-int/2addr v1, v2

    iget-object v2, p0, Lcom/getmeera/android/ui/UnlockActivity;->N:Lgw;

    if-eqz v2, :cond_28

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    check-cast v2, Lhw;

    invoke-virtual {v2, v1}, Lh70;->g0(Ljava/lang/Object;)Z

    :cond_28
    sget-object v1, Lcom/getmeera/android/ui/UnlockActivity;->P:Lgw;

    iget-object v2, p0, Lcom/getmeera/android/ui/UnlockActivity;->N:Lgw;

    if-ne v1, v2, :cond_30

    sput-object v0, Lcom/getmeera/android/ui/UnlockActivity;->P:Lgw;

    :cond_30
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method
