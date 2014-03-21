---

layout: post
title: Linux 随学随记 (2)
categories: [Linux]
tags: [linux, vim]

---

============================

## 一、vim切换tab:

向后  <span style="color:red">`:tabn`</span> or <span style="color:red">`:tabnext`</span> or <span style="color:red">`gt`</span>  
向前  <span style="color:red">`:tabp`</span> or <span style="color:red">`:tabprev`</span> or <span style="color:red">`gT`</span>

  <br />

## 二、vim与系统剪贴板的交互 (仅限于gvim!!!)

<span style="color:red">`"+y`</span>  复制到剪贴板  
<span style="color:red">`"+p`</span>  从剪贴板粘贴

  <br />

## 三、vim重复命令

<span style="color:red">`.`</span>  重复上次操作，前面可加次数

<span style="color:red">`:[range]g[lobal]/{pattern}/[cmd]`</span>  
&emsp;&emsp;在 [range] 界定的匹配模式 {pattern} 的文本行上执行Ex 命令 [cmd] \(缺省是 ":p")。

<span style="color:red">`:[range]g[lobal]!/{pattern}/[cmd]`</span>  
&emsp;&emsp;在 [range] 界定的_不_匹配模式 {pattern} 的文本行上执行 Ex 命令 [cmd] \(缺省是 ":p")。

<span style="color:red">`:[range]v[global]/{pattern}/[cmd]`</span>  
&emsp;&emsp;等同于 :g!。

  <br />

## 四、vim中tab与空格的转换 (慎用！！！)

<span style="color:red">`:ret[ab][!] [new_tabstop]`</span>  
&emsp;&emsp;将制表符\<TAB>转换为空格符，数量由[new_tabstop]指定。若为空或为0，则使用默认的'tabstop'。  
&emsp;&emsp;若有'!'，则将空格序列转化为\<TAB>。

  <br />

## 五、查看中文帮助:

<span style="color:red">**`man -L zh_CN.utf8 command`**</span>

  <br />

## 六、查看日志:

<span style="color:red">**`journalctl`**</span> [OPTIONS...] [MATCHES...]

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
