---
title: Piplight 在 Linux 上使用网银
categories:
  - Linux
tags:
  - Linux
  - Fedora
  - Pipelight
  - Wine
  - ActiveX
date: 2014-03-02 02:11:37
updated: 2014-04-18 21:25:11
description: 记录在 Fedora 上使用网银的过程。
---

[@felixonmars](https://twitter.com/felixonmars) 在博客 [Pipelight – 让 Linux 原生 Chromium/Chrome 无缝支持 ActiveX 控件 (看! 网银!)](http://blog.felixc.at/2014/02/pipelight-let-linux-native-chromium-chrome-support-activex-seamlessly/) 中对如何通过 pipelight 使用工行网银做了很详细的描述, 不过是以 Arch Linux 作为例子来介绍的. 这里以 Fedora 20 为例, 做一个详细的介绍.

二者 Pipelight 和 ActiveX 控件的配置相同, 在 Pipelight 的安装上略有不同. 另外，Fedora 在安装 wine 时没有安装 winetricks, 需要手动安装. 因此, 相同部分的步骤基本上来自上面的博客.

基本的原理：利用 Chrome 里已有的 npactivex (ActiveX for Chrome) 扩展, 配合 pipelight 提供的 npactivex NPAPI 插件, 将 ActiveX 控件本身用 wine 执行, 并且无缝地嵌入 Chrome 网页中.

1\. 安装不在仓库里的微软核心字体:

    sudo yum install cabextract
    sudo rpm -i http://sourceforge.net/projects/mscorefonts2/files/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

2\. 然后添加仓库, 并安装 Pipelight (对于 Fedora 18 和 Fedora 19 只需要把 Fedora\_20 替换成 Fedora\_18 或 Fedora\_19 即可):

    sudo wget http://download.opensuse.org/repositories/home:/DarkPlayer:/Pipelight/Fedora_20/home:DarkPlayer:Pipelight.repo -O /etc/yum.repos.d/pipelight.repo
    sudo yum install pipelight
    sudo pipelight-plugin --update

3\. 解锁 pipelight 的 npactivex 插件:

    sudo pipelight-plugin --unlock npactivex

看到 "Plugin npactivex is now unlocked" 即为解锁成功

4\. 启用 npactivex 插件:

    sudo pipelight-plugin --enable npactivex

5\. 启动 chrome 浏览器, 打开 <chrome://plugins>, 应该可以看到以下内容:

> ActiveX hosting plugin for NPAPI
> ActiveX hosting plugin for NPAPI r37
> Name: ActiveX hosting plugin for NPAPI
> Description: ActiveX hosting plugin for NPAPI r37
> Version:
> Location: /usr/lib/pipelight/libpipelight-npactivex.so
> Type: NPAPI
> Disable
> MIME types:
> MIME type Description  File extensions
> application/x-itst-activex  ActiveX (\*.ocx)
> .ocx
> application/activex-manager  ActiveXManager

如果看到下列错误:

> Pipelight Error (npactivex)!
> Something went wrong, check the terminal output

请从终端打开 chromium/google-chrome, 观察终端出错日志

6\. 安装winetricks:

    wget http://winetricks.googlecode.com/svn/trunk/src/winetricks
    sudo cp winetricks /path/to/your/bin/
    sudo chmod +x /path/to/your/bin/winetricks

7\. 安装需要的 ActiveX 控件. 下面以工行控件为例:

7.1. 下载工行网银控件安装包:

    wget http://www.icbc.com.cn/icbc/html/download/dkq/icbc_netbank_client_controls.exe

7.2. 安装 mfc42 运行库:

    WINEPREFIX=~/.wine-pipelight winetricks -q mfc42

7.3. 安装:

    WINEPREFIX=~/.wine-pipelight wine icbc_netbank_client_controls.exe

故障排除: 运行

    WINEPREFIX=~/.wine-pipelight wine uninstaller --list

如果输出包含以下内容就说明安装成功了, 否则说明以上某一步出错了

> {93156467-FD99-4A30-9CA5-8563F4BB8DB3}|||icbc\_netbank\_client\_controls

8\. 安装 np-activex extension:

扩展可以从 Chrome Web Store 直接安装, 地址:

<https://chrome.google.com/webstore/detail/activex-for-chrome/lgllffgicojgllpmdbemgglaponefajn/related>

9\. 设置 np-activex extension:

打开 chrome://chrome/extensions, 点击 "ActiveX for Chrome" 旁边的 "选项" (Options), 浏览到 "ICBC工商银行" 所在的条目, 将"已禁用"改为"已启用".

10\. 用 Chrome 打开 <https://mybank.icbc.com.cn/icbc/perbank/index.jsp> 应该可以正常登陆工行网银了.

上面的博客还给出了其作者对支付宝的测试成功的 npactivex extension 的规则:

> Mode: WildChar
> Pattern: https://\*.alipay.com/\*
> User Agent: MSIE9
> Other helper scripts: dynamic ieevent

不过, 在 npactivex extension 的设置页面中虽然有农业银行的的选项，但是我还是始终没有成功......

参考:

+ [Pipelight – 让 Linux 原生 Chromium/Chrome 无缝支持 ActiveX 控件 (看! 网银!)](http://blog.felixc.at/2014/02/pipelight-let-linux-native-chromium-chrome-support-activex-seamlessly)
+ [Pipelight - Installation](http://fds-team.de/cms/pipelight-installation.html)
