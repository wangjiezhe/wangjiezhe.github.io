---
title: 奔驰定理与重心坐标
date: 2021-03-12 11:08:14
updated: 2021-03-12 11:08:14
categories:
  - 数学
tags:
  - 向量
  - 重心坐标
description: 介绍平面中的重心坐标系
mathjax: true
typora-root-url: 2021-03-12-Barycentric-coordinate-system
---

## 奔驰定理

在讲平面向量的时候，遇到了一个经典的题目：

{% note info %}

已知点 $P$ 为 $\triangle ABC$ 内一点，求证：$S_{\triangle PBC} \cdot \overrightarrow{PA} + S_{\triangle PCA} \cdot \overrightarrow{PB} + S_{\triangle PAB} \cdot \overrightarrow{PC} = \mathbf{0}$．

{% endnote %}

证明如下：如图，延长 $AP$ 交 $BC$ 于 点 $Q$，则 $\dfrac{S_{\triangle PBC}}{S_{\triangle PCA} + S_{\triangle PAB}} = \dfrac{|PQ|}{|AP|}$，

故 $\overrightarrow{PQ} = - \dfrac{S_{\triangle PBC}}{S_{\triangle PCA} + S_{\triangle PAB}} \cdot \overrightarrow{PA}$．

另外，因为 $|BQ|:|QC| = S_{\triangle PAB} : S_{\triangle PCA}$，所以 $
\overrightarrow{PQ} = \dfrac{S_{\triangle PCA} \cdot \overrightarrow{PB} + S_{\triangle PAB} \cdot \overrightarrow{PC}}{S_{\triangle PCA} + S_{\triangle PAB}}$，

故 $- S_{\triangle PBC} \cdot \overrightarrow{PA} = S_{\triangle PCA} \cdot \overrightarrow{PB} + S_{\triangle PAB} \cdot \overrightarrow{PC}$，移项后命题得证．

![](image-20210312112751459.png)

这个结论因为它的图形长得像奔驰的标志，被称为“奔驰定理”．

这个名字最早的出处不详，但实际上，这对应的就是三角形的“重心坐标”．

## 三角形的重心坐标

{% note primary %}

对 $\triangle ABC$ 所在平面内任意一点 $P$，如果存在不全为零的实数 $\lambda_0$，$\lambda _1$，$\lambda_2$，使得
$$
\left( \lambda_0 + \lambda_1 + \lambda_2 \right) \overrightarrow{OP} = \lambda_0 \overrightarrow{OA} + \lambda_1 \overrightarrow{OB} + \lambda_2 \overrightarrow{OC}
$$
对平面内任意一点 $O$ 成立，则称 $( \lambda_0 : \lambda_1 : \lambda_2 )$ 为点 $P$ 相对于 $\triangle ABC$ 的**重心坐标**．

{% endnote %}

显然，重心坐标并不是唯一的，$( k \lambda_0 : k \lambda_1 : k \lambda_2 )$ 也是点 $P$ 相对于 $\triangle ABC$ 的重心坐标．

为了保证唯一性，我们可以进行对其正规化，取 $\lambda_i^\prime = \lambda_i / \displaystyle\sum_{k=0}^2 \lambda_k$ ，则 $\displaystyle\sum_{i=0}^2 \lambda_i^\prime = 1$，此时称 $(\lambda_0^\prime : \lambda_1^\prime : \lambda_2^\prime)$ 为其**正规化（重心）坐标**．

### 重心坐标的存在性

对 $\triangle ABC$ 所在平面内任意一点 $P$，根据平面向量基本定理，存在唯一的实数对 $(\lambda, \mu)$，使得 $\overrightarrow{AP} = \lambda \overrightarrow{AB} + \mu \overrightarrow{AC}$．因此
$$
\begin{aligned}
\overrightarrow{OP} &= \overrightarrow{OA} + \overrightarrow{AP} \\
&= \overrightarrow{OA} + \lambda \overrightarrow{AB} + \mu \overrightarrow{AC} \\
&= \overrightarrow{OA} + \lambda \left( \overrightarrow{OB} - \overrightarrow{OA} \right) + \lambda \left( \overrightarrow{OC} - \overrightarrow{OA} \right) \\
&= (1-\lambda-\mu)\overrightarrow{OA} + \lambda\overrightarrow{OB} + \mu\overrightarrow{OC}
\end{aligned}
$$

取 $( \lambda_0, \lambda_1, \lambda_2 ) = (1-\lambda-\mu,\lambda,\mu)$ 即可．注意这已经是正规化坐标．

### 正规化坐标的符号

当点 $P$ 位于 $\triangle ABC$ 内部的时候，$\lambda, \mu, \lambda+\mu \in (0,1)$，故 $1-\lambda-\mu \in (0,1)$，也就是三项均是正数．

对于 $\triangle ABC$ 外的情况，可以参考下图：

![](image-20210312123927467.png)

### 重心坐标的几何意义

在平面直角坐标系 $xOy$ 中，设 $A(x_1,y_1)$，$B(x_2,y_2)$，$C(x_3,y_3)$，$P(x_P,y_P)$，点 $P$ 相对于 $\triangle ABC$ 的重心坐标为 $(\alpha:\beta:\gamma)$，其中 $\alpha+\beta+\gamma=1$．

