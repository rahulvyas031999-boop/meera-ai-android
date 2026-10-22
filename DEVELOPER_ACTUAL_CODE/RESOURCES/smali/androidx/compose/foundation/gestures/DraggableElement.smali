###### Class androidx.compose.foundation.gestures.DraggableElement (androidx.compose.foundation.gestures.DraggableElement)
.class public final Landroidx/compose/foundation/gestures/DraggableElement;
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
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001\u00a8\u0006\u0003"
    }
    d2 = {
        "Landroidx/compose/foundation/gestures/DraggableElement;",
        "LOv0;",
        "LRI;",
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
.field public final b:LSI;

.field public final c:LSC0;

.field public final d:Z

.field public final e:LKw0;

.field public final f:Z

.field public final g:LIU;

.field public final h:LIU;

.field public final i:Z


# direct methods
.method public constructor <init>(LSI;LSC0;ZLKw0;ZLIU;LIU;Z)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/compose/foundation/gestures/DraggableElement;->b:LSI;

    iput-object p2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->c:LSC0;

    iput-boolean p3, p0, Landroidx/compose/foundation/gestures/DraggableElement;->d:Z

    iput-object p4, p0, Landroidx/compose/foundation/gestures/DraggableElement;->e:LKw0;

    iput-boolean p5, p0, Landroidx/compose/foundation/gestures/DraggableElement;->f:Z

    iput-object p6, p0, Landroidx/compose/foundation/gestures/DraggableElement;->g:LIU;

    iput-object p7, p0, Landroidx/compose/foundation/gestures/DraggableElement;->h:LIU;

    iput-boolean p8, p0, Landroidx/compose/foundation/gestures/DraggableElement;->i:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-nez p1, :cond_8

    return v1

    :cond_8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-class v3, Landroidx/compose/foundation/gestures/DraggableElement;

    if-eq v3, v2, :cond_11

    return v1

    :cond_11
    check-cast p1, Landroidx/compose/foundation/gestures/DraggableElement;

    iget-object v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->b:LSI;

    iget-object v3, p1, Landroidx/compose/foundation/gestures/DraggableElement;->b:LSI;

    invoke-static {v2, v3}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1e

    return v1

    :cond_1e
    iget-object v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->c:LSC0;

    iget-object v3, p1, Landroidx/compose/foundation/gestures/DraggableElement;->c:LSC0;

    if-eq v2, v3, :cond_25

    return v1

    :cond_25
    iget-boolean v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->d:Z

    iget-boolean v3, p1, Landroidx/compose/foundation/gestures/DraggableElement;->d:Z

    if-eq v2, v3, :cond_2c

    return v1

    :cond_2c
    iget-object v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->e:LKw0;

    iget-object v3, p1, Landroidx/compose/foundation/gestures/DraggableElement;->e:LKw0;

    invoke-static {v2, v3}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_37

    return v1

    :cond_37
    iget-boolean v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->f:Z

    iget-boolean v3, p1, Landroidx/compose/foundation/gestures/DraggableElement;->f:Z

    if-eq v2, v3, :cond_3e

    return v1

    :cond_3e
    iget-object v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->g:LIU;

    iget-object v3, p1, Landroidx/compose/foundation/gestures/DraggableElement;->g:LIU;

    invoke-static {v2, v3}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_49

    return v1

    :cond_49
    iget-object v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->h:LIU;

    iget-object v3, p1, Landroidx/compose/foundation/gestures/DraggableElement;->h:LIU;

    invoke-static {v2, v3}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_54

    return v1

    :cond_54
    iget-boolean v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->i:Z

    iget-boolean p1, p1, Landroidx/compose/foundation/gestures/DraggableElement;->i:Z

    if-eq v2, p1, :cond_5b

    return v1

    :cond_5b
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Landroidx/compose/foundation/gestures/DraggableElement;->b:LSI;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->c:LSC0;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Landroidx/compose/foundation/gestures/DraggableElement;->d:Z

    invoke-static {v2, v1, v0}, LDe1;->f(IIZ)I

    move-result v0

    iget-object v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->e:LKw0;

    if-eqz v2, :cond_20

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_21

    :cond_20
    const/4 v2, 0x0

    :goto_21
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->f:Z

    invoke-static {v0, v1, v2}, LDe1;->f(IIZ)I

    move-result v0

    iget-object v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->g:LIU;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Landroidx/compose/foundation/gestures/DraggableElement;->h:LIU;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean v1, p0, Landroidx/compose/foundation/gestures/DraggableElement;->i:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v1, v0

    return v1
.end method

.method public final l()LHv0;
    .registers 6

    new-instance v0, LRI;

    sget-object v1, LJH;->S:LJH;

    iget-boolean v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->d:Z

    iget-object v3, p0, Landroidx/compose/foundation/gestures/DraggableElement;->e:LKw0;

    iget-object v4, p0, Landroidx/compose/foundation/gestures/DraggableElement;->c:LSC0;

    invoke-direct {v0, v1, v2, v3, v4}, LGI;-><init>(LDU;ZLKw0;LSC0;)V

    iget-object v1, p0, Landroidx/compose/foundation/gestures/DraggableElement;->b:LSI;

    iput-object v1, v0, LRI;->k0:LSI;

    iput-object v4, v0, LRI;->l0:LSC0;

    iget-boolean v1, p0, Landroidx/compose/foundation/gestures/DraggableElement;->f:Z

    iput-boolean v1, v0, LRI;->m0:Z

    iget-object v1, p0, Landroidx/compose/foundation/gestures/DraggableElement;->g:LIU;

    iput-object v1, v0, LRI;->n0:LIU;

    iget-object v1, p0, Landroidx/compose/foundation/gestures/DraggableElement;->h:LIU;

    iput-object v1, v0, LRI;->o0:LIU;

    iget-boolean v1, p0, Landroidx/compose/foundation/gestures/DraggableElement;->i:Z

    iput-boolean v1, v0, LRI;->p0:Z

    return-object v0
.end method

.method public final m(LHv0;)V
    .registers 8

    move-object v0, p1

    check-cast v0, LRI;

    sget-object v1, LJH;->S:LJH;

    iget-object p1, v0, LRI;->k0:LSI;

    iget-object v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->b:LSI;

    invoke-static {p1, v2}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    const/4 v3, 0x1

    if-nez p1, :cond_14

    iput-object v2, v0, LRI;->k0:LSI;

    move p1, v3

    goto :goto_15

    :cond_14
    const/4 p1, 0x0

    :goto_15
    iget-object v2, v0, LRI;->l0:LSC0;

    iget-object v4, p0, Landroidx/compose/foundation/gestures/DraggableElement;->c:LSC0;

    if-eq v2, v4, :cond_1e

    iput-object v4, v0, LRI;->l0:LSC0;

    move p1, v3

    :cond_1e
    iget-boolean v2, v0, LRI;->p0:Z

    iget-boolean v5, p0, Landroidx/compose/foundation/gestures/DraggableElement;->i:Z

    if-eq v2, v5, :cond_28

    iput-boolean v5, v0, LRI;->p0:Z

    move v5, v3

    goto :goto_29

    :cond_28
    move v5, p1

    :goto_29
    iget-object p1, p0, Landroidx/compose/foundation/gestures/DraggableElement;->g:LIU;

    iput-object p1, v0, LRI;->n0:LIU;

    iget-object p1, p0, Landroidx/compose/foundation/gestures/DraggableElement;->h:LIU;

    iput-object p1, v0, LRI;->o0:LIU;

    iget-boolean p1, p0, Landroidx/compose/foundation/gestures/DraggableElement;->f:Z

    iput-boolean p1, v0, LRI;->m0:Z

    iget-boolean v2, p0, Landroidx/compose/foundation/gestures/DraggableElement;->d:Z

    iget-object v3, p0, Landroidx/compose/foundation/gestures/DraggableElement;->e:LKw0;

    invoke-virtual/range {v0 .. v5}, LGI;->Y0(LDU;ZLKw0;LSC0;Z)V

    return-void
.end method
