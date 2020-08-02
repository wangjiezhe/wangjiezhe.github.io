---
title: Mathematica 中特殊符号的使用规则
date: 2020-07-05 21:06:35
updated: 2020-07-05 21:06:35
categories:
  - 数学
  - 软件
tags:
  - Mathematica
---

最近因为一些原因重新开始使用 Mathematica，Mathematica 的符号计算功能非常强大，但是在网上搜索别人的代码的时候，发现很难看懂，里面各种「@#%^&*?!」符号，看得人眼花缭乱。

所以在这里我们对一些常用的符号做一些总结。

<!-- more -->

## 前置、中置与后置运算符

我们知道，在数学中，我们很多时候习惯使用中置运算符，而计算机科学一般都是使用前置运算符，因此在 Mathematica 中，对于各种运算符都给了不同的符号。

```mathematica
f @ x
x // f
(* 结果是 *)
f[x]
```

需要注意的是，后置运算符 `//` 的运算优先级较低，例如 `1+x//f` 表示的是 `f[1+x]`，而不是 `1+f[x]`，这点在使用的时候需要注意，必要的时候可以加小括号。

对于有多个参数的函数，可以使用中置运算符：

```mathematica
x~f~y~f~z
(* 结果是 *)
f[x,y,z]
```

这种形式在连接列表（`~Join~`）、连接字符串（`<>`）等时候比较常见。

## 函数式编程符号

在函数式编程中，`Map`、`Apply` 是两个非常重要的函数，因此 Mathematica 专门规定了简写的符号。

`Map` 函数：

```mathematica
f /@ {a, b, c}
Map[f, {a, b, c}]
(* 结果是 *)
{f[a], f[b], f[c]}
```

注意，`Map` 函数不仅仅可以作用在列表上，还可以作用在表达式上

```mathematica
Map[f, a + b + c]
(* 结果是 *)
f[a] + f[b] + f[c]

Map[f, g[a, b, c]]
(* 结果是 *)
g[f[a], f[b], f[c]]
```

还有一个不太常用的符号 `//@`，表示的是 `MapAll` 函数：

```mathematica
f //@ {{a, b}, {c, d}, {x, y}}
MapAll[f, {{a, b}, {c, d}, {x, y}}]
Map[f, {{a, b}, {c, d}, {x, y}}, {0, Infinity}]
(* 结果是 *)
f[{f[{f[a], f[b]}], f[{f[c], f[d]}], f[{f[x], f[y]}]}]
```

`Apply` 函数：

```mathematica
f @@ {a, b, c}
Apply[f,{a, b, c}]
(* 结果是 *)
f[a, b, c]
```

另外，`Apply` 函数还有一种简写形式 `@@@`，表示在第 1 层应用函数（`@@` 默认是在最外层，也就是第 0 层）。

注意下面三个符号的不同点：

```mathematica
f @@ {{a, b}, {c, d}, {x, y}}
(* 结果是 *)
f[{a, b}, {c, d}, {x, y}]

f @@@ {{a, b}, {c, d}, {x, y}}
(* 结果是 *)
{f[a, b], f[c, d], f[x, y]}

f /@ {{a, b}, {c, d}, {x, y}}
(* 结果是 *)
{f[{a, b}], f[{c, d}], f[{x, y}]}
```

{% note primary %}
在使用 `Map` 和 `Apply` 函数的时候，一定要注意列表的层数，必要时需要指定层数来使用。
{% endnote %}

{% note info %}
Mathematica 中没有 `Reduce` 函数，可以视情况分别使用 `FoldList`、`ComposeList`、`NestList` 等函数。
{% endnote %}

{% note warning %}
Mathematica 中也没有 `Zip` 函数，可以视情况分别使用 `Thread`、`MapThread`、`MapIndexed` 等函数。
{% endnote %}

## 匿名函数（λ 函数）

```mathematica
(x ⟼ x^2) /@ Range[10]
(x \[Function] x^2) /@ Range[10]
Function[x, x^2] /@ Range[10]
(#1^2) & /@ Range[10]

(* 匿名函数可以直接作用于列表 *)
(#1^2) & @ Range[10]
Range[10] // (#1^2) &

(* 结果是 *)
{1, 4, 9, 16, 25, 36, 49, 64, 81, 100}
```

`&` 结尾表示一个匿名函数，其中 `#1`（`Slot[1]`）、`#2`（`Slot[2]`）等表示参数。`#1` 可简写为 `#`，`#0`（`Slot[0]`） 则表示函数本身。

`##`（即`##1`、`SlotSequence[]`）表示所有参数，`##k`（`SlotSequence[k]`） 表示从第 k 个开始后面的参数。

常见的用法比如定义谓词函数：

```mathematica
Select[{1, -1, 2, -2, 3, -3}, # >= -1 &]
(* 结果是 *)
{1, -1, 2, 3}
```

传递函数参数：

```mathematica
(* 牛顿法 *)
NewtonZero[f_, x0_] := FixedPoint[# - f[#]/f'[#] &, x0]
```

等等。

## 函数的复合

下面是函数复合的不同表示方法，其中 `@*` 表示左复合，`/*` 表示右复合。特别要注意其中的小括号。

```mathematica
f@*g@*h @@ {x, y, z}
(f@*g@*h)[x, y, z]
Composition[f, g, h][x, y, z]

h /* g /* f @@ {x, y, z}
(h /* g /* f)[x, y, z]
RightComposition[h, g, f][x, y, z]

f@g@h[x, y, z]
f@g@(h @@ {x, y, z})

h[x, y, z] // g // f
h @@ {x, y, z} // g // f

f[g[h[#1, #2, #3]]]& [x, y, z]
f[g[h[#1, #2, #3]]]& @@ {x, y, z}

(* 结果是 *)
f[g[h[x, y, z]]]
```

## 逻辑运算符

这部分和其它语言类似，`&&`（或 `∧`）表示且，`||`（或 `∨`）表示或，`!`（或 `¬`）表示非（否定）。

## 历史记录

`%` 表示上一个结果，`%%` 表示倒数第二个结果，`%%...%`（k 次）表示倒数第 k 次结果，`%n` 表示第 n 次计算的结果。

## 模式匹配

这部分我用的不多，主要是方程的解会以这种形式给出。`->` 表示转换规则，使用 `/.` 可以应用规则。

```mathematica
Solve[{x^2 + y == 5, x - y == 1}, {x, y}]
(* 结果是 *)
{{x -> -3, y -> -4}, {x -> 2, y -> 1}}

f[x, y] /. %
(* 结果是 *)
{f[-3, -4], f[2, 1]}
```

其它的还有字符串的模式匹配等等。

---

参考资料：

- [How to| 使用简写符号](https://reference.wolfram.com/language/howto/UseShorthandNotations.html)
- [What the @#%^&*?! do all those funny signs mean?](https://mathematica.stackexchange.com/questions/18393/what-are-the-most-common-pitfalls-awaiting-new-users/25616#25616)
