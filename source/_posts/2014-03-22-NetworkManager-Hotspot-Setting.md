---
title: 修改 NetworkManager wifi 热点的加密方式
categories:
  - Linux
tags:
  - linux
  - network
date: 2014-03-22 00:00:00
---

> **Note: 在 Fedora 21 中, 默认的加密方式已改为 WPA**

NetworkManager 共享 wifi 热点时默认的加密方式是 WEP, 这种加密方式早已被证明安全性较低.而 WPA 加密的安全性则相对较高.

wifi 热点的配置文件为 `/etc/NetworkManager/system-connections/Hostpot`, 该文件须用 root 权限打开.

修改:

ssid: wifi 名称, 可改为自己想要的.

key-mgmt: 加密方式, 有以下几种:

+ none: WEP
+ ieee8021x: Dynamic WEP
+ wpa-none: WPA-PSK Ad-Hoc
+ wpa-psk: infrastructure WPA-PSK
+ wpa-eap: WPA-Enterprise

默认为 `key-mgmt=none`, 我将其修改为 `key-mgmt=wpa-psk`.

下面原来两行

```
wep-key0=
wep-key-type=
```

为WEP密码和类型, 将其删去或注释掉, 改为

```
psk=your_password
```

然后重启 NetworkManager 服务即可

```
sudo systemctl restart NetworkManager.service
```

