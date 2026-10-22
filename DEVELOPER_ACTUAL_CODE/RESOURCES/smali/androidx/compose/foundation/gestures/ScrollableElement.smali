###### Class androidx.compose.foundation.gestures.ScrollableElement (androidx.compose.foundation.gestures.ScrollableElement)
.class final Landroidx/compose/foundation/gestures/ScrollableElement;
.super LOv0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "LOv0;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001\u00a8\u0006\u0003"
    }
    d2 = {
        "Landroidx/compose/foundation/gestures/ScrollableElement;",
        "LOv0;",
        "LdT0;",
        "foundation_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
.end annotation


# instance fields
.field public final b:LeT0;

.field public final c:LSC0;

.field public final d:LCD0;

.field public final e:Z

.field public final f:Z

.field public final g:LVE;

.field public final h:LKw0;

.field public final i:Lsk;


# direct methods
.method public constructor <init>(Lsk;LVE;LKw0;LSC0;LCD0;LeT0;ZZ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p6, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->b:LeT0;

    iput-object p4, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->c:LSC0;

    iput-object p5, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->d:LCD0;

    iput-boolean p7, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->e:Z

    iput-boolean p8, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->f:Z

    iput-object p2, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->g:LVE;

    iput-object p3, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->h:LKw0;

    iput-object p1, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->i:Lsk;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Landroidx/compose/foundation/gestures/ScrollableElement;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Landroidx/compose/foundation/gestures/ScrollableElement;

    iget-object v1, p1, Landroidx/compose/foundation/gestures/ScrollableElement;->b:LeT0;

    iget-object v3, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->b:LeT0;

    invoke-static {v3, v1}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->c:LSC0;

    iget-object v3, p1, Landroidx/compose/foundation/gestures/ScrollableElement;->c:LSC0;

    if-eq v1, v3, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->d:LCD0;

    iget-object v3, p1, Landroidx/compose/foundation/gestures/ScrollableElement;->d:LCD0;

    invoke-static {v1, v3}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget-boolean v1, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->e:Z

    iget-boolean v3, p1, Landroidx/compose/foundation/gestures/ScrollableElement;->e:Z

    if-eq v1, v3, :cond_30

    return v2

    :cond_30
    iget-boolean v1, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->f:Z

    iget-boolean v3, p1, Landroidx/compose/foundation/gestures/ScrollableElement;->f:Z

    if-eq v1, v3, :cond_37

    return v2

    :cond_37
    iget-object v1, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->g:LVE;

    iget-object v3, p1, Landroidx/compose/foundation/gestures/ScrollableElement;->g:LVE;

    invoke-static {v1, v3}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    return v2

    :cond_42
    iget-object v1, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->h:LKw0;

    iget-object v3, p1, Landroidx/compose/foundation/gestures/ScrollableElement;->h:LKw0;

    invoke-static {v1, v3}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4d

    return v2

    :cond_4d
    iget-object v1, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->i:Lsk;

    iget-object p1, p1, Landroidx/compose/foundation/gestures/ScrollableElement;->i:Lsk;

    invoke-static {v1, p1}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_58

    return v2

    :cond_58
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->b:LeT0;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->c:LSC0;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    const/4 v0, 0x0

    iget-object v3, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->d:LCD0;

    if-eqz v3, :cond_1b

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto :goto_1c

    :cond_1b
    move v3, v0

    :goto_1c
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-boolean v3, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->e:Z

    invoke-static {v2, v1, v3}, LDe1;->f(IIZ)I

    move-result v2

    iget-boolean v3, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->f:Z

    invoke-static {v2, v1, v3}, LDe1;->f(IIZ)I

    move-result v2

    iget-object v3, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->g:LVE;

    if-eqz v3, :cond_33

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto :goto_34

    :cond_33
    move v3, v0

    :goto_34
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object v3, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->h:LKw0;

    if-eqz v3, :cond_3f

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto :goto_40

    :cond_3f
    move v3, v0

    :goto_40
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object v1, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->i:Lsk;

    if-eqz v1, :cond_4a

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_4a
    add-int/2addr v2, v0

    return v2
.end method

.method public final l()LHv0;
    .registers 11

    new-instance v9, LdT0;

    iget-boolean v7, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->e:Z

    iget-boolean v8, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->f:Z

    iget-object v6, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->b:LeT0;

    iget-object v5, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->d:LCD0;

    iget-object v2, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->g:LVE;

    iget-object v4, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->c:LSC0;

    iget-object v3, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->h:LKw0;

    iget-object v1, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->i:Lsk;

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, LdT0;-><init>(Lsk;LVE;LKw0;LSC0;LCD0;LeT0;ZZ)V

    return-object v9
.end method

.method public final m(LHv0;)V
    .registers 13

    check-cast p1, LdT0;

    iget-boolean v0, p1, LGI;->e0:Z

    iget-boolean v2, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->e:Z

    const/4 v1, 0x1

    const/4 v3, 0x0

    if-eq v0, v2, :cond_14

    iget-object v0, p1, LdT0;->q0:LUS0;

    iput-boolean v2, v0, LUS0;->O:Z

    iget-object v0, p1, LdT0;->n0:LOS0;

    iput-boolean v2, v0, LOS0;->a0:Z

    move v6, v1

    goto :goto_15

    :cond_14
    move v6, v3

    :goto_15
    iget-object v0, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->g:LVE;

    if-nez v0, :cond_1c

    iget-object v4, p1, LdT0;->o0:LVE;

    goto :goto_1d

    :cond_1c
    move-object v4, v0

    :goto_1d
    iget-object v5, p1, LdT0;->p0:LoT0;

    iget-object v7, v5, LoT0;->a:LeT0;

    iget-object v8, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->b:LeT0;

    invoke-static {v7, v8}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2c

    iput-object v8, v5, LoT0;->a:LeT0;

    move v3, v1

    :cond_2c
    iget-object v7, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->d:LCD0;

    iput-object v7, v5, LoT0;->b:LCD0;

    iget-object v8, v5, LoT0;->d:LSC0;

    iget-object v9, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->c:LSC0;

    if-eq v8, v9, :cond_39

    iput-object v9, v5, LoT0;->d:LSC0;

    move v3, v1

    :cond_39
    iget-boolean v8, v5, LoT0;->e:Z

    iget-boolean v10, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->f:Z

    if-eq v8, v10, :cond_43

    iput-boolean v10, v5, LoT0;->e:Z

    move v8, v1

    goto :goto_44

    :cond_43
    move v8, v3

    :goto_44
    iput-object v4, v5, LoT0;->c:LVE;

    iget-object v1, p1, LdT0;->m0:Lzy0;

    iput-object v1, v5, LoT0;->f:Lzy0;

    iget-object v1, p1, LdT0;->r0:LcB;

    iput-object v9, v1, LcB;->a0:LSC0;

    iput-boolean v10, v1, LcB;->c0:Z

    iget-object v3, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->i:Lsk;

    iput-object v3, v1, LcB;->d0:Lsk;

    iput-object v7, p1, LdT0;->k0:LCD0;

    iput-object v0, p1, LdT0;->l0:LVE;

    sget-object v0, Landroidx/compose/foundation/gestures/a;->a:LPS0;

    sget-object v1, LNQ0;->a0:LNQ0;

    iget-object v0, v5, LoT0;->d:LSC0;

    sget-object v3, LSC0;->N:LSC0;

    if-ne v0, v3, :cond_64

    move-object v4, v3

    goto :goto_67

    :cond_64
    sget-object v0, LSC0;->O:LSC0;

    move-object v4, v0

    :goto_67
    iget-object v3, p0, Landroidx/compose/foundation/gestures/ScrollableElement;->h:LKw0;

    move-object v0, p1

    move v5, v8

    invoke-virtual/range {v0 .. v5}, LGI;->Y0(LDU;ZLKw0;LSC0;Z)V

    if-eqz v6, :cond_78

    const/4 v0, 0x0

    iput-object v0, p1, LdT0;->s0:Lx;

    iput-object v0, p1, LdT0;->t0:LcT0;

    invoke-static {p1}, LeM1;->b(LUU0;)V

    :cond_78
    return-void
.end method
