###### Class com.getmeera.android.ui.facelock.WatchmanActivity (com.getmeera.android.ui.facelock.WatchmanActivity)
.class public final Lcom/getmeera/android/ui/facelock/WatchmanActivity;
.super Lxw;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0006\u00b2\u0006\u000c\u0010\u0005\u001a\u00020\u00048\nX\u008a\u0084\u0002"
    }
    d2 = {
        "Lcom/getmeera/android/ui/facelock/WatchmanActivity;",
        "Lxw;",
        "<init>",
        "()V",
        "hn1",
        "s",
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
.field public static volatile o0:Lcom/getmeera/android/ui/facelock/WatchmanActivity;


# instance fields
.field public final h0:LO51;

.field public final i0:LiC;

.field public final j0:Ltn1;

.field public volatile k0:Ljava/util/List;

.field public volatile l0:J

.field public volatile m0:J

.field public volatile n0:Z


# direct methods
.method public constructor <init>()V
    .registers 8

    invoke-direct {p0}, Lxw;-><init>()V

    new-instance v6, Lhn1;

    const/4 v2, 0x0

    const/4 v5, 0x0

    const-string v3, "Starting\u2026"

    const/4 v1, 0x0

    const-string v4, ""

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lhn1;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v6}, LLz1;->a(Ljava/lang/Object;)LO51;

    move-result-object v0

    iput-object v0, p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->h0:LO51;

    invoke-static {}, Lrz1;->a()LF71;

    move-result-object v0

    sget-object v1, LpH;->a:LgF;

    invoke-static {v0, v1}, LgK1;->b(LSC;LSC;)LSC;

    move-result-object v0

    invoke-static {v0}, LnK1;->a(LSC;)LiC;

    move-result-object v0

    iput-object v0, p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->i0:LiC;

    new-instance v0, Ltn1;

    invoke-direct {v0}, Ltn1;-><init>()V

    iput-object v0, p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->j0:Ltn1;

    sget-object v0, LnL;->N:LnL;

    iput-object v0, p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->k0:Ljava/util/List;

    return-void
.end method

