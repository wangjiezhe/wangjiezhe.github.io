title: Linux 随学随记 (4)
categories:
  - Linux
tags:
  - linux
  - shell
  - vim
date: 2015-08-20 00:00:00
---

## mplayer 循环播放歌曲

```bash
$ mplayer -loop n ***.mp3
```

n 表示重复次数，0 表示无限循环。


## vim 搜索大小写匹配

`set ignorecase`
忽略正常字母的大小写

`set smartcase`
只包含小写字母时忽略大小写

`\c`
强制忽略大小写

`\C`
强制匹配大小写


## cd 转移

当两个目录路径只有一个区别（比如一个单词不同）时，这个是从旧目录切换到新目录的一种简单方法。

    cd directorya directoryb

第一个参数是当前目录路径中需要替换的参数，第二个参数是替换字符串。

    # 要从v7目录 切换到v8目录，只需键入cd v7 v8
    /programs/v7/reports/monthly > cd v7 v8
    /programs/v8/reports/monthly >

    # 如果历史上的每年每月都有一个对应目录，cd 转移允许从一年跳到另一年
    /hist/2010/april/reports > cd 2010 2011
    /hist/2011/april/reports >

    # 切换月份目录
    /hist/2011/april/reports > cd april may
    /hist/2011/may/reports >


## vim 快速缩进

`>>`
向右缩进

`<<`
向左缩进

`:ce` (center)
文本居中

`:le` (left)
文本靠左

`:ri` (right)
文本靠右


## vim 编辑多个文件

`:n`
编辑下一个文件

`:N`
编辑上一个文件

`:e#`
回到前一个文件

`:ls`
列出所有编辑的文件

`:b 2.txt` or `:b 2`
直接进入文件 2.txt 或者编号为 2 的文件编辑

`:bd 2.txt` or `:b 2`
删除列表中的文件项目

`:f`
显示正在编辑的文件名

`:f new.txt`
重命名当前文件为 new.txt


## vim 加密文件

`$ vim -x file1`
创建加密文档 file1

`set cm=blowfish2` (newest)
设置加密方式

