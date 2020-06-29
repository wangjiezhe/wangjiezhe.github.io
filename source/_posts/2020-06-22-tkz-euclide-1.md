---
title: 常用 tkz-euclide 命令（一）——点的定义方法
date: 2020-06-22 20:31:22
updated: 2020-06-29 23:20:16
categories:
  - Latex
tags:
  - tikz
  - 画图
description: 使用 tkz-euclide 宏包绘制几何图形
mathjax: true
---

基本格式：

```tex
\begin{tikzpicture}
  %%% 定义基础点
  \tkzDefPoint(0,0){A}
  \tkzDefPoint(1,0){B}
  %%% 定义各种图形及其它点
  \tkzDefSquare(A,B) \tkzGetPoints{C}{D}
  %%% 画出所有图形和点
  \tkzDrawPolygon(A,B,C,D)
  \tkzDrawPoints(A,...,D)
  %%% 标记图形和点
  \tkzLabelPoints[below](A,B)
  \tkzLabelPoints[above](C,D)
\end{tikzpicture}
```

相较于 `tikz` 宏包的优点：

- 常用的图形都有定义，可以直接画
- 命令的命名规则比较好记

缺点：

- 命名比较繁琐

## 定义点的方法

### 定义坐标点

| 方法                 | 命令                                                         |
| -------------------- | ------------------------------------------------------------ |
| 直角坐标             | `\tkzDefPoint(<x,y>){A}`                                     |
| 极坐标               | `\tkzDefPoint(<θ:ρ>){A}`                                     |
| 相对坐标             | `\tkzDefShiftPoint[A](<x,y> or <θ:ρ>){B}` 或者 <br /> `\tkzDefPoint[shift={(<x,y> or <θ:ρ>)}]((<x,y> or <θ:ρ>){B})`或者 <br />`\tkzDefPointOnCircle[angle=θ,center=A,radius=ρ] \tkzGetPoint{B}` |
| 批量定义（直角坐标） | `\tkzDefPoints{<x1/y1/A,x2/y2/B,...>}`                       |

### 定义相对点

| 方法                                                         | 命令                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| 中点                                                         | `\tkzDefMidPoint(A,B) \tkzGetPoint{C}`                       |
| 定比分点（$AP:PB=m:n$，即 <br />$\overrightarrow{OP}=\frac{n\overrightarrow{OA}+m\overrightarrow{OB}}{n+m}$） | `\tkzDefBarycentricPoint(<A=n，B=m>) \tkzGetPoint{P}`        |
| 定比分点（$\overrightarrow{AP}=k\overrightarrow{AB}$）       | `\tkzDefPointOnLine[pos=k](A,B)`                             |
| 重心坐标                                                     | `\tkzDefBarycentricPoint(<A=α1，B=α2,C=α3,...>) \tkzGetPoint{P}` |
| 内相似中心                                                   | `\tkzDefIntSimilitudeCenter(O1,r1)(O2,r2) \tkzGetPoint{I}`   |
| 外相似中心                                                   | `\tkzExtSimilitudeCenter(O1,r1)(O2,r2) \tkzGetPoint{J}`      |

### 定义几何变换点

命令：`\tkzDefPointBy[<option>](P) \tkzGetPoint{Q}`

批量变换：`\tkzDefPointsBy[<option>](M,N,...){P,Q,...}`

（如后面的为`{}`，则缺省值为`M',N',...`）

| 变换           | 选项                                  |
| ------------- | ------------------------------------- |
| 平移           | `translation=from A to B`             |
| 位似           | `homothety=center A ratio .5`         |
| 反射（轴对称）   | `reflection=over A--B`                |
| 中心对称        | `symmetry=center A`                   |
| 投影           | `projection=onto A--B`                |
| 旋转（角度）    | `rotation=center O angle 30`          |
| 旋转（弧度）    | `rotation in rad=center O angle pi/3` |
| 反演           | `inversion=center O through A`        |

### 定义向量变换点

命令：`\tkzDefPointWith[<options>](<A,B>) \tkzGetPoint{C}`