.method public static final m(Lcom/getmeera/android/ui/facelock/WatchmanActivity;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLon1;Lon1;LGy;I)V
    .registers 66

    move-object/from16 v1, p0

    move/from16 v3, p2

    move/from16 v5, p4

    move-object/from16 v4, p9

    move-object/from16 v0, p10

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v6, -0x7f7c309d

    invoke-virtual {v0, v6}, LGy;->c0(I)LGy;

    invoke-static {}, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->getLocalLifecycleOwner()LbK0;

    move-result-object v6

    invoke-virtual {v0, v6}, LGy;->l(LbK0;)Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, LRd0;

    sget-object v6, Lfh1;->a:Lfh1;

    new-instance v7, Lkn1;

    const/4 v9, 0x0

    invoke-direct {v7, v1, v9}, Lkn1;-><init>(Lcom/getmeera/android/ui/facelock/WatchmanActivity;LkC;)V

    invoke-static {v0, v7, v6}, Lbu1;->c(LGy;LHU;Ljava/lang/Object;)V

    sget-object v6, LFv0;->b:LFv0;

    sget-object v7, Landroidx/compose/foundation/layout/c;->c:Landroidx/compose/foundation/layout/FillElement;

    sget-wide v10, Luv;->b:J

    sget-object v15, Lez1;->a:LNL0;

    invoke-static {v7, v10, v11, v15}, Landroidx/compose/foundation/a;->b(LIv0;JLSY0;)LIv0;

    move-result-object v16

    const v7, -0x8e4ffc2

    invoke-virtual {v0, v7}, LGy;->a0(I)V

    invoke-virtual/range {p10 .. p10}, LGy;->P()Ljava/lang/Object;

    move-result-object v7

    sget-object v10, LBy;->a:LfM1;

    if-ne v7, v10, :cond_47

    invoke-static/range {p10 .. p10}, Lpf;->c(LGy;)LKw0;

    move-result-object v7

    :cond_47
    move-object/from16 v17, v7

    check-cast v17, LKw0;

    const/4 v14, 0x0

    invoke-virtual {v0, v14}, LGy;->r(Z)V

    const v7, -0x8e4f85e

    invoke-virtual {v0, v7}, LGy;->a0(I)V

    const/high16 v7, 0xe000000

    and-int v7, p11, v7

    const/high16 v11, 0x6000000

    xor-int/2addr v7, v11

    const/high16 v12, 0x4000000

    if-le v7, v12, :cond_66

    invoke-virtual {v0, v4}, LGy;->g(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6a

    :cond_66
    and-int v7, p11, v11

    if-ne v7, v12, :cond_6c

    :cond_6a
    const/4 v7, 0x1

    goto :goto_6d

    :cond_6c
    move v7, v14

    :goto_6d
    invoke-virtual/range {p10 .. p10}, LGy;->P()Ljava/lang/Object;

    move-result-object v11

    if-nez v7, :cond_75

    if-ne v11, v10, :cond_7f

    :cond_75
    new-instance v11, Lb4;

    const/16 v7, 0x16

    invoke-direct {v11, v4, v7}, Lb4;-><init>(LCU;I)V

    invoke-virtual {v0, v11}, LGy;->k0(Ljava/lang/Object;)V

    :cond_7f
    move-object/from16 v21, v11

    check-cast v21, LCU;

    invoke-virtual {v0, v14}, LGy;->r(Z)V

    const/16 v19, 0x0

    const/16 v22, 0x1c

    const/16 v18, 0x0

    const/16 v20, 0x0

    invoke-static/range {v16 .. v22}, Landroidx/compose/foundation/a;->d(LIv0;LKw0;Lk40;ZLxP0;LCU;I)LIv0;

    move-result-object v7

    const/16 v10, 0x12

    int-to-float v10, v10

    invoke-static {v7, v10}, Landroidx/compose/foundation/layout/a;->k(LIv0;F)LIv0;

    move-result-object v7

    sget-object v10, LCr;->b0:LNh;

    sget-object v11, Lvc;->c:LXW;

    const/16 v12, 0x30

    invoke-static {v11, v10, v0, v12}, LMv;->a(Luc;LNh;LGy;I)LOv;

    move-result-object v10

    iget v11, v0, LGy;->P:I

    invoke-virtual/range {p10 .. p10}, LGy;->n()LyF0;

    move-result-object v9

    invoke-static {v0, v7}, LrJ1;->c(LGy;LIv0;)LIv0;

    move-result-object v7

    sget-object v16, Lwy;->f:Lvy;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lvy;->b:LLV;

    iget-object v13, v0, LGy;->a:Llc;

    instance-of v13, v13, Llc;

    if-eqz v13, :cond_500

    invoke-virtual/range {p10 .. p10}, LGy;->e0()V

    iget-boolean v14, v0, LGy;->O:Z

    if-eqz v14, :cond_c5

    invoke-virtual {v0, v2}, LGy;->m(LCU;)V

    goto :goto_c8

    :cond_c5
    invoke-virtual/range {p10 .. p10}, LGy;->n0()V

    :goto_c8
    sget-object v14, Lvy;->f:Luy;

    invoke-static {v0, v14, v10}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    sget-object v10, Lvy;->e:Luy;

    invoke-static {v0, v10, v9}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    sget-object v9, Lvy;->g:Luy;

    iget-boolean v12, v0, LGy;->O:Z

    if-nez v12, :cond_e6

    invoke-virtual/range {p10 .. p10}, LGy;->P()Ljava/lang/Object;

    move-result-object v12

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v12, v4}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_e9

    :cond_e6
    invoke-static {v11, v0, v11, v9}, LXm;->o(ILGy;ILuy;)V

    :cond_e9
    sget-object v4, Lvy;->d:Luy;

    invoke-static {v0, v4, v7}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    sget-object v7, LCr;->Y:LOh;

    sget-object v11, Lvc;->a:LCr;

    const/16 v12, 0x30

    invoke-static {v11, v7, v0, v12}, LRP0;->b(Lsc;LOh;LGy;I)LSP0;

    move-result-object v7

    iget v11, v0, LGy;->P:I

    invoke-virtual/range {p10 .. p10}, LGy;->n()LyF0;

    move-result-object v12

    move-object/from16 v32, v8

    invoke-static {v0, v6}, LrJ1;->c(LGy;LIv0;)LIv0;

    move-result-object v8

    if-eqz v13, :cond_4fa

    invoke-virtual/range {p10 .. p10}, LGy;->e0()V

    move/from16 v19, v13

    iget-boolean v13, v0, LGy;->O:Z

    if-eqz v13, :cond_113

    invoke-virtual {v0, v2}, LGy;->m(LCU;)V

    goto :goto_116

    :cond_113
    invoke-virtual/range {p10 .. p10}, LGy;->n0()V

    :goto_116
    invoke-static {v0, v14, v7}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    invoke-static {v0, v10, v12}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    iget-boolean v7, v0, LGy;->O:Z

    if-nez v7, :cond_12e

    invoke-virtual/range {p10 .. p10}, LGy;->P()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v7, v12}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_131

    :cond_12e
    invoke-static {v11, v0, v11, v9}, LXm;->o(ILGy;ILuy;)V

    :cond_131
    invoke-static {v0, v4, v8}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    const/16 v7, 0xa

    int-to-float v7, v7

    invoke-static {v6, v7}, Landroidx/compose/foundation/layout/c;->l(LIv0;F)LIv0;

    move-result-object v7

    sget-object v8, LJP0;->a:LIP0;

    invoke-static {v7, v8}, LzI1;->a(LIv0;LSY0;)LIv0;

    move-result-object v7

    if-nez p5, :cond_14d

    const-wide v11, 0xffef4444L

    invoke-static {v11, v12}, LZI1;->c(J)J

    move-result-wide v11

    goto :goto_14f

    :cond_14d
    sget-wide v11, Luv;->c:J

    :goto_14f
    invoke-static {v7, v11, v12, v15}, Landroidx/compose/foundation/a;->b(LIv0;JLSY0;)LIv0;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {v7, v0, v8}, LXj;->a(LIv0;LGy;I)V

    const/16 v7, 0x8

    int-to-float v13, v7

    invoke-static {v6, v13}, Landroidx/compose/foundation/layout/c;->p(LIv0;F)LIv0;

    move-result-object v7

    invoke-static {v0, v7}, LIu1;->a(LGy;LIv0;)V

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v11, "WATCHMAN \u00b7 "

    invoke-direct {v7, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v12, p1

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    sget-wide v34, Luv;->d:J

    invoke-static {}, LCr;->F()LJc1;

    move-result-object v26

    const/16 v29, 0x0

    const v30, 0xfffa

    const/4 v7, 0x0

    const-wide/16 v20, 0x0

    move-object/from16 v36, v10

    move-wide/from16 v10, v20

    const/16 v17, 0x0

    const/16 v37, 0x30

    move-object/from16 v12, v17

    move/from16 v39, v13

    move/from16 v38, v19

    move-object/from16 v13, v17

    const/16 v16, 0x0

    move-object/from16 v40, v14

    move-object/from16 v14, v16

    const-wide/16 v16, 0x0

    move-object/from16 v41, v15

    move-wide/from16 v15, v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v28, 0x180

    move-object/from16 v42, v6

    move-object/from16 v6, v33

    move-object/from16 v44, v9

    move-object/from16 v43, v32

    const/16 v32, 0x0

    move-wide/from16 v8, v34

    move-object/from16 v27, p10

    invoke-static/range {v6 .. v30}, Ltc1;->b(Ljava/lang/String;LIv0;JJLWT;LaU;LAT;JLzb1;Ltb1;JIZIILDU;LJc1;LGy;III)V

    const/4 v8, 0x1

    invoke-virtual {v0, v8}, LGy;->r(Z)V

    const/16 v6, 0xc

    int-to-float v9, v6

    move-object/from16 v7, v42

    invoke-static {v7, v9}, Landroidx/compose/foundation/layout/c;->f(LIv0;F)LIv0;

    move-result-object v6

    invoke-static {v0, v6}, LIu1;->a(LGy;LIv0;)V

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v7, v6}, Landroidx/compose/foundation/layout/c;->d(LIv0;F)LIv0;

    move-result-object v10

    const/high16 v11, 0x3f400000    # 0.75f

    invoke-static {v10, v11}, Landroidx/compose/foundation/layout/a;->d(LIv0;F)LIv0;

    move-result-object v10

    const/16 v11, 0x18

    int-to-float v11, v11

    invoke-static {v11}, LJP0;->b(F)LIP0;

    move-result-object v12

    invoke-static {v10, v12}, LzI1;->a(LIv0;LSY0;)LIv0;

    move-result-object v10

    const-wide v12, 0xff0d1321L

    invoke-static {v12, v13}, LZI1;->c(J)J

    move-result-wide v12

    move-object/from16 v14, v41

    invoke-static {v10, v12, v13, v14}, Landroidx/compose/foundation/a;->b(LIv0;JLSY0;)LIv0;

    move-result-object v10

    sget-object v12, LCr;->S:LPh;

    const/4 v15, 0x0

    invoke-static {v12, v15}, LXj;->e(LPh;Z)LCs0;

    move-result-object v12

    iget v13, v0, LGy;->P:I

    invoke-virtual/range {p10 .. p10}, LGy;->n()LyF0;

    move-result-object v14

    invoke-static {v0, v10}, LrJ1;->c(LGy;LIv0;)LIv0;

    move-result-object v10

    if-eqz v38, :cond_4f6

    invoke-virtual/range {p10 .. p10}, LGy;->e0()V

    iget-boolean v6, v0, LGy;->O:Z

    if-eqz v6, :cond_214

    invoke-virtual {v0, v2}, LGy;->m(LCU;)V

    :goto_211
    move-object/from16 v6, v40

    goto :goto_218

    :cond_214
    invoke-virtual/range {p10 .. p10}, LGy;->n0()V

    goto :goto_211

    :goto_218
    invoke-static {v0, v6, v12}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    move-object/from16 v12, v36

    invoke-static {v0, v12, v14}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    iget-boolean v14, v0, LGy;->O:Z

    if-nez v14, :cond_232

    invoke-virtual/range {p10 .. p10}, LGy;->P()Ljava/lang/Object;

    move-result-object v14

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v14, v8}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_235

    :cond_232
    move-object/from16 v8, v44

    goto :goto_238

    :cond_235
    move-object/from16 v8, v44

    goto :goto_23b

    :goto_238
    invoke-static {v13, v0, v13, v8}, LXm;->o(ILGy;ILuy;)V

    :goto_23b
    invoke-static {v0, v4, v10}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    const/4 v14, 0x0

    const/16 v10, 0xe

    if-nez p5, :cond_268

    const v11, 0x3a46f1c4

    invoke-virtual {v0, v11}, LGy;->a0(I)V

    shr-int/lit8 v11, p11, 0xf

    and-int/2addr v11, v10

    or-int/lit16 v11, v11, 0x240

    move-object/from16 v36, v12

    move-object/from16 v10, v43

    move-object/from16 v12, p6

    invoke-virtual {v1, v12, v10, v0, v11}, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->l(Ljava/lang/String;LRd0;LGy;I)V

    invoke-virtual {v0, v15}, LGy;->r(Z)V

    move-object/from16 v46, v6

    move-object/from16 v47, v7

    move-object/from16 v48, v8

    move/from16 v49, v9

    move v8, v15

    move-object/from16 v45, v36

    const/4 v1, 0x1

    goto/16 :goto_2e3

    :cond_268
    move-object/from16 v36, v12

    move-object/from16 v12, p6

    const v10, 0x3a4830f8

    invoke-virtual {v0, v10}, LGy;->a0(I)V

    sget-object v10, Lkc;->a:Lkc;

    invoke-virtual {v10}, Lkc;->a()V

    invoke-static {}, Lkc;->c()Ler0;

    move-result-object v10

    iget-wide v12, v10, Ler0;->o:J

    sget-object v10, LaU;->R:LaU;

    const/high16 v15, 0x41600000    # 14.0f

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-static {v15, v1, v10, v14}, LCr;->M(FFLaU;F)LJc1;

    move-result-object v26

    invoke-static {v7, v11}, Landroidx/compose/foundation/layout/a;->k(LIv0;F)LIv0;

    move-result-object v1

    new-instance v15, Ltb1;

    const/4 v10, 0x3

    invoke-direct {v15, v10}, Ltb1;-><init>(I)V

    const/16 v11, 0xc

    shr-int/lit8 v11, p11, 0xc

    const/16 v16, 0xe

    and-int/lit8 v11, v11, 0xe

    or-int/lit8 v28, v11, 0x30

    const/16 v29, 0x0

    const v30, 0xfdf8

    const-wide/16 v19, 0x0

    move/from16 v16, v10

    move-wide/from16 v10, v19

    const/16 v17, 0x0

    move-wide/from16 v52, v12

    move-object/from16 v13, v36

    move-wide/from16 v36, v52

    move-object/from16 v12, v17

    move-object/from16 v45, v13

    move-object/from16 v13, v17

    const/16 v16, 0x0

    move-object/from16 v14, v16

    const-wide/16 v16, 0x0

    move-object/from16 v27, v15

    move-wide/from16 v15, v16

    const/16 v17, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object/from16 v46, v6

    move-object/from16 v6, p5

    move-object/from16 v47, v7

    move-object v7, v1

    move-object/from16 v48, v8

    move/from16 v49, v9

    const/4 v1, 0x1

    move-wide/from16 v8, v36

    move-object/from16 v18, v27

    move-object/from16 v27, p10

    invoke-static/range {v6 .. v30}, Ltc1;->b(Ljava/lang/String;LIv0;JJLWT;LaU;LAT;JLzb1;Ltb1;JIZIILDU;LJc1;LGy;III)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, LGy;->r(Z)V

    :goto_2e3
    invoke-virtual {v0, v1}, LGy;->r(Z)V

    move-object/from16 v9, v47

    move/from16 v6, v49

    invoke-static {v9, v6}, Landroidx/compose/foundation/layout/c;->f(LIv0;F)LIv0;

    move-result-object v6

    invoke-static {v0, v6}, LIu1;->a(LGy;LIv0;)V

    const-string v31, "s"

    const-string v33, ""

    if-lez v5, :cond_318

    if-ne v5, v1, :cond_2fc

    move-object/from16 v6, v33

    goto :goto_2fe

    :cond_2fc
    move-object/from16 v6, v31

    :goto_2fe
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " face"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " in view"

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_31a

    :cond_318
    const-string v6, "Nobody in view"

    :goto_31a
    sget-object v7, LaU;->R:LaU;

    const/high16 v10, 0x41800000    # 16.0f

    const/high16 v11, 0x41c00000    # 24.0f

    const/4 v15, 0x0

    invoke-static {v10, v11, v7, v15}, LCr;->M(FFLaU;F)LJc1;

    move-result-object v26

    const/16 v29, 0x0

    const v30, 0xfffa

    const/4 v7, 0x0

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const-wide/16 v16, 0x0

    move-wide/from16 v15, v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v28, 0x180

    move-object/from16 v50, v9

    move-wide/from16 v8, v34

    move-object/from16 v27, p10

    invoke-static/range {v6 .. v30}, Ltc1;->b(Ljava/lang/String;LIv0;JJLWT;LaU;LAT;JLzb1;Ltb1;JIZIILDU;LJc1;LGy;III)V

    if-ne v3, v1, :cond_354

    move-object/from16 v6, v33

    goto :goto_356

    :cond_354
    move-object/from16 v6, v31

    :goto_356
    invoke-static/range {p3 .. p3}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v7

    xor-int/2addr v7, v1

    if-eqz v7, :cond_368

    const-string v7, " \u00b7 last: "

    move-object/from16 v8, p3

    invoke-virtual {v7, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    :goto_365
    move-object/from16 v7, v33

    goto :goto_36b

    :cond_368
    move-object/from16 v8, p3

    goto :goto_365

    :goto_36b
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " alert"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    sget-object v31, Lkc;->a:Lkc;

    invoke-virtual/range {v31 .. v31}, Lkc;->a()V

    invoke-static {}, Lkc;->c()Ler0;

    move-result-object v7

    iget-wide v14, v7, Ler0;->o:J

    sget-object v7, LaU;->S:LaU;

    const/high16 v9, 0x41500000    # 13.0f

    const/high16 v13, 0x41900000    # 18.0f

    const/4 v12, 0x0

    invoke-static {v9, v13, v7, v12}, LCr;->M(FFLaU;F)LJc1;

    move-result-object v26

    const/16 v29, 0x0

    const v30, 0xfffa

    const/4 v7, 0x0

    const-wide/16 v10, 0x0

    const/16 v16, 0x0

    move v1, v12

    move-object/from16 v12, v16

    move-object/from16 v13, v16

    move-wide/from16 v33, v14

    move-object/from16 v14, v16

    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v28, 0x0

    move-wide/from16 v8, v33

    move-object/from16 v27, p10

    invoke-static/range {v6 .. v30}, Ltc1;->b(Ljava/lang/String;LIv0;JJLWT;LaU;LAT;JLzb1;Ltb1;JIZIILDU;LJc1;LGy;III)V

    const v6, 0xdc9b2c

    invoke-virtual {v0, v6}, LGy;->a0(I)V

    const/4 v8, 0x6

    if-nez p7, :cond_423

    int-to-float v6, v8

    move-object/from16 v9, v50

    invoke-static {v9, v6}, Landroidx/compose/foundation/layout/c;->f(LIv0;F)LIv0;

    move-result-object v6

    invoke-static {v0, v6}, LIu1;->a(LGy;LIv0;)V

    invoke-virtual/range {v31 .. v31}, Lkc;->a()V

    invoke-static {}, Lkc;->c()Ler0;

    move-result-object v6

    iget-wide v14, v6, Ler0;->k:J

    sget-object v6, LaU;->S:LaU;

    const/high16 v7, 0x41500000    # 13.0f

    const/high16 v10, 0x41900000    # 18.0f

    invoke-static {v7, v10, v6, v1}, LCr;->M(FFLaU;F)LJc1;

    move-result-object v26

    new-instance v1, Ltb1;

    const/4 v6, 0x3

    invoke-direct {v1, v6}, Ltb1;-><init>(I)V

    const/16 v29, 0x0

    const v30, 0xfdfa

    const-string v6, "Plug in the charger \u2014 watching keeps the camera and screen on."

    const/4 v7, 0x0

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v16, 0x0

    move-wide/from16 v33, v14

    move-object/from16 v14, v16

    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v28, 0x6

    move-object/from16 v51, v9

    move-wide/from16 v8, v33

    move-object/from16 v18, v1

    move-object/from16 v27, p10

    invoke-static/range {v6 .. v30}, Ltc1;->b(Ljava/lang/String;LIv0;JJLWT;LaU;LAT;JLzb1;Ltb1;JIZIILDU;LJc1;LGy;III)V

    :goto_421
    const/4 v1, 0x0

    goto :goto_426

    :cond_423
    move-object/from16 v51, v50

    goto :goto_421

    :goto_426
    invoke-virtual {v0, v1}, LGy;->r(Z)V

    const/16 v1, 0x10

    int-to-float v1, v1

    move-object/from16 v15, v51

    invoke-static {v15, v1}, Landroidx/compose/foundation/layout/c;->f(LIv0;F)LIv0;

    move-result-object v1

    invoke-static {v0, v1}, LIu1;->a(LGy;LIv0;)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v15, v1}, Landroidx/compose/foundation/layout/c;->d(LIv0;F)LIv0;

    move-result-object v6

    new-instance v7, Ltc;

    move/from16 v8, v39

    invoke-direct {v7, v8}, Ltc;-><init>(F)V

    sget-object v8, LCr;->a0:LNh;

    const/4 v9, 0x6

    invoke-static {v7, v8, v0, v9}, LMv;->a(Luc;LNh;LGy;I)LOv;

    move-result-object v7

    iget v8, v0, LGy;->P:I

    invoke-virtual/range {p10 .. p10}, LGy;->n()LyF0;

    move-result-object v9

    invoke-static {v0, v6}, LrJ1;->c(LGy;LIv0;)LIv0;

    move-result-object v6

    if-eqz v38, :cond_4f2

    invoke-virtual/range {p10 .. p10}, LGy;->e0()V

    iget-boolean v10, v0, LGy;->O:Z

    if-eqz v10, :cond_462

    invoke-virtual {v0, v2}, LGy;->m(LCU;)V

    :goto_45f
    move-object/from16 v2, v46

    goto :goto_466

    :cond_462
    invoke-virtual/range {p10 .. p10}, LGy;->n0()V

    goto :goto_45f

    :goto_466
    invoke-static {v0, v2, v7}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    move-object/from16 v2, v45

    invoke-static {v0, v2, v9}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    iget-boolean v2, v0, LGy;->O:Z

    if-nez v2, :cond_480

    invoke-virtual/range {p10 .. p10}, LGy;->P()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v2, v7}, LiA1;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_485

    :cond_480
    move-object/from16 v2, v48

    invoke-static {v8, v0, v8, v2}, LXm;->o(ILGy;ILuy;)V

    :cond_485
    invoke-static {v0, v4, v6}, LvC1;->c(LGy;LHU;Ljava/lang/Object;)V

    sget-object v2, Lwl;->a:LOD0;

    invoke-virtual/range {v31 .. v31}, Lkc;->a()V

    invoke-static {}, Lkc;->c()Ler0;

    move-result-object v2

    iget-wide v6, v2, Ler0;->m:J

    const-wide/16 v8, 0x0

    const/16 v2, 0xe

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    move-object/from16 v14, p10

    move-object v4, v15

    move v15, v2

    invoke-static/range {v6 .. v15}, Lwl;->a(JJJJLGy;I)Lvl;

    move-result-object v10

    const/16 v2, 0xe

    int-to-float v6, v2

    invoke-static {v6}, LJP0;->b(F)LIP0;

    move-result-object v9

    invoke-static {v4, v1}, Landroidx/compose/foundation/layout/c;->d(LIv0;F)LIv0;

    move-result-object v7

    sget-object v15, Lcy;->a:LFw;

    shr-int/lit8 v1, p11, 0x15

    and-int/2addr v1, v2

    const v2, 0x30000030

    or-int v17, v1, v2

    const/4 v12, 0x0

    const/16 v18, 0x1e4

    const/4 v8, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v6, p8

    move-object/from16 v16, p10

    invoke-static/range {v6 .. v18}, LZE1;->a(LCU;LIv0;ZLSY0;Lvl;LAl;Luj;LND0;LKw0;LIU;LGy;II)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, LGy;->r(Z)V

    invoke-virtual {v0, v1}, LGy;->r(Z)V

    invoke-virtual/range {p10 .. p10}, LGy;->v()LjL0;

    move-result-object v12

    if-eqz v12, :cond_4f1

    new-instance v13, Lln1;

    move-object v0, v13

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p11

    invoke-direct/range {v0 .. v11}, Lln1;-><init>(Lcom/getmeera/android/ui/facelock/WatchmanActivity;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLon1;Lon1;I)V

    iput-object v13, v12, LjL0;->d:LHU;

    :cond_4f1
    return-void

    :cond_4f2
    invoke-static {}, LqJ1;->b()V

    throw v32

    :cond_4f6
    invoke-static {}, LqJ1;->b()V

    throw v32

    :cond_4fa
    const/16 v32, 0x0

    invoke-static {}, LqJ1;->b()V

    throw v32

    :cond_500
    const/16 v32, 0x0

    invoke-static {}, LqJ1;->b()V

    throw v32
