---

layout: post
title: Linux 随学随记 (3)
categories: [Linux]
tags: [linux, shell]

---

=========================================

## 一、显示ANSI转义码

`^[`  使用Ctrl-V Esc生成(ASC ASCII值)

  <br />

## 二、开机自启动文件

系统: `/etc/rc.d/rc.local`  
用户: `$HOME/.config/autostart/`

  <br />

## 三、sed 替换中使用变量

sed替换命令用双引号`""` 而不是单引号 `''`，然后里面直接用 `$VARIABLE` 就可以了。

  <br />

## 四、vim 保存 root 权限文件

`:w !sudo tee %`

  <br />

## 五、vim 跳转

Ctrl+] = Ctrl+left\_click  
Ctrl+t = Ctrl+right\_click

  <br />

## 六、从视频中提取音频

运行以下命令之一：

```bash
$ mencoder -oac mp3lame -ovc copy -of rawaudio 01.flv -o 01.mp3
$ ffmpeg -i 01.flv -f mp3 -vn 01.mp3
$ ffmpeg -i 01.flv -acodec libmp3lame -vn 01.mp3
```

  <br />

## 七、交换 CapsLock 键和左 Ctrl 键

### 1. 使用 gnome-tweak-tool

选择 Typing > Ctrl key position > Swap Ctrl and Caps Lock 即可。

(要求 `gsettings get org.gnome.settings-daemon.plugins.keyboard active` 的值为 `true`)

### 2. 使用 setxkbmap 命令

运行

```bash
$ setxkbmap -option ctrl:swapctrl
```

或者把命令放到~/.zshrc中

### 3. 使用xmodmap

建立 ~/.xmodmap，添加如下内容：

```
remove Lock = Caps_Lock
remove Control = Control_L
keysym Control_L = Caps_Lock
keysym Caps_Lock = Control_L
add Lock = Caps_Lock
add Control = Control_L
```

然后运行

```bash
$ xmodmap ~/.xmodmap 2>/dev/null
```

__网上的教程都是要将命令添加到 ~/.xinitrc (Fedora 迁移到了 ~/.config/imsettings/xinputrc) 或 /etc/rc.d/rc.local 中，而不是 ~/.zshrc (我使用的是 oh\_my\_zsh，使用 bash 的话使用 ~/.bashrc)中，否则会重复执行使得键位回归。但是我的测试却是如果使用前者，新开一个 shell 时键位就会回归，而使用后者则没有问题，不知是不是与使用 zsh 有关，bash 没有测试。__

  <br />