| 变换     | 描述                                                         | 选项                   |
| -------- | ------------------------------------------------------------ | ---------------------- |
| 正交     | $\overrightarrow{AC}=K\overrightarrow{AB}$，$\overrightarrow{AC}\perp\overrightarrow{AB}$． | `orthogonal`           |
| 单位正交 | $AC=K$，$\overrightarrow{AC}\perp\overrightarrow{AB}$．      | `orthogonal normed`    |
| 共线     | $\overrightarrow{AC}=K\overrightarrow{AB}$．                 | `linear`               |
| 单位共线 | $AC=K$，$\overrightarrow{AC}\parallel\overrightarrow{AB}$．  | `linear normed`        |
| 共线     | $\overrightarrow{MC}=K\overrightarrow{AB}$．                 | `colinear=at M`        |
| 单位共线 | $MC=K$，$\overrightarrow{MC}\parallel\overrightarrow{AB}$．  | `colinear normed=at M` |
| 变换系数 | K默认为1（与前面的选项组合使用）                             | `K=1`                  |

获取向量的坐标：`\tkzGetVectxy(<A,B>){<V>}`，则向量 $\overrightarrow{AB}$ 的坐标为 (`\Vx`,`\Vy`)．

### 定义三角形的各中心

命令：`\tkzDefTriangleCenter[<option>](<A,B,C>) \tkzGetPoint{P}`

| ETC 编号 | 名称                            | 描述                                                         | 选项          |
| -------- | ------------------------------- | ------------------------------------------------------------ | ------------- |
| X(1)     | 内心                            | 三条内角平分线的交点                                         | `in`          |
|          | 旁心（与B对应）                 | 两条外角平分线与一条内角平分线的交点                         | `ex`          |
| X(2)     | 重心                            | 三条中线的交点                                               | `centroid`    |
| X(3)     | 外心                            | 三条垂直平分线的交点                                         | `circum`      |
| X(4)     | 垂心                            | 三条高的交点                                                 | `ortho`       |
| X(5)     | 欧拉圆（九点圆）心              | 三边的中点、三高的垂足、<br />顶点到垂心的三条线段的中点<br />所在圆的圆心 | `euler`       |
| X(6)     | 类似重心（Lemoine点、莱莫恩点） | 重心的等角共轭点                                             | `symmedian`   |
| X(7)     | Gergonne点（热尔岗点）          | 内切点与对应顶点的三条连线的交点                             | `gergonne`    |
| X(8)     | Nagel点（奈格尔点）             | 旁切点与对应顶点的三条连线的交点                             | `nagel`       |
| X(9)     | mittenpunkt点                   | 旁切点三角形的类似重心                                       | `mittenpunkt` |
| X(10)    | Spieker点（斯俾克心）           | 中点三角形的内心                                             | `spieker`     |
| X(11)    | 费尔巴哈点                      | 内切圆与九点圆的切点                                         | `feuerbach`   |

### 定义随机点

命令：`\tkzDefRandPointOn[<local option>]  \tkzGetPoint{P}`

| 位置                 | 选项                                |
| -------------------- | ----------------------------------- |
| 线段                 | `segment=A--B`                      |
| 直线                 | `line=A--B`                         |
| 矩形                 | `rectangle=A and B`                 |
| 圆（已知半径长度）   | `circle=center A radius 2`          |
| 圆（已知半径线段）   | `circle through=center A through B` |
| 圆盘（已知半径线段） | `disk through=center A through B`   |

## 绘制点的方法

绘制单个点：`\tkzDrawPoint[<options>](A)`

绘制多个点：`\tkzDrawPoints[<options>](A,B,C,...)`

| 描述 | 选项                           |
| ---- | ------------------------------ |
| 形状 | shape=circle, cross, cross out |
| 大小 | size=6                         |
| 颜色 | color=black                    |
| 填充 | fill=black!50                  |

## 标记点的方法

标记单个点：`\tkzLabelPoint[<options>](A){<text support tex>}`

标记多个点：`\tkzLabelPoints[<options>](A,B,C,...)`

自动选择位置标记多个点：`\tkzAutoLabelPoints[center=M, <options>](A,B,C,...)`

| 描述     | 选项                     |
| -------- | ------------------------ |
| 位置     | above/below + left/right |
| 具体位置 | below right=3pt          |
| 字体大小 | font=\scriptsize         |
| 颜色     | color=black              |

