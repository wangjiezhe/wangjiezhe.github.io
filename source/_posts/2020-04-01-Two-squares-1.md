---
title: 双正方形模型（一）
date: 2020-04-01 14:23:42
updated: 2020-04-13 15:03:00
categories:
  - 数学
  - 平面几何
tags:
  - 全等
  - 正方形
description: 和两个共顶点的正方形有关的结论
mathjax: true
typora-root-url: 2020-04-01-Two-squares-1
---

在正方形的题目中，有很常见的一类是和两个正方形有关的图形，如下图：

<img src="fig1-1.png" alt="图1" style="zoom:50%;" />

在这个图形中，有很多有意思的性质，也衍生出了很多的题目．我们讲分几次一一道来．

## 「手拉手」模型

在学习全等的时候，我们知道有一类很重要的全等模型——旋转全等模型，俗称「手拉手」模型．说的是两个共顶点且顶角相等的等腰三角形，一定伴随着一组旋转全等，如`图2`：

<img src="fig1-2.png" alt="图2" style="zoom:50%;" />

$\triangle ABC$  和 $\triangle ADE$ 是两个顶角相等的等腰三角形，易证 $\triangle ABD \cong \triangle ACE$ ．这是一个旋转全等，旋转角度等于两个等腰三角形的顶角角度．

关于这个模型，也有很多相关的结论，不过大部分和这次的内容关系不大，有机会我们另开文讲述．

那么，对于两个共顶点的正方形，也有类似的结论．在`图1`中，我们可以把它看成是两个等腰直角三角形 $ABE$ 和 $ACG$ 的「手拉手」，于是就有 $\triangle ABG \cong \triangle AEC$，而且旋转角度为 $90^\circ$．

<img src="fig1-3.png" alt="图3" style="zoom:50%;" />

于是，我们就得到了一个对角线垂直且相等的四边形 $BCGE$．

### 和中点四边形相关的问题

熟悉中点四边形的朋友马上就会想到，这样一个四边形的中点四边形一定是一个正方形，也就是下面这个图：

<img src="fig1-4.png" alt="图5" style="zoom:50%;" />

在这个图中，中点四边形 $MPNQ$ 就是一个正方形．

## 另一个和中点相关的问题

在`图1`中，如果我们取 $EG$ 的中点 $P$ ，连结 $AP$ ，则 $AP \perp BC$ 且 $AP = \dfrac{1}{2} BC$．（如果取 $BC$ 中点，有类似的结论）

<img src="fig1-5.png" alt="图5" style="zoom:50%;" />

对于中点问题，我们知道一种常见的处理方法就是「倍长中线」，因此我们倍长 $AP$ 至 $H$，可以证明 $\triangle GHA \cong \triangle ABC$．注意这是一个旋转 $90 ^\circ$ 的全等，因此 $AH$ 和 $BC$ 垂直且相等，所以上面的结论成立．

<img src="fig1-6.png" alt="图6" style="zoom:50%;" />

这个命题逆命题也成立，即如果 $AP \perp BC$，则 $P$ 为 $EG$ 的中点，且 $AP = \dfrac{1}{2} BC$．

这个命题也可以利用上图来证明，不过这个时候需要直接延长作 $AH=BC$ 来证明全等．

这个时候另外一种处理方法是做垂直，利用弦图的模型来证明全等．

<img src="fig1-7.png" alt="图7" style="zoom:50%;" />

如`图7`，延长 $PA$ 交 $BC$ 于 $Q$，作 $EM \perp AP$ 于 $M$，$GN \perp AP$ 于 $N$，则 $\triangle ABQ \cong \triangle EAM$，$\triangle ACQ \cong \triangle GAM$，于是 $EM = AQ = NG$ 且 $EM \parallel NG$，因此 $EMGN$ 是平行四边形，于是
$$
\begin{aligned}
  PE &= PG, \\
  PN &= PM, \\
  BC &= BQ + QC \\ &= AM + AN \\ &= 2AP
\end{aligned}
$$
这两个证明同时还都证明了另一个结论，就是 $S_{\triangle ABC} = S_{\triangle AEG}$．由割补法知这两个三角形的面积的确是相等的．

