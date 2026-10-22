###### Class com.getmeera.android.automation.MeeraNotificationListener (com.getmeera.android.automation.MeeraNotificationListener)
.class public final Lcom/getmeera/android/automation/MeeraNotificationListener;
.super Landroid/service/notification/NotificationListenerService;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/getmeera/android/automation/MeeraNotificationListener;",
        "Landroid/service/notification/NotificationListenerService;",
        "<init>",
        "()V",
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
.field public static volatile N:LDU;

.field public static volatile O:LJU;

.field public static final P:Ljava/util/Set;

.field public static volatile Q:LdE0;

.field public static final R:Ljava/util/List;

.field public static final S:Lxc;

.field public static final T:Lxc;

.field public static final U:Lxc;

.field public static final V:Ljava/util/LinkedHashMap;

.field public static final W:Ljava/util/LinkedHashMap;

.field public static volatile X:Lcom/getmeera/android/automation/MeeraNotificationListener;

.field public static volatile Y:Z

.field public static volatile Z:J

.field public static final a0:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 13

    const-string v8, "com.instagram.android"

    const-string v9, "org.thoughtcrime.securesms"

    const-string v0, "com.whatsapp"

    const-string v1, "com.whatsapp.w4b"

    const-string v2, "org.telegram.messenger"

    const-string v3, "com.google.android.apps.messaging"

    const-string v4, "com.android.mms"

    const-string v5, "com.google.android.dialer"

    const-string v6, "com.android.dialer"

    const-string v7, "com.samsung.android.dialer"

    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LSV0;->k([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->P:Ljava/util/Set;

    const-string v11, "voice call"

    const-string v12, "video call"

    const-string v1, "incoming call"

    const-string v2, "ongoing call"

    const-string v3, "call in progress"

    const-string v4, "calling"

    const-string v5, "missed call"

    const-string v6, "dialing"

    const-string v7, "unknown"

    const-string v8, "private number"

    const-string v9, "no caller id"

    const-string v10, "tap to return to call"

    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lov;->g([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->R:Ljava/util/List;

    new-instance v0, Lxc;

    invoke-direct {v0}, Lxc;-><init>()V

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->S:Lxc;

    new-instance v0, Lxc;

    invoke-direct {v0}, Lxc;-><init>()V

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->T:Lxc;

    new-instance v0, Lxc;

    invoke-direct {v0}, Lxc;-><init>()V

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->U:Lxc;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->V:Ljava/util/LinkedHashMap;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->W:Ljava/util/LinkedHashMap;

    const-string v10, "naya message"

    const-string v11, "naye message"

    const-string v1, "new message"

    const-string v2, "new messages"

    const-string v3, "message"

    const-string v4, "messages"

    const-string v5, "checking for new messages"

    const-string v6, "you may have new messages"

    const-string v7, "sending message"

    const-string v8, "waiting for messages"

    const-string v9, "waiting for message"

    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LSV0;->k([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->a0:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/service/notification/NotificationListenerService;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/service/notification/StatusBarNotification;Z)V
    .registers 25

    const/4 v1, 0x1

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v0

    iget-object v0, v0, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    const-string v2, "android.title"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_14

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_15

    :cond_14
    const/4 v2, 0x0

    :goto_15
    const-string v4, "android.text"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    if-eqz v4, :cond_23

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v10, v4

    goto :goto_24

    :cond_23
    const/4 v10, 0x0

    :goto_24
    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v4

    iget-object v4, v4, Landroid/app/Notification;->category:Ljava/lang/String;

    const-string v5, "call"

    invoke-static {v4, v5}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    const/4 v12, 0x0

    if-eqz v4, :cond_b0

    filled-new-array {v2, v10}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lov;->g([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3f
    :goto_3f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_94

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/String;

    if-eqz v6, :cond_3f

    invoke-static {v6}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_55

    goto :goto_3f

    :cond_55
    invoke-static {v6}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_6a

    goto :goto_3f

    :cond_6a
    sget-object v7, Lcom/getmeera/android/automation/MeeraNotificationListener;->R:Ljava/util/List;

    instance-of v8, v7, Ljava/util/Collection;

    if-eqz v8, :cond_77

    invoke-interface {v7}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_77

    goto :goto_95

    :cond_77
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_7b
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_95

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3f

    invoke-static {v6, v8, v12}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v8

    if-eqz v8, :cond_7b

    goto :goto_3f

    :cond_94
    const/4 v5, 0x0

    :cond_95
    :goto_95
    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_b0

    invoke-static {v5}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPostTime()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    new-instance v6, LdE0;

    invoke-direct {v6, v4, v5}, LdE0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sput-object v6, Lcom/getmeera/android/automation/MeeraNotificationListener;->Q:LdE0;

    :cond_b0
    const/16 v13, 0x3c

    if-eqz v2, :cond_15b

    invoke-static {v2}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_bc

    goto/16 :goto_15b

    :cond_bc
    if-eqz v10, :cond_15b

    invoke-static {v10}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_c6

    goto/16 :goto_15b

    :cond_c6
    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->isOngoing()Z

    move-result v4

    if-nez v4, :cond_15b

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v4

    :try_start_d0
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v5, v4, v12}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4
    :try_end_e0
    .catch Ljava/lang/Exception; {:try_start_d0 .. :try_end_e0} :catch_e0

    :catch_e0
    move-object v11, v4

    sget-object v14, Lcom/getmeera/android/automation/MeeraNotificationListener;->T:Lxc;

    monitor-enter v14

    :try_start_e4
    invoke-virtual {v14}, Lxc;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_eb

    goto :goto_10f

    :cond_eb
    invoke-virtual {v14}, Ljava/util/AbstractList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_ef
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_10f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfc;

    iget-object v6, v5, Lfc;->b:Ljava/lang/String;

    invoke-static {v6, v2}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_ef

    iget-object v5, v5, Lfc;->c:Ljava/lang/String;

    invoke-static {v5, v10}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_ef

    move v3, v12

    goto :goto_12d

    :catchall_10d
    move-exception v0

    goto :goto_159

    :cond_10f
    :goto_10f
    sget-object v15, Lcom/getmeera/android/automation/MeeraNotificationListener;->T:Lxc;

    new-instance v9, Lfc;

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPostTime()J

    move-result-wide v5

    move-object v4, v9

    move-object v7, v11

    move-object v8, v2

    move-object v3, v9

    move-object v9, v10

    invoke-direct/range {v4 .. v9}, Lfc;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v15, v3}, Lxc;->h(Ljava/lang/Object;)V

    :goto_122
    sget-object v3, Lcom/getmeera/android/automation/MeeraNotificationListener;->T:Lxc;

    iget v4, v3, Lxc;->P:I

    if-le v4, v13, :cond_12c

    invoke-virtual {v3}, Lxc;->o()Ljava/lang/Object;
    :try_end_12b
    .catchall {:try_start_e4 .. :try_end_12b} :catchall_10d

    goto :goto_122

    :cond_12c
    move v3, v1

    :goto_12d
    monitor-exit v14

    if-eqz v3, :cond_13d

    if-eqz p2, :cond_13d

    sget-object v4, Lcom/getmeera/android/automation/MeeraNotificationListener;->O:LJU;

    if-eqz v4, :cond_13d

    :try_start_136
    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v11, v2, v10}, LJU;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_13d
    .catchall {:try_start_136 .. :try_end_13d} :catchall_13d

    :catchall_13d
    :cond_13d
    if-eqz v3, :cond_15b

    sget-object v3, Lcom/getmeera/android/automation/MeeraNotificationListener;->P:Ljava/util/Set;

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15b

    :try_start_14b
    sget-object v3, LLM0;->L:LwM0;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, LwM0;->a(Landroid/content/Context;)LLM0;

    move-result-object v3

    invoke-virtual {v3, v11, v2, v10}, LLM0;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_158
    .catch Ljava/lang/Exception; {:try_start_14b .. :try_end_158} :catch_15b

    goto :goto_15b

    :goto_159
    monitor-exit v14

    throw v0

    :catch_15b
    :cond_15b
    :goto_15b
    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.whatsapp"

    invoke-static {v3, v4}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_175

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.whatsapp.w4b"

    invoke-static {v3, v4}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_174

    goto :goto_175

    :cond_174
    return-void

    :cond_175
    :goto_175
    if-eqz v2, :cond_546

    invoke-static {v2}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_17f

    goto/16 :goto_546

    :cond_17f
    if-eqz v10, :cond_546

    invoke-static {v10}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_189

    goto/16 :goto_546

    :cond_189
    const-string v3, "WhatsApp"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_192

    return-void

    :cond_192
    const-string v3, "WhatsApp Business"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_19b

    return-void

    :cond_19b
    invoke-static {v10}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [C

    fill-array-data v4, :array_548

    invoke-static {v3, v4}, LE61;->t0(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1bb

    :goto_1b9
    move v3, v1

    goto :goto_1d2

    :cond_1bb
    sget-object v4, Lcom/getmeera/android/automation/MeeraNotificationListener;->a0:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c4

    goto :goto_1b9

    :cond_1c4
    const-string v4, "^\\d+\\s+(new\\s+)?messages?\\b"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    :goto_1d2
    if-eqz v3, :cond_1e1

    sget-wide v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->Z:J

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPostTime()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    sput-wide v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->Z:J

    return-void

    :cond_1e1
    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.whatsapp.w4b"

    invoke-static {v3, v4}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    iget-object v3, v3, Landroid/app/Notification;->actions:[Landroid/app/Notification$Action;

    if-eqz v3, :cond_316

    array-length v4, v3

    move v5, v12

    :goto_1f5
    if-ge v5, v4, :cond_21a

    aget-object v6, v3, v5

    invoke-virtual {v6}, Landroid/app/Notification$Action;->getRemoteInputs()[Landroid/app/RemoteInput;

    move-result-object v7

    if-eqz v7, :cond_214

    array-length v8, v7

    move v11, v12

    :goto_201
    if-ge v11, v8, :cond_20f

    aget-object v14, v7, v11

    invoke-virtual {v14}, Landroid/app/RemoteInput;->getAllowFreeFormInput()Z

    move-result v14

    if-eqz v14, :cond_20d

    move v7, v1

    goto :goto_210

    :cond_20d
    add-int/2addr v11, v1

    goto :goto_201

    :cond_20f
    move v7, v12

    :goto_210
    if-ne v7, v1, :cond_214

    move v7, v1

    goto :goto_215

    :cond_214
    move v7, v12

    :goto_215
    if-eqz v7, :cond_218

    goto :goto_21b

    :cond_218
    add-int/2addr v5, v1

    goto :goto_1f5

    :cond_21a
    const/4 v6, 0x0

    :goto_21b
    if-eqz v6, :cond_316

    sget-object v3, LrN0;->a:LrM0;

    const-string v3, "android.conversationTitle"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_22c

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_22d

    :cond_22c
    const/4 v3, 0x0

    :goto_22d
    const-string v4, "android.isGroupConversation"

    invoke-virtual {v0, v4, v12}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPostTime()J

    move-result-wide v20

    invoke-static {v2}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v7, LrN0;->a:LrM0;

    const-string v8, ""

    invoke-virtual {v7, v5, v8}, LrM0;->f(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    if-eqz v3, :cond_270

    invoke-static {v3}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v8, ""

    invoke-virtual {v7, v3, v8}, LrM0;->f(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_270

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_270

    goto :goto_271

    :cond_270
    const/4 v3, 0x0

    :goto_271
    const-string v8, " @ "

    invoke-static {v5, v8, v12}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v11

    if-eqz v11, :cond_2a3

    new-instance v4, LqN0;

    if-nez v3, :cond_297

    invoke-static {v5, v8}, LE61;->j0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v8, ""

    invoke-virtual {v7, v3, v8}, LrM0;->f(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_297
    move-object/from16 v18, v3

    const/16 v19, 0x1

    move-object/from16 v16, v4

    move-object/from16 v17, v5

    invoke-direct/range {v16 .. v21}, LqN0;-><init>(Ljava/lang/String;Ljava/lang/String;ZJ)V

    goto :goto_2e7

    :cond_2a3
    if-eqz v3, :cond_2c3

    if-nez v4, :cond_2b5

    invoke-static {v3}, LrN0;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v18 .. v18}, LrN0;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2c3

    :cond_2b5
    new-instance v4, LqN0;

    const/16 v19, 0x1

    move-object/from16 v16, v4

    move-object/from16 v17, v5

    move-object/from16 v18, v3

    invoke-direct/range {v16 .. v21}, LqN0;-><init>(Ljava/lang/String;Ljava/lang/String;ZJ)V

    goto :goto_2e7

    :cond_2c3
    if-nez v4, :cond_2da

    const-string v3, ": "

    invoke-static {v5, v3, v12}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v3

    if-eqz v3, :cond_2ce

    goto :goto_2da

    :cond_2ce
    new-instance v4, LqN0;

    const/16 v19, 0x0

    move-object/from16 v16, v4

    move-object/from16 v17, v5

    invoke-direct/range {v16 .. v21}, LqN0;-><init>(Ljava/lang/String;Ljava/lang/String;ZJ)V

    goto :goto_2e7

    :cond_2da
    :goto_2da
    new-instance v4, LqN0;

    const/16 v19, 0x1

    move-object/from16 v16, v4

    move-object/from16 v17, v5

    move-object/from16 v18, v5

    invoke-direct/range {v16 .. v21}, LqN0;-><init>(Ljava/lang/String;Ljava/lang/String;ZJ)V

    :goto_2e7
    sget-object v3, Lcom/getmeera/android/automation/MeeraNotificationListener;->W:Ljava/util/LinkedHashMap;

    monitor-enter v3

    :try_start_2ea
    invoke-static {v2}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v7, Lar0;

    invoke-direct {v7, v6, v4}, Lar0;-><init>(Landroid/app/Notification$Action;LqN0;)V

    invoke-interface {v3, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2fa
    sget-object v4, Lcom/getmeera/android/automation/MeeraNotificationListener;->W:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/AbstractMap;->size()I

    move-result v5

    if-le v5, v13, :cond_312

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    invoke-static {v5}, Lnv;->D(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_30f
    .catchall {:try_start_2ea .. :try_end_30f} :catchall_310

    goto :goto_2fa

    :catchall_310
    move-exception v0

    goto :goto_314

    :cond_312
    monitor-exit v3

    goto :goto_316

    :goto_314
    monitor-exit v3

    throw v0

    :cond_316
    :goto_316
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v10}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/getmeera/android/automation/MeeraNotificationListener;->U:Lxc;

    monitor-enter v6

    :try_start_325
    new-instance v7, Lf7;

    const/4 v8, 0x5

    invoke-direct {v7, v8, v3, v4}, Lf7;-><init>(IJ)V

    invoke-static {v6, v7}, Ltv;->s(Ljava/util/List;LDU;)Z

    invoke-static {v5}, LQG1;->R(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6}, Lxc;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_33a

    :cond_338
    move v11, v12

    goto :goto_363

    :cond_33a
    invoke-virtual {v6}, Ljava/util/AbstractList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_33e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_338

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, LdE0;

    iget-object v8, v7, LdE0;->N:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    invoke-static {v5, v8}, LM61;->v(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_362

    iget-object v7, v7, LdE0;->N:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    invoke-static {v3, v7}, LM61;->v(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7
    :try_end_35c
    .catchall {:try_start_325 .. :try_end_35c} :catchall_35f

    if-eqz v7, :cond_33e

    goto :goto_362

    :catchall_35f
    move-exception v0

    goto/16 :goto_544

    :cond_362
    :goto_362
    move v11, v1

    :goto_363
    monitor-exit v6

    if-nez v11, :cond_40f

    invoke-static {v10}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "You:"

    invoke-static {v3, v4, v1}, LM61;->A(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_409

    const-string v4, "Aap:"

    invoke-static {v3, v4, v1}, LM61;->A(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_380

    goto/16 :goto_409

    :cond_380
    const-string v3, "android.messages"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v3

    if-nez v3, :cond_38b

    :cond_388
    :goto_388
    move v3, v12

    goto/16 :goto_40a

    :cond_38b
    array-length v4, v3

    if-nez v4, :cond_390

    const/4 v3, 0x0

    goto :goto_394

    :cond_390
    array-length v4, v3

    sub-int/2addr v4, v1

    aget-object v3, v3, v4

    :goto_394
    instance-of v4, v3, Landroid/os/Bundle;

    if-eqz v4, :cond_39b

    check-cast v3, Landroid/os/Bundle;

    goto :goto_39c

    :cond_39b
    const/4 v3, 0x0

    :goto_39c
    if-nez v3, :cond_39f

    goto :goto_388

    :cond_39f
    const-string v4, "sender"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    if-eqz v4, :cond_3ad

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3d3

    :cond_3ad
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1c

    if-lt v4, v5, :cond_3d2

    const-string v4, "sender_person"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    invoke-static {v3}, LZq0;->r(Landroid/os/Parcelable;)Z

    move-result v4

    if-eqz v4, :cond_3c4

    invoke-static {v3}, LZq0;->b(Landroid/os/Parcelable;)Landroid/app/Person;

    move-result-object v3

    goto :goto_3c5

    :cond_3c4
    const/4 v3, 0x0

    :goto_3c5
    if-eqz v3, :cond_3d2

    invoke-static {v3}, LZq0;->k(Landroid/app/Person;)Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_3d2

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_3d3

    :cond_3d2
    const/4 v4, 0x0

    :cond_3d3
    :goto_3d3
    if-eqz v4, :cond_388

    invoke-static {v4}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3dc

    goto :goto_388

    :cond_3dc
    const-string v3, "android.selfDisplayName"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_3e9

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_3ea

    :cond_3e9
    const/4 v3, 0x0

    :goto_3ea
    const-string v5, "You"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_409

    const-string v5, "Aap"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_409

    if-eqz v3, :cond_388

    invoke-static {v3}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_403

    goto :goto_388

    :cond_403
    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_388

    :cond_409
    :goto_409
    move v3, v1

    :goto_40a
    if-eqz v3, :cond_40d

    goto :goto_40f

    :cond_40d
    move v3, v12

    goto :goto_410

    :cond_40f
    :goto_40f
    move v3, v1

    :goto_410
    if-eqz v3, :cond_416

    invoke-static {v10}, LQG1;->R(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    :cond_416
    move-object v14, v10

    :try_start_417
    const-string v4, "android.messages"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v0

    if-nez v0, :cond_421

    :cond_41f
    const/4 v0, 0x0

    goto :goto_44d

    :cond_421
    array-length v4, v0

    if-nez v4, :cond_426

    const/4 v0, 0x0

    goto :goto_42a

    :cond_426
    array-length v4, v0

    sub-int/2addr v4, v1

    aget-object v0, v0, v4

    :goto_42a
    instance-of v4, v0, Landroid/os/Bundle;

    if-eqz v4, :cond_433

    check-cast v0, Landroid/os/Bundle;

    goto :goto_434

    :catchall_431
    move-exception v0

    goto :goto_447

    :cond_433
    const/4 v0, 0x0

    :goto_434
    if-eqz v0, :cond_41f

    const-string v4, "time"

    const-wide/16 v5, 0x0

    invoke-virtual {v0, v4, v5, v6}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0
    :try_end_442
    .catchall {:try_start_417 .. :try_end_442} :catchall_431

    cmp-long v4, v7, v5

    if-lez v4, :cond_41f

    goto :goto_44d

    :goto_447
    new-instance v4, LJO0;

    invoke-direct {v4, v0}, LJO0;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v4

    :goto_44d
    nop

    instance-of v4, v0, LJO0;

    if-eqz v4, :cond_453

    const/4 v0, 0x0

    :cond_453
    check-cast v0, Ljava/lang/Long;

    sget-object v15, Lcom/getmeera/android/automation/MeeraNotificationListener;->S:Lxc;

    monitor-enter v15

    :try_start_458
    invoke-virtual {v15}, Lxc;->d()I

    move-result v4

    invoke-virtual {v15, v4}, Ljava/util/AbstractList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v4

    :cond_460
    invoke-interface {v4}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v5

    if-eqz v5, :cond_486

    invoke-interface {v4}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, LIo1;

    iget-object v7, v6, LIo1;->a:Ljava/lang/String;

    invoke-static {v7, v2}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_482

    iget-object v6, v6, LIo1;->b:Ljava/lang/String;

    invoke-static {v6, v14}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_482

    move v6, v1

    goto :goto_483

    :catchall_47f
    move-exception v0

    goto/16 :goto_542

    :cond_482
    move v6, v12

    :goto_483
    if-eqz v6, :cond_460

    goto :goto_487

    :cond_486
    const/4 v5, 0x0

    :goto_487
    check-cast v5, LIo1;

    if-nez v5, :cond_48d

    :cond_48b
    move v4, v12

    goto :goto_49a

    :cond_48d
    if-eqz v0, :cond_499

    iget-wide v6, v5, LIo1;->c:J

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    cmp-long v4, v6, v16

    if-nez v4, :cond_48b

    :cond_499
    move v4, v1

    :goto_49a
    if-nez v4, :cond_4c9

    new-instance v10, LIo1;

    if-eqz v0, :cond_4a6

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    :goto_4a4
    move-wide v7, v4

    goto :goto_4ab

    :cond_4a6
    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPostTime()J

    move-result-wide v4

    goto :goto_4a4

    :goto_4ab
    move-object v4, v10

    move-object v5, v2

    move-object v6, v14

    move-object v0, v10

    move v10, v3

    invoke-direct/range {v4 .. v11}, LIo1;-><init>(Ljava/lang/String;Ljava/lang/String;JZZZ)V

    sget-object v2, Lcom/getmeera/android/automation/MeeraNotificationListener;->S:Lxc;

    invoke-virtual {v2, v0}, Lxc;->h(Ljava/lang/Object;)V

    :goto_4b8
    sget-object v2, Lcom/getmeera/android/automation/MeeraNotificationListener;->S:Lxc;

    iget v3, v2, Lxc;->P:I

    if-le v3, v13, :cond_4c2

    invoke-virtual {v2}, Lxc;->o()Ljava/lang/Object;

    goto :goto_4b8

    :cond_4c2
    if-nez p2, :cond_4c7

    invoke-static {v0}, LQG1;->b(LIo1;)V

    :cond_4c7
    move-object v5, v0

    goto :goto_4d9

    :cond_4c9
    if-eqz p2, :cond_4d8

    if-eqz v5, :cond_4d8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v5, v2, v3}, LQG1;->l(LIo1;J)Z

    move-result v0
    :try_end_4d5
    .catchall {:try_start_458 .. :try_end_4d5} :catchall_47f

    if-eqz v0, :cond_4d8

    goto :goto_4d9

    :cond_4d8
    const/4 v5, 0x0

    :goto_4d9
    monitor-exit v15

    if-eqz p2, :cond_541

    sget-object v0, LJo1;->a:Ljava/util/List;

    if-eqz v14, :cond_4f1

    invoke-static {v14}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4eb

    goto :goto_4f1

    :cond_4eb
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_4f3

    :cond_4f1
    :goto_4f1
    move v0, v12

    goto :goto_517

    :cond_4f3
    sget-object v2, LJo1;->a:Ljava/util/List;

    instance-of v3, v2, Ljava/util/Collection;

    if-eqz v3, :cond_500

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_500

    goto :goto_4f1

    :cond_500
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_504
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4f1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LrM0;

    invoke-virtual {v3, v0}, LrM0;->a(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_504

    move v0, v1

    :goto_517
    if-nez v0, :cond_541

    if-eqz v5, :cond_541

    iget-boolean v0, v5, LIo1;->e:Z

    xor-int/2addr v0, v1

    if-eqz v0, :cond_521

    goto :goto_522

    :cond_521
    const/4 v5, 0x0

    :goto_522
    if-eqz v5, :cond_541

    :try_start_524
    sget-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->N:LDU;

    if-eqz v0, :cond_52b

    invoke-interface {v0, v5}, LDU;->l(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_52b
    .catchall {:try_start_524 .. :try_end_52b} :catchall_52b

    :catchall_52b
    :cond_52b
    :try_start_52b
    sget-object v0, LNd;->a:LNd;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, LNd;->b:LiC;

    new-instance v2, LLd;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v5, v3}, LLd;-><init>(Landroid/content/Context;LIo1;LkC;)V

    const/4 v0, 0x3

    invoke-static {v1, v3, v12, v2, v0}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;
    :try_end_541
    .catchall {:try_start_52b .. :try_end_541} :catchall_541

    :catchall_541
    :cond_541
    return-void

    :goto_542
    monitor-exit v15

    throw v0

    :goto_544
    monitor-exit v6

    throw v0

    :cond_546
    :goto_546
    return-void

    nop

    :array_548
    .array-data 2
        0x2es
        0x2026s
    .end array-data
.end method

.method public final b()V
    .registers 4

    :try_start_0
    invoke-virtual {p0}, Landroid/service/notification/NotificationListenerService;->getActiveNotifications()[Landroid/service/notification/StatusBarNotification;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4} :catch_5

    goto :goto_a

    :catch_5
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    const/4 v0, 0x0

    :goto_a
    if-nez v0, :cond_d

    return-void

    :cond_d
    new-instance v1, LtW;

    const/16 v2, 0xd

    invoke-direct {v1, v2}, LtW;-><init>(I)V

    invoke-static {v0, v1}, LGc;->x([Ljava/lang/Object;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :catchall_1c
    :goto_1c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/service/notification/StatusBarNotification;

    const/4 v2, 0x0

    :try_start_29
    invoke-virtual {p0, v1, v2}, Lcom/getmeera/android/automation/MeeraNotificationListener;->a(Landroid/service/notification/StatusBarNotification;Z)V
    :try_end_2c
    .catchall {:try_start_29 .. :try_end_2c} :catchall_1c

    goto :goto_1c

    :cond_2d
    return-void
.end method

.method public final onDestroy()V
    .registers 2

    const/4 v0, 0x0

    sput-boolean v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->Y:Z

    sget-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->X:Lcom/getmeera/android/automation/MeeraNotificationListener;

    if-ne v0, p0, :cond_a

    const/4 v0, 0x0

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->X:Lcom/getmeera/android/automation/MeeraNotificationListener;

    :cond_a
    invoke-super {p0}, Landroid/service/notification/NotificationListenerService;->onDestroy()V

    return-void
.end method

.method public final onListenerConnected()V
    .registers 2

    sput-object p0, Lcom/getmeera/android/automation/MeeraNotificationListener;->X:Lcom/getmeera/android/automation/MeeraNotificationListener;

    const/4 v0, 0x1

    sput-boolean v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->Y:Z

    invoke-virtual {p0}, Lcom/getmeera/android/automation/MeeraNotificationListener;->b()V

    return-void
.end method

.method public final onListenerDisconnected()V
    .registers 3

    const/4 v0, 0x0

    sput-boolean v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->Y:Z

    sget-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->X:Lcom/getmeera/android/automation/MeeraNotificationListener;

    if-ne v0, p0, :cond_a

    const/4 v0, 0x0

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->X:Lcom/getmeera/android/automation/MeeraNotificationListener;

    :cond_a
    :try_start_a
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lcom/getmeera/android/automation/MeeraNotificationListener;

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {v0}, Landroid/service/notification/NotificationListenerService;->requestRebind(Landroid/content/ComponentName;)V
    :try_end_14
    .catchall {:try_start_a .. :try_end_14} :catchall_14

    :catchall_14
    return-void
.end method

.method public final onNotificationPosted(Landroid/service/notification/StatusBarNotification;)V
    .registers 3

    if-nez p1, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x1

    :try_start_4
    invoke-virtual {p0, p1, v0}, Lcom/getmeera/android/automation/MeeraNotificationListener;->a(Landroid/service/notification/StatusBarNotification;Z)V
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_8

    goto :goto_f

    :catchall_8
    move-exception v0

    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    :goto_f
    return-void
.end method

.method public final onNotificationRemoved(Landroid/service/notification/StatusBarNotification;)V
    .registers 4

    if-nez p1, :cond_3

    return-void

    :cond_3
    :try_start_3
    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_f

    iget-object p1, p1, Landroid/app/Notification;->category:Ljava/lang/String;

    goto :goto_10

    :catchall_d
    move-exception p1

    goto :goto_1b

    :cond_f
    move-object p1, v0

    :goto_10
    const-string v1, "call"

    invoke-static {p1, v1}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1e

    sput-object v0, Lcom/getmeera/android/automation/MeeraNotificationListener;->Q:LdE0;
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_d

    goto :goto_1e

    :goto_1b
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    :cond_1e
    :goto_1e
    return-void
.end method
