---
title: 双正方形模型（二）
date: 2020-04-03 01:10:39
updated: 2020-04-14 02:09:00
categories:
  - 数学
  - 平面几何
tags:
  - 全等
  - 相似
  - 正方形
description: 上文中和两个共顶点的正方形有关的结论的推广
mathjax: true
---

在前一篇文章中，我们提到，在`图1`中，如果我们考虑 $DF$ 的中点，会有一些其它的性质．

![图1](fig2-1.png)

如`图2`，我们取 $DF$ 的中点，连结 $PB$、$PC$，则有 $PB = PC$ 且 $PB \perp PC$（同理，有 $PE = PG$ 且 $PE \perp PG$）．

![图2](fig2-2.png)

我们注意到，这个图形只跟下半部分（或者上半部分有关），因此这类题目经常以两个「等腰直角三角形」的形式出现，如`图3`：

![图3](fig2-3.png)

## 证明方法

这个题的解决方法也有很多，可以用「倍长中线」，可以构造「三角形的中位线」，也可以构造「梯形中位线」．

### 倍长中线

如`图4`，倍长 $BP$ 至 $K$，可以证明 $\triangle ABC \cong \triangle FKC$，注意这是一个旋转 $90^\circ$ 的全等，因此 $CB$ 和 $CK$ 垂直且相等，我们得到了一个等腰 $\mathrm{Rt} \triangle CBK$ ，于是它的一半 $\triangle PCB$ 也是一个等腰直角三角形．

![图4](fig2-4.png)

### 构造三角形的中位线

如`图5`，分别取 $AD$、$AF$ 的中点 $M$、$N$，可以证明 $\triangle PMB \cong \triangle CNP$．注意这又是一个旋转 $90^\circ$ 的全等，因此 $PB$ 和 $PC$ 垂直且相等．

![图5](fig2-5.png)

### 构造梯形的中位线

如`图6`，分别过 $D$、$F$、$A$ 作 $BC$ 的垂线，垂足依次为 $J$、$K$、$L$，则有弦图的模型可知，$\triangle BJD \cong \triangle ALB$，$\triangle FKC \cong \triangle CLA$，于是 $BJ = AL = CK$，$DJ = BL$，$FK = CL$．我们取 $BC$ 的中点 $Q$，于是 $Q$ 也是 $JK$ 的中点，因此 $PQ$ 是梯形 $DJKF$ 的中位线，故 $PQ \perp BC$，且
$$
\begin{aligned}
  PQ &= \dfrac{1}{2} \left( DJ + FK \right) = \dfrac{1}{2} \left( BL + CL \right) \\
  &= \dfrac{1}{2} BC = BQ = CQ
\end{aligned}
$$
因此 $\triangle PCB$ 是等腰直角三角形．

![图6](fig2-6.png)

### 变形

我们需要注意的是，当这两个等腰 $\mathrm{Rt} \triangle ABD$ 和 $\triangle ACF$ 旋转到不同的位置的时候，这个图可能看起来变得完全不一样，但是本质上是一个图形，如`图7`~`图10`：

![图7](fig2-7.png)

![图8](fig2-8.png)

![图9](fig2-9.png)

![图10](fig2-10.png)

## 推广

在`图3`中，$\triangle ABD$ 和 $\triangle ACF$ 都是等腰直角三角形．如果我们把这个条件进行弱化，去掉等腰的条件，但保持两个直角三角形是相似的，即 $\mathrm{Rt}\triangle ABD \sim \mathrm{Rt}\triangle ACF$ （其实就是 $\angle ADB = \angle AFC$），那么 $PB = PC$ 的结论依旧成立．

![图11](fig2-11.png)

这个时候的解决方法和前面也是类似的．

### 倍长中线

这个方法和`图4`类似，只不过把要证明的全等变成了相似．

如`图12`，倍长 $BP$ 至 $K$，则
$$
\frac{KF}{FC} = \frac{DB}{FC} = \frac{BA}{AC}
$$
而且
$$
\begin{aligned}
  \angle KFC &= \angle KFD + \angle DFC \\
  &= \angle FDB + \angle DFC \\
  &= 360^\circ - \angle DBC - \angle FCB \\&
  = 180^\circ - \angle ABC - \angle ACB \\&
  = \angle BAC
\end{aligned}
$$
因此 $\triangle KFC \sim \triangle BAC$．这是一个旋转 $90^\circ$ 的相似，于是 $\triangle BCK$ 是直角三角形，$CP$ 是其斜边中线，故 $CP = \dfrac{1}{2} BK = PB$．

![图12](fig2-12.png)

### 构造三角形的中位线

这个方法和`图5`完全一样，$BM = \dfrac{1}{2} AD = PN$，$MP = \dfrac{1}{2} AF = NC$，且
$$
\begin{aligned}
  \angle BMP &= \angle BMA + \angle AMP \\
  &= 2\angle BDA + \angle AMP \\
  &= 2\angle CFA + \angle ANP \\
  &= \angle CNA + \angle ANP \\
  &= \angle PNC
\end{aligned}
$$
因此 $\triangle BMP \cong \triangle PNC$，于是 $PB = PC$．

![图13](fig2-13.png)

### 构造梯形的中位线

这个方法和`图6`类似，不过也是要把证明的全等变成相似．

如`图14`，$\triangle BJD \sim \triangle ALB$，$\triangle FKC \sim \triangle CLA$，于是
$$
\frac{BJ}{AL} = \frac{BD}{AB} = \frac{CF}{AC} = \frac{CK}{AL}
$$
因此 $BJ = CK$ 依旧成立．后面的过程就完全一样了．

我们取 $BC$ 的中点 $Q$，于是 $Q$ 也是 $JK$ 的中点，因此 $PQ$ 是梯形 $DJKF$ 的中位线，故 $PQ \perp BC$，且
$$
\begin{aligned}
  PQ &= \dfrac{1}{2} \left( DJ + FK \right) = \dfrac{1}{2} \left( BL + CL \right) \\
  &= \dfrac{1}{2} BC = BQ = CQ
\end{aligned}
$$
因此 $PB = PC$．

![图14](fig2-14.png)

---

总结一下，我们看到处理中点有两种主要的思路，一个是「倍长中线」，一种是「构造中位线」，包括三角形中位线和梯形中位线．在证明的过程中，还可能会用到直角三角形斜边中线的结论．

对于很多题目，这两种思路都行得通．但是一般来说，「倍长中线」的辅助线比较容易想出来，但后续全等（或者相似）的三角形比较难找，证明也比较麻烦．

而「构造中位线」的思路关键在于选对中位线的取法，因此辅助线不太好做，但是后续的证明一般比前一种方法要简单．

对于不同的题目，我们要注意选择不同的方法．

---

在本文中，我们讨论了如何对正方形（等腰直角三角形）的结论进行推广，我们保留了直角的条件，而去掉了等腰的条件．

那么，我们还可以反过来想，如果保留等腰的条件，去掉直角的条件，那是否还会有这样漂亮的结论？

如果没有的话，是否可以考虑再加上一些条件（就像我们上面加入了相似的条件），再得到比较好的结论？

关于这种情形，我们放在下一篇文章中来讨论．
