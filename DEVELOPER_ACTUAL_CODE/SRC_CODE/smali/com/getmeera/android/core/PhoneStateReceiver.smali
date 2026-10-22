###### Class com.getmeera.android.core.PhoneStateReceiver (com.getmeera.android.core.PhoneStateReceiver)
.class public final Lcom/getmeera/android/core/PhoneStateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/core/PhoneStateReceiver;",
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


# static fields
.field public static volatile a:Lkm;

.field public static volatile b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkm;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lkm;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/getmeera/android/core/PhoneStateReceiver;->a:Lkm;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.PHONE_STATE"

    invoke-static {v0, v1}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    return-void

    :cond_d
    const-string v0, "state"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_16

    return-void

    :cond_16
    const-string v1, "incoming_number"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-object v1, Lcom/getmeera/android/core/PhoneStateReceiver;->a:Lkm;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz p2, :cond_2a

    invoke-static {p2}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v4

    xor-int/2addr v4, v3

    if-eqz v4, :cond_2a

    goto :goto_2b

    :cond_2a
    move-object p2, v2

    :goto_2b
    iget-object v4, v1, Lkm;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_3f

    new-instance v1, Lmm;

    new-instance v4, Lkm;

    invoke-direct {v4, v0, p2}, Lkm;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, p2, v4}, Lmm;-><init>(Ljava/lang/String;Lkm;)V

    goto :goto_63

    :cond_3f
    if-eqz p2, :cond_5d

    iget-object v4, v1, Lkm;->b:Ljava/lang/String;

    if-eqz v4, :cond_4e

    invoke-static {v4}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4c

    goto :goto_4e

    :cond_4c
    move v4, v5

    goto :goto_4f

    :cond_4e
    :goto_4e
    move v4, v3

    :goto_4f
    xor-int/2addr v4, v3

    if-nez v4, :cond_5d

    new-instance v1, Lmm;

    new-instance v4, Lkm;

    invoke-direct {v4, v0, p2}, Lkm;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, p2, v4}, Lmm;-><init>(Ljava/lang/String;Lkm;)V

    goto :goto_63

    :cond_5d
    new-instance p2, Llm;

    invoke-direct {p2, v1}, Llm;-><init>(Lkm;)V

    move-object v1, p2

    :goto_63
    nop

    instance-of p2, v1, Lmm;

    if-eqz p2, :cond_6e

    move-object v4, v1

    check-cast v4, Lmm;

    iget-object v4, v4, Lmm;->b:Lkm;

    goto :goto_77

    :cond_6e
    instance-of v4, v1, Llm;

    if-eqz v4, :cond_c9

    move-object v4, v1

    check-cast v4, Llm;

    iget-object v4, v4, Llm;->a:Lkm;

    :goto_77
    sput-object v4, Lcom/getmeera/android/core/PhoneStateReceiver;->a:Lkm;

    if-eqz p2, :cond_7e

    move-object v2, v1

    check-cast v2, Lmm;

    :cond_7e
    if-nez v2, :cond_81

    return-void

    :cond_81
    iget-object p2, v2, Lmm;->a:Ljava/lang/String;

    sget-object v1, Landroid/telephony/TelephonyManager;->EXTRA_STATE_RINGING:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8e

    sput-boolean v3, Lcom/getmeera/android/core/PhoneStateReceiver;->b:Z

    goto :goto_aa

    :cond_8e
    sget-object v1, Landroid/telephony/TelephonyManager;->EXTRA_STATE_OFFHOOK:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9b

    sget-boolean v1, Lcom/getmeera/android/core/PhoneStateReceiver;->b:Z

    if-nez v1, :cond_aa

    return-void

    :cond_9b
    sget-object v1, Landroid/telephony/TelephonyManager;->EXTRA_STATE_IDLE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c8

    sget-boolean v1, Lcom/getmeera/android/core/PhoneStateReceiver;->b:Z

    if-nez v1, :cond_a8

    return-void

    :cond_a8
    sput-boolean v5, Lcom/getmeera/android/core/PhoneStateReceiver;->b:Z

    :cond_aa
    :goto_aa
    :try_start_aa
    sget-object v1, Lcom/getmeera/android/core/MeeraForegroundService;->j4:Lgz1;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/getmeera/android/core/MeeraForegroundService;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "com.getmeera.android.INCOMING_CALL"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "extra_call_state"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra_call_number"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    invoke-static {p1, p2}, Lgz1;->W(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_c8
    .catch Ljava/lang/Exception; {:try_start_aa .. :try_end_c8} :catch_c8

    :catch_c8
    :cond_c8
    return-void

    :cond_c9
    new-instance p1, Lmw;

    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    throw p1
.end method
