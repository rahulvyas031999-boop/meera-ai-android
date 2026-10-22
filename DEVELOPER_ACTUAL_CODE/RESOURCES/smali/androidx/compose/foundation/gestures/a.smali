###### Class androidx.compose.foundation.gestures.a (androidx.compose.foundation.gestures.a)
.class public abstract Landroidx/compose/foundation/gestures/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LPS0;

.field public static final b:LjH;

.field public static final c:LQS0;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, LPS0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/compose/foundation/gestures/a;->a:LPS0;

    new-instance v0, LjH;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, LjH;-><init>(I)V

    sput-object v0, Landroidx/compose/foundation/gestures/a;->b:LjH;

    new-instance v0, LQS0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/compose/foundation/gestures/a;->c:LQS0;

    return-void
.end method

.method public static final a(LoT0;JLkC;)Ljava/lang/Object;
    .registers 15

    instance-of v0, p3, LRS0;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, LRS0;

    iget v1, v0, LRS0;->T:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, LRS0;->T:I

    goto :goto_18

    :cond_13
    new-instance v0, LRS0;

    invoke-direct {v0, p3}, LlC;-><init>(LkC;)V

    :goto_18
    iget-object p3, v0, LRS0;->S:Ljava/lang/Object;

    sget-object v1, LaD;->N:LaD;

    iget v2, v0, LRS0;->T:I

    const/4 v3, 0x1

    if-eqz v2, :cond_35

    if-ne v2, v3, :cond_2d

    iget-object p0, v0, LRS0;->R:LYL0;

    iget-object p1, v0, LRS0;->Q:LoT0;

    invoke-static {p3}, LYK1;->b(Ljava/lang/Object;)V

    move-object p3, p0

    move-object p0, p1

    goto :goto_56

    :cond_2d
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_35
    invoke-static {p3}, LYK1;->b(Ljava/lang/Object;)V

    new-instance p3, LYL0;

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    sget-object v2, Lqx0;->N:Lqx0;

    new-instance v10, LSS0;

    const/4 v9, 0x0

    move-object v4, v10

    move-object v5, p0

    move-wide v6, p1

    move-object v8, p3

    invoke-direct/range {v4 .. v9}, LSS0;-><init>(LoT0;JLYL0;LkC;)V

    iput-object p0, v0, LRS0;->Q:LoT0;

    iput-object p3, v0, LRS0;->R:LYL0;

    iput v3, v0, LRS0;->T:I

    invoke-virtual {p0, v2, v10, v0}, LoT0;->e(Lqx0;LHU;LkC;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_56

    goto :goto_61

    :cond_56
    :goto_56
    iget p1, p3, LYL0;->N:F

    invoke-virtual {p0, p1}, LoT0;->g(F)J

    move-result-wide p0

    new-instance v1, LFA0;

    invoke-direct {v1, p0, p1}, LFA0;-><init>(J)V

    :goto_61
    return-object v1
.end method

.method public static final b(LIv0;LeT0;LSC0;LCD0;ZZLVE;LKw0;Lsk;)LIv0;
    .registers 19

    new-instance v9, Landroidx/compose/foundation/gestures/ScrollableElement;

    move-object v0, v9

    move-object/from16 v1, p8

    move-object/from16 v2, p6

    move-object/from16 v3, p7

    move-object v4, p2

    move-object v5, p3

    move-object v6, p1

    move v7, p4

    move v8, p5

    invoke-direct/range {v0 .. v8}, Landroidx/compose/foundation/gestures/ScrollableElement;-><init>(Lsk;LVE;LKw0;LSC0;LCD0;LeT0;ZZ)V

    move-object v0, p0

    invoke-interface {p0, v9}, LIv0;->j(LIv0;)LIv0;

    move-result-object v0

    return-object v0
.end method
