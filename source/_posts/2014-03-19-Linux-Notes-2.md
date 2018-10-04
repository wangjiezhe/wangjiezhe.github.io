---
title: Linux 随学随记 (2)
categories:
  - Linux
tags:
  - linux
  - vim
abbrlink: 30901
date: 2014-03-19 00:00:00
---

<br />

## 一、vim切换tab:

向后  `:tabn`{: style="color: red"} or `:tabnext`{: style="color: red"} or `gt`{: style="color: red"}  
向前  `:tabp`{: style="color: red"} or `:tabprev`{: style="color: red"} or `gT`{: style="color: red"}

  <br />

## 二、vim与系统剪贴板的交互 (仅限于gvim!!!)

`"+y`{: style="color: red"}
: 复制到剪贴板

`"+p`{: style="color: red"}
: 从剪贴板粘贴

  <br />

## 三、vim重复命令

`.`{: style="color: red"}
: 重复上次操作，前面可加次数

`:[range]g[lobal]/{pattern}/[cmd]`{: style="color: red"}
: 在 [range] 界定的匹配模式 {pattern} 的文本行上执行Ex 命令 [cmd] \(缺省是 ":p")。

`:[range]g[lobal]!/{pattern}/[cmd]`{: style="color: red"}
: 在 [range] 界定的_不_匹配模式 {pattern} 的文本行上执行 Ex 命令 [cmd] \(缺省是 ":p")。

`:[range]v[global]/{pattern}/[cmd]`{: style="color: red"}
: 等同于 :g!。

  <br />

## 四、vim中tab与空格的转换 (慎用！！！)

`:ret[ab][!] [new_tabstop]`{: style="color: red"}
: 将制表符\<TAB>转换为空格符，数量由[new\_tabstop]指定。若为空或为0，则使用默认的'tabstop'。
: 若有'!'，则将空格序列转化为\<TAB>。

  <br />

## 五、查看中文帮助:

**`man -L zh_CN.utf8 command`**{: style="color: red"}

  <br />

## 六、查看日志:

**`journalctl`**{: style="color: red"} [OPTIONS...] [MATCHES...]

Options:

```
  -f --follow        Follow the journal
     --since=DATE    Start showing entries on or newer than the specified date
     --until=DATE    Stop showing entries on or older than the specified date
  -l --full          Do not ellipsize fields
  -u --unit=UNIT     Show data only from the specified unit
     --disk-usage    Show total disk usage of all journal files
```


  <br />
