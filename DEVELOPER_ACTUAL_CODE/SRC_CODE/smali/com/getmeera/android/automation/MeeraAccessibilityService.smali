###### Class com.getmeera.android.automation.MeeraAccessibilityService (com.getmeera.android.automation.MeeraAccessibilityService)
.class public final Lcom/getmeera/android/automation/MeeraAccessibilityService;
.super Landroid/accessibilityservice/AccessibilityService;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/getmeera/android/automation/MeeraAccessibilityService;",
        "Landroid/accessibilityservice/AccessibilityService;",
        "<init>",
        "()V",
        "Vj0",
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
.field public static volatile Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

.field public static volatile R:Ljava/lang/String;

.field public static final S:Ljava/util/concurrent/CopyOnWriteArrayList;


# instance fields
.field public final N:La91;

.field public final O:LYj0;

.field public volatile P:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    sput-object v0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->S:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroid/accessibilityservice/AccessibilityService;-><init>()V

    sget-object v0, LLV;->m0:LLV;

    new-instance v1, La91;

    invoke-direct {v1, v0}, La91;-><init>(LCU;)V

    iput-object v1, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->N:La91;

    new-instance v0, LYj0;

    invoke-direct {v0}, Landroid/content/BroadcastReceiver;-><init>()V

    iput-object v0, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->O:LYj0;

    return-void
.end method

