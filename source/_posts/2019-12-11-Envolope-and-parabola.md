---
title: 包络线与抛物线
date: 2019-12-11 14:51:00
updated: 2019-12-12 16:02:21
categories:
  - 数学
tags:
  - 抛物线
  - 包络线
  - 绣曲线
description: 一个错误引发的“血案”
mathjax: true
---

今天在给一个学生讲题的时候遇到了这样一道题目：

求 $\lvert x \rvert + \lvert y \rvert \le 3$ 所包含的区域的面积．

<p><img src="square.webp" width="300px"></p>

易知，这是个正方形，面积是 $\left(\sqrt{3}\right)^2=9$．它在第一象限的边界点应该是形如 $(t,3-t)$ 的点，都在 $x+y=3$ 这条直线上．

但是，这个学生却想成了 $(t,0)$ 和 $(0,3-t)$ 的连线，把所有这样的线都画出来，发现它的边界是一条弧线．于是，这个学生就认为它的边界应该是一条圆弧．

<p><img src="envolope.webp" width="300px"></p>

显然，这个学生的错误是很明显的．但这也带来了一个问题：如果按照学生所想的，那么面积应该是多少？

那么首先需要确定的是，它的边界到底是什么？

## 边界曲线

我们只考虑第一象限的情况．

### 解法一

这个区域的边界，应该是取最靠外的点，或者是，最靠上的点．于是我们可以想办法求出，在每一个 $x$ 处，对应的 $y$ 的最大值．

设线段的方程为
$$
\frac{x}{a}+\frac{y}{3-a}=1 \tag{1}
$$
其中 $0<a<3$，$0 \le x \le 3$，于是
$$
\begin{aligned}
       y &= (3-a)\left(1-\frac{x}{a}\right) \\
         &= 3+x-a-\frac{3x}{a} \\
         &= 3+x-\left(a+\frac{3x}{a}\right) \\
         &\le 3+x-2\sqrt{a\cdot \frac{3x}{a}} \\
         &= 3+x-2\sqrt{3x} \\
         &= \left(\sqrt{3}-\sqrt{x}\right)^2
    \end{aligned}
$$
所以边界应该是
$$
\sqrt{x}+\sqrt{y}=\sqrt{3}\tag{2}.
$$

### 解法二

世界上，这个边界是所有满足条件的线段的[包络线][1]．

设线段所在直线的方程为
$$
\begin{aligned}
        F(x,y,a) &= (3-a)x+ay-a(3-a) \\
                 &= a^2-(x-y+3)a+3x \\
                 &= 0
    \end{aligned}
$$
于是有
$$
    \frac{\partial{F}}{\partial{a}} = 2a-(x-y+3)=0
$$
从而 $a=\dfrac{x-y+3}{2}$，代入到前一个方程消去 $a$，可以得到
$$
    \frac{1}{4}(x-y+3)^2-\frac{1}{2}(x-y+3)^2+3x=0
$$
化简得
$$
    (x-y+3)^2=12x \tag{3}
$$
可以验证，方程 $(3)$ 和我们前面求出的方程 $(2)$ 是一致的．

### 解法三

设直线方程同解法二，注意到对于每一个 $(x,y)$，有且仅有一个 $a$ 满足条件．于是有
$$
    \Delta=(x-y+3)^2-12x=0
$$
很明显，和解法二得到的结果是一样的．

> 此解法的[出处][2]
> 此处称该曲线为绣曲线，但我只在此处和中文维基百科的[包络线][3]里面见到了这个名词．目前还不清楚这是否是通用的名词．

## 围出的面积

第一象限所求的面积，就相当于边界和 $x$ 轴所夹的面积，因此
$$
\begin{aligned}
        S &= \int_0^3 \left(3+x+2\sqrt{3x}\right)\mathrm{d}x \\
          &= \left.\left[3x+\frac{1}{2}x^2+\frac{2}{3}\cdot \frac{2}{3}(3x)^{\frac{3}{2}}\right]\right|_0^3 \\
          &= 9+4.5+4 \\
          &= 22.5
    \end{aligned}
$$
于是四个象限的区域面积一共是 $22.5\times 4=90$．

## 曲线的类型

很明显，这是一条二次曲线的一部分．经过仿射变换
$$
    \begin{cases}
        x'=x \\
        y'=x-y+3
    \end{cases}
$$
变为 ${y'}^2=3x$，容易看出这是一条抛物线．

如果要做保距变换的话，则是
$$
\begin{pmatrix}
        x \\[12pt]
        y
    \end{pmatrix} =
    \begin{pmatrix}
        \cos\dfrac{\pi}{4} & -\sin\dfrac{\pi}{4} \\[10pt]
        \sin\dfrac{\pi}{4} & \cos\dfrac{\pi}{4}
    \end{pmatrix}
    \begin{pmatrix}
        x' \\[12pt]
        y'
    \end{pmatrix} +
    \begin{pmatrix}
        \dfrac{3}{4} \\[8pt]
        \dfrac{3}{4}
    \end{pmatrix}
$$
此时方程变为 ${y'}^2=3\sqrt{2}x'$，焦点为 $\left(\dfrac{3\sqrt{2}}{4},0\right)$，准线为 $x'=-\dfrac{3\sqrt{2}}{4}$．

于是原抛物线的焦点是 $\left(\dfrac{3}{2},0\right)$，准线为 $y=x$．

## 问题拓展

在高中学习抛物线的时候，有这样一道题目：

对于抛物线 $y^2=2px$，过点$K\left(-\dfrac{p}{2},0\right)$ 作抛物线的两条切线，切点分别为 $A$、$B$，过抛物线在两切点之间的部分上的任意一点，作抛物线的切线，分别交 $KA$、$KB$ 与 $M$、$N$，求证： $\left|KM\right|+\left|KN\right|$ 为定值．

<p><img src="parabola.webp" width="300px"></p>

### 证明

抛物线在 $\left(x_0,y_0\right)$ 处的切线是 $MN: y=\dfrac{p}{y_0}\left(x+x_0\right)$．易知经过 $K$ 的两条切线的方程为 $y=\pm\left(x+\dfrac{p}{2}\right)$，从而可解得交点的纵坐标为 $y_{M,N}=\dfrac{\dfrac{p}{2}-x_0}{\pm 1-\dfrac{y_0}{p}}$，因此
$$
\left|KM\right|+\left|KN\right|=\sqrt{2}\left|y_M-y_N\right|=\sqrt{2}p
$$
为定值．

### 与前面的联系

其实仔细观察一下就会发现，抛物线这道题里面的 $MN$，就是我们方程 $(1)$ 所对应的线段，所有满足条件的 $MN$ 的包络线就是抛物线在 $A$、$B$ 之间的部分！




[1]: https://en.wikipedia.org/wiki/Envelope_(mathematics)
[2]: http://11235813.wikidot.com/geometry:20150927-envelope
[3]: https://zh.wikipedia.org/zh-hans/包络线
