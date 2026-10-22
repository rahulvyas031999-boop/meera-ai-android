###### Class com.getmeera.android.MeeraApplication (com.getmeera.android.MeeraApplication)
.class public final Lcom/getmeera/android/MeeraApplication;
.super Landroid/app/Application;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/MeeraApplication;",
        "Landroid/app/Application;",
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
.field public static volatile N:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCreate()V
    .registers 8

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sput-object v2, Lcom/getmeera/android/MeeraApplication;->N:Landroid/content/Context;

    sget-boolean v2, LWI1;->a:Z

    if-eqz v2, :cond_10

    goto :goto_22

    :cond_10
    sput-boolean v1, LWI1;->a:Z

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v3

    new-instance v4, LnC0;

    invoke-direct {v4, v2, v3}, LnC0;-><init>(Landroid/content/Context;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-static {v4}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    :goto_22
    sget-object v2, LQ50;->a:[I

    invoke-static {p0}, LQ50;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2b

    goto :goto_3b

    :cond_2b
    sget-object v3, LQ50;->b:La91;

    invoke-virtual {v3}, La91;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3b

    sput-boolean v1, LQ50;->c:Z

    :cond_3b
    :goto_3b
    invoke-static {p0}, LQ50;->b(Landroid/content/Context;)V

    const/4 v2, 0x0

    :try_start_3f
    sget-object v3, LLX0;->f:LbW0;

    invoke-virtual {v3, p0}, LbW0;->d(Landroid/content/Context;)LLX0;

    move-result-object v3

    invoke-virtual {v3}, LLX0;->q()Z

    move-result v4

    const-string v5, ""

    if-nez v4, :cond_4e

    goto :goto_5c

    :cond_4e
    invoke-virtual {v3}, LLX0;->m()Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "prompt_bundle_json"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_5b

    goto :goto_5c

    :cond_5b
    move-object v5, v3

    :goto_5c
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_66

    invoke-static {v5}, LsK1;->b(Ljava/lang/String;)Z

    move-result v3
    :try_end_66
    .catchall {:try_start_3f .. :try_end_66} :catchall_66

    :catchall_66
    :cond_66
    :try_start_66
    sget-object v3, LWZ0;->a:Ljava/lang/String;

    sget-object v3, LLX0;->f:LbW0;

    invoke-virtual {v3, p0}, LbW0;->d(Landroid/content/Context;)LLX0;

    move-result-object v3

    invoke-virtual {v3}, LLX0;->q()Z

    move-result v4

    const-string v5, ""

    if-nez v4, :cond_77

    goto :goto_85

    :cond_77
    invoke-virtual {v3}, LLX0;->m()Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "skill_bundle_json"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_84

    goto :goto_85

    :cond_84
    move-object v5, v3

    :goto_85
    invoke-static {v5}, LWZ0;->a(Ljava/lang/String;)Z
    :try_end_88
    .catchall {:try_start_66 .. :try_end_88} :catchall_88

    :catchall_88
    :try_start_88
    sget-object v3, LzU;->a:Ljava/util/Set;
    :try_end_8a
    .catchall {:try_start_88 .. :try_end_8a} :catchall_be

    :try_start_8a
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "meera_free_tools"

    invoke-virtual {v3, v4, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "names"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_9a
    .catchall {:try_start_8a .. :try_end_9a} :catchall_9b

    goto :goto_a2

    :catchall_9b
    move-exception v3

    :try_start_9c
    new-instance v4, LJO0;

    invoke-direct {v4, v3}, LJO0;-><init>(Ljava/lang/Throwable;)V

    move-object v3, v4

    :goto_a2
    nop

    instance-of v4, v3, LJO0;

    if-eqz v4, :cond_a8

    move-object v3, v2

    :cond_a8
    check-cast v3, Ljava/lang/String;

    if-nez v3, :cond_ad

    goto :goto_be

    :cond_ad
    new-array v1, v1, [C

    const/16 v4, 0x2c

    aput-char v4, v1, v0

    const/4 v4, 0x6

    invoke-static {v3, v1, v0, v4}, LE61;->d0(Ljava/lang/CharSequence;[CII)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, LzU;->a(Ljava/util/List;)Ljava/util/Set;

    move-result-object v1

    sput-object v1, LzU;->b:Ljava/util/Set;
    :try_end_be
    .catchall {:try_start_9c .. :try_end_be} :catchall_be

    :catchall_be
    :goto_be
    :try_start_be
    sget-object v1, Lff0;->a:Lef0;
    :try_end_c0
    .catchall {:try_start_be .. :try_end_c0} :catchall_10e

    :try_start_c0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v3, "meera_live_remote"

    invoke-virtual {v1, v3, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v3, "config"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_d0
    .catchall {:try_start_c0 .. :try_end_d0} :catchall_d1

    goto :goto_d8

    :catchall_d1
    move-exception v1

    :try_start_d2
    new-instance v3, LJO0;

    invoke-direct {v3, v1}, LJO0;-><init>(Ljava/lang/Throwable;)V

    move-object v1, v3

    :goto_d8
    nop

    instance-of v3, v1, LJO0;

    if-eqz v3, :cond_de

    move-object v1, v2

    :cond_de
    check-cast v1, Ljava/lang/String;
    :try_end_e0
    .catchall {:try_start_d2 .. :try_end_e0} :catchall_10e

    if-nez v1, :cond_e3

    goto :goto_ee

    :cond_e3
    :try_start_e3
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lff0;->c(Lorg/json/JSONObject;)Lef0;

    move-result-object v1

    sput-object v1, Lff0;->a:Lef0;
    :try_end_ee
    .catchall {:try_start_e3 .. :try_end_ee} :catchall_ee

    :catchall_ee
    :goto_ee
    :try_start_ee
    invoke-static {p0}, Lff0;->b(Landroid/content/Context;)LdE0;

    move-result-object v1

    iget-object v3, v1, LdE0;->N:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    iget-object v1, v1, LdE0;->O:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    sget-object v1, Lbf0;->j:Lbf0;

    monitor-enter v1
    :try_end_105
    .catchall {:try_start_ee .. :try_end_105} :catchall_10e

    :try_start_105
    iput-wide v3, v1, Lbf0;->b:J

    iput-wide v5, v1, Lbf0;->c:J
    :try_end_109
    .catchall {:try_start_105 .. :try_end_109} :catchall_10b

    :try_start_109
    monitor-exit v1
    :try_end_10a
    .catchall {:try_start_109 .. :try_end_10a} :catchall_10e

    goto :goto_10e

    :catchall_10b
    move-exception v3

    :try_start_10c
    monitor-exit v1
    :try_end_10d
    .catchall {:try_start_10c .. :try_end_10d} :catchall_10b

    :try_start_10d
    throw v3
    :try_end_10e
    .catchall {:try_start_10d .. :try_end_10e} :catchall_10e

    :catchall_10e
    :goto_10e
    sget-object v1, LpH;->b:LaF;

    invoke-static {v1}, LnK1;->a(LSC;)LiC;

    move-result-object v3

    new-instance v4, Lgl0;

    invoke-direct {v4, p0, v2}, Lgl0;-><init>(Lcom/getmeera/android/MeeraApplication;LkC;)V

    const/4 v5, 0x3

    invoke-static {v3, v2, v0, v4, v5}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    invoke-static {v1}, LnK1;->a(LSC;)LiC;

    move-result-object v1

    new-instance v3, Lhl0;

    invoke-direct {v3, p0, v2}, Lhl0;-><init>(Lcom/getmeera/android/MeeraApplication;LkC;)V

    invoke-static {v1, v2, v0, v3, v5}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    return-void
.end method

.method public final onTrimMemory(I)V
    .registers 4

    const-string v0, "MEM trim level="

    invoke-super {p0, p1}, Landroid/app/Application;->onTrimMemory(I)V

    const/16 v1, 0xf

    if-ge p1, v1, :cond_a

    return-void

    :cond_a
    :try_start_a
    sget-object v1, LO4;->a:Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " \u2014 avatar GL released"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LO4;->c(Ljava/lang/String;)V
    :try_end_20
    .catchall {:try_start_a .. :try_end_20} :catchall_20

    :catchall_20
    return-void
.end method

###### Class defpackage.C3961nC0 (nC0)
.class public final synthetic LnC0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LnC0;->a:Landroid/content/Context;

    iput-object p2, p0, LnC0;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    return-void
.end method


# virtual methods
.method public final uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 5

    iget-object v0, p0, LnC0;->a:Landroid/content/Context;

    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, LWI1;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_2 .. :try_end_9} :catchall_9

    :catchall_9
    iget-object v0, p0, LnC0;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v0, :cond_10

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    :cond_10
    return-void
.end method