.method public static final C(LZL0;Ljava/lang/StringBuilder;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 7

    if-nez p2, :cond_3

    return-void

    :cond_3
    iget v0, p0, LZL0;->N:I

    const/16 v1, 0x190

    if-le v0, v1, :cond_a

    return-void

    :cond_a
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_20

    invoke-static {v0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_21

    :cond_20
    move-object v0, v1

    :goto_21
    const-string v2, ""

    if-nez v0, :cond_26

    move-object v0, v2

    :cond_26
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_3a

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3a

    invoke-static {v3}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_3a
    if-nez v1, :cond_3d

    goto :goto_3e

    :cond_3d
    move-object v2, v1

    :goto_3e
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_45

    goto :goto_4b

    :cond_45
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_7b

    :goto_4b
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p2, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x7c

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v0, 0x2c

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v0, 0x3b

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v0, p0, LZL0;->N:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, LZL0;->N:I

    :cond_7b
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_80
    if-ge v1, v0, :cond_8c

    invoke-virtual {p2, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-static {p0, p1, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->C(LZL0;Ljava/lang/StringBuilder;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_80

    :cond_8c
    return-void
.end method

.method public static D(Lcom/getmeera/android/automation/MeeraAccessibilityService;LlC;)Ljava/lang/Object;
    .registers 6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/4 v2, 0x0

    if-ge v0, v1, :cond_b

    goto :goto_38

    :cond_b
    new-instance v0, Lqp;

    invoke-static {p1}, LlA1;->b(LkC;)LkC;

    move-result-object p1

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1}, Lqp;-><init>(ILkC;)V

    invoke-virtual {v0}, Lqp;->w()V

    :try_start_18
    iget-object p1, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->N:La91;

    invoke-virtual {p1}, La91;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ExecutorService;

    new-instance v1, LZj0;

    const/16 v3, 0x46

    invoke-direct {v1, v0, v3}, LZj0;-><init>(Lqp;I)V

    invoke-static {p0, p1, v1}, LF0;->v(Lcom/getmeera/android/automation/MeeraAccessibilityService;Ljava/util/concurrent/ExecutorService;Landroid/accessibilityservice/AccessibilityService$TakeScreenshotCallback;)V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_2a} :catch_2b

    goto :goto_34

    :catch_2b
    invoke-virtual {v0}, Lqp;->c()Z

    move-result p0

    if-eqz p0, :cond_34

    invoke-virtual {v0, v2}, Lqp;->k(Ljava/lang/Object;)V

    :cond_34
    :goto_34
    invoke-virtual {v0}, Lqp;->v()Ljava/lang/Object;

    move-result-object v2

    :goto_38
    return-object v2
.end method

.method public static F(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    .registers 4

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    const/high16 p1, 0x200000

    invoke-virtual {p0, p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(ILandroid/os/Bundle;)Z

    move-result p0

    return p0
.end method

.method public static L(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 12

    const-string v0, "\\s+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v1, " "

    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_3e

    return v1

    :cond_3e
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d3

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v2

    if-eqz v2, :cond_4d

    goto/16 :goto_d3

    :cond_4d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    int-to-double v2, v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    int-to-double v4, v4

    const-wide v6, 0x3feccccccccccccdL    # 0.9

    mul-double/2addr v4, v6

    cmpg-double v2, v2, v4

    if-gez v2, :cond_62

    return v0

    :cond_62
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    move v4, v0

    :goto_74
    if-ge v4, v2, :cond_91

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v8

    new-instance v9, LdE0;

    invoke-direct {v9, v5, v8}, LdE0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_74

    :cond_91
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_99

    move v2, v0

    goto :goto_c6

    :cond_99
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    move v2, v0

    :cond_9e
    :goto_9e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LdE0;

    iget-object v4, v3, LdE0;->N:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Character;

    invoke-virtual {v4}, Ljava/lang/Character;->charValue()C

    move-result v4

    iget-object v3, v3, LdE0;->O:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Character;

    invoke-virtual {v3}, Ljava/lang/Character;->charValue()C

    move-result v3

    if-ne v4, v3, :cond_9e

    add-int/lit8 v2, v2, 0x1

    if-ltz v2, :cond_c1

    goto :goto_9e

    :cond_c1
    invoke-static {}, Lov;->n()V

    const/4 p0, 0x0

    throw p0

    :cond_c6
    :goto_c6
    int-to-double v2, v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    int-to-double p0, p0

    mul-double/2addr p0, v6

    cmpl-double p0, v2, p0

    if-ltz p0, :cond_d2

    goto :goto_d3

    :cond_d2
    move v1, v0

    :cond_d3
    :goto_d3
    return v1
.end method

.method public static b(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/graphics/Rect;
    .registers 2

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    return-object v0
.end method

.method public static c(Landroid/view/accessibility/AccessibilityNodeInfo;)LFj;
    .registers 5

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result p0

    if-lez p0, :cond_27

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result p0

    if-gtz p0, :cond_19

    goto :goto_27

    :cond_19
    new-instance p0, LFj;

    iget v0, v1, Landroid/graphics/Rect;->left:I

    iget v2, v1, Landroid/graphics/Rect;->top:I

    iget v3, v1, Landroid/graphics/Rect;->right:I

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    invoke-direct {p0, v0, v2, v3, v1}, LFj;-><init>(IIII)V

    return-object p0

    :cond_27
    :goto_27
    return-object v0
.end method

.method public static final h(LDU;Ljava/util/ArrayList;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 6

    if-nez p2, :cond_3

    return-void

    :cond_3
    invoke-interface {p0, p2}, LDU;->l(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_12
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_17
    if-ge v1, v0, :cond_23

    invoke-virtual {p2, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-static {p0, p1, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->h(LDU;Ljava/util/ArrayList;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    :cond_23
    return-void
.end method

.method public static final j(Ljava/lang/StringBuilder;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 6

    if-nez p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    const/16 v1, 0xa

    const/4 v2, 0x0

    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2c

    invoke-static {v0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_23

    goto :goto_24

    :cond_23
    move-object v0, v2

    :goto_24
    if-eqz v0, :cond_2c

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2c
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_38

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_5d

    :cond_38
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_5d

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5d

    invoke-static {v0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5d

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_55

    move-object v2, v0

    :cond_55
    if-eqz v2, :cond_5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_5d
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_62
    if-ge v1, v0, :cond_6e

    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->j(Ljava/lang/StringBuilder;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_62

    :cond_6e
    return-void
.end method

.method public static final p(LbM0;Ljava/lang/String;LbM0;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 7

    if-nez p3, :cond_3

    return-void

    :cond_3
    iget-object v0, p0, LbM0;->N:Ljava/lang/Object;

    if-eqz v0, :cond_8

    return-void

    :cond_8
    invoke-virtual {p3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_1d

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1d

    invoke-static {v0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1e

    :cond_1d
    const/4 v0, 0x0

    :goto_1e
    if-eqz v0, :cond_36

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_29

    iput-object p3, p0, LbM0;->N:Ljava/lang/Object;

    return-void

    :cond_29
    iget-object v1, p2, LbM0;->N:Ljava/lang/Object;

    if-nez v1, :cond_36

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v0

    if-eqz v0, :cond_36

    iput-object p3, p2, LbM0;->N:Ljava/lang/Object;

    :cond_36
    invoke-virtual {p3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_3b
    if-ge v1, v0, :cond_47

    invoke-virtual {p3, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-static {p0, p1, p2, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->p(LbM0;Ljava/lang/String;LbM0;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3b

    :cond_47
    return-void
.end method

.method public static t(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x0

    if-eqz p0, :cond_28

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_28

    const/16 v1, 0x2f

    invoke-static {p0, v1, p0}, LE61;->i0(Ljava/lang/String;CLjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_28

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_28

    const-string v1, "0"

    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_28

    move-object v0, p0

    :cond_28
    return-object v0
.end method

.method public static w(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;
    .registers 5

    const-string v0, "(no label)"

    if-nez p0, :cond_5

    return-object v0

    :cond_5
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_28

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_28

    invoke-static {v1}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_28

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_23

    move-object v1, v2

    :cond_23
    if-nez v1, :cond_26

    goto :goto_28

    :cond_26
    move-object v0, v1

    goto :goto_4a

    :cond_28
    :goto_28
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p0

    if-eqz p0, :cond_46

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_46

    invoke-static {p0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_46

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_45

    goto :goto_46

    :cond_45
    move-object v2, p0

    :cond_46
    :goto_46
    if-nez v2, :cond_49

    goto :goto_4a

    :cond_49
    move-object v0, v2

    :goto_4a
    return-object v0
.end method

.method public static x(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;
    .registers 4

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    :try_start_4
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->refresh()Z

    move-result v1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_8} :catch_9

    goto :goto_a

    :catch_9
    const/4 v1, 0x0

    :goto_a
    if-nez v1, :cond_d

    return-object v0

    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isSelected()Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocused()Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    if-eqz p0, :cond_52

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_52

    invoke-static {p0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_54

    :cond_52
    const-string p0, "-"

    :cond_54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final A()LFj;
    .registers 5

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    new-instance v1, LFj;

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    const/4 v3, 0x0

    invoke-direct {v1, v3, v3, v2, v0}, LFj;-><init>(IIII)V

    return-object v1
.end method

.method public final B()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, LZL0;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->C(LZL0;Ljava/lang/StringBuilder;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final E(ZZ)Z
    .registers 10

    sget-object v0, LUc0;->q0:LUc0;

    invoke-virtual {p0, v0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->g(LDU;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_13

    const/4 v0, 0x0

    goto :goto_66

    :cond_13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1f

    :goto_1d
    move-object v0, v1

    goto :goto_66

    :cond_1f
    move-object v3, v1

    check-cast v3, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {v3}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->b(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/graphics/Rect;

    move-result-object v4

    if-eqz v4, :cond_2d

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    goto :goto_2e

    :cond_2d
    move v4, v2

    :goto_2e
    invoke-static {v3}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->b(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/graphics/Rect;

    move-result-object v3

    if-eqz v3, :cond_39

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    goto :goto_3a

    :cond_39
    move v3, v2

    :goto_3a
    mul-int/2addr v4, v3

    :cond_3b
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {v5}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->b(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/graphics/Rect;

    move-result-object v6

    if-eqz v6, :cond_4d

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    goto :goto_4e

    :cond_4d
    move v6, v2

    :goto_4e
    invoke-static {v5}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->b(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/graphics/Rect;

    move-result-object v5

    if-eqz v5, :cond_59

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    goto :goto_5a

    :cond_59
    move v5, v2

    :goto_5a
    mul-int/2addr v6, v5

    if-ge v4, v6, :cond_5f

    move-object v1, v3

    move v4, v6

    :cond_5f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_3b

    goto :goto_1d

    :goto_66
    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    if-nez v0, :cond_6b

    return v2

    :cond_6b
    const/16 v1, 0x1000

    if-nez p2, :cond_72

    if-eqz p1, :cond_72

    goto :goto_7e

    :cond_72
    const/16 v2, 0x2000

    if-nez p2, :cond_7a

    if-nez p1, :cond_7a

    :cond_78
    move v1, v2

    goto :goto_7e

    :cond_7a
    if-eqz p2, :cond_78

    if-eqz p1, :cond_78

    :goto_7e
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    move-result p1

    return p1
.end method

.method public final G(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;LkC;)Ljava/lang/Object;
    .registers 14

    instance-of v0, p3, Lbk0;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lbk0;

    iget v1, v0, Lbk0;->X:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lbk0;->X:I

    goto :goto_18

    :cond_13
    new-instance v0, Lbk0;

    invoke-direct {v0, p0, p3}, Lbk0;-><init>(Lcom/getmeera/android/automation/MeeraAccessibilityService;LkC;)V

    :goto_18
    iget-object p3, v0, Lbk0;->V:Ljava/lang/Object;

    sget-object v1, LaD;->N:LaD;

    iget v2, v0, Lbk0;->X:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_41

    if-eq v2, v4, :cond_33

    if-ne v2, v3, :cond_2b

    invoke-static {p3}, LYK1;->b(Ljava/lang/Object;)V

    goto/16 :goto_a9

    :cond_2b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_33
    iget p1, v0, Lbk0;->U:I

    iget p2, v0, Lbk0;->T:I

    iget-object v2, v0, Lbk0;->S:Ljava/lang/String;

    iget-object v5, v0, Lbk0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iget-object v6, v0, Lbk0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    invoke-static {p3}, LYK1;->b(Ljava/lang/Object;)V

    goto :goto_78

    :cond_41
    invoke-static {p3}, LYK1;->b(Ljava/lang/Object;)V

    if-nez p1, :cond_49

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1

    :cond_49
    invoke-static {p1, p2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->F(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_52

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1

    :cond_52
    const/4 p3, 0x4

    const/4 v2, 0x0

    move-object v6, p0

    move-object v9, p2

    move-object p2, p1

    move p1, v2

    move-object v2, v0

    move-object v0, v9

    :goto_5a
    if-ge p1, p3, :cond_ac

    if-lez p1, :cond_7d

    iput-object v6, v2, Lbk0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    iput-object p2, v2, Lbk0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iput-object v0, v2, Lbk0;->S:Ljava/lang/String;

    iput p3, v2, Lbk0;->T:I

    iput p1, v2, Lbk0;->U:I

    iput v4, v2, Lbk0;->X:I

    const-wide/16 v7, 0x96

    invoke-static {v7, v8, v2}, LyK1;->a(JLkC;)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v1, :cond_73

    return-object v1

    :cond_73
    move-object v5, p2

    move p2, p3

    move-object v9, v2

    move-object v2, v0

    move-object v0, v9

    :goto_78
    move p3, p2

    move-object p2, v5

    move-object v9, v2

    move-object v2, v0

    move-object v0, v9

    :cond_7d
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->refresh()Z

    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    const/4 v7, 0x0

    if-eqz v5, :cond_8c

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_8d

    :cond_8c
    move-object v5, v7

    :goto_8d
    if-nez v5, :cond_91

    const-string v5, ""

    :cond_91
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->L(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_aa

    iput-object v7, v2, Lbk0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    iput-object v7, v2, Lbk0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iput-object v7, v2, Lbk0;->S:Ljava/lang/String;

    iput v3, v2, Lbk0;->X:I

    invoke-virtual {v6, p2, v0, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->s(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;LkC;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_a9

    return-object v1

    :cond_a9
    :goto_a9
    return-object p3

    :cond_aa
    add-int/2addr p1, v4

    goto :goto_5a

    :cond_ac
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1
.end method

.method public final H(FFFFJ)Z
    .registers 13

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    invoke-virtual {v1, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v1, p3, p4}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance p1, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {p1}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance p2, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v2, 0x0

    move-object v0, p2

    move-wide v4, p5

    invoke-direct/range {v0 .. v5}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {p1, p2}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p2}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z

    move-result p1

    return p1
.end method

.method public final I(FF)Z
    .registers 9

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    invoke-virtual {v1, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    new-instance p1, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {p1}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance p2, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x3c

    move-object v0, p2

    invoke-direct/range {v0 .. v5}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {p1, p2}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p2}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z

    move-result p1

    return p1
.end method

.method public final J(Landroid/view/accessibility/AccessibilityNodeInfo;JLkC;)Ljava/lang/Object;
    .registers 13

    instance-of v0, p4, Lck0;

    if-eqz v0, :cond_13

    move-object v0, p4

    check-cast v0, Lck0;

    iget v1, v0, Lck0;->X:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lck0;->X:I

    goto :goto_18

    :cond_13
    new-instance v0, Lck0;

    invoke-direct {v0, p0, p4}, Lck0;-><init>(Lcom/getmeera/android/automation/MeeraAccessibilityService;LkC;)V

    :goto_18
    iget-object p4, v0, Lck0;->V:Ljava/lang/Object;

    sget-object v1, LaD;->N:LaD;

    iget v2, v0, Lck0;->X:I

    const/4 v3, 0x1

    if-eqz v2, :cond_3c

    if-ne v2, v3, :cond_34

    iget-wide p1, v0, Lck0;->U:J

    iget-object p3, v0, Lck0;->T:Ljava/lang/String;

    iget-object v2, v0, Lck0;->S:Ljava/lang/String;

    iget-object v4, v0, Lck0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iget-object v5, v0, Lck0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    invoke-static {p4}, LYK1;->b(Ljava/lang/Object;)V

    move-object p4, v2

    move-object v2, p3

    move-object p3, v4

    goto :goto_7a

    :cond_34
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3c
    invoke-static {p4}, LYK1;->b(Ljava/lang/Object;)V

    if-nez p1, :cond_44

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1

    :cond_44
    invoke-virtual {p0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->B()Ljava/lang/String;

    move-result-object p4

    invoke-static {p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->x(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->f(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v4

    if-nez v4, :cond_55

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1

    :cond_55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    add-long/2addr v4, p2

    move-object p3, p1

    move-wide p1, v4

    move-object v5, p0

    :cond_5d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long v4, v6, p1

    if-gez v4, :cond_96

    iput-object v5, v0, Lck0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    iput-object p3, v0, Lck0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iput-object p4, v0, Lck0;->S:Ljava/lang/String;

    iput-object v2, v0, Lck0;->T:Ljava/lang/String;

    iput-wide p1, v0, Lck0;->U:J

    iput v3, v0, Lck0;->X:I

    const-wide/16 v6, 0x78

    invoke-static {v6, v7, v0}, LyK1;->a(JLkC;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v1, :cond_7a

    return-object v1

    :cond_7a
    :goto_7a
    invoke-virtual {v5}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->B()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_87

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p1

    :cond_87
    invoke-static {p3}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->x(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_93

    invoke-virtual {v4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5d

    :cond_93
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p1

    :cond_96
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1
.end method

.method public final K(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .registers 4

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    :try_start_4
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->refresh()Z

    move-result v1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_8} :catch_9

    goto :goto_a

    :catch_9
    move v1, v0

    :goto_a
    if-nez v1, :cond_d

    return v0

    :cond_d
    invoke-static {p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->c(Landroid/view/accessibility/AccessibilityNodeInfo;)LFj;

    move-result-object p1

    if-eqz p1, :cond_31

    invoke-virtual {p0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->A()LFj;

    move-result-object v1

    invoke-virtual {p1, v1}, LFj;->a(LFj;)LFj;

    move-result-object p1

    invoke-virtual {p1}, LFj;->i()Z

    move-result v1

    if-eqz v1, :cond_22

    return v0

    :cond_22
    invoke-virtual {p1}, LFj;->d()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, LFj;->e()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, v0, p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->I(FF)Z

    move-result p1

    return p1

    :cond_31
    return v0
.end method

.method public final M(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;LRg1;LkC;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    instance-of v2, v1, Ldk0;

    if-eqz v2, :cond_19

    move-object v2, v1

    check-cast v2, Ldk0;

    iget v3, v2, Ldk0;->Z:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_19

    sub-int/2addr v3, v4

    iput v3, v2, Ldk0;->Z:I

    move-object/from16 v3, p0

    goto :goto_20

    :cond_19
    new-instance v2, Ldk0;

    move-object/from16 v3, p0

    invoke-direct {v2, v3, v1}, Ldk0;-><init>(Lcom/getmeera/android/automation/MeeraAccessibilityService;LkC;)V

    :goto_20
    iget-object v1, v2, Ldk0;->X:Ljava/lang/Object;

    sget-object v4, LaD;->N:LaD;

    iget v5, v2, Ldk0;->Z:I

    const/4 v9, 0x3

    const/4 v10, 0x4

    const/4 v11, 0x2

    const/4 v12, 0x1

    const/4 v13, 0x0

    if-eqz v5, :cond_72

    if-eq v5, v12, :cond_6e

    if-eq v5, v11, :cond_54

    if-eq v5, v9, :cond_42

    if-ne v5, v10, :cond_3a

    invoke-static {v1}, LYK1;->b(Ljava/lang/Object;)V

    goto/16 :goto_19c

    :cond_3a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_42
    iget v0, v2, Ldk0;->W:I

    iget v5, v2, Ldk0;->V:I

    iget-object v8, v2, Ldk0;->S:Ljava/lang/String;

    iget-object v11, v2, Ldk0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iget-object v14, v2, Ldk0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    invoke-static {v1}, LYK1;->b(Ljava/lang/Object;)V

    move-object v1, v8

    move v8, v0

    move v0, v9

    goto/16 :goto_169

    :cond_54
    iget v0, v2, Ldk0;->W:I

    iget v5, v2, Ldk0;->V:I

    iget-object v14, v2, Ldk0;->U:Ljava/lang/StringBuilder;

    iget-object v15, v2, Ldk0;->T:LRg1;

    iget-object v8, v2, Ldk0;->S:Ljava/lang/String;

    iget-object v10, v2, Ldk0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iget-object v9, v2, Ldk0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    invoke-static {v1}, LYK1;->b(Ljava/lang/Object;)V

    move v6, v0

    move-object v1, v8

    move-object v0, v10

    move v13, v11

    move-object v8, v2

    move-object v10, v9

    move-object v2, v15

    goto/16 :goto_13d

    :cond_6e
    invoke-static {v1}, LYK1;->b(Ljava/lang/Object;)V

    goto :goto_c1

    :cond_72
    invoke-static {v1}, LYK1;->b(Ljava/lang/Object;)V

    if-nez v0, :cond_7a

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    :cond_7a
    invoke-virtual {v0, v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v5

    move-object v14, v1

    move-object v8, v2

    move-object v10, v3

    const/4 v9, 0x0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    :goto_8e
    if-ge v9, v5, :cond_144

    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v15

    int-to-char v15, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    new-instance v11, Landroid/os/Bundle;

    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    const-string v6, "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE"

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v6, v7}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    const/high16 v6, 0x200000

    invoke-virtual {v0, v6, v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(ILandroid/os/Bundle;)Z

    move-result v6

    if-nez v6, :cond_c2

    iput-object v13, v8, Ldk0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    iput-object v13, v8, Ldk0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iput-object v13, v8, Ldk0;->S:Ljava/lang/String;

    iput-object v13, v8, Ldk0;->T:LRg1;

    iput-object v13, v8, Ldk0;->U:Ljava/lang/StringBuilder;

    iput v12, v8, Ldk0;->Z:I

    invoke-virtual {v10, v0, v1, v8}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->G(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;LkC;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v4, :cond_c1

    return-object v4

    :cond_c1
    :goto_c1
    return-object v1

    :cond_c2
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v6, 0x20

    if-ne v15, v6, :cond_dc

    sget-object v6, LIK0;->N:LHK0;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LIK0;->O:LZ;

    move-object v11, v14

    const-wide/16 v13, 0x50

    move-object/from16 p1, v8

    const-wide/16 v7, 0xa0

    invoke-virtual {v6, v13, v14, v7, v8}, LIK0;->f(JJ)J

    move-result-wide v6

    goto :goto_102

    :cond_dc
    move-object/from16 p1, v8

    move-object v11, v14

    const/16 v6, 0xa

    if-ne v15, v6, :cond_f3

    sget-object v6, LIK0;->N:LHK0;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LIK0;->O:LZ;

    const-wide/16 v7, 0x12c

    const-wide/16 v13, 0x96

    invoke-virtual {v6, v13, v14, v7, v8}, LIK0;->f(JJ)J

    move-result-wide v6

    goto :goto_102

    :cond_f3
    sget-object v6, LIK0;->N:LHK0;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LIK0;->O:LZ;

    const-wide/16 v7, 0x28

    const-wide/16 v13, 0x6e

    invoke-virtual {v6, v7, v8, v13, v14}, LIK0;->f(JJ)J

    move-result-wide v6

    :goto_102
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    if-eqz v8, :cond_11b

    if-eq v8, v12, :cond_112

    const/4 v13, 0x2

    if-ne v8, v13, :cond_115

    long-to-double v6, v6

    const-wide/high16 v13, 0x3fe0000000000000L    # 0.5

    :goto_110
    mul-double/2addr v6, v13

    double-to-long v6, v6

    :cond_112
    move-object/from16 v8, p1

    goto :goto_122

    :cond_115
    new-instance v0, Lmw;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0

    :cond_11b
    long-to-double v6, v6

    const-wide v13, 0x3ffccccccccccccdL    # 1.8

    goto :goto_110

    :goto_122
    iput-object v10, v8, Ldk0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    iput-object v0, v8, Ldk0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iput-object v1, v8, Ldk0;->S:Ljava/lang/String;

    iput-object v2, v8, Ldk0;->T:LRg1;

    iput-object v11, v8, Ldk0;->U:Ljava/lang/StringBuilder;

    iput v9, v8, Ldk0;->V:I

    iput v5, v8, Ldk0;->W:I

    const/4 v13, 0x2

    iput v13, v8, Ldk0;->Z:I

    invoke-static {v6, v7, v8}, LyK1;->a(JLkC;)Ljava/lang/Object;

    move-result-object v6

    if-ne v6, v4, :cond_13a

    return-object v4

    :cond_13a
    move v6, v5

    move v5, v9

    move-object v14, v11

    :goto_13d
    add-int/lit8 v9, v5, 0x1

    move v5, v6

    move v11, v13

    const/4 v13, 0x0

    goto/16 :goto_8e

    :cond_144
    move-object v11, v0

    move-object v2, v8

    move-object v14, v10

    const/4 v5, 0x4

    const/4 v8, 0x0

    :goto_149
    if-ge v8, v5, :cond_1a1

    if-lez v8, :cond_168

    iput-object v14, v2, Ldk0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    iput-object v11, v2, Ldk0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iput-object v1, v2, Ldk0;->S:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, v2, Ldk0;->T:LRg1;

    iput-object v0, v2, Ldk0;->U:Ljava/lang/StringBuilder;

    iput v5, v2, Ldk0;->V:I

    iput v8, v2, Ldk0;->W:I

    const/4 v0, 0x3

    iput v0, v2, Ldk0;->Z:I

    const-wide/16 v9, 0x96

    invoke-static {v9, v10, v2}, LyK1;->a(JLkC;)Ljava/lang/Object;

    move-result-object v6

    if-ne v6, v4, :cond_16b

    return-object v4

    :cond_168
    const/4 v0, 0x3

    :goto_169
    const-wide/16 v9, 0x96

    :cond_16b
    invoke-virtual {v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->refresh()Z

    invoke-virtual {v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    if-eqz v6, :cond_179

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_17a

    :cond_179
    const/4 v6, 0x0

    :goto_17a
    if-nez v6, :cond_17e

    const-string v6, ""

    :cond_17e
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6, v1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->L(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_19d

    const/4 v6, 0x0

    iput-object v6, v2, Ldk0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    iput-object v6, v2, Ldk0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iput-object v6, v2, Ldk0;->S:Ljava/lang/String;

    iput-object v6, v2, Ldk0;->T:LRg1;

    iput-object v6, v2, Ldk0;->U:Ljava/lang/StringBuilder;

    const/4 v7, 0x4

    iput v7, v2, Ldk0;->Z:I

    invoke-virtual {v14, v11, v1, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->s(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;LkC;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v4, :cond_19c

    return-object v4

    :cond_19c
    :goto_19c
    return-object v1

    :cond_19d
    const/4 v6, 0x0

    const/4 v7, 0x4

    add-int/2addr v8, v12

    goto :goto_149

    :cond_1a1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0
.end method

.method public final N(JJLCU;LkC;)Ljava/lang/Object;
    .registers 13

    instance-of v0, p6, Lek0;

    if-eqz v0, :cond_13

    move-object v0, p6

    check-cast v0, Lek0;

    iget v1, v0, Lek0;->V:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lek0;->V:I

    goto :goto_18

    :cond_13
    new-instance v0, Lek0;

    invoke-direct {v0, p0, p6}, Lek0;-><init>(Lcom/getmeera/android/automation/MeeraAccessibilityService;LkC;)V

    :goto_18
    iget-object p6, v0, Lek0;->T:Ljava/lang/Object;

    sget-object v1, LaD;->N:LaD;

    iget v2, v0, Lek0;->V:I

    const/4 v3, 0x1

    if-eqz v2, :cond_35

    if-ne v2, v3, :cond_2d

    iget-wide p1, v0, Lek0;->R:J

    iget-wide p3, v0, Lek0;->Q:J

    iget-object p5, v0, Lek0;->S:LCU;

    invoke-static {p6}, LYK1;->b(Ljava/lang/Object;)V

    goto :goto_3e

    :cond_2d
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_35
    invoke-static {p6}, LYK1;->b(Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    add-long/2addr v4, p1

    move-wide p1, v4

    :cond_3e
    :goto_3e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long p6, v4, p1

    if-gez p6, :cond_5c

    invoke-interface {p5}, LCU;->a()Ljava/lang/Object;

    move-result-object p6

    if-eqz p6, :cond_4d

    return-object p6

    :cond_4d
    iput-object p5, v0, Lek0;->S:LCU;

    iput-wide p3, v0, Lek0;->Q:J

    iput-wide p1, v0, Lek0;->R:J

    iput v3, v0, Lek0;->V:I

    invoke-static {p3, p4, v0}, LyK1;->a(JLkC;)Ljava/lang/Object;

    move-result-object p6

    if-ne p6, v1, :cond_3e

    return-object v1

    :cond_5c
    const/4 p1, 0x0

    return-object p1
.end method

.method public final a()Ljava/util/ArrayList;
    .registers 6

    sget-object v0, LUc0;->o0:LUc0;

    invoke-virtual {p0, v0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->g(LDU;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_35

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {p0, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->u(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_23

    goto :goto_2f

    :cond_23
    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->d(Landroid/view/accessibility/AccessibilityNodeInfo;I)Lsp;

    move-result-object v3

    if-eqz v3, :cond_2f

    new-instance v4, LVj0;

    invoke-direct {v4, v2, v3}, LVj0;-><init>(Landroid/view/accessibility/AccessibilityNodeInfo;Lsp;)V

    :cond_2f
    :goto_2f
    if-eqz v4, :cond_f

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_35
    return-object v1
.end method

.method public final d(Landroid/view/accessibility/AccessibilityNodeInfo;I)Lsp;
    .registers 17

    invoke-static {p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->c(Landroid/view/accessibility/AccessibilityNodeInfo;)LFj;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    :cond_8
    new-instance v13, Lsp;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_16

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v4, v2

    goto :goto_17

    :cond_16
    move-object v4, v1

    :goto_17
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_21

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_21
    move-object v5, v1

    invoke-static {p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->t(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->A()LFj;

    move-result-object v1

    invoke-virtual {v0, v1}, LFj;->a(LFj;)LFj;

    move-result-object v7

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v8

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result v9

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    move-result v10

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isCheckable()Z

    move-result v11

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v12

    move-object v2, v13

    move/from16 v3, p2

    invoke-direct/range {v2 .. v12}, Lsp;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;LFj;ZZZZZ)V

    return-object v13
.end method

.method public final e(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .registers 13

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v1

    const/16 v2, 0x10

    if-eqz v1, :cond_17

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {p1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    move-result p1

    return p1

    :cond_17
    invoke-static {p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->c(Landroid/view/accessibility/AccessibilityNodeInfo;)LFj;

    move-result-object v1

    invoke-virtual {p0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->A()LFj;

    move-result-object v3

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    move v4, v0

    :goto_24
    if-eqz p1, :cond_97

    const/4 v5, 0x5

    if-ge v4, v5, :cond_97

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v5

    if-eqz v5, :cond_92

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    move-result v5

    if-eqz v5, :cond_92

    invoke-static {p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->c(Landroid/view/accessibility/AccessibilityNodeInfo;)LFj;

    move-result-object v4

    if-eqz v1, :cond_8d

    if-eqz v4, :cond_8d

    invoke-virtual {v4}, LFj;->i()Z

    move-result v5

    if-eqz v5, :cond_46

    goto :goto_8c

    :cond_46
    invoke-virtual {v1}, LFj;->d()I

    move-result v5

    invoke-virtual {v1}, LFj;->e()I

    move-result v1

    invoke-virtual {v4, v5, v1}, LFj;->b(II)Z

    move-result v1

    if-nez v1, :cond_55

    goto :goto_8c

    :cond_55
    invoke-virtual {v3}, LFj;->c()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v1, v5, v7

    if-gtz v1, :cond_60

    goto :goto_8d

    :cond_60
    invoke-virtual {v4}, LFj;->c()J

    move-result-wide v5

    long-to-double v5, v5

    invoke-virtual {v3}, LFj;->c()J

    move-result-wide v7

    long-to-double v7, v7

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v7, v9

    cmpl-double v1, v5, v7

    if-lez v1, :cond_72

    goto :goto_8c

    :cond_72
    invoke-virtual {v3}, LFj;->f()I

    move-result v1

    if-lez v1, :cond_8d

    invoke-virtual {v4}, LFj;->f()I

    move-result v1

    int-to-double v4, v1

    invoke-virtual {v3}, LFj;->f()I

    move-result v1

    int-to-double v6, v1

    const-wide v8, 0x3fe3333333333333L    # 0.6

    mul-double/2addr v6, v8

    cmpl-double v1, v4, v6

    if-lez v1, :cond_8d

    :goto_8c
    return v0

    :cond_8d
    :goto_8d
    invoke-virtual {p1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    move-result p1

    return p1

    :cond_92
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    goto :goto_24

    :cond_97
    return v0
.end method

.method public final f(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .registers 3

    invoke-virtual {p0, p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->e(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p1, 0x1

    return p1

    :cond_8
    invoke-virtual {p0, p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->K(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result p1

    return p1
.end method

.method public final g(LDU;)Ljava/util/ArrayList;
    .registers 4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->h(LDU;Ljava/util/ArrayList;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    return-object v0
.end method

.method public final i()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->j(Ljava/lang/StringBuilder;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LE61;->q0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final k()Ljava/lang/String;
    .registers 7

    :try_start_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getWindows()Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityWindowInfo;->getType()I

    move-result v4

    if-ne v4, v3, :cond_d

    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_25
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_3e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v5}, Landroid/view/accessibility/AccessibilityWindowInfo;->isFocused()Z

    move-result v5

    if-eqz v5, :cond_29

    goto :goto_3f

    :cond_3e
    move-object v2, v4

    :goto_3f
    check-cast v2, Landroid/view/accessibility/AccessibilityWindowInfo;

    if-nez v2, :cond_5f

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_47
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityWindowInfo;->isActive()Z

    move-result v2

    if-eqz v2, :cond_47

    goto :goto_5c

    :cond_5b
    move-object v1, v4

    :goto_5c
    move-object v2, v1

    check-cast v2, Landroid/view/accessibility/AccessibilityWindowInfo;
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5f} :catch_85

    :cond_5f
    if-eqz v2, :cond_71

    :try_start_61
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityWindowInfo;->getRoot()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_71

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_71

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_71} :catch_71

    :catch_71
    :cond_71
    if-eqz v4, :cond_82

    :try_start_73
    invoke-static {v4}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7a

    goto :goto_82

    :cond_7a
    const-string v0, "inputmethod"

    invoke-static {v4, v0, v3}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v0

    if-eqz v0, :cond_87

    :cond_82
    :goto_82
    sget-object v4, Lcom/getmeera/android/automation/MeeraAccessibilityService;->R:Ljava/lang/String;
    :try_end_84
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_84} :catch_85

    goto :goto_87

    :catch_85
    sget-object v4, Lcom/getmeera/android/automation/MeeraAccessibilityService;->R:Ljava/lang/String;

    :cond_87
    :goto_87
    return-object v4
.end method

.method public final l(Ljava/util/List;JLDU;)Z
    .registers 12

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_9

    const/4 p1, 0x0

    return p1

    :cond_9
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    invoke-static {p1}, Lnv;->E(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LdE0;

    iget-object v0, v0, LdE0;->N:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-static {p1}, Lnv;->E(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LdE0;

    iget-object v2, v2, LdE0;->O:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lnv;->z(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_36
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_56

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LdE0;

    iget-object v2, v0, LdE0;->N:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    iget-object v0, v0, LdE0;->O:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_36

    :cond_56
    new-instance p1, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {p1}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance v6, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v2, 0x0

    move-object v0, v6

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {p1, v6}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object p1

    :try_start_6c
    new-instance p2, LWj0;

    invoke-direct {p2, p4}, LWj0;-><init>(LDU;)V

    const/4 p3, 0x0

    invoke-virtual {p0, p1, p2, p3}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_7a
    .catchall {:try_start_6c .. :try_end_7a} :catchall_7b

    goto :goto_82

    :catchall_7b
    move-exception p1

    new-instance p2, LJO0;

    invoke-direct {p2, p1}, LJO0;-><init>(Ljava/lang/Throwable;)V

    move-object p1, p2

    :goto_82
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    instance-of p3, p1, LJO0;

    if-eqz p3, :cond_89

    move-object p1, p2

    :cond_89
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1
.end method

.method public final m(Ljava/lang/String;)Ljava/util/List;
    .registers 3

    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_11

    invoke-static {p1}, Lnv;->g0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    goto :goto_13

    :cond_11
    sget-object p1, LnL;->N:LnL;

    :goto_13
    return-object p1
.end method

.method public final n(Ljava/lang/String;)Ljava/util/List;
    .registers 3

    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_11

    invoke-static {p1}, Lnv;->g0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    goto :goto_13

    :cond_11
    sget-object p1, LnL;->N:LnL;

    :goto_13
    return-object p1
.end method

.method public final o(Ljava/lang/String;)Landroid/view/accessibility/AccessibilityNodeInfo;
    .registers 5

    new-instance v0, LbM0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, LbM0;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-static {v0, p1, v1, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->p(LbM0;Ljava/lang/String;LbM0;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    iget-object p1, v0, LbM0;->N:Ljava/lang/Object;

    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    if-nez p1, :cond_1b

    iget-object p1, v1, LbM0;->N:Ljava/lang/Object;

    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    :cond_1b
    return-object p1
.end method

.method public final onAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 8

    if-eqz p1, :cond_b7

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_b7

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getPackageName()Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_b7

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_b7

    invoke-static {p1}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const/4 v2, 0x0

    if-eqz v0, :cond_20

    goto :goto_21

    :cond_20
    move-object p1, v2

    :goto_21
    if-eqz p1, :cond_b7

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_51

    const-string v0, "com.android.systemui"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_51

    const-string v0, "inputmethod"

    invoke-static {p1, v0, v1}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v0

    if-nez v0, :cond_51

    const-string v0, ".ime"

    invoke-static {p1, v0, v3}, LM61;->u(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_51

    const-string v0, ".ime."

    invoke-static {p1, v0, v3}, LE61;->C(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v0

    if-eqz v0, :cond_4f

    goto :goto_51

    :cond_4f
    move v0, v3

    goto :goto_52

    :cond_51
    :goto_51
    move v0, v1

    :goto_52
    if-nez v0, :cond_75

    sget-object v4, Lcom/getmeera/android/automation/MeeraAccessibilityService;->R:Ljava/lang/String;

    invoke-static {v4, p1}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    xor-int/2addr v4, v1

    sput-object p1, Lcom/getmeera/android/automation/MeeraAccessibilityService;->R:Ljava/lang/String;

    if-eqz v4, :cond_75

    sget-object v4, Lcom/getmeera/android/automation/MeeraAccessibilityService;->S:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v4}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :catchall_65
    :goto_65
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_75

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LDU;

    :try_start_71
    invoke-interface {v5, p1}, LDU;->l(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_74
    .catchall {:try_start_71 .. :try_end_74} :catchall_65

    goto :goto_65

    :cond_75
    :try_start_75
    sget-object v4, LXb;->a:Ljava/lang/String;

    if-eqz v0, :cond_85

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_85

    move v0, v1

    goto :goto_86

    :cond_85
    move v0, v3

    :goto_86
    invoke-static {p0, p1, v0}, LXb;->a(Landroid/content/Context;Ljava/lang/String;Z)V
    :try_end_89
    .catchall {:try_start_75 .. :try_end_89} :catchall_89

    :catchall_89
    const-string v0, "com.instagram.android"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b7

    sget-object p1, LWL0;->a:LWL0;

    sget-object v0, LWL0;->c:Ll51;

    if-eqz v0, :cond_9e

    invoke-virtual {v0}, Lh70;->c()Z

    move-result v0

    if-ne v0, v1, :cond_9e

    goto :goto_b7

    :cond_9e
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, LWL0;->j(Landroid/content/Context;)V

    invoke-static {}, LWL0;->f()Z

    move-result p1

    if-nez p1, :cond_ac

    goto :goto_b7

    :cond_ac
    sget-object p1, LWL0;->b:LiC;

    new-instance v1, LRL0;

    invoke-direct {v1, v0, v2}, LRL0;-><init>(Landroid/content/Context;LkC;)V

    const/4 v0, 0x3

    invoke-static {p1, v2, v3, v1, v0}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    :cond_b7
    :goto_b7
    return-void
.end method

.method public final onDestroy()V
    .registers 2

    sget-object v0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    if-ne v0, p0, :cond_7

    const/4 v0, 0x0

    sput-object v0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    :cond_7
    :try_start_7
    iget-object v0, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->N:La91;

    invoke-virtual {v0}, La91;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_12

    :catchall_12
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public final onInterrupt()V
    .registers 1

    return-void
.end method

.method public final onServiceConnected()V
    .registers 4

    invoke-super {p0}, Landroid/accessibilityservice/AccessibilityService;->onServiceConnected()V

    sput-object p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    const-string v0, "A11Y connected"

    :try_start_7
    sget-object v1, LO4;->a:Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, LO4;->b(Landroid/content/Context;)V

    invoke-static {v0}, LO4;->c(Ljava/lang/String;)V
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_13

    :catchall_13
    iget-boolean v0, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->P:Z

    if-eqz v0, :cond_18

    goto :goto_34

    :cond_18
    :try_start_18
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_2c

    iget-object v1, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->O:LYj0;

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_31

    :cond_2c
    iget-object v1, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->O:LYj0;

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :goto_31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->P:Z
    :try_end_34
    .catchall {:try_start_18 .. :try_end_34} :catchall_34

    :catchall_34
    :goto_34
    sget-object v0, LWL0;->a:LWL0;

    invoke-virtual {v0, p0}, LWL0;->j(Landroid/content/Context;)V

    return-void
.end method

.method public final onUnbind(Landroid/content/Intent;)Z
    .registers 4

    const-string v0, "A11Y unbound"

    :try_start_2
    sget-object v1, LO4;->a:Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, LO4;->b(Landroid/content/Context;)V

    invoke-static {v0}, LO4;->c(Ljava/lang/String;)V
    :try_end_e
    .catchall {:try_start_2 .. :try_end_e} :catchall_e

    :catchall_e
    iget-boolean v0, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->P:Z

    if-eqz v0, :cond_17

    :try_start_12
    iget-object v0, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->O:LYj0;

    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_17
    .catchall {:try_start_12 .. :try_end_17} :catchall_17

    :catchall_17
    :cond_17
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->P:Z

    sget-object v0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    if-ne v0, p0, :cond_21

    const/4 v0, 0x0

    sput-object v0, Lcom/getmeera/android/automation/MeeraAccessibilityService;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    :cond_21
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result p1

    return p1
.end method

.method public final q(Ljava/lang/String;)Landroid/view/accessibility/AccessibilityNodeInfo;
    .registers 3

    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_13

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_13

    invoke-static {p1}, Lnv;->G(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    goto :goto_14

    :cond_13
    const/4 p1, 0x0

    :goto_14
    return-object p1
.end method

.method public final r()Landroid/view/accessibility/AccessibilityNodeInfo;
    .registers 8

    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    :cond_8
    const/4 v2, 0x1

    :try_start_9
    invoke-virtual {v0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->findFocus(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_20

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-virtual {p0, v0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->u(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v2
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_19} :catch_20

    if-eqz v2, :cond_1c

    goto :goto_1d

    :cond_1c
    move-object v0, v1

    :goto_1d
    if-eqz v0, :cond_20

    return-object v0

    :catch_20
    :cond_20
    sget-object v0, LUc0;->p0:LUc0;

    invoke-virtual {p0, v0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->g(LDU;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2f
    :goto_2f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_46

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {p0, v5}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->u(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v5

    if-eqz v5, :cond_2f

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    :cond_46
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_4a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocused()Z

    move-result v5

    if-eqz v5, :cond_4a

    goto :goto_5f

    :cond_5e
    move-object v4, v1

    :goto_5f
    check-cast v4, Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz v4, :cond_64

    return-object v4

    :cond_64
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_6f

    goto :goto_a7

    :cond_6f
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_7a

    goto :goto_a7

    :cond_7a
    move-object v3, v1

    check-cast v3, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {v3}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->c(Landroid/view/accessibility/AccessibilityNodeInfo;)LFj;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_89

    invoke-virtual {v3}, LFj;->e()I

    move-result v3

    goto :goto_8a

    :cond_89
    move v3, v4

    :cond_8a
    :goto_8a
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {v6}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->c(Landroid/view/accessibility/AccessibilityNodeInfo;)LFj;

    move-result-object v6

    if-eqz v6, :cond_9c

    invoke-virtual {v6}, LFj;->e()I

    move-result v6

    goto :goto_9d

    :cond_9c
    move v6, v4

    :goto_9d
    if-ge v3, v6, :cond_a1

    move-object v1, v5

    move v3, v6

    :cond_a1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_8a

    :goto_a7
    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz v1, :cond_ac

    return-object v1

    :cond_ac
    invoke-static {v0}, Lnv;->G(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    return-object v0
.end method

.method public final s(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;LkC;)Ljava/lang/Object;
    .registers 16

    instance-of v0, p3, LXj0;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, LXj0;

    iget v1, v0, LXj0;->X:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, LXj0;->X:I

    goto :goto_18

    :cond_13
    new-instance v0, LXj0;

    invoke-direct {v0, p0, p3}, LXj0;-><init>(Lcom/getmeera/android/automation/MeeraAccessibilityService;LkC;)V

    :goto_18
    iget-object p3, v0, LXj0;->V:Ljava/lang/Object;

    sget-object v1, LaD;->N:LaD;

    iget v2, v0, LXj0;->X:I

    const-string v3, ""

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_4a

    if-eq v2, v6, :cond_40

    if-ne v2, v5, :cond_38

    iget p1, v0, LXj0;->U:I

    iget p2, v0, LXj0;->T:I

    iget-object v2, v0, LXj0;->S:Ljava/lang/String;

    iget-object v7, v0, LXj0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iget-object v8, v0, LXj0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    invoke-static {p3}, LYK1;->b(Ljava/lang/Object;)V

    goto/16 :goto_b6

    :cond_38
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_40
    iget-object p2, v0, LXj0;->S:Ljava/lang/String;

    iget-object p1, v0, LXj0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iget-object v2, v0, LXj0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    invoke-static {p3}, LYK1;->b(Ljava/lang/Object;)V

    goto :goto_5f

    :cond_4a
    invoke-static {p3}, LYK1;->b(Ljava/lang/Object;)V

    iput-object p0, v0, LXj0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    iput-object p1, v0, LXj0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iput-object p2, v0, LXj0;->S:Ljava/lang/String;

    iput v6, v0, LXj0;->X:I

    const-wide/16 v7, 0x2bc

    invoke-static {v7, v8, v0}, LyK1;->a(JLkC;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_5e

    return-object v1

    :cond_5e
    move-object v2, p0

    :goto_5f
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->refresh()Z

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object p3

    if-eqz p3, :cond_6d

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_6e

    :cond_6d
    move-object p3, v4

    :goto_6e
    if-nez p3, :cond_71

    move-object p3, v3

    :cond_71
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p3, p2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->L(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_7d

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p1

    :cond_7d
    new-instance p3, Landroid/os/Bundle;

    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    const-string v7, "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE"

    invoke-virtual {p3, v7, p2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    const/high16 v7, 0x200000

    invoke-virtual {p1, v7, p3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(ILandroid/os/Bundle;)Z

    move-result p3

    if-nez p3, :cond_95

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1

    :cond_95
    const/4 p3, 0x4

    const/4 v7, 0x0

    move-object v8, v2

    move-object v2, p2

    move p2, p3

    move v11, v7

    move-object v7, p1

    move p1, v11

    :goto_9d
    if-ge p1, p2, :cond_d6

    if-lez p1, :cond_b6

    iput-object v8, v0, LXj0;->Q:Lcom/getmeera/android/automation/MeeraAccessibilityService;

    iput-object v7, v0, LXj0;->R:Landroid/view/accessibility/AccessibilityNodeInfo;

    iput-object v2, v0, LXj0;->S:Ljava/lang/String;

    iput p2, v0, LXj0;->T:I

    iput p1, v0, LXj0;->U:I

    iput v5, v0, LXj0;->X:I

    const-wide/16 v9, 0x96

    invoke-static {v9, v10, v0}, LyK1;->a(JLkC;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_b6

    return-object v1

    :cond_b6
    :goto_b6
    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->refresh()Z

    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object p3

    if-eqz p3, :cond_c4

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_c5

    :cond_c4
    move-object p3, v4

    :goto_c5
    if-nez p3, :cond_c8

    move-object p3, v3

    :cond_c8
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p3, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->L(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_d4

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p1

    :cond_d4
    add-int/2addr p1, v6

    goto :goto_9d

    :cond_d6
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1
.end method

.method public final u(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .registers 4

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isVisibleToUser()Z

    move-result v1

    if-nez v1, :cond_b

    return v0

    :cond_b
    invoke-static {p1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->c(Landroid/view/accessibility/AccessibilityNodeInfo;)LFj;

    move-result-object p1

    if-nez p1, :cond_12

    return v0

    :cond_12
    invoke-virtual {p0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->A()LFj;

    move-result-object v0

    invoke-virtual {p1, v0}, LFj;->h(LFj;)Z

    move-result p1

    return p1
.end method

.method public final v(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 5

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->y(Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    xor-int/2addr v0, v2

    if-eqz v0, :cond_d

    return-object v1

    :cond_d
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->y(Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public final y(Ljava/lang/String;Z)Ljava/util/ArrayList;
    .registers 8

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lp50;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lp50;-><init>(Lcom/getmeera/android/automation/MeeraAccessibilityService;I)V

    invoke-virtual {p0, v1}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->g(LDU;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_13
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz p2, :cond_27

    invoke-virtual {p0, v2}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->u(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v3

    if-eqz v3, :cond_13

    :cond_27
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/getmeera/android/automation/MeeraAccessibilityService;->d(Landroid/view/accessibility/AccessibilityNodeInfo;I)Lsp;

    move-result-object v3

    if-nez v3, :cond_32

    goto :goto_13

    :cond_32
    new-instance v4, LVj0;

    invoke-direct {v4, v2, v3}, LVj0;-><init>(Landroid/view/accessibility/AccessibilityNodeInfo;Lsp;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_3b
    new-instance p2, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {v0, v1}, Lpv;->p(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {p2, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LVj0;

    iget-object v2, v2, LVj0;->b:Lsp;

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4a

    :cond_5c
    invoke-static {p1, p2}, LLz1;->d(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/List;

    move-result-object p1

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_69
    :goto_69
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_85

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LER0;

    iget-object v1, v1, LER0;->a:Lsp;

    iget v1, v1, Lsp;->a:I

    invoke-static {v1, v0}, Lnv;->H(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LVj0;

    if-eqz v1, :cond_69

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_69

    :cond_85
    return-object p2
.end method

.method public final z()Ljava/lang/String;
    .registers 3

    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    if-eqz v1, :cond_11

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_11

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_11} :catch_11

    :catch_11
    :cond_11
    return-object v0
.end method