.end method

.method public static final n(Lcom/getmeera/android/ui/facelock/WatchmanActivity;Lrn1;[BLkC;)Ljava/lang/Object;
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v3, v2, Lqn1;

    if-eqz v3, :cond_1c

    move-object v3, v2

    check-cast v3, Lqn1;

    iget v4, v3, Lqn1;->S:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_1c

    sub-int/2addr v4, v5

    iput v4, v3, Lqn1;->S:I

    goto :goto_21

    :cond_1c
    new-instance v3, Lqn1;

    invoke-direct {v3, v0, v2}, Lqn1;-><init>(Lcom/getmeera/android/ui/facelock/WatchmanActivity;LkC;)V

    :goto_21
    iget-object v2, v3, Lqn1;->Q:Ljava/lang/Object;

    sget-object v4, LaD;->N:LaD;

    iget v5, v3, Lqn1;->S:I

    const/4 v6, 0x1

    const/4 v7, 0x2

    if-eqz v5, :cond_44

    if-eq v5, v6, :cond_3f

    if-ne v5, v7, :cond_37

    :try_start_2f
    invoke-static {v2}, LYK1;->b(Ljava/lang/Object;)V
    :try_end_32
    .catchall {:try_start_2f .. :try_end_32} :catchall_34

    goto/16 :goto_1c0

    :catchall_34
    move-exception v0

    goto/16 :goto_1c3

    :cond_37
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3f
    :try_start_3f
    invoke-static {v2}, LYK1;->b(Ljava/lang/Object;)V
    :try_end_42
    .catchall {:try_start_3f .. :try_end_42} :catchall_34

    goto/16 :goto_1a7

    :cond_44
    invoke-static {v2}, LYK1;->b(Ljava/lang/Object;)V

    iget-boolean v2, v1, Lrn1;->a:Z

    const-string v5, ""

    iget-object v9, v1, Lrn1;->b:Ljava/util/List;

    if-eqz v2, :cond_69

    invoke-interface {v9}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    xor-int/2addr v10, v6

    if-eqz v10, :cond_69

    const/4 v14, 0x0

    const/16 v16, 0x3f

    iget-object v11, v1, Lrn1;->b:Ljava/util/List;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x0

    invoke-static/range {v11 .. v16}, Lnv;->L(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;LDU;I)Ljava/lang/String;

    move-result-object v1

    const-string v10, "Unknown face + "

    invoke-virtual {v10, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_79

    :cond_69
    if-eqz v2, :cond_6d

    move-object v1, v5

    goto :goto_79

    :cond_6d
    const/4 v13, 0x0

    const/16 v15, 0x3f

    iget-object v10, v1, Lrn1;->b:Ljava/util/List;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    invoke-static/range {v10 .. v15}, Lnv;->L(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;LDU;I)Ljava/lang/String;

    move-result-object v1

    :goto_79
    invoke-static {v1}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_82

    const-string v10, "Unknown face"

    goto :goto_83

    :cond_82
    move-object v10, v1

    :goto_83
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    const-string v12, "watchman"

    move-object/from16 v13, p2

    invoke-static {v11, v12, v1, v12, v13}, LHu1;->f(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)J

    move-result-wide v18

    :cond_8f
    iget-object v1, v0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->h0:LO51;

    invoke-virtual {v1}, LO51;->getValue()Ljava/lang/Object;

    move-result-object v15

    move-object v11, v15

    check-cast v11, Lhn1;

    iget v12, v11, Lhn1;->b:I

    add-int/lit8 v13, v12, 0x1

    const/4 v12, 0x0

    const/16 v17, 0x19

    const/16 v16, 0x0

    const/16 v20, 0x0

    move-object v14, v10

    move-object v8, v15

    move/from16 v15, v16

    move-object/from16 v16, v20

    invoke-static/range {v11 .. v17}, Lhn1;->a(Lhn1;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;I)Lhn1;

    move-result-object v11

    invoke-virtual {v1, v8, v11}, LO51;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8f

    sget-object v1, LO4;->a:Ljava/io/File;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v1

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "WATCHMAN alert stranger="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " known="

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, LO4;->c(Ljava/lang/String;)V

    const-string v1, "meera_watchman"

    const-string v2, "Watchman: "

    :try_start_d6
    const-class v8, Landroid/app/NotificationManager;

    invoke-virtual {v0, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/NotificationManager;

    if-nez v8, :cond_e1

    goto :goto_120

    :cond_e1
    new-instance v9, Landroid/app/NotificationChannel;

    const-string v11, "Meera watchman"

    const/4 v12, 0x4

    invoke-direct {v9, v1, v11, v12}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v8, v9}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    new-instance v9, LKz0;

    invoke-direct {v9, v0, v1}, LKz0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v1, v9, LKz0;->p:Landroid/app/Notification;

    const v11, 0x1080037

    iput v11, v1, Landroid/app/Notification;->icon:I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, LKz0;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v9, LKz0;->e:Ljava/lang/CharSequence;

    const-string v1, "Photo saved in Face Lock \u2192 Who tried to get in"

    invoke-static {v1}, LKz0;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v9, LKz0;->f:Ljava/lang/CharSequence;

    const/16 v1, 0x10

    invoke-virtual {v9, v1}, LKz0;->d(I)V

    invoke-virtual {v9}, LKz0;->b()Landroid/app/Notification;

    move-result-object v1

    const/16 v2, 0x1caf

    invoke-virtual {v8, v2, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_120
    .catchall {:try_start_d6 .. :try_end_120} :catchall_120

    :catchall_120
    :goto_120
    sget-object v1, LvP;->b:LjK1;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, LjK1;->y(Landroid/content/Context;)LvP;

    move-result-object v1

    const-string v2, "watch_telegram"

    iget-object v1, v1, LvP;->a:Landroid/content/SharedPreferences;

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1f1

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, LHu1;->i(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_140
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_154

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v8, v2

    check-cast v8, LB60;

    iget-wide v8, v8, LB60;->a:J

    cmp-long v8, v8, v18

    if-nez v8, :cond_140

    goto :goto_155

    :cond_154
    const/4 v2, 0x0

    :goto_155
    check-cast v2, LB60;

    if-eqz v2, :cond_15c

    iget-object v1, v2, LB60;->f:Ljava/lang/String;

    goto :goto_15d

    :cond_15c
    const/4 v1, 0x0

    :goto_15d
    if-nez v1, :cond_160

    goto :goto_161

    :cond_160
    move-object v5, v1

    :goto_161
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "h:mm a"

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Meera watchman: "

    const-string v8, " seen at "

    invoke-static {v2, v10, v8, v1}, LYH;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, LRa1;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v2, v0}, LRa1;-><init>(Landroid/content/Context;)V

    :try_start_184
    invoke-static {v5}, LM61;->w(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/2addr v0, v6

    if-eqz v0, :cond_1aa

    const-string v0, "telegram_send_file"

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "path"

    invoke-virtual {v7, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v7, "caption"

    invoke-virtual {v5, v7, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    iput v6, v3, Lqn1;->S:I

    invoke-virtual {v2, v0, v1, v3}, LRa1;->c(Ljava/lang/String;Lorg/json/JSONObject;LkC;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_1a7

    goto :goto_1f3

    :cond_1a7
    :goto_1a7
    check-cast v2, Lorg/json/JSONObject;

    goto :goto_1c8

    :cond_1aa
    const-string v0, "telegram_send_message"

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "text"

    invoke-virtual {v5, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    iput v7, v3, Lqn1;->S:I

    invoke-virtual {v2, v0, v1, v3}, LRa1;->c(Ljava/lang/String;Lorg/json/JSONObject;LkC;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_1c0

    goto :goto_1f3

    :cond_1c0
    :goto_1c0
    check-cast v2, Lorg/json/JSONObject;
    :try_end_1c2
    .catchall {:try_start_184 .. :try_end_1c2} :catchall_34

    goto :goto_1c8

    :goto_1c3
    new-instance v2, LJO0;

    invoke-direct {v2, v0}, LJO0;-><init>(Ljava/lang/Throwable;)V

    :goto_1c8
    instance-of v0, v2, LJO0;

    if-eqz v0, :cond_1ce

    const/4 v8, 0x0

    goto :goto_1cf

    :cond_1ce
    move-object v8, v2

    :goto_1cf
    check-cast v8, Lorg/json/JSONObject;

    sget-object v0, LO4;->a:Ljava/io/File;

    const/4 v0, 0x0

    if-eqz v8, :cond_1df

    const-string v1, "success"

    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-ne v1, v6, :cond_1df

    goto :goto_1e0

    :cond_1df
    move v6, v0

    :goto_1e0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "WATCHMAN telegram ok="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LO4;->c(Ljava/lang/String;)V

    :cond_1f1
    sget-object v4, Lfh1;->a:Lfh1;

    :goto_1f3
    return-object v4
.end method


# virtual methods
.method public final l(Ljava/lang/String;LRd0;LGy;I)V
    .registers 16

    const v0, -0x55d3fe22

    invoke-virtual {p3, v0}, LGy;->c0(I)LGy;

    sget-object v0, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Le61;

    invoke-virtual {p3, v0}, LGy;->l(LbK0;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/content/Context;

    const v0, 0x5e9ad8ad

    invoke-virtual {p3, v0}, LGy;->a0(I)V

    invoke-virtual {p3}, LGy;->P()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, LBy;->a:LfM1;

    if-ne v0, v1, :cond_2a

    new-instance v0, LUI0;

    invoke-direct {v0, v2}, LUI0;-><init>(Landroid/content/Context;)V

    sget-object v3, LSI0;->O:LSI0;

    invoke-virtual {v0, v3}, LUI0;->setScaleType(LSI0;)V

    invoke-virtual {p3, v0}, LGy;->k0(Ljava/lang/Object;)V

    :cond_2a
    check-cast v0, LUI0;

    const/4 v3, 0x0

    const v4, 0x5e9ae6a4

    invoke-static {v4, p3, v3}, LaG0;->d(ILGy;Z)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v1, :cond_3d

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    invoke-virtual {p3, v4}, LGy;->k0(Ljava/lang/Object;)V

    :cond_3d
    check-cast v4, Ljava/util/concurrent/ExecutorService;

    invoke-virtual {p3, v3}, LGy;->r(Z)V

    sget-object v9, Lfh1;->a:Lfh1;

    new-instance v10, LZj;

    const/4 v8, 0x5

    move-object v1, v10

    move-object v3, v0

    move-object v5, p1

    move-object v6, p2

    move-object v7, p0

    invoke-direct/range {v1 .. v8}, LZj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-static {v9, v10, p3}, Lbu1;->a(Ljava/lang/Object;LDU;LGy;)V

    sget-object v1, Landroidx/compose/foundation/layout/c;->c:Landroidx/compose/foundation/layout/FillElement;

    new-instance v2, LkO;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, LkO;-><init>(LUI0;I)V

    const/16 v0, 0x30

    const/4 v3, 0x0

    invoke-static {v2, v1, v3, p3, v0}, Landroidx/compose/ui/viewinterop/a;->a(LDU;LIv0;LDU;LGy;I)V

    invoke-virtual {p3}, LGy;->v()LjL0;

    move-result-object p3

    if-eqz p3, :cond_6d

    new-instance v0, LWV0;

    invoke-direct {v0, p0, p1, p2, p4}, LWV0;-><init>(Lcom/getmeera/android/ui/facelock/WatchmanActivity;Ljava/lang/String;LRd0;I)V

    iput-object v0, p3, LjL0;->d:LHU;

    :cond_6d
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 8

    const/4 v0, 0x1

    invoke-super {p0, p1}, Lxw;->onCreate(Landroid/os/Bundle;)V

    sput-object p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->o0:Lcom/getmeera/android/ui/facelock/WatchmanActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v1, 0x80

    invoke-virtual {p1, v1}, Landroid/view/Window;->addFlags(I)V

    sget-object p1, LvP;->b:LjK1;

    invoke-virtual {p1, p0}, LjK1;->y(Landroid/content/Context;)LvP;

    move-result-object p1

    iget-object p1, p1, LvP;->a:Landroid/content/SharedPreferences;

    const-string v1, "watch_lens"

    const-string v2, "back"

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_22

    goto :goto_23

    :cond_22
    move-object v2, p1

    :goto_23
    sget-object p1, LO4;->a:Ljava/io/File;

    const-string p1, "WATCHMAN start lens="

    invoke-virtual {p1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LO4;->c(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->i0:LiC;

    new-instance v1, Lnn1;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lnn1;-><init>(Lcom/getmeera/android/ui/facelock/WatchmanActivity;LkC;)V

    const/4 v4, 0x3

    const/4 v5, 0x0

    invoke-static {p1, v3, v5, v1, v4}, LLE1;->g(LZC;LSC;ILHU;I)Ll51;

    new-instance p1, Lpn1;

    invoke-direct {p1, p0, v2, v0}, Lpn1;-><init>(Lcom/getmeera/android/ui/facelock/WatchmanActivity;Ljava/lang/String;I)V

    new-instance v1, LFw;

    const v2, 0x46cc0a7a

    invoke-direct {v1, v2, p1, v0}, LFw;-><init>(ILjava/lang/Object;Z)V

    invoke-static {p0, v1}, Lyw;->a(Lxw;LFw;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/high16 v1, -0x40800000    # -1.0f

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/16 v2, 0x1f40

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->m0:J

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->n0:Z

    sget-object v0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->o0:Lcom/getmeera/android/ui/facelock/WatchmanActivity;

    const/4 v1, 0x0

    if-ne v0, p0, :cond_a

    sput-object v1, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->o0:Lcom/getmeera/android/ui/facelock/WatchmanActivity;

    :cond_a
    iget-object v0, p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->i0:LiC;

    invoke-static {v0, v1}, LnK1;->d(LZC;Ljava/util/concurrent/CancellationException;)V

    const-string v0, "WATCHMAN stop"

    invoke-static {v0}, LO4;->c(Ljava/lang/String;)V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public final onPause()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->n0:Z

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method public final onResume()V
    .registers 2

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/getmeera/android/ui/facelock/WatchmanActivity;->n0:Z

    return-void
.end method
