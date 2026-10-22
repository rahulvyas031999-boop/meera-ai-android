###### Class com.getmeera.android.social.SocialAlarmReceiver (com.getmeera.android.social.SocialAlarmReceiver)
.class public final Lcom/getmeera/android/social/SocialAlarmReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/getmeera/android/social/SocialAlarmReceiver;",
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
.field public static final a:LiC;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    invoke-static {}, Lrz1;->a()LF71;

    move-result-object v0

    sget-object v1, LpH;->b:LaF;

    invoke-static {v0, v1}, LgK1;->b(LSC;LSC;)LSC;

    move-result-object v0

    invoke-static {v0}, LnK1;->a(LSC;)LiC;

    move-result-object v0

    sput-object v0, Lcom/getmeera/android/social/SocialAlarmReceiver;->a:LiC;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static final a(Lcom/getmeera/android/social/SocialAlarmReceiver;Landroid/content/Context;Ly31;Landroid/net/Uri;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILkC;)Ljava/lang/Object;
    .registers 26

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v0, p2

    move-object/from16 v3, p6

    move-object/from16 v4, p7

    move/from16 v5, p8

    move-object/from16 v6, p9

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v7, v6, Li31;

    if-eqz v7, :cond_24

    move-object v7, v6

    check-cast v7, Li31;

    iget v8, v7, Li31;->a0:I

    const/high16 v9, -0x80000000

    and-int v10, v8, v9

    if-eqz v10, :cond_24

    sub-int/2addr v8, v9

    iput v8, v7, Li31;->a0:I

    goto :goto_29

    :cond_24
    new-instance v7, Li31;

    invoke-direct {v7, v1, v6}, Li31;-><init>(Lcom/getmeera/android/social/SocialAlarmReceiver;LkC;)V

    :goto_29
    iget-object v6, v7, Li31;->Y:Ljava/lang/Object;

    sget-object v8, LaD;->N:LaD;

    iget v9, v7, Li31;->a0:I

    sget-object v10, Lfh1;->a:Lfh1;

    const/4 v11, 0x2

    const/4 v12, 0x1

    if-eqz v9, :cond_72

    if-eq v9, v12, :cond_56

    if-ne v9, v11, :cond_4e

    iget v0, v7, Li31;->X:I

    iget-object v1, v7, Li31;->U:Ljava/lang/Object;

    check-cast v1, LE31;

    iget-object v2, v7, Li31;->T:Ljava/lang/String;

    iget-object v3, v7, Li31;->S:Ljava/lang/Comparable;

    check-cast v3, Ljava/lang/String;

    iget-object v4, v7, Li31;->R:Landroid/content/Context;

    iget-object v5, v7, Li31;->Q:Lcom/getmeera/android/social/SocialAlarmReceiver;

    invoke-static {v6}, LYK1;->b(Ljava/lang/Object;)V

    goto/16 :goto_137

    :cond_4e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_56
    iget v0, v7, Li31;->X:I

    iget-object v1, v7, Li31;->W:LE31;

    iget-object v2, v7, Li31;->V:Ljava/lang/String;

    iget-object v3, v7, Li31;->U:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v4, v7, Li31;->T:Ljava/lang/String;

    iget-object v5, v7, Li31;->S:Ljava/lang/Comparable;

    check-cast v5, Landroid/net/Uri;

    iget-object v9, v7, Li31;->R:Landroid/content/Context;

    iget-object v12, v7, Li31;->Q:Lcom/getmeera/android/social/SocialAlarmReceiver;

    invoke-static {v6}, LYK1;->b(Ljava/lang/Object;)V

    move-object v14, v6

    move-object v6, v5

    move-object v5, v14

    goto/16 :goto_d8

    :cond_72
    invoke-static {v6}, LYK1;->b(Ljava/lang/Object;)V

    iget-object v6, v0, Ly31;->a:Landroid/content/SharedPreferences;

    const-string v9, "daily_auto"

    const/4 v13, 0x0

    invoke-interface {v6, v9, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_86

    invoke-static {v5, v2, v3, v4}, Lcom/getmeera/android/social/SocialAlarmReceiver;->f(ILandroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :goto_83
    move-object v8, v10

    goto/16 :goto_18c

    :cond_86
    :try_start_86
    const-string v6, "default_platform"

    const-string v9, "INSTAGRAM"

    iget-object v0, v0, Ly31;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v6, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_94

    const-string v0, ""

    :cond_94
    invoke-static {v0}, LWG0;->valueOf(Ljava/lang/String;)LWG0;

    move-result-object v0
    :try_end_98
    .catchall {:try_start_86 .. :try_end_98} :catchall_99

    goto :goto_a0

    :catchall_99
    move-exception v0

    new-instance v6, LJO0;

    invoke-direct {v6, v0}, LJO0;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v6

    :goto_a0
    sget-object v6, LWG0;->Q:LWG0;

    instance-of v9, v0, LJO0;

    if-eqz v9, :cond_a7

    move-object v0, v6

    :cond_a7
    check-cast v0, LWG0;

    sget-object v6, LE31;->j:Ljava/util/List;

    move/from16 v6, p4

    invoke-static {v0, v6}, LFu1;->i(LWG0;I)LE31;

    move-result-object v0

    iput-object v1, v7, Li31;->Q:Lcom/getmeera/android/social/SocialAlarmReceiver;

    iput-object v2, v7, Li31;->R:Landroid/content/Context;

    move-object/from16 v6, p3

    iput-object v6, v7, Li31;->S:Ljava/lang/Comparable;

    move-object/from16 v9, p5

    iput-object v9, v7, Li31;->T:Ljava/lang/String;

    iput-object v3, v7, Li31;->U:Ljava/lang/Object;

    iput-object v4, v7, Li31;->V:Ljava/lang/String;

    iput-object v0, v7, Li31;->W:LE31;

    iput v5, v7, Li31;->X:I

    iput v12, v7, Li31;->a0:I

    invoke-virtual {v1, v2, v7}, Lcom/getmeera/android/social/SocialAlarmReceiver;->d(Landroid/content/Context;LkC;)Ljava/lang/Object;

    move-result-object v12

    if-ne v12, v8, :cond_cf

    goto/16 :goto_18c

    :cond_cf
    move-object v14, v1

    move-object v1, v0

    move v0, v5

    move-object v5, v12

    move-object v12, v14

    move-object v15, v9

    move-object v9, v2

    move-object v2, v4

    move-object v4, v15

    :goto_d8
    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_108

    sget-object v1, LO4;->a:Ljava/io/File;

    const-string v1, "SOCIAL auto-post blocked: "

    invoke-virtual {v1, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, LO4;->c(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \u2014 khud daalna padega ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v9, v3, v1}, Lcom/getmeera/android/social/SocialAlarmReceiver;->f(ILandroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_83

    :cond_108
    new-instance v5, LV31;

    invoke-direct {v5, v9}, LV31;-><init>(Landroid/content/Context;)V

    iput-object v12, v7, Li31;->Q:Lcom/getmeera/android/social/SocialAlarmReceiver;

    iput-object v9, v7, Li31;->R:Landroid/content/Context;

    iput-object v3, v7, Li31;->S:Ljava/lang/Comparable;

    iput-object v2, v7, Li31;->T:Ljava/lang/String;

    iput-object v1, v7, Li31;->U:Ljava/lang/Object;

    const/4 v13, 0x0

    iput-object v13, v7, Li31;->V:Ljava/lang/String;

    iput-object v13, v7, Li31;->W:LE31;

    iput v0, v7, Li31;->X:I

    iput v11, v7, Li31;->a0:I

    const/16 v11, 0x8

    move-object/from16 p0, v5

    move-object/from16 p1, v6

    move-object/from16 p2, v1

    move-object/from16 p3, v4

    move-object/from16 p4, v7

    move/from16 p5, v11

    invoke-static/range {p0 .. p5}, LV31;->e(LV31;Landroid/net/Uri;LE31;Ljava/lang/String;LlC;I)Ljava/lang/Object;

    move-result-object v6

    if-ne v6, v8, :cond_135

    goto :goto_18c

    :cond_135
    move-object v4, v9

    move-object v5, v12

    :goto_137
    check-cast v6, LM31;

    sget-object v7, LO4;->a:Ljava/io/File;

    invoke-virtual {v1}, LE31;->a()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-static {v8}, LnM0;->a(Ljava/lang/Class;)Lor;

    move-result-object v8

    invoke-virtual {v8}, Lor;->b()Ljava/lang/String;

    move-result-object v8

    const-string v9, "SOCIAL auto-post "

    const-string v11, " -> "

    invoke-static {v9, v7, v11, v8}, LXm;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    instance-of v6, v6, LK31;

    if-eqz v6, :cond_173

    invoke-virtual {v1}, LE31;->a()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " pe daal diya"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v4, v1, v2}, Lcom/getmeera/android/social/SocialAlarmReceiver;->f(ILandroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_83

    :cond_173
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \u2014 apne aap post nahi ho paaya, kholo."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v4, v3, v1}, Lcom/getmeera/android/social/SocialAlarmReceiver;->f(ILandroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_83

    :goto_18c
    return-object v8
.end method

.method public static final b(Lcom/getmeera/android/social/SocialAlarmReceiver;Landroid/content/Context;Ly31;Lx31;LkC;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v4, v3, Lp31;

    if-eqz v4, :cond_1f

    move-object v4, v3

    check-cast v4, Lp31;

    iget v5, v4, Lp31;->X:I

    const/high16 v6, -0x80000000

    and-int v7, v5, v6

    if-eqz v7, :cond_1f

    sub-int/2addr v5, v6

    iput v5, v4, Lp31;->X:I

    :goto_1d
    move-object v9, v4

    goto :goto_25

    :cond_1f
    new-instance v4, Lp31;

    invoke-direct {v4, v0, v3}, Lp31;-><init>(Lcom/getmeera/android/social/SocialAlarmReceiver;LkC;)V

    goto :goto_1d

    :goto_25
    iget-object v3, v9, Lp31;->V:Ljava/lang/Object;

    sget-object v4, LaD;->N:LaD;

    iget v5, v9, Lp31;->X:I

    sget-object v11, Lfh1;->a:Lfh1;

    const/4 v6, 0x1

    const/4 v7, 0x2

    const/4 v8, 0x3

    const-string v12, "Scheduled post ready hai"

    const/4 v10, 0x0

    const v13, 0x1605a

    if-eqz v5, :cond_85

    if-eq v5, v6, :cond_6e

    if-eq v5, v7, :cond_57

    if-ne v5, v8, :cond_4f

    iget-object v0, v9, Lp31;->T:Ljava/lang/Object;

    check-cast v0, LE31;

    iget-object v1, v9, Lp31;->S:Ljava/lang/Object;

    check-cast v1, Lx31;

    iget-object v2, v9, Lp31;->R:Landroid/content/Context;

    iget-object v4, v9, Lp31;->Q:Lcom/getmeera/android/social/SocialAlarmReceiver;

    invoke-static {v3}, LYK1;->b(Ljava/lang/Object;)V

    goto/16 :goto_1bc

    :cond_4f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_57
    iget-object v0, v9, Lp31;->U:LE31;

    iget-object v1, v9, Lp31;->T:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    iget-object v2, v9, Lp31;->S:Ljava/lang/Object;

    check-cast v2, Lx31;

    iget-object v5, v9, Lp31;->R:Landroid/content/Context;

    iget-object v6, v9, Lp31;->Q:Lcom/getmeera/android/social/SocialAlarmReceiver;

    invoke-static {v3}, LYK1;->b(Ljava/lang/Object;)V

    move-object v14, v6

    move-object v6, v1

    move-object v1, v2

    move-object v2, v5

    goto/16 :goto_174

    :cond_6e
    iget-object v0, v9, Lp31;->T:Ljava/lang/Object;

    check-cast v0, Lx31;

    iget-object v1, v9, Lp31;->S:Ljava/lang/Object;

    check-cast v1, Ly31;

    iget-object v2, v9, Lp31;->R:Landroid/content/Context;

    iget-object v5, v9, Lp31;->Q:Lcom/getmeera/android/social/SocialAlarmReceiver;

    invoke-static {v3}, LYK1;->b(Ljava/lang/Object;)V

    move-object/from16 v17, v2

    move-object v2, v0

    move-object v0, v5

    move-object v5, v1

    move-object/from16 v1, v17

    goto :goto_b7

    :cond_85
    invoke-static {v3}, LYK1;->b(Ljava/lang/Object;)V

    iget-object v3, v2, Lx31;->e:Ljava/lang/String;

    invoke-static {v3}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v3

    xor-int/2addr v3, v6

    if-eqz v3, :cond_9a

    iget-object v3, v2, Lx31;->e:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v5, p2

    goto :goto_bd

    :cond_9a
    iget-object v3, v2, Lx31;->f:Ljava/lang/String;

    invoke-static {v3}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v5

    xor-int/2addr v5, v6

    if-eqz v5, :cond_ba

    iput-object v0, v9, Lp31;->Q:Lcom/getmeera/android/social/SocialAlarmReceiver;

    iput-object v1, v9, Lp31;->R:Landroid/content/Context;

    move-object/from16 v5, p2

    iput-object v5, v9, Lp31;->S:Ljava/lang/Object;

    iput-object v2, v9, Lp31;->T:Ljava/lang/Object;

    iput v6, v9, Lp31;->X:I

    invoke-virtual {v0, v9, v1, v3}, Lcom/getmeera/android/social/SocialAlarmReceiver;->e(LkC;Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Comparable;

    move-result-object v3

    if-ne v3, v4, :cond_b7

    goto/16 :goto_212

    :cond_b7
    :goto_b7
    check-cast v3, Landroid/net/Uri;

    goto :goto_bd

    :cond_ba
    move-object/from16 v5, p2

    move-object v3, v10

    :goto_bd
    if-nez v3, :cond_dc

    sget-object v0, LO4;->a:Ljava/io/File;

    iget-wide v0, v2, Lx31;->a:J

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SOCIAL queued post "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ": no image"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LO4;->c(Ljava/lang/String;)V

    :goto_d9
    move-object v4, v11

    goto/16 :goto_212

    :cond_dc
    sget-object v14, LG30;->a:LG30;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v15

    iget-object v6, v2, Lx31;->f:Ljava/lang/String;

    invoke-static {v6}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v16

    if-eqz v16, :cond_ec

    const-string v6, "scheduled post"

    :cond_ec
    sget-object v8, LE30;->b:LSZ0;

    invoke-virtual {v14, v15, v6, v8}, LG30;->b(Ljava/lang/String;Ljava/lang/String;LSZ0;)V

    sget-object v6, LWG0;->P:Lnw0;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, v2, Lx31;->c:Ljava/lang/String;

    invoke-static {v6}, Lnw0;->x(Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    invoke-static {v6}, Lnv;->G(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, LWG0;

    if-nez v6, :cond_106

    sget-object v6, LWG0;->Q:LWG0;

    :cond_106
    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget-object v14, v2, Lx31;->d:Ljava/lang/String;

    invoke-virtual {v14, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const-string v14, "story"

    const/4 v15, 0x0

    invoke-static {v8, v14, v15}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v14

    if-nez v14, :cond_12a

    const-string v14, "stories"

    invoke-static {v8, v14, v15}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v14

    if-nez v14, :cond_12a

    const-string v14, "status"

    invoke-static {v8, v14, v15}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v8

    if-eqz v8, :cond_128

    goto :goto_12a

    :cond_128
    move v8, v7

    goto :goto_12b

    :cond_12a
    :goto_12a
    const/4 v8, 0x1

    :goto_12b
    sget-object v14, LE31;->j:Ljava/util/List;

    invoke-static {v6, v8}, LFu1;->i(LWG0;I)LE31;

    move-result-object v6

    const-string v8, "daily_auto"

    iget-object v5, v5, Ly31;->a:Landroid/content/SharedPreferences;

    invoke-interface {v5, v8, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_157

    invoke-virtual {v6}, LE31;->a()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \u2014 kholo aur daal do"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v1, v12, v2}, Lcom/getmeera/android/social/SocialAlarmReceiver;->f(ILandroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_d9

    :cond_157
    iput-object v0, v9, Lp31;->Q:Lcom/getmeera/android/social/SocialAlarmReceiver;

    iput-object v1, v9, Lp31;->R:Landroid/content/Context;

    iput-object v2, v9, Lp31;->S:Ljava/lang/Object;

    iput-object v3, v9, Lp31;->T:Ljava/lang/Object;

    iput-object v6, v9, Lp31;->U:LE31;

    iput v7, v9, Lp31;->X:I

    invoke-virtual {v0, v1, v9}, Lcom/getmeera/android/social/SocialAlarmReceiver;->d(Landroid/content/Context;LkC;)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v4, :cond_16b

    goto/16 :goto_212

    :cond_16b
    move-object v14, v0

    move-object v0, v6

    move-object v6, v3

    move-object v3, v5

    move-object/from16 v17, v2

    move-object v2, v1

    move-object/from16 v1, v17

    :goto_174
    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_19d

    invoke-virtual {v0}, LE31;->a()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u2014 "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", kholo"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v2, v12, v0}, Lcom/getmeera/android/social/SocialAlarmReceiver;->f(ILandroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_d9

    :cond_19d
    new-instance v5, LV31;

    invoke-direct {v5, v2}, LV31;-><init>(Landroid/content/Context;)V

    iget-object v8, v1, Lx31;->g:Ljava/lang/String;

    iput-object v14, v9, Lp31;->Q:Lcom/getmeera/android/social/SocialAlarmReceiver;

    iput-object v2, v9, Lp31;->R:Landroid/content/Context;

    iput-object v1, v9, Lp31;->S:Ljava/lang/Object;

    iput-object v0, v9, Lp31;->T:Ljava/lang/Object;

    iput-object v10, v9, Lp31;->U:LE31;

    const/4 v3, 0x3

    iput v3, v9, Lp31;->X:I

    const/16 v10, 0x8

    move-object v7, v0

    invoke-static/range {v5 .. v10}, LV31;->e(LV31;Landroid/net/Uri;LE31;Ljava/lang/String;LlC;I)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v4, :cond_1bb

    goto :goto_212

    :cond_1bb
    move-object v4, v14

    :goto_1bc
    check-cast v3, LM31;

    sget-object v5, LO4;->a:Ljava/io/File;

    invoke-virtual {v0}, LE31;->a()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6}, LnM0;->a(Ljava/lang/Class;)Lor;

    move-result-object v6

    invoke-virtual {v6}, Lor;->b()Ljava/lang/String;

    move-result-object v6

    const-string v7, "SOCIAL scheduled "

    const-string v8, " -> "

    invoke-static {v7, v5, v8, v6}, LXm;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    instance-of v3, v3, LK31;

    if-eqz v3, :cond_1f5

    invoke-virtual {v0}, LE31;->a()Ljava/lang/String;

    move-result-object v0

    const-string v3, " pe daal diya"

    invoke-static {v0, v3}, LXm;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, v1, Lx31;->g:Ljava/lang/String;

    const/16 v3, 0x50

    invoke-static {v3, v1}, LE61;->o0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v2, v0, v1}, Lcom/getmeera/android/social/SocialAlarmReceiver;->f(ILandroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_d9

    :cond_1f5
    invoke-virtual {v0}, LE31;->a()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u2014 apne aap post nahi ho paaya, kholo."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v2, v12, v0}, Lcom/getmeera/android/social/SocialAlarmReceiver;->f(ILandroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_d9

    :goto_212
    return-object v4
.end method

.method public static final c(Lcom/getmeera/android/social/SocialAlarmReceiver;Landroid/content/Context;Ls31;LkC;)Ljava/lang/Object;
    .registers 9

    const/4 v0, 0x1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v1, p3, Lq31;

    if-eqz v1, :cond_17

    move-object v1, p3

    check-cast v1, Lq31;

    iget v2, v1, Lq31;->S:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_17

    sub-int/2addr v2, v3

    iput v2, v1, Lq31;->S:I

    goto :goto_1c

    :cond_17
    new-instance v1, Lq31;

    invoke-direct {v1, p0, p3}, Lq31;-><init>(Lcom/getmeera/android/social/SocialAlarmReceiver;LkC;)V

    :goto_1c
    iget-object p0, v1, Lq31;->Q:Ljava/lang/Object;

    sget-object p3, LaD;->N:LaD;

    iget v2, v1, Lq31;->S:I

    if-eqz v2, :cond_32

    if-ne v2, v0, :cond_2a

    invoke-static {p0}, LYK1;->b(Ljava/lang/Object;)V

    goto :goto_57

    :cond_2a
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_32
    invoke-static {p0}, LYK1;->b(Ljava/lang/Object;)V

    sget-object p0, LLX0;->f:LbW0;

    invoke-virtual {p0, p1}, LbW0;->d(Landroid/content/Context;)LLX0;

    move-result-object p0

    new-instance p1, Lk71;

    invoke-virtual {p0}, LLX0;->d()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0}, LLX0;->e()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0, v2}, Lk71;-><init>(Ljava/lang/String;Ljava/util/List;)V

    invoke-static {p2}, Lt31;->a(Ls31;)Ljava/lang/String;

    move-result-object p0

    iput v0, v1, Lq31;->S:I

    const-string p2, "You write short original motivational lines. Output ONLY the line."

    invoke-static {p1, p2, p0, v1}, Lk71;->o(Lk71;Ljava/lang/String;Ljava/lang/String;LkC;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p3, :cond_57

    goto :goto_7e

    :cond_57
    :goto_57
    check-cast p0, Ljava/lang/String;

    const/4 p3, 0x0

    if-nez p0, :cond_5d

    goto :goto_7e

    :cond_5d
    invoke-static {p0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    new-array p1, v0, [C

    const/16 p2, 0x22

    const/4 v1, 0x0

    aput-char p2, p1, v1

    invoke-static {p0, p1}, LE61;->r0(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x8c

    invoke-static {p1, p0}, LE61;->o0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/2addr p1, v0

    if-eqz p1, :cond_7e

    move-object p3, p0

    :cond_7e
    :goto_7e
    return-object p3
.end method

.method public static f(ILandroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    new-instance v1, Landroid/app/NotificationChannel;

    const-string v2, "meera_social"

    const-string v3, "Meera social"

    const/4 v4, 0x3

    invoke-direct {v1, v2, v3, v4}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/getmeera/android/MainActivity;

    invoke-direct {v1, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v3, 0x14000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    const/high16 v3, 0xc000000

    invoke-static {p1, p0, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    new-instance v3, LKz0;

    invoke-direct {v3, p1, v2}, LKz0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iget-object p1, v3, LKz0;->p:Landroid/app/Notification;

    const v2, 0x108003f

    iput v2, p1, Landroid/app/Notification;->icon:I

    invoke-static {p2}, LKz0;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, v3, LKz0;->e:Ljava/lang/CharSequence;

    invoke-static {p3}, LKz0;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, v3, LKz0;->f:Ljava/lang/CharSequence;

    new-instance p1, LEq1;

    const/16 p2, 0x9

    const/4 v2, 0x0

    invoke-direct {p1, p2, v2}, LEq1;-><init>(IZ)V

    invoke-static {p3}, LKz0;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p2

    iput-object p2, p1, LEq1;->P:Ljava/lang/Object;

    invoke-virtual {v3, p1}, LKz0;->e(LEq1;)V

    const/16 p1, 0x10

    invoke-virtual {v3, p1}, LKz0;->d(I)V

    iput-object v1, v3, LKz0;->g:Landroid/app/PendingIntent;

    invoke-virtual {v3}, LKz0;->b()Landroid/app/Notification;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/content/Context;LkC;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Lh31;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lh31;

    iget v1, v0, Lh31;->T:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lh31;->T:I

    goto :goto_18

    :cond_13
    new-instance v0, Lh31;

    invoke-direct {v0, p0, p2}, Lh31;-><init>(Lcom/getmeera/android/social/SocialAlarmReceiver;LkC;)V

    :goto_18
    iget-object p2, v0, Lh31;->R:Ljava/lang/Object;

    sget-object v1, LaD;->N:LaD;

    iget v2, v0, Lh31;->T:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_39

    if-eq v2, v4, :cond_33

    if-ne v2, v3, :cond_2b

    invoke-static {p2}, LYK1;->b(Ljava/lang/Object;)V

    goto :goto_74

    :cond_2b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_33
    iget-object p1, v0, Lh31;->Q:Landroid/content/Context;

    invoke-static {p2}, LYK1;->b(Ljava/lang/Object;)V

    goto :goto_49

    :cond_39
    invoke-static {p2}, LYK1;->b(Ljava/lang/Object;)V

    sget-object p2, Le;->a:Le;

    iput-object p1, v0, Lh31;->Q:Landroid/content/Context;

    iput v4, v0, Lh31;->T:I

    invoke-static {v0}, Le;->b(LlC;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_49

    return-object v1

    :cond_49
    :goto_49
    if-nez p2, :cond_4e

    const-string p1, "accessibility off hai"

    return-object p1

    :cond_4e
    invoke-static {p1}, LDD1;->a(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_55

    return-object v5

    :cond_55
    invoke-static {p1}, LDD1;->e(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_67

    sget-object p2, LUE0;->a:LUE0;

    invoke-virtual {p2, p1}, LUE0;->b(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_64

    goto :goto_67

    :cond_64
    const-string p1, "phone lock tha"

    return-object p1

    :cond_67
    :goto_67
    sget-object p2, Lcom/getmeera/android/ui/UnlockActivity;->O:LxK0;

    iput-object v5, v0, Lh31;->Q:Landroid/content/Context;

    iput v3, v0, Lh31;->T:I

    invoke-virtual {p2, p1, v0}, LxK0;->i(Landroid/content/Context;LkC;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_74

    return-object v1

    :cond_74
    :goto_74
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_7d

    goto :goto_7f

    :cond_7d
    const-string v5, "phone khul nahi paaya"

    :goto_7f
    return-object v5
.end method

.method public final e(LkC;Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Comparable;
    .registers 9

    instance-of v0, p1, Lj31;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lj31;

    iget v1, v0, Lj31;->U:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lj31;->U:I

    goto :goto_18

    :cond_13
    new-instance v0, Lj31;

    invoke-direct {v0, p0, p1}, Lj31;-><init>(Lcom/getmeera/android/social/SocialAlarmReceiver;LkC;)V

    :goto_18
    iget-object p1, v0, Lj31;->S:Ljava/lang/Object;

    sget-object v1, LaD;->N:LaD;

    iget v2, v0, Lj31;->U:I

    const/4 v3, 0x1

    if-eqz v2, :cond_33

    if-ne v2, v3, :cond_2b

    iget-object p3, v0, Lj31;->R:Ljava/lang/String;

    iget-object p2, v0, Lj31;->Q:Landroid/content/Context;

    invoke-static {p1}, LYK1;->b(Ljava/lang/Object;)V

    goto :goto_58

    :cond_2b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_33
    invoke-static {p1}, LYK1;->b(Ljava/lang/Object;)V

    sget-object p1, LLX0;->f:LbW0;

    invoke-virtual {p1, p2}, LbW0;->d(Landroid/content/Context;)LLX0;

    move-result-object p1

    new-instance v2, Li30;

    invoke-virtual {p1}, LLX0;->c()Ljava/util/List;

    move-result-object v4

    invoke-virtual {p1}, LLX0;->e()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p2, v4, p1}, Li30;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    sget-object p1, LE30;->b:LSZ0;

    iput-object p2, v0, Lj31;->Q:Landroid/content/Context;

    iput-object p3, v0, Lj31;->R:Ljava/lang/String;

    iput v3, v0, Lj31;->U:I

    invoke-static {v2, p3, p1, v0}, Li30;->h(Li30;Ljava/lang/String;LSZ0;LkC;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_58

    return-object v1

    :cond_58
    :goto_58
    check-cast p1, Lf30;

    instance-of v0, p1, Le30;

    const/4 v1, 0x0

    if-nez v0, :cond_60

    return-object v1

    :cond_60
    check-cast p1, Le30;

    iget-object p1, p1, Le30;->a:[B

    invoke-static {p2, p3, p1}, LYr1;->c(Landroid/content/Context;Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_6b

    return-object v1

    :cond_6b
    const/4 p2, 0x0

    const-string p3, "content://"

    invoke-static {p1, p3, p2}, LM61;->A(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_78

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :cond_78
    return-object v1
.end method

.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 19

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    sget-object v0, Ly31;->b:LxK0;

    invoke-virtual {v0, v6}, LxK0;->e(Landroid/content/Context;)Ly31;

    move-result-object v7

    invoke-static {v6}, LBu1;->c(Landroid/content/Context;)V

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_f6

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v10, 0x0

    const v2, -0x68fdc82d

    sget-object v11, Lcom/getmeera/android/social/SocialAlarmReceiver;->a:LiC;

    if-eq v1, v2, :cond_6d

    const v2, -0x14c8590a

    if-eq v1, v2, :cond_28

    goto/16 :goto_f6

    :cond_28
    const-string v1, "com.getmeera.android.social.DAILY_STORY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    goto/16 :goto_f6

    :cond_32
    const-string v0, "daily_on"

    iget-object v1, v7, Ly31;->a:Landroid/content/SharedPreferences;

    invoke-interface {v1, v0, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_3e

    goto/16 :goto_f6

    :cond_3e
    invoke-static {}, LA31;->a()I

    move-result v4

    const/4 v0, -0x1

    const-string v2, "daily_last_day"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v4, :cond_52

    const-string v0, "SOCIAL daily already done today"

    invoke-static {v0}, LO4;->c(Ljava/lang/String;)V

    goto/16 :goto_f6

    :cond_52
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v12, Ln31;

    const/4 v5, 0x0

    move-object v0, v12

    move-object/from16 v1, p0

    move-object v2, v6

    move-object v3, v7

    invoke-direct/range {v0 .. v5}, Ln31;-><init>(Lcom/getmeera/android/social/SocialAlarmReceiver;Landroid/content/Context;Ly31;ILkC;)V

    invoke-static {v11, v9, v10, v12, v8}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    goto/16 :goto_f6

    :cond_6d
    const-string v1, "com.getmeera.android.social.QUEUED_POST"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_77

    goto/16 :goto_f6

    :cond_77
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual {v7}, Ly31;->b()Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_88
    :goto_88
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lx31;

    iget-wide v3, v3, Lx31;->b:J

    cmp-long v3, v3, v12

    if-gtz v3, :cond_88

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_88

    :cond_9f
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a6

    goto :goto_f6

    :cond_a6
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_aa
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f3

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lx31;

    iget-wide v0, v4, Lx31;->a:J

    invoke-virtual {v7, v0, v1}, Ly31;->c(J)V

    sget-object v0, LA31;->a:LrM0;

    iget-wide v0, v4, Lx31;->b:J

    sub-long v0, v12, v0

    const-wide/32 v2, 0xa4cb80

    cmp-long v0, v0, v2

    if-lez v0, :cond_e4

    sget-object v0, LO4;->a:Ljava/io/File;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SOCIAL queued post "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, v4, Lx31;->a:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " dropped as stale"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LO4;->c(Ljava/lang/String;)V

    goto :goto_aa

    :cond_e4
    new-instance v15, Lo31;

    const/4 v5, 0x0

    move-object v0, v15

    move-object/from16 v1, p0

    move-object v2, v6

    move-object v3, v7

    invoke-direct/range {v0 .. v5}, Lo31;-><init>(Lcom/getmeera/android/social/SocialAlarmReceiver;Landroid/content/Context;Ly31;Lx31;LkC;)V

    invoke-static {v11, v9, v10, v15, v8}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    goto :goto_aa

    :cond_f3
    invoke-static {v6}, LBu1;->c(Landroid/content/Context;)V

    :cond_f6
    :goto_f6
    return-void
.end method
