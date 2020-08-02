---
title: 常用 tkz-euclide 命令（二）——直线形的定义方法
date: 2020-07-04 17:44:49
updated: 2020-07-07 02:33:51
categories:
  - Latex
tags:
  - tikz
  - 画图
mathjax: true
---

在上一节中，总结了各种定义特殊点的方法，这一节主要讲述如何定义各类直线形——直线，三角形和多边形．

<!-- more -->

## 定义直线形的方法

### 定义直线

命令：`\tkzDefLine[<options>](A,B) or (A,B,C)  \tkzGetPoints{P}{Q} or \tkzGetPoint{P}` 

| 描述                                              | 默认长度                                    | 选项                                                      |
| ------------------------------------------------- | ------------------------------------------- | --------------------------------------------------------- |
| $AB$ 的垂直平分线 $PQ$                            | 正$\triangle ABP$、$\triangle ABQ$          | 默认，或者 `mediator`                                     |
| 过 $M$ 的垂线 $MP\perp AB$                        | $MP=AB$                                     | `perpendicular=through M` <br />或 `orthogonal=through M` |
| 过 $M$ 的平行线 $MP \parallel AB$                 | $\overrightarrow{MP}=\overrightarrow{AB}$． | `parallel=through M`                                      |
| $\angle ABC$ 的角平分线 $BP$                      | 很长，建议<br />使用 `normed`               | `bisector`                                                |
| $\angle ABC$ 的邻补角 $\angle A'BC$ 的平分线 $BP$ | 很长，建议<br />使用 `normed`               | `bisector out`                                            |
|                                                   |                                             |                                                           |
| 变换系数                                          |                                             | `K=1`                                                     |
| 正交化                                            |                                             | `normed`                                                  |

### 定义切线

| 描述                                   | 命令                                                         |
| -------------------------------------- | ------------------------------------------------------------ |
| 过 $\odot O$ 上点 $A$ 的切线 $AP$      | `\tkzDefTangent[at=A](O)  \tkzGetPoint{P}`                   |
| 过$\odot O$ 外点 $A$ 的切线 $AP$、$AQ$ | `\tkzDefTangent[from=A](O, K)  \tkzGetPoints{P}{Q}` <br />或 `\tkzDefTangent[from with R=A](O, r cm)\tkzGetPoints{P}{Q}` |

### 定义三角形

命令：`\tkzDefTriangle[<options>](A,B)  \tkzGetPoint{C}`

| 种类                                                         | 选项                 |
| ------------------------------------------------------------ | -------------------- |
| 已知两个角（$\angle A=\alpha \degree$，$\angle B=\beta \degree$） | `two angles=α and β` |
| 等边三角形                                                   | `equilateral`        |
| 勾股三角形（$AB:BC:AC=4:3:5$）                         | `pythagore`          |
| 含有 $30 \degree$ 的直角三角形（$\angle A=30 \degree$，$\angle B=90 \degree$） | `school`             |
| 黄金三角形（$\angle A=36 \degree$，$\angle B=\angle C=72\degree$） | `gold`               |
| 黄金三角形（$\angle C=36 \degree$，$\angle A=\angle B=72\degree$） | `euclide`            |
| 黄金矩形的一半（$\angle B=90\degree$，$\dfrac{AB}{BC}=\varphi$） | `golden`             |
| 胡夫三角形（$AB:BC:AC=2:\varphi:\varphi$）                   | `cheops`             |

### 定义特殊三角形

命令：`\tkzDefSpcTriangle[<options>](A,B,C)`，对应的「心」存在 `tkzPointResult` 中

| 描述                                 | 对应的「心」 | 选项                   |
| ------------------------------------ | ------------ | ---------------------- |
|                                      | 内心         | `in` 或 `incentral`    |
| 旁心三角形                           |              | `ex` 或 `excentral`    |
| 内切点三角形                         | Gergonne 点  | `intouch` 或 `contact` |
| 旁切点三角形                         | Nagel 点     | `extouch`              |
| 中点三角形                           | 重心         | `centroid` 或 `medial` |
| 垂足三角形                           | 垂心         | `orthic`               |
| 九点圆和旁切圆切点三角形             |              | `feuerbach`            |
| 欧拉三角形（由顶点与垂心的中点构成） |              | `euler`                |
| 外接圆外切三角形                     |              | `tangential`           |

