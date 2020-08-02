---
title: 双正方形模型（三）
date: 2020-04-03 14:28:07
updated: 2020-04-03 14:28:07
categories:
  - 数学
  - 平面几何
tags:
  - 全等
  - 相似
  - 正方形
mathjax: true
---

在上一篇文章的最后，我们留了一个问题，就是如果仅保留等腰的条件，是否还有比较好的结论？

要解决这个问题，我们先从一种特殊情况谈起．

<!-- more -->

## 一种特殊情况

当两个等腰 $\mathrm{Rt} \triangle ABD$ 和 $\triangle ACF$ 旋转的时候，一种非常特殊的情况就是两个三角形的斜边共线的情况，如`图1`：

![图1](image-20200403021215357.png)

这个时候上面的结论依旧成立，而且我们注意到这个时候 $\angle BAC = 90^\circ$，因此如果我们取 $BC$ 的中点 $Q$，则有 $QA = \dfrac{1}{2} BC = QP$，也就是说 $\triangle APQ$ 是一个等腰三角形．

熟悉四点共圆的朋友马上就会想到，这里面 $ABCP$ 四点共圆，圆心恰好就是 $Q$．

![图2](image-20200403021414962.png)

### 逆命题

那我们反过来想一下，如果取 $\triangle ABC$ 的外接圆和 $DF$ 交于 $P$，那么 $P$ 点是否一定是 $DF$ 的中点？

![图3](image-20200403124126297.png)

如果考虑同一法的话，很明显这个结论是成立的．

那如果不用同一法呢？

### 构造梯形的中位线

一种方法是构造梯形的中位线．我们分别过 $B$、$C$、$Q$ 作 $DF$ 的垂线，垂足依次为 $M$、$N$、$T$，则 $CT$ 是梯形 $BMNC$ 的中位线，且 $M$、$N$、$T$ 分别是 $AD$、$AF$、$AP$ 的中点，于是
$$
\begin{aligned}
  PD &= 2MT = 2NT = 2 \left( AN - AT \right) \\
  &= AF - AP = PF
\end{aligned}
$$
因此 $P$ 是 $DF$ 的中点．

![图4](image-20200403124523191.png)

另一种方法是构造旋转相似，这种方法放到我们后面的推广里来讲．

## 一种推广

如果要保持四点共圆的条件不变，我们可以把条件弱化成什么样子？

注意如果要保持四点共圆的话，我们要保持 $\angle BAC = 90^\circ$，因此两个等腰三角形的两底角要保持互余，也就是两顶角要保持互补．

因此，我们可以把两个等腰直角三角形的条件改为，两个「顶角互补的等腰三角形」：

![图5](image-20200404001633874.png)

在`图5`中，$AB = BD$，$AC = CF$，$\angle ABD + \angle ACF = 180^\circ$，我们分别取 $BC$、$DF$ 的中点 $P$、$Q$，则 $\angle BPC = 90^\circ$，且 $AQ = QP$．

我们可以利用上一篇文章中的三种方法，对这种情况进行证明．因为方法几乎是一样的，这里就从略了．

## 继续推广

我们回顾一下`图4`的证明，这种方法本质上就是用了三个等腰 $\triangle ABD$、$\triangle ACF$、$\triangle APQ$ 的条件，因此我们可以把条件再进行弱化，如下图：

![图6](image-20200403125819232.png)

如`图6`，$\triangle ABD$ 和 $\triangle ACF$ 都是等腰三角形，$AB = BD$，$AC = CF$，$Q$ 为 $BC$ 的中点，则
$$
QA = QP \Longleftrightarrow PD = PF
$$
我们来想一下，前面的那些方法，是否还成立？

{% note primary %}
同时，大家可以想一下，这个图形和我们上一篇文章中里的图形有什么区别和联系．
{% endnote %}

### 倍长中线

这个时候，倍长中线的方法依旧可以使用，不过这个时候，应该要倍长 $AQ$．

![图7](image-20200404002901935.png)

> 为了两个全等三角形看着大一些，我调整了两个等腰三角形的角度，但这不影响我们的证明

如`图7`，倍长 $AQ$ 至 $K$，可以证明 $\triangle DBK \cong \triangle KCF$．

证明这个全等的关键，是要证明 $\angle DBK = \angle KCF$．为了叙述方便，我们设 $\angle DBA = 2\alpha$，$\angle ACF = 2\beta$，则 $\angle BAC = \alpha + \beta$，$\angle ABK = \angle ACK = 180^\circ - \alpha - \beta$，于是
$$
\begin{aligned}
  \angle DBK &= \angle DBA + \angle ABK \\
  &= 2\alpha + (180^\circ - \alpha - \beta) \\
  &= 180^\circ + \alpha - \beta \\
  \\
  \angle KCF &= 360^\circ - \angle ACF - \angle ACK \\
  &= 360^\circ - 2\beta - (180^\circ - \alpha - \beta) \\
  &= 180^\circ + \alpha - \beta
\end{aligned}
$$
故 $\angle DBK = \angle KCF$．

有了全等之后，我们就有 $KD = KF$．

