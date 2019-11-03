---
title: Linux 下 zip 解压的文件名乱码问题
categories:
  - Linux
tags:
  - Linux
  - Zip
  - 乱码
date: 2014-08-14 10:28:59
updated: 2014-10-11 00:21:49
description: GBK 编码的 zip 文件正常解压（unzip，7z，file-roller）都会出现乱码，本文通过一个 python 脚本来彻底解决这个问题。
---

在 windows 下打包的 zip 文件, 文件名是以 GBK 的方式编码的, 在 Linux 下解压会出现文件名乱码的问题。

一种方法是通过 wine 安装 7z 或 haozip 来解决。

另一种方法是利用环境变量 + 7z + convmv 来解决。

用 7z 在 LC_ALL=C 或 LC_ALL=zh_CN。gbk 的环境下解压 zip 文件：

```bash
LC_ALL=C 7z x -oOUTDIR zipfile.zip
```

然后用 convmv 检测文件名的编码转换, 查看是否有乱码：

```bash
convmv -f cp936 -t utf8-r *
```

如果没有乱码, 则可以进行转换：

```bash
convmv -f cp936 -t utf8 --notest *
```

如果还要转换某个文件的编码, 则可以用 iconv ：

```bash
iconv -f cp936 -t utf8 -o outfile infile
```

网上还经常提到的一种方法是用 unzip 的 -O 选项, 可惜在新版的 unzip 中这一选项被移除了, 如果需要也可以自己打补丁, 不过个人感觉很麻烦。

还有一种方法是用 python 来做。网上有一个流传比较广的脚本, 不过功能不过完善, 下面的代码[^1]是在原代码基础上修改而成的，支持解压加密的压缩文件：

Python 3 版本：

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
unzip3_gbk.py: Deal with zip files using encoding GB2312/GBK/GB18030
"""

import os
# import sys
import argparse
import zipfile
# import copy
import datetime


class GBKZipFile(zipfile.ZipFile):
    """Class with methods to list, extract zip files using encoding GB18030."""
    def __init__(self, filename):
        super().__init__(filename, mode='r')
        # self.filelist_old = copy.deepcopy(self.filelist)
        # self.NameToInfo_old = copy.deepcopy(self.NameToInfo)
        self.NameToInfo = {}
        for zinfo in self.filelist:
            zinfo.filename = zinfo.filename.encode('cp437').decode('gb18030')
            self.NameToInfo[zinfo.filename] = zinfo

    @staticmethod
    def print_bold(text):
        """Print bold text."""
        bold = '\033[1m'
        endc = '\033[0m'
        print(bold + text + endc)

    def pprintdir(self):
        """Print a table of contents of the zip files more elegantly."""
        self.print_bold('Archive:  ' + os.path.basename(self.filename))
        if self.comment:
            self.print_bold('Comment:  ' + self.comment.decode('gb18030'))
        print('{:^10}  {:^19}  {}'.format('Size', 'Modified', 'File Name'))
        print('{:=^10}  {:=^19}  {:=<11}'.format('', '', ''))
        size_sum = 0
        for zinfo in self.filelist:
            filename = zinfo.filename
            filetime = '{:%Y-%m-%d %H:%M:%S}'.format(
                datetime.datetime(*zinfo.date_time))
            print('{:>10}  {}  {}'.format(zinfo.file_size, filetime, filename))
            size_sum += zinfo.file_size
        file_sum = len(self.filelist)
        print('{:-^10}  {:^19}  {:-^11}'.format('', '', ''))
        print('{:>10}  {:^19}  {}'.format(str(size_sum), '',
                                          str(file_sum) + ' files'))


def cenc(name):
    """Check if it's not None and encode."""
    return name is not None and name.encode() or None


class MyParser(argparse.ArgumentParser):
    """Paring command line options."""
    def __init__(self, prog=None):
        description = 'Extract files from zipfiles using encoding GBK'
        super().__init__(prog=prog,
                         description=description)
        self.add_argument('zipfile', nargs='+')
        self.add_argument('-l', '--list', action='store_true', dest='islist',
                          help='list files in zipfiles')
        self.add_argument('-o', '--outdir', dest='outdir',
                          help='set output directory')
        self.add_argument('-p', '--password', dest='password',
                          help='set password')


def main():
    """Parse argument, list or extract zip files."""
    myparser = MyParser()
    args = myparser.parse_args()

    if args.islist:
        for zfile in args.zipfile:
            with GBKZipFile(zfile) as zfp:
                if args.password:
                    zfp.setpassword(cenc(args.password))
                zfp.pprintdir()
    else:
        for zfile in args.zipfile:
            with GBKZipFile(zfile) as zfp:
                zfp.extractall(path=args.outdir, pwd=cenc(args.password))


if __name__ == '__main__':
    main()
```

Python 2 版本：

```python
#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# unzip_gbk.py
"""
解决用 gbk 编码压缩的 zip 文件在 utf-8 环境下解压产生的中文文件名乱码问题
"""

from __future__ import print_function
import os
import sys
import getopt
from zipfile import ZipFile
from textwrap import dedent

IFLIST = False


def usage():
    """显示帮助"""
    help_text = """\
            Usage: %s [options] zipfile1 [zipfile2 ...]
            Options:
            -h --help     : display this help
            -l --list     : list files
            -o --outdir   : set output directory
            -p --password : set password""" % sys.argv[0]
    print(dedent(help_text))


def analyse(args=sys.argv[1:]):
    """解析命令行参数, 返回输出文件夹, 解压密码和待解压文件"""
    shortargs = "hlo:p:"
    longargs = ["help", "list", "outdir=", "password="]
    outdir = os.getcwdu()
    password = None

    try:
        opts, zipfiles = getopt.getopt(args, shortargs, longargs)
    except getopt.GetoptError:
        print("Getopt error!")
        usage()
        sys.exit(1)

    for opt, value in opts:
        if opt in ("-h", "--help"):
            usage()
            sys.exit()
        elif opt in ("-l", "--list"):
            global IFLIST
            IFLIST = True
        elif opt in ("-o", "--outdir"):
            outdir = value.decode('utf8')
        elif opt in ("-p", "--password"):
            password = value

    return outdir, password, zipfiles


def listzip(filename, password=None):
    """列出文件内容"""
    print("Archive: " + filename)
    with ZipFile(filename, 'r') as infile:
        if password:
            infile.setpassword(password)

        for name in infile.namelist():
            utf8name = name.decode('gbk')
            print(utf8name)


def unzip(filename, outdir='', password=None):
    """解压文件"""
    print("Unziping " + filename)
    with ZipFile(filename, "r") as infile:
        if password:
            infile.setpassword(password)

        for name in infile.namelist():
            utf8name = name.decode('gbk')
            print("Extracting " + utf8name)
            pathname = os.path.join(outdir, os.path.dirname(utf8name))
            targetname = os.path.join(outdir, utf8name)
            if not os.path.exists(pathname):
                os.makedirs(pathname)
            data = infile.read(name)
            if not os.path.exists(targetname):
                with open(targetname, 'w') as myfile:
                    myfile.write(data)


def main():
    """主程序"""
    outdir, password, zipfiles = analyse()
    if not zipfiles:
        print("No file to unzip.")
        usage()
        sys.exit()

    if IFLIST:
        for filename in zipfiles:
            listzip(filename, password)
    else:
        for filename in zipfiles:
            unzip(filename, outdir, password)

    sys.exit()


if __name__ == "__main__":
    main()
```



[^1]: https://gist.github.com/wangjiezhe/7841a350983a147b6d7e
