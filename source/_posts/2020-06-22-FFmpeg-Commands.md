---
title: 常用 FFmpeg 命令
date: 2020-06-22 20:28:22
updated: 2020-06-22 20:28:22
categories:
  - 工作
tags:
  - 视频
description: 记录一些常用 FFmpeg 命令，以后不用每次再去搜索
---

## 剪裁文件

```bash
### 截取前一部分的视频
ffmpeg -t [duration] -i [input.mp4] -c copy [output.mp4]

### 截取后一部分视频
ffmpeg -ss [start] -i [input.mp4] -c copy [output.mp4]

### 截取中间一部分视频（结束时间确定）
ffmpeg -ss [start] -to [end] -i [input.mp4] -c copy [output.mp4]
### 或者（时长确定）
ffmpeg -ss [start] -t [duration] -i [input.mp4] -c copy [output.mp4]
```

时间格式：`HH:MM:SS.XXX`。

这里面使用 `-c copy` 的选项，避免重新进行编码，可以很快地进行剪裁。

{% note warning %}

这里 `-ss`、`-to`、`-t` 的选项放在 `-i` 选项之前，时间不是很精确，可能有几秒的误差，但是可以避免黑屏的问题。在对时间精确度要求不高的情况下这是最好的方案。

如果放在 `-i` 选项之后，会对输入文件进行逐帧解码，时间会比较准确，但可能出现黑屏问题，速度也比较慢。

{% endnote %}

一种更加精确的剪裁方法是：

```bash
ffmpeg -ss [start] -t [duration] -accurate_seek -i [input.mp4] -avoid_negative_ts 1 -c copy [output.mp4]
```

注意 `-accurate_seek` 选项要在 `-i` 选项之前。

如果需要非常精确的剪裁的话，需要重新进行编码，并使用 `-strict experimental` 或者 `-strict 2` 的选项。

## 合并文件

先把要合并的文件写在一个文本文件 `list.txt` 里：

```txt
file './split1.mp4'
file './split2.mp4'
file './split3.mp4'
```

然后再进行合并：

```bash
ffmpeg -f concat -i [list.txt] -c copy [output.mp4]
```

{% note danger %}

如果遇到 `Unsafe file name` 的错误（例如文件名中有空格），可以在 `-f` 和 `-i` 之间加上 `-safe 0` 的选项。

{% endnote %}

## 改变格式

```bash
### 重新编码
ffmpeg -i [input].mp4 [output].flv

### 不重新编码
ffmpeg -i [input].mp4 -c copy [output].flv
```

## 提取音频

```bash
ffmpeg -i [intput].mp4 -c:a copy [output.aac]
```

## 合并视频和音频

```bash
ffmpeg -i [input.mp4] -i [input.aac] -c copy [output.mp4]
```
