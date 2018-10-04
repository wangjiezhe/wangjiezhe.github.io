---
title: Linux 随学随记 (2)
categories:
  - Linux
tags:
  - linux
  - vim
date: 2014-03-19 00:00:00
---

## 一、vim切换tab:

向后  `:tabn`
向前  `:tabp`

## 二、vim与系统剪贴板的交互 (仅限于gvim!!!)

`"+y`
复制到剪贴板

`"+p`
从剪贴板粘贴

## 三、vim重复命令

`.`
重复上次操作，前面可加次数

`:[range]g[lobal]/{pattern}/[cmd]`
在 `[range]` 界定的匹配模式 `{pattern}` 的文本行上执行Ex 命令 `[cmd]` （缺省是 `:p`）。

`:[range]g[lobal]!/{pattern}/[cmd]`
在 [range] 界定的_不_匹配模式 {pattern} 的文本行上执行 Ex 命令 [cmd] （缺省是 `:p`）。

`:[range]v[global]/{pattern}/[cmd]`
等同于 :g!。

## 四、vim中tab与空格的转换 (慎用！！！)

`:ret[ab][!] [new_tabstop]`
将制表符`<TAB>`转换为空格符，数量由`[new_tabstop]`指定。若为空或为0，则使用默认的`tabstop`。
若有`!`，则将空格序列转化为`<TAB>`。

## 五、查看中文帮助:

**`man -L zh_CN.utf8 command`**

## 六、查看日志:

`journalctl [OPTIONS...] [MATCHES...]`

Options:

```
  -f --follow        Follow the journal
     --since=DATE    Start showing entries on or newer than the specified date
     --until=DATE    Stop showing entries on or older than the specified date
  -l --full          Do not ellipsize fields
  -u --unit=UNIT     Show data only from the specified unit
     --disk-usage    Show total disk usage of all journal files
```
