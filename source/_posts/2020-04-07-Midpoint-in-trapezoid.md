---
title: 梯形中点问题的探究与推广
date: 2020-04-07 16:36:08
updated: 2020-04-07 23:15:00
categories:
  - 数学
  - 平面几何
tags:
  - 全等
  - 梯形
description: 一个和直角梯形的腰中点有关的问题
mathjax: true
---

在前面的三篇文章中，我们探究了和正方形有关的中点问题．在本文中，我们来看一个和梯形有关的中点问题．

和梯形相关的中点问题，主要可以分为「底中点」和「腰中点」两大类．对于「底中点」相关的问题，我们合并到下一篇关于一般四边形的中点问题的文章中一起来讨论．今天我们重点来看一下和「腰中点」有关的问题．

## 「腰中点」的处理方法

对于「腰中点」相关的问题，主要的思路有两个：「倍长中线」和构造「中位线」．

是不是很熟悉？和前面正方形的处理方法是一样的．

### 倍长中线

如`图1`，$E$ 是腰 $CD$ 的中点，连结 $AE$ 并延长交 $BC$ 于 $F$，则有 $\triangle ADE \cong \triangle FCE$，于是 $E$ 也是 $AF$ 的中点，$AD = CF$．

这个方法相当于是 $\triangle ADE$ 旋转到了 $\triangle FCE$，于是把原来的梯形变成了一个三角形．

这个方法同时可以用来证明梯形的中位线定理．

![图1](image-20200407195909322.png)

### 梯形的中位线

如`图2`，$E$ 是腰 $CD$ 的中点，取 $AD$ 的中点 $F$，则 $EF$ 是梯形 $ABCD$ 的中位线，于是 $EF \parallel AB \parallel CD$，且 $EF = \dfrac{1}{2} (AB + CD)$．

![图2](image-20200407200434731.png)

## 直角梯形的「腰中点」

如`图3`，对于直角梯形 $ABCD$，$\angle A = \angle D = 90^\circ$，取腰 $BC$ 的中点 $E$，则 $EA = ED$，即 $\triangle AED$ 是等腰三角形．

![图3](image-20200407203742837.png)

用上面两种方法，都很容易证明这个命题．

### 一种特殊情况

如果在`图3`中加入 $AE \perp DE$，也就是 $\triangle AED$ 是等腰直角三角形的条件，那么 $AB + CD = AD$．

![图4](image-20200407202634748.png)

如果用第1种方法，如`图5`，则 $DE$ 垂直平分 $AF$， $\triangle ADF$ 是等腰直角三角形，
$$
\begin{aligned}
  AD &= DF\\
  &= DC + CF \\
  &= DC + AB
\end{aligned}
$$
![图5](image-20200407202836803.png)

如果用第2种方法，如`图6`，则
$$
AD = 2EF = AB + CD
$$
![图6](image-20200407203017868.png)

如果我们在 $AD$ 上取 $AM = DC$，则 $DM = AB$，$\triangle BAM \cong \triangle MDC$，于是 $\triangle MBC$ 是等腰直角三角形．

![图7](image-20200407203413192.png)

如果再考虑 $AE$ 与 $BM$ 的交点 $P$，$DE$ 与 $CM$ 的交点 $Q$，则有 $PQ \perp CD$，$BP = MQ$，$MP = CQ$．

![图8](image-20200407203931747.png)

因为 $\angle PMQ = \angle PEQ = 90^\circ$，所以 $EPMQ$ 四点共圆， $\angle EPQ = \angle EMQ = 45^\circ = \angle EAD$，故 $PQ \parallel QD$，于是有 $PQ \perp CD$．

由 $PQ \parallel QD$ 我们还可以得到 $AP = DQ$，于是 $\triangle ABP \cong DMQ$，故 $BP = MQ$，$MP = CQ$．

事实上，在这个图中，
$$
\begin{aligned}
\triangle ABP &\cong \triangle DMQ \\
\triangle AMP &\cong \triangle DCQ \\
\triangle BPE &\cong \triangle MQE \\
\triangle PME &\cong \triangle QCE
\end{aligned}
$$
于是
$$
S_{ABEM} = S_{DCEM}
$$

 如果考虑四点共圆的话，有 $ABEM$、$DCEM$、$EPMQ$ 三组四点共圆，而且这三个圆有公共弦 $EM$．

![图9](image-20200407204349872.png)

### 图形的来源

如果我们仔细观察一下`图7`，我们就会发现，这个图实际上是「弦图」的一半．

![图10](image-20200407204805206.png)

如果再考虑 $PQ$，那么这个图就相当于嵌套的两个弦图，于是`图8`中的结论就显然成立了．

![图11](image-20200407205207225.png)

### 变形

