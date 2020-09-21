---
title: 安装 ArchWSL 后需要做的事
date: 2020-04-11 00:39:40
updated: 2020-05-14 10:53:40
categories: Windows
tags:
	- WSL
	- Arch
description: 记录在 WSL 中安装完 Arch 之后要做的事情
---

最近把 windows 更新到了 2004，切换到了 WSL 2 上。

## 安装 WSL 2

启用 WSL 和虚拟机控制平台功能（要求管理员权限）：

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

之后重启电脑。

安装 Arch，参见 [ArchWSL](https://github.com/yuk7/ArchWSL)。

## WSL 2 相对于 WSL 1 的优缺点

优点：

- 本地文件操作更快。之前编译一个 glibc，几个小时都没有编完
- 解决了 sleep 的问题
- 支持网络操作，例如 ping
- 可以使用 docker

缺点：

- 经常会爆内存，包括安装大软件、长时间运行等
- 访问 Windows 主机上文件的速度变慢

## 语言设置

把 `/etc/locale.conf` 改为 `LANG=zh_CN.UTF8`。

然后 `source /etc/locale.conf`。

{% note info %}
一个非常奇怪的事情是，如果把 `LANG` 设为 `zh_CN.UTF-8`，那么在 **bash** 下，windows 中的中文文件名显示为乱码，而 **zsh** 则显示正常。
但在默认的 `LANG=en_US.UTF-8` 下，**bash** 和 **zsh** 都能正常显示中文文件名。
{% endnote %}

## 安装软件包

### 导入密钥（非常重要！！！）

```bash
# 初始化密钥环 && 验证主密钥 && 更新密钥
pacman-key --init && pacman-key --populate archlinux && pacman-key --refresh-keys
```

### 启用国内的镜像源

```bash
echo "Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.neusoft.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.cqu.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
```

### 添加 ArchlinuxCN 源

```bash
echo "
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/x86_64" >> /etc/pacman.conf
pacman -Sy && pacman -S archlinuxcn-keyring && pacman -S yaourt
```

这里坚持用 yaourt 的原因有两个，一是在 root 环境下使用不报错（主要是需要彩色显示），二是可以显示版本更新还是编译更新。

### 安装常用软件

#### 先搭建好常用环境

```bash
pacman -Syu
pacman -S zsh git subversion lua openssh
```

#### 安装 zinit（原 zplugin）

```bash
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
echo "source ~/.zinit/bin/zinit.zsh" > ~/.zshrc
```

> 不得不再次吐槽一下 `git clone` 的速度。。。

#### 安装 powerlevel10k

```bash
echo "zinit ice depth=1; zinit light romkatv/powerlevel10k" >> ~/.zshrc
```

#### 启用 zsh（终于有了一个好看的终端）

```bash
zsh
```

然后就可以导入之前的 `.zshrc` 了。

#### 切换默认终端至 zsh

```bash
chsh -s /bin/zsh
```

#### 安装 vim-plug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

导入之前的 `.vimrc` 文件，并执行命令：

```bash
vim +PlugInstall +qall
```

#### 安装常用软件

```bash
pacman -S base-devel which diffutils man openssh tree p7zip bc wget \
  htop strace most \
  yarn npm python-pip \
  zathura-ps zathura-pdf-poppler \
  feh imagemagick mediainfo ffmpeg \
  opencc dos2unix jq net-tools bind-tools nload
yarn global add hexo-cli nali-cli http-server
```

#### 安装花哨软件

```bash
pacman -S fd exa bat ripgrep percol
```

#### 安装常用字体

```bash
pacman -S adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts tex-gyre-fonts ttf-dejavu wqy-zenhei wqy-microhei ttf-sarasa-gothic
```

#### 安装专业软件

```bash
pacman -S texlive-most
pacman -S texlive-langchinese biber asymptote qtikz \
  sagemath jupyter
```

{% note danger %}
<span style="color:red">注意</span>：安装 `texlive-fontextra` 会爆内存！！！
反正我的8G内存被爆了，16G没有问题）
{% endnote %}

#### 安装 X 软件

```bash
pacman -S tk gvim
```

向 `~/.zshrc` 中添加：

```bash
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolve.conf 2>/dev/null):0.0
export LIBGL_ALWAYS_INDIRECT=1
```

注意对于 WSL 2，VcXsrv 启动时需要选中 `Disable access control` 的选项，或者加上 `-ac` 的参数。

## 添加新用户

```bash
groupadd AAA
useradd XXX -g AAA -G wheel -m -N
pacman -S sudo
echo "wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel
```

其实我一直是使用 root 账户，只有在需要 makepkg 的时候才切换到普通用户。







