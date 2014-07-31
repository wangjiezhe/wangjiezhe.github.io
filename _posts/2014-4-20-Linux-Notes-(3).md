---

layout: post
title: Linux 随学随记 (3)
categories: [Linux]
tags: [linux, shell]

---

<br />

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

~~~
:w !sudo tee %
~~~

  <br />

## 五、vim 跳转

Ctrl+] = Ctrl+left\_click  
Ctrl+t = Ctrl+right\_click

  <br />

## 六、从视频中提取音频

运行以下命令之一：

~~~ bash
$ mencoder -oac mp3lame -ovc copy -of rawaudio 01.flv -o 01.mp3
$ ffmpeg -i 01.flv -f mp3 -vn 01.mp3
$ ffmpeg -i 01.flv -acodec libmp3lame -vn 01.mp3
~~~

  <br />

## 七、交换 CapsLock 键和左 Ctrl 键

### 1. 使用 gnome-tweak-tool

选择 Typing > Ctrl key position > Swap Ctrl and Caps Lock 即可。

(要求 `gsettings get org.gnome.settings-daemon.plugins.keyboard active` 的值为 `true`，故在 gnome 中使用 fcitx 时此方法无法使用)

### 2. 使用 setxkbmap 命令

运行

~~~ bash
$ setxkbmap -option ctrl:swapctrl
~~~

或者在 ~/.zshrc 中添加如下内容：

~~~ shell
# Swap Ctrl_L and CapsLock
if [[ -n $DISPLAY ]]; then
	setxkbmap -option ctrl:swapctrl
fi
~~~

  <br />

## 八、交换 Escape 键和右 Alt 键

这时，前面两种方法都没有现成的选项可以使用，因此我们使用xmodmap

建立 ~/.xmodmap，添加如下内容：

~~~
! 交换Escape和Alt_R
clear mod1
keycode   9 = Alt_R NoSymbol Alt_R
keycode 108 = Escape NoSymbol Escape
add    mod1 = Escape Meta_L
~~~

然后运行

~~~ shell
$ xmodmap ~/.xmodmap 2>/dev/null
~~~

网上的教程都是要将命令添加到 ~/.xinitrc 或 /etc/rc.d/rc.local 中，而不是 ~/.zshrc (或 ~/.bashrc)中，否则会重复执行使得键位回归。但经测试，前者无法成功(有的地方解释是 xinitrc 在新版本中已不再使用)，于是我在 ~/.zshrc 中添加如下代码:

```bash
# Swap Alt_R and Escape
if [[ -n $DISPLAY ]] && [[ -n $(xmodmap|grep "mod1.*Alt_R") ]]; then
	xmodmap "$HOME"/.xmodmap 2>/dev/null
fi
```

  <br />
