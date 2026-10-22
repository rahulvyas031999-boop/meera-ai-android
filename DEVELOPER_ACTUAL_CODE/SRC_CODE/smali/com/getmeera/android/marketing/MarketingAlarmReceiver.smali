###### Class com.getmeera.android.marketing.MarketingAlarmReceiver (com.getmeera.android.marketing.MarketingAlarmReceiver)
.class public final Lcom/getmeera/android/marketing/MarketingAlarmReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/getmeera/android/marketing/MarketingAlarmReceiver;",
        "Landroid/content/BroadcastReceiver;",
        "<init>",
        "()V",
        "fE1",
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
.field public static final synthetic a:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 14

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.getmeera.android.marketing.DAILY_TRENDS"

    invoke-static {v0, v1}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    const-string v3, "meera_marketing"

    const/4 v4, 0x0

    if-eqz v0, :cond_4a

    invoke-static {p1}, Lbj0;->a(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    const-string v0, "trends_daily"

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_29

    goto :goto_49

    :cond_29
    invoke-static {}, LA31;->a()I

    move-result p2

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v3, "trends_last_day"

    const/4 v5, -0x1

    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, p2, :cond_3f

    goto :goto_49

    :cond_3f
    sget-object v0, Lbj0;->a:LiC;

    new-instance v3, Lzi0;

    invoke-direct {v3, p1, p2, v4}, Lzi0;-><init>(Landroid/content/Context;ILkC;)V

    invoke-static {v0, v4, v2, v3, v1}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    :goto_49
    return-void

    :cond_4a
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v5, "com.getmeera.android.marketing.FOLLOWUPS_DUE"

    invoke-static {v0, v5}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7d

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string v0, "followups_announced_at"

    invoke-interface {p2, v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p1}, Lbj0;->a(Landroid/content/Context;)V

    sget-object p2, Lbj0;->a:LiC;

    new-instance v0, Lwi0;

    invoke-direct {v0, p1, v5, v6, v4}, Lwi0;-><init>(Landroid/content/Context;JLkC;)V

    invoke-static {p2, v4, v2, v0, v1}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    return-void

    :cond_7d
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v5, "com.getmeera.android.marketing.WEEKLY_NUMBERS"

    invoke-static {v0, v5}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a8

    invoke-static {p1}, Lbj0;->a(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    const-string v0, "weekly_summary"

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_9d

    goto :goto_a7

    :cond_9d
    sget-object p2, Lbj0;->a:LiC;

    new-instance v0, LAi0;

    invoke-direct {v0, p1, v4}, LAi0;-><init>(Landroid/content/Context;LkC;)V

    invoke-static {p2, v4, v2, v0, v1}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    :goto_a7
    return-void

    :cond_a8
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    const-string v0, "com.getmeera.android.marketing.CALENDAR_DUE"

    invoke-static {p2, v0}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_b5

    return-void

    :cond_b5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {p1}, LhE1;->e(Landroid/content/Context;)Ljava/util/List;

    move-result-object p2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_c6
    :goto_c6
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_df

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    cmp-long v8, v8, v5

    if-lez v8, :cond_c6

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c6

    :cond_df
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-static {v0}, Lnv;->Z(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    const/16 v3, 0x28

    invoke-static {v0, v3}, Lnv;->b0(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v5

    const/4 v7, 0x0

    const/16 v10, 0x3e

    const-string v6, ","

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v5 .. v10}, Lnv;->L(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;LDU;I)Ljava/lang/String;

    move-result-object v0

    const-string v3, "calendar_upcoming"

    invoke-interface {p2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p1}, Lbj0;->a(Landroid/content/Context;)V

    sget-object p2, Lbj0;->a:LiC;

    new-instance v0, Lxi0;

    invoke-direct {v0, p1, v4}, Lxi0;-><init>(Landroid/content/Context;LkC;)V

    invoke-static {p2, v4, v2, v0, v1}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    return-void
.end method