如果我们只考虑 $\triangle MBC$，那么就变成了这样一道题：

如`图12`，在等腰 $\mathrm{Rt} \triangle MBC$ 中，$E$ 是斜边 $BC$ 的中点，$MP = CQ$，则 $\triangle EPQ$ 是等腰直角三角形．

![图12](image-20200407210336181.png)

利用`图8`中的 $\triangle PME \cong \triangle QCE$，这个结论显然是成立的．

### 推广一

如果我们保留 $MB = MC$ 的条件（即 $ME \perp BC$），如`图13`，那么这个时候仍有 $\angle AED = \angle BMC$ 的结论成立．

![图13](image-20200407215302674.png)

注意到这个时候 $ABEM$、$DCEM$ 这两组四点共圆依旧成立，于是
$$
\begin{aligned}
  \angle BMC &= \angle BME + \angle CME \\
  &= \angle BAE + \angle CDE \\
  &= \angle AED
\end{aligned}
$$
或者
$$
\begin{aligned}
  \angle BMC &= 180^\circ - \angle MBE - \angle MCE \\
  &= 180^\circ - \angle MAE - \angle MDE \\
  &= \angle AED
\end{aligned}
$$
![图14](image-20200407215320597.png)

事实上，对于一般的梯形 $ABCD$，$AB \parallel CD$，过 $B$、$C$ 和 $AD$ 上一点 $M$ 作 $\triangle MDC$ 的外接圆交 $BC$ 于 $N$，则有 $\angle AND = \angle BMC$．

![图15](image-20200407220600095.png)

注意到
$$
\begin{aligned}
  \angle BAM &= 180^\circ - \angle MDC \\
  &= \angle MNC
\end{aligned}
$$
因此上面 $ABNM$ 四点也共圆．

剩下的证明和`图14`是完全一样的，只需要把式子中的 $E$ 点换成 $N$ 点就可以．

### 推广二

如果我们保留 $\angle BMC = \angle AND = 90^\circ$ 的条件，过 $B$、$C$ 和 $AD$ 上一点 $M$ 作 $\triangle MDC$ 的外接圆交 $BC$ 于 $N$，作 $\triangle AND$ 的外接圆与 $BC$ 的另一个交点 $P$，则 $AP \perp BM$，$DP \perp CM$．

![图16](image-20200407224616854.png)

证明中还用到上面推出的 $ABNM$ 四点共圆的结论：
$$
\begin{aligned}
  \angle DPN &= \angle DAN = \angle MBN \\
  \angle APB &= \angle ADN = \angle MCN
\end{aligned}
$$
![图17](image-20200407224550924.png)

于是 $DP \parallel BM$，$AP \parallel CM$，故 $AP \perp BM$，$DP \perp CM$．

类似地，如果作 $\triangle MBC$ 的外接圆与 $BC$ 交于 $N$，与 $AD$ 的另一个交点是 $Q$，则有 $AN \perp BQ$，$DN \perp CQ$．

![图18](image-20200407225514056.png)

证明的方法和上面相同：
$$
\begin{aligned}
  \angle ANB &= \angle AMB = \angle QCB \\
  \angle AQB &= \angle MCB = \angle MDN
\end{aligned}
$$
于是 $DN \parallel BQ$，$AN \parallel CQ$，故 $AN \perp BQ$，$DN \perp CQ$．

![图19](image-20200407225615430.png)

事实上，对于一般的梯形 $ABCD$，$AB \parallel CD$，如果过 $B$、$C$ 和 $AD$ 上一点 $M$ 作 $\triangle MDC$ 的外接圆交 $BC$ 于 $N$，作 $\triangle AND$ 的外接圆与 $BC$ 的另一个交点 $P$，那么依然有 $DP \parallel BM$，$AP \parallel CM$ 的结论成立．证明过程和前面完全相同．

![图20](image-20200407230050074.png)

#### 变形

我们把`图20`简化一下，就可以得到下面这个题目：

如`图21`，在梯形 $ABCD$ 中，$AB \parallel CD$，任取 $AD$ 上一点 $M$，作 $AP \parallel CM$ 交 $BC$ 于 $P$，则 $DP \parallel BM$．

![图21](image-20200407230745546.png)

这就变成了一个简单的平行线分线段成比例的题目．

我们不妨设 $DA$ 和 $CB$ 的延长线交于 $K$，则
$$
\begin{aligned}
  AB \parallel CD &\implies \frac{KA}{KD} = \frac{KB}{KC} \\
  \\
  AP \parallel CM &\implies \frac{KA}{KM} = \frac{KP}{KC}
\end{aligned}
$$
两式相除，可得
$$
\frac{KM}{KD} = \frac{KB}{KP} \implies BM \parallel DP
$$
![图22](image-20200407231555858.png)