如果已知 $P$ 是 $DF$ 的中点，由「三线合一」可知 $KP \perp DF$，即 $\triangle KPA$ 是直角三角形，$KQ$ 是其斜边中线，于是
$$
PQ = \dfrac{1}{2} AK = AQ
$$

如果已知 $QA  = QP$，由 $QK = QA = QP$ 可知 $\angle KPA = 90^\circ$，再由「三线合一」可知 $PD = PF$．

### 构造三角形的中位线

这个时候我们没有办法利用中位线直接证明 $QA = QP$，但是我们可以分别取 $AD$、$AF$ 的中点 $M$、$N$，先证明 $QM= QN$．

![图8](image-20200404005413523.png)

我们分别取 $AB$、$AC$ 的中点 $S$、$T$，于是可以证明 $\triangle MSQ \cong \triangle QTN$．其中 $\angle MSQ = \angle QTN$ 的证明和上一个方法类似．

于是接下来，只需要证明 $\triangle QAM \cong \triangle QPN$ 即可（或者过 $Q$ 作 $AP$ 的垂线，利用三线合一来做）．
$$
\begin{aligned}
  PD = PF &\implies AM = \frac{1}{2} AD \\
  &= \frac{1}{2}(DF - AF) \\
  &= PF - NF = PN \\
  &\implies \mathrm{SAS} \\
  \\
  QA = QP &\implies \mathrm{AAS}
\end{aligned}
$$

### 两种方法的联系

实际上，如果我们把上一种方法的图和这一种方法的图放在一起，就会发现这两组三角形其实是相似的．

![图9](image-20200404010445766.png)

### 构造梯形的中位线

这种方法和`图4`的证明是一样的，这里就不在重复了．

可以看出，这是最简单的一种证明方法．

### 构造旋转相似

这个图还有一个证明方法，就是构造 $A$ 关于 $BC$ 的对称点 $S$，如`图10`，则
$$
\begin{aligned}
  \angle SBD &= 2\angle SAD \\
  &= 2\left( 180^\circ - \angle SAF \right) \\
  &= \angle SCF
\end{aligned}
$$
于是 $\triangle SBD \sim \triangle SCF$，这是一组旋转相似．

![图10](image-20200403130658955.png)

如果已知 $P$ 是 $DF$ 的中点，那么就有 $\triangle SBD \sim \triangle SQP \sim \triangle SCF$，因此 $AQ = SQ = PQ$．

{% note info %}
具体的推导过程如下：
$$
\begin{aligned}
  & \triangle SBD \sim \triangle SCF \\
  \implies & \triangle SBC \sim \triangle SDF \\
  \implies & \triangle SBQ \sim \triangle SDP \\
  \implies & \triangle SBD \sim \triangle SQP
\end{aligned}
$$
{% endnote %}

如果已知 $QA  = QP$，那么
$$
\begin{aligned}
  \angle SBD &= 2\angle SAD \\
  &= 2\left( 180^\circ - \angle SAP \right) \\
  &= \angle SQP
\end{aligned}
$$
于是 $\triangle SBD \sim \triangle SPQ$．由于 $Q$ 是 $BC$ 中点，所以 $P$ 是 $DF$ 的中点．

{% note info %}
具体的推导过程如下：
$$
\begin{aligned}
  &\left.
  \begin{array}{r}
    \triangle SBD \sim \triangle SCF \\
    \implies \triangle SBC \sim \triangle SDF \\
    \\
    \triangle SBD \sim \triangle SQP \\
    \implies \triangle SBQ \sim \triangle SDP
  \end{array}
  \right\} \\
  \\
  & \;\;\implies \frac{BC}{DF} = \frac{SB}{SD} = \frac{BQ}{DP}
\end{aligned}
$$
因此
$$
\frac{DP}{DF} = \frac{BQ}{BP} = \frac{1}{2}
$$
即 $P$ 为 $DF$ 的中点．
{% endnote %}

![图11](image-20200403132128065.png)

这种方法大量用到了相似和圆周角的性质，由此又可以引申出关于双圆问题的一些结论．有兴趣的朋友可以自行探究一下．

### 和前文图形的关系

我们回过头来看一下`图8`，注意在这个图中我们平没有用到 $D$、$F$ 这两个点，因此我们考虑把这两个点去掉，于是这个图就变成了下面这样：

![图12](image-20200404013143185.png)

如`图12`，$\triangle AMB$ 和 $\triangle ANC$ 都是直角三角形，且 $M$、$A$、$N$ 共线，取 $BC$ 的中点 $Q$，则 $QM = QN$．

对比一下我们前面那篇文章中的`图11`，那个图的条件实际上两个直角三角形加上 $\angle MAB = \angle CAN$，而`图12`中则加上 $M$、$A$、$N$ 共线，两个条件不同，结论却是相同的．

---

至此，这个模型的讨论就暂时告一段落．我们在这三篇文章中，系统地讨论了和两个正方形相关的中点问题，以及他们的推广和变形．我们看到，解决这类问题的关键点在于处理好「中点」的条件．我们需要熟练地掌握「倍长中线」和「中位线」的技巧，才能够顺利地解决这些问题．