当然，如果熟悉三角函数的话，这两个三角形的面积相等是显然的．因为 $\angle BAC$ 和 $\angle EAG$ 互补，而角的两边对应相等，因此面积也是相等的．

### 变形一

前面我们说了 $BCGE$ 是一个对角线垂直且相等的四边形，因此，这个题的可以这样来出：

如`图8`，在四边形 $ABCD$ 中，$AC \perp BD$，且 $AC=BD$，分别取 $AD$、$BC$、$AB$ 的中点 $M$、$N$、$P$，分别过 $M$、$N$ 作 $AD$、$BC$ 的垂线交于 $O$，则 $PO \perp CD$．

<img src="fig1-8.png" alt="图8" style="zoom:50%;" />

这个图如果把 $OA$、$OB$、$OC$、$OD$ 都连起来，显然有 $\triangle OAC \cong \triangle OBD$，注意这是一个旋转 $90^\circ$ 的全等，因此 $\triangle OAD$、$\triangle OBC$ 都是等腰直角三角形．于是这就变成了`图5`一样的图了，后面的证明和上面相同．

<img src="fig1-9.png" alt="图9" style="zoom:50%;" />

### 变形二

如果我们把两个正方形中间再加一个小正方形，那么结论会变成什么样子？

如`图10`，有三个正方形 $ABCD$、$AEFG$、$FHIJ$，取 $JD$ 中点 $P$，则有 $PE \perp BH$ 且 $PE = \dfrac{1}{2} BH$．

<img src="fig1-10.png" alt="图10" style="zoom:50%;" />

很明显，这个图是上面`图5`的一个推广，如果中间的小正方形缩成一个点，那么就变成了`图5`．

既然是推广，那么证明应该也是类似的．我们还是可以倍长 $EP$ 来做，不过这个时候要找的全等变得复杂了一些．

<img src="fig1-11.png" alt="图11" style="zoom:50%;" />


如`图11`，我们倍长 $EP$ 至 $K$，可以类似地证明 $\triangle JKE \cong \triangle GBH$．

不过在证明的时候需要注意，这里面隐藏着两个「手拉手」的全等模型，在证明上面的全等的时候需要用到，如`图12`，有 $\triangle ADE \cong \triangle ABG$，$\triangle FJE \cong \triangle FGH$，都是旋转 $90^\circ$ 的全等．

<img src="fig1-12.png" alt="图12" style="zoom:50%;" />

### 拓展联想

在圆的内接四边形中，有一个类似的结论：

若圆内接四边形的对角线相互垂直，则垂直于一边且过对角线交点的直线将平分对边．

这就是 Brahmagupta 定理，一般译作「婆罗摩笈多定理」，或者「布拉美古塔定理」．

如`图13`，在圆的内接四边形 $ABCD$ 中，$AC \perp BD$，过对角线的中点 $O$ 作 $PQ \perp AB$ 点 $Q$，交 $CD$ 于点 $P$，则 $P$ 是 $CD$ 的中点．

<img src="fig1-13.png" alt="图13" style="zoom:50%;" />

这个的证明是比较简单的，
$$
\begin{aligned}
  \angle POC &= 90^\circ - \angle QOB \\ &= \angle QBO \\ &= \angle PCO
\end{aligned}
$$
于是
$$
\begin{aligned}
  \angle POD &= 90^\circ - \angle POC \\ &= 90^\circ - \angle PCO \\ &= \angle PDC
\end{aligned}
$$

故 $PC = PO = PD$，直接倒角就可以证明了．

这个定理的逆命题也成立，即如果 $P$ 是 $CD$ 的中点，那么 $OP \perp AB$．证明和上面类似．

------

总结一下，这类问题主要是和中点有关系，主要的方法是「倍长中线」和「手拉手」的全等．还有一类问题是借助于中位线来解决的，这一类题目讨论的不是 $EG$ 的中点（图1中），而是 $DF$ 的中点．这一类问题，我们放到下一篇文章中来讨论．
