---

layout: post
title: Linux 下 zip 解压的文件名乱码问题
categories: [Linux]
tags: [linux, zip, 乱码]

---

<br />

在 windows 下打包的 zip 文件, 文件名是以 GBK 的方式编码的, 在 Linux 下解压会出现文件名乱码的问题.

一种方法是通过 wine 安装 7z 或 haozip 来解决.

另一种方法是利用环境变量 + 7z + convmv 来解决.

用 7z 在 LC_ALL=C 或 LC_ALL=zh_CN.gbk 的环境下解压 zip 文件:

```
LC_ALL=C 7z x -oOUTDIR zipfile.zip
```

然后用 convmv 检测文件名的编码转换, 查看是否有乱码:

```
convmv -f cp936 -t utf8-r *
```

如果没有乱码, 则可以进行转换:

```
convmv -f cp936 -t utf8 --notest *
```

如果还要转换某个文件的编码, 则可以用 iconv :

```
iconv -f cp936 -t utf8 -o outfile infile
```

网上还经常提到的一种方法是用 unzip 的 -O 选项, 可惜在新版的 unzip 中这一选项被移除了, 如果需要也可以自己打补丁, 不过个人感觉很麻烦.

还有一种方法是用 python 来做. 网上有一个流传比较广的脚本, 不过功能不过完善, 下面的代码是在原代码基础上修改而成的:

<script src="https://gist.github.com/wangjiezhe/7841a350983a147b6d7e.js"></script>

这种方法的缺点是比较慢.

<br />