### 定义特殊多边形

| 图形                                 | 命令                                             |
| ------------------------------------ | ------------------------------------------------ |
| 正方形                               | `\tkzDefSquare(A,B)  \tkzGetPoints{C}{D}`        |
| 平行四边形                           | `\tkzDefParallelogram(A,B,C)  \tkzGetPoint{D}`   |
| 黄金矩形（$\dfrac{AB}{BC}=\varphi$） | `\tkzDefGoldRectangle(A,B)  \tkzGetPoints{C}{D}` |

### 定义正多边形

命令：`\tkzDefRegPolygon[<options>](A,B)`  

| 描述                        | 选项      |
| --------------------------- | --------- |
| 第一个字母为中心（默认）    | `center`  |
| 两个字母为相邻顶点          | `side`    |
| 边数                        | `sides=5` |
| 顶点命名（$P_1$、$P_2$、…） | `name=P`  |

## 绘制直线形的方法

### 绘制直线

绘制一条直线：`\tkzDrawLine[<options>](A,B)`

绘制多条直线：`\tkzDrawLines[<options>](A,B C,D ...)`

自定义直线的样式：`\tkzSetUpLine[<options>]`

| 样式 | 默认选项                                                     |
| ---- | ------------------------------------------------------------ |
| 样式 | `style=solid`（或 `dashed`、`densely dashed`、`dotted`、`densely dotted`） |
| 粗细 | `line width=0.4pt`                                           |
| 颜色 | `color=black`                                                |
| 延长 | `add= .2 and .2`                                             |

### 绘制三角形中的特殊线段

| 名称     | 命令                                                         |
| -------- | ------------------------------------------------------------ |
| 中线     | `\tkzDrawLine[median](A,B,C)` <br /> 或 `\tkzDrawMedian(A,B,C)` |
| 角平分线 | `\tkzDrawLine[bisector](A,B,C)` <br /> 或 `\tkzDrawBisector(A,B,C)` |
| 高       | `\tkzDrawLine[altitude](A,B,C)` <br /> 或 `\tkzDrawAltitude(A,B,C)` |

### 绘制线段

绘制一条线段：`\tkzDrawSegment[<options>](A,B)`（相当于 `\draw (A)--(B)`）

绘制多条线段：`\tkzDrawSegments[<options>](A,B C,D ...)`

### （定义并）绘制三角形

命令：`\tkzDrawTriangle[<options>](A,B)  \tkzGetPoint{C}`

### （定义并）绘制正方形

命令：`\tkzDrawSquare[<options>](A,B)  \tkzGetPoints{C}{D}`

### （定义并）绘制黄金矩形

命令：`\tkzDrawGoldRectangle[<options>](A,B)  \tkzGetPoints{C}{D}`

### 绘制多边形

命令：`\tkzDrawPolygon[<options>](A,B,C,...)`

### 绘制多边形链

命令：`\tkzDrawPolySeg[<options>](A,B,C,...)`

## 填充直线形的方法

### 填充多边形

命令：`\tkzFillPolygon[<options>](A,B,C,...)`

## 标记直线形的方法

### 标记直线

命令：`\tkzLabelLine[<options>](A,B){<text support tex>}`

| 描述     | 选项                       |
| -------- | -------------------------- |
| 相对位置 | `pos=.5`                   |
| 位置     | `above/below + left/right` |
| 颜色     | `black`                    |

### 标记线段

标记一条线段：`\tkzLabelSegment[<options>](A,B)`

标记多条线段：`\tkzLabelSegments[<options>](A,B C,D ...)`

选项和直线相同．

### 用符号标记线段

标记一条线段：`\tkzMarkSegment[mark=<mark option>, <other options>](A,B)`

标记多条线段：`\tkzMarkSegment[mark=<mark option>, <other options>](A,B C,D ...)`

| 符号     | 标记选项            |
| -------- | ------------------- |
| 部分字母 | `o`、`s`、`x`、`z`  |
| $\infty$ | `oo`                |
| 直竖线   | `|`、`||`、`|||`    |
| 斜竖线   | `s|`、`s||`、`s|||` |

| 描述     | 其它选项   |
| -------- | ---------- |
| 相对位置 | `pos=.5`   |
| 大小     | `size=4pt` |
| 颜色     | `black`    |