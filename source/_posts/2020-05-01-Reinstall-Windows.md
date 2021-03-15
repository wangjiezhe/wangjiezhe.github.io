---
title: 记录重装系统时遇到的坑
date: 2020-05-01T21:26:42+08:00
updated: 2020-09-22T13:26:42+08:00
categories: Windows
tags:
  - MathType
  - 显卡
description: 重装系统就是个坑，能不碰就不要碰
---

由于之前的电脑 8G 的内存已经明显不够了。比如 chrome 开10+个网页，wsl2 一直开着或者更新了大软件（比如 texlive-fontextra），VSCode 打开一个大项目，都会造成内存告急。如果有两种情况同时出现的话，基本上直接崩溃了。chrome 的话崩溃了还好，再打开就可以了。wsl2 一但崩溃，特别是在 pacman 更新的时候，直接导致更新的数据库崩溃，还都手动修复。

如果开虚拟内存系统托管的话，系统倒是再加 8G 的虚拟内存，但是由于我的硬盘是机械硬盘，于是就会造成硬盘活动时间始终是100%，会造成响应变慢，甚至直接卡死。

于是我加了一块 500G 的固态硬盘，用的西数的蓝盘，然后把两个 4G 的内存条换成了两个 8G 的内存条，还把网卡换成了最新的 AX200（原先的网卡不支持 5GHz 的 WIFI）。

顺带请了一下风扇，换了散热硅脂。

以及拔插了一下摄像头的连接线，解决了之前摄像头时能用时不能用的问题。

因为之前的系统里的东西比较杂乱，于是我决定重新安装系统，而不是做系统迁移。

安装 windows 还是比较顺利的。这里建议不要用 Media Creation Tool，而是直接下载 iso 文件，这样下载的速度会快一些。（谁叫我有 IDM 呢 →_→）

安装之后，系统引导会自动生成，不用手动干预。

然而，主要耗费时间是在安装各种软件上。

## Adobe

有请 [vposy](https://weibo.com/vposy) 大神。。。

## Office 下载与激活

参见 <https://v0v.bid>。

## MathType 与字体冲突的问题

MathType 与 Microsoft Store 中的「更纱黑体」相冲突，安装「更纱黑体」会导致 MathType 闪退，原因不明。

但直接下载字体点击安装的话就没有问题。

这个问题折腾了我半天的时间。。。

{% note danger %}
重启电脑之后发现，手动安装也不行。。。
话说之前的系统里一直是两者共存没有问题啊。。。
{% endnote %}

{% note primary %}
又尝试单独安装部分字体，只装了 `Sarasa Term`，没有问题。那就先这么用吧。。。
{% endnote %}

{% note info %}
20200922 更新：在新电脑上，Windows Store 上安装的「更纱黑体」不行，但是手动下载安装字体又没有问题了，真是一个神奇的问题。

「更纱黑体」在 [tuna 镜像站](https://mirrors.tuna.tsinghua.edu.cn/github-release/be5invis/Sarasa-Gothic/LatestRelease/)上可以下载，不用忍受 GitHub 的龟速了。
与之类似的还有 [git for windows](https://mirrors.tuna.tsinghua.edu.cn/github-release/git-for-windows/git/LatestRelease/)，[git-lfs](https://mirrors.tuna.tsinghua.edu.cn/github-release/git-lfs/git-lfs/LatestRelease/) 等。
{% endnote %}

## 盘符问题

在安装的时候，一定将新的系统盘标为 C 盘。如果系统安装完了之后，就没法再修改了。至少我目前还没有找到方法。

看过网上说的一些方法。如果直接在硬盘管理中修改盘符的话，非系统盘是可以直接修改的，系统盘修改的话会显示参数错误。

还有直接修改注册表中 `HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices` 下的驱动器号的，我试了一下，然后电脑就无法启动了。还是通过安装盘恢复原来的设定之后才能启动。

又是一天的血和泪。。。

> 主要的原因是，之前安装 Windows 的时候偷懒了，直接加载 iso 文件安装的，没有制作安装 U 盘。然后修改注册表之后系统无法启动，只能进入到 Linux 下去制作 Windows 的启动盘。
> 直接使用 dd 的话，电脑不能识别 U 盘启动，试了好几个软件，最终使用 **woeusb** 才成功了。

{% note info %}
其实大部分软件安装都没有问题，只是在「华为电脑管家」的时候出现了问题。
于是我只能把另外一个分区改为 C 盘，然后安装之后把 `Program Files(x86)` 中的文件移到 D 盘中，然后在注册表中搜索修改所有相关的项。
目前使用上还没有发现问题。
{% endnote %}

## 独显问题

之前电脑上，可以选择以 N 卡运行 chrome。但是这次安装之后，即使是选择 N 卡运行，包括在 Nvidia 控制面板里设置，还是右击选择以「高性能 Nvidia 处理器」运行，都没有作用。

Firefox 也不管用。

但是 mpv 和 qutebrwoser 都运行正常。

> 主要这么纠结的原因是，在打雀魂的时候，核显会飙到 80%，而且会有明显的卡顿。切换到 N 卡上话，核显 50%，独显 45%，但至少没有感觉的明显的卡顿了。
> 我就是想打个麻将而已，容易么我。。。
> 顺带说一下，笔记本是 14 年买的，CPU 是 i7-4700HQ，核显是 HD Graphic 4600，独显是 GeForce GTX 850M。

## 播放器选择

安装之后试了一下 4k 视频的播放，发现不需要修改就可以直接舒畅播放的就只有 vlc，而且仅仅使用核显，播放的时候 CPU 30%，核显 vlc 使用 5%，整体 20%，不知道是怎么调教的。

如果配置好的话，让 mpv 用 N 卡解码也是可以流畅播放的，核显 25%，独显 60%。

## 对不同应用切换不同的输入法

设置 -> 设备 -> 输入 -> 高级键盘设置 -> 切换输入法 -> 勾选「允许我为每个应用窗口使用不同的输入法」

## 杀毒软件

趁着这次机会，入正了 EAV。

## Git

如果直接安装 Git For Windows 的话，就没有什么问题。
不过由于我安装了 MSYS2，因此就直接在 MSYS2 里面安装了，但这带来了一个奇怪的问题，那就是 git 的 ssh 协议无法使用。具体就是：如我运行

```bash
ssh -T git@github.com
```

没有问题，会正常的返回

```text
Hi wangjiezhe! You've successfully authenticated, but GitHub does not provide shell access.
```

但是 `git pull` 和 `git push` 就是运行不成功，显示

```text
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

后来发现，Git For Windows 貌似可以之间使用 Windows 默认的 ssh 配置文件（位置在 `%HOMEPATH%\.ssh\`），而在 MSYS2 里安装的话需要把密钥复制到 MSYS2 的 ssh 配置文件里。

## WSL

在安装完 WSL 之后，我发现网络访问有问题，而且问题比较奇怪。

我在 WSL 中，能够正常访问网络；在 Windows 中，也能访问 WSL 中的网络；但是在 WSL 中，无法访问 Windows 应用，包括 VcXsrc。

{% note primary %}
问题已解决，是防火墙的问题。我之前只在「允许应用通过防火墙」中为 VcXsrv 允许了专用网络，把公用网络也勾选上就 OK 了。
其它的例如 `python -m http.server`，把 `python.exe` 加入到防火墙的入站规则里就可以了。
如果使用 Windows 默认的防火墙的话，推荐使用 [Firewall App Blocker](https://www.sordum.org/8125/firewall-app-blocker-fab-v1-7/)，可以很方便的添加防火墙规则。
{% endnote %}
