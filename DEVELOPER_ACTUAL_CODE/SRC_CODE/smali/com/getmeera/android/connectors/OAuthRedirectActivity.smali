###### Class com.getmeera.android.connectors.OAuthRedirectActivity (com.getmeera.android.connectors.OAuthRedirectActivity)
.class public final Lcom/getmeera/android/connectors/OAuthRedirectActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/connectors/OAuthRedirectActivity;",
        "Landroid/app/Activity;",
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
.field public static final synthetic N:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Intent;)V
    .registers 4

    const-string v0, "CONNECTOR oauth redirect unreadable: "

    :try_start_2
    invoke-virtual {p0, p1}, Lcom/getmeera/android/connectors/OAuthRedirectActivity;->b(Landroid/content/Intent;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_b
    .catchall {:try_start_2 .. :try_end_5} :catchall_9

    :goto_5
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_22

    :catchall_9
    move-exception p1

    goto :goto_23

    :catch_b
    move-exception p1

    :try_start_c
    sget-object v1, LO4;->a:Ljava/io/File;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LO4;->c(Ljava/lang/String;)V
    :try_end_21
    .catchall {:try_start_c .. :try_end_21} :catchall_9

    goto :goto_5

    :goto_22
    return-void

    :goto_23
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    throw p1
.end method

.method public final b(Landroid/content/Intent;)V
    .registers 11

    if-eqz p1, :cond_a1

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_a

    goto/16 :goto_a1

    :cond_a
    invoke-virtual {p1}, Landroid/net/Uri;->isHierarchical()Z

    move-result v0

    if-nez v0, :cond_16

    const-string p1, "CONNECTOR oauth redirect ignored \u2014 not a hierarchical URI"

    invoke-static {p1}, LO4;->c(Ljava/lang/String;)V

    return-void

    :cond_16
    const-string v0, "error"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_36

    invoke-static {v0}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_25

    goto :goto_36

    :cond_25
    sget-object p1, LO4;->a:Ljava/io/File;

    const-string p1, "CONNECTOR oauth redirect declined: "

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LO4;->c(Ljava/lang/String;)V

    const-string p1, "Connect cancel ho gaya"

    invoke-virtual {p0, p1}, Lcom/getmeera/android/connectors/OAuthRedirectActivity;->c(Ljava/lang/String;)V

    return-void

    :cond_36
    :goto_36
    const-string v0, "code"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "state"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    if-nez v0, :cond_48

    move-object v5, v1

    goto :goto_49

    :cond_48
    move-object v5, v0

    :goto_49
    if-eqz v4, :cond_9c

    invoke-static {v4}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_52

    goto :goto_9c

    :cond_52
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v0

    const/4 v8, 0x0

    if-eqz v0, :cond_60

    invoke-static {v0}, Lnv;->N(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_61

    :cond_60
    move-object v0, v8

    :goto_61
    if-nez v0, :cond_65

    move-object v3, v1

    goto :goto_66

    :cond_65
    move-object v3, v0

    :goto_66
    new-instance v0, LNg0;

    invoke-direct {v0}, LNg0;-><init>()V

    const-string v1, "picked_file_ids"

    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_82

    invoke-static {p1}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_7c

    goto :goto_7d

    :cond_7c
    move-object p1, v8

    :goto_7d
    if-eqz p1, :cond_82

    invoke-virtual {v0, v1, p1}, LNg0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_82
    invoke-virtual {v0}, LNg0;->b()LNg0;

    move-result-object v6

    sget-object p1, LpH;->a:LgF;

    sget-object p1, LFg0;->a:LgY;

    invoke-static {p1}, LnK1;->a(LSC;)LiC;

    move-result-object p1

    new-instance v0, LnA0;

    const/4 v7, 0x0

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, LnA0;-><init>(Lcom/getmeera/android/connectors/OAuthRedirectActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LNg0;LkC;)V

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-static {p1, v8, v2, v0, v1}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    return-void

    :cond_9c
    :goto_9c
    const-string p1, "Connect adhoora reh gaya \u2014 dobara try karo"

    invoke-virtual {p0, p1}, Lcom/getmeera/android/connectors/OAuthRedirectActivity;->c(Ljava/lang/String;)V

    :cond_a1
    :goto_a1
    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/getmeera/android/connectors/OAuthRedirectActivity;->a(Landroid/content/Intent;)V

    return-void
.end method

.method public final onNewIntent(Landroid/content/Intent;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Lcom/getmeera/android/connectors/OAuthRedirectActivity;->a(Landroid/content/Intent;)V

    return-void
.end method
