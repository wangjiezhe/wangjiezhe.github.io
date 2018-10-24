---
title: 形如 6k±1 的素数
date: 2018-10-24 21:33:40
tags:
  - 素数
  - 欧几里得
categories:
  - 数学
  - 初等数论
description: 证明有无穷多个形如 6k±1 的素数。
mathjax: true
---

欧几里得曾经给出过一个素数有无穷多个的证明：

{% note info %}

设 $P$ 是一个包含有限个素数的集合，令
$$
N=\prod_{p \in P} p + 1
$$
则 $\forall p \in P$ ，$p \nmid N$ ，所以 $N$ 必有一个素因子不在集合 $P$ 中，故 $P$ 不可能包含所有的素数，也就是说，素数一定有无穷多个。

{% endnote %}

应用类似的方法，可以证明形如 $6k - 1$ 的素数也有无穷多个：

{% note success %}

设 $P$ 是一个包含有限个形如 $6k - 1$ 的素数的集合，令
$$
N=6 \cdot \prod_{p \in P} p - 1
$$
则 $\forall p \in P$，$p \nmid N$。但素数一定有 $6k \pm 1$ 的形式，而形如 $6k+1$ 的数的乘积还是 $6k+1$ 的形式，不可能得到 $6k-1$ 的形式，故 $N$ 必有一个形如 $6k-1$ 的素因子，且这个素因子不在 $P$ 中，故 $P$ 不可能包含所有形如 $6k - 1$ 的素数，也就是说，形如 $6k - 1$ 的素数有无穷多个。

{% endnote %}

而用同样的方法无法证明形如 $6k+1$ 的素数有无穷多个，我们需要另辟蹊径。

下面给出两个证明：

{% note info %}

证明一：

设 $P$ 为一个包含有限个形如 $6k + 1$ 的素数的集合，令
$$
N = 6 \cdot \prod_{p \in P} p
$$
考虑 $N^2-N+1$ 的素因子 $p$，因为 $N^3+1=(N+1) \cdot (N^2-N+1)$，所以 $p \mid N^3+1$，即 $N^3 \equiv -1 \pmod p$，所以 $N^6 \equiv 1 \pmod p$。

考虑 $N$ 对模 $p$ 的指数 $\delta_p (N)$。则必有 $\delta_p (N) \mid 6$，故 $\delta_p (N)$ 只能是 $1$，$2$，$3$ 或者 $6$。由 $N^3 \equiv -1 \pmod p$ 知， $\delta_p (N)$ 不可能是 $1$ 或 $3$。

如果 $\delta_p (N) = 2$ 的话，则有 $N^2 \equiv 1 \pmod p$，且 $N \equiv -1 \pmod p$，故 $p \mid N+1$，可得 $p \mid (N+1, N^2-N+1) = (N+1, 3) =1$，这是不可能的。

所以 $\delta_p (N)$ 只能等于 $6$。

而  $\delta_p (N) \mid \varphi(p) = p-1$，即 $6 \mid p-1$，故 $p$ 为 $6k+1$ 形式的素数，且 $p \notin P$。

所以 $P$ 不可能包含所有形如 $6k + 1$ 的素数，也就是说，形如 $6k + 1$ 的素数有无穷多个。

{% endnote %}

{% note success %}

证明二：



{% endnote %}

事实上，我们有**狄利克雷定理**：

{% note primary %}

设 $a$、$b$ 为整数，且 $(a,b)=1$，则有无穷多个形如 $ax+b$ 的素数。

{% endnote %}

不过，这个定理的证明依赖于解析数论的内容，就不在我们的讨论范围之内了。



参考：

- https://mathblag.wordpress.com/2013/08/30/primes-of-the-form-6k1/
- https://math.stackexchange.com/questions/671820/proving-an-infinite-number-of-primes-of-the-form-6n1
- *Elementary Number Theory: Primes, Congruences, and Secrets* by William Stein