根据定义，$\overrightarrow{OP} = \alpha\overrightarrow{OA} + \beta\overrightarrow{OB} + \gamma\overrightarrow{OC}$，因此
$$
\left\{
\begin{aligned}
x_P &= \alpha x_1 + \beta x_2 + \gamma x_3 \\
y_p &= \alpha y_1 + \beta y_2 + \gamma y_3 \\
1 &= \alpha + \beta + \gamma
\end{aligned}
\right.
\Longleftrightarrow
\begin{pmatrix}
x_P \\ y_P \\ 1
\end{pmatrix}
=
\begin{pmatrix}
x_1 & x_2 & x_3 \\
y_1 & y_2 & y_3 \\
1 & 1 & 1
\end{pmatrix}
\begin{pmatrix}
\alpha \\ \beta \\ \gamma
\end{pmatrix}
$$
根据 Cramer 法则，
$$
\alpha = \frac{S_{\triangle PBC}}{S_{\triangle ABC}},\quad
\beta = \frac{S_{\triangle PCA}}{S_{\triangle ABC}},\quad
\gamma = \frac{S_{\triangle PAB}}{S_{\triangle ABC}}
$$
这里的面积指的是三角形的有向面积，正负与三个点的位置关系有关．

所以，$(S_{\triangle PBC}:S_{\triangle PCA}:S_{\triangle PAB})$ 就是点 $P$ 相对于 $\triangle ABC$ 的重心坐标，这对应的就是“奔驰定理”中的三个系数．

实际上，根据“奔驰定理”，
$$
S_{\triangle PBC} \cdot \left(\overrightarrow{OA} - \overrightarrow{OP}\right) + S_{\triangle PCA} \cdot  \left(\overrightarrow{OB} - \overrightarrow{OP}\right) + S_{\triangle PAB} \cdot  \left(\overrightarrow{OC} - \overrightarrow{OP}\right) = \mathbf{0}
$$
移项得
$$
\left(S_{\triangle PBC}  + S_{\triangle PCA}  + S_{\triangle PAB}\right) \cdot \overrightarrow{OP}
=
S_{\triangle PBC} \cdot \overrightarrow{OA} + S_{\triangle PCA} \cdot \overrightarrow{OB} + S_{\triangle PAB} \cdot \overrightarrow{OC}
$$
也可以直接得到，当点 $P$ 在 $\triangle ABC$ 内部的时候，它相对于 $\triangle ABC$ 的重心坐标为 $(S_{\triangle PBC}:S_{\triangle PCA}:S_{\triangle PAB})$．

由于三角形的重心坐标和面积有关系，因此也被称为面积坐标．

### 重心坐标名称的来源

考虑平面内三个质点 $A$、$B$、$C$，它们的质量分别为 $m_1$、$m_2$、$m_3$，则该质心系的质心相对于 $\triangle ABC$ 的重心坐标恰好为 $(m_1,m_2,m_3)$．

## 三角形各中心的重心坐标

下表列出了几个常见的三角形中心的重心坐标．

| 名称 |                           重心坐标                           |
| :--: | :----------------------------------------------------------: |
| 重心 |                           $1:1:1$                            |
| 内心 |                           $a:b:c$                            |
| 外心 | $a(b^2 + c^2 - a^2) : b(c^2 + a^2 - b^2) : c(a^2 + b^2 - c^2)$<br />$\sin 2A:\sin2B:\sin 2C$<br />$(1-\cos B\cos C):(1-\cos C\cos A):(1-\cos A\cos B)$ |
| 垂心 | $(a^{2}+b^{2}-c^{2})(a^{2}-b^{2}+c^{2}):(-a^{2}+b^{2}+c^{2})(a^{2}+b^{2}-c^{2}):(a^{2}-b^{2}+c^{2})(-a^{2}+b^{2}+c^{2})$<br />$\tan A:\tan B:\tan C$<br />$a\cos B\cos C:b\cos C\cos A:c\cos A\cos B$ |
| 旁心 |         $-a:b:c\quad \quad a:-b:c\quad \quad a:b:-c$         |

其它特殊点的重心坐标，可以查看 [ETC](https://faculty.evansville.edu/ck6/encyclopedia/ETC.html)，里面每个点下面列出的 `Barycentrics` 就是该点的重心坐标．

## 重心坐标的一般定义

事实上，重心坐标的定义可以推广到 $n$ 维向量空间，甚至是仿射空间．

考虑 $n$ 维仿射空间 $\mathbf A$ 中的仿射无关的 $n+1$ 个点 $A_0,A_1,\cdots,A_n$，即 $A_0,A_1,\cdots,A_n$ 是一个 $n$ 维单形的顶点，则对于任意一点 $P \in \mathbf A$，存在不全为零的实数 $\lambda_0,\lambda_1,\cdots,\lambda_n$，使得
$$
(\lambda_0+\lambda_1+\cdots+\lambda_n)\overrightarrow{OP} = \lambda_0\overrightarrow{OA_1}+\lambda_1\overrightarrow{OA_2}+\cdots+\lambda_n\overrightarrow{OA_n}
$$
对于任意一点 $O$ 成立，则称 $(\lambda_0:\lambda_1:\cdots:\lambda_n)$ 为点 $P$ 相对于 $A_0,A_1,\cdots,A_n$ 的重心坐标．

重心坐标是一种齐次坐标，在仿射变换下保持不变．

$(\lambda_0:\lambda_1:\cdots:\lambda_n)$ 和 $(\mu_0:\mu_1:\cdots:\mu_n)$ 都是点 $P$ 相对于 $A_0,A_1,\cdots,A_n$ 的重心坐标的充要条件是，存在非零常数 $k$，使得对于任意的 $i$，有 $\lambda_i = k\mu_i$．

类似的，也可以对其进行正规化，取 $\displaystyle\sum_{i=0}^n \lambda_i=1$ 即可．

