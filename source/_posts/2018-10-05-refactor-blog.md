---
title: 博客的重构与回顾
date: 2018-10-05 15:06:59
tags:
    - blog
    - fedora
    - archlinux
    - hexo
categories:
    - Blog
description: 重新构建了博客的页面，记录了一些遇到的问题和解决办法。
---

利用十一的时间，重新整理了一下个人博客的页面。

看了一下，上一篇文章还是在 2015 年 8 月，到现在已经有三年多了，我真是。。。唉


## 入坑 Linux

记得最早接触 Linux 是在 2012 年，当时是上计概课要写代码，于是心血来潮地在电脑上安装了 Fedora（话说那时 Fedora 的版本号才是 17），然后就掉进了 Linux 的坑里一去不复返。而注册 Github 的时间是在 2013 年 8 月 15 日，具体什么原因已经不记得了。。。

后来想找一款能够听歌的软件，那时网易云音乐还没有出 Linux 版，FZUG 也还没有成立，我在网上偶然间发现了一款可以听歌、而且还是可以听网易云音乐的软件，那就是 [kwplayer][1]。看了下 commit，第一次提交是在 2013 年 8 月 29 号：[inited][2]。而我应该是在10月份的时候发现的，至于在哪儿找到的已经完全不记得了。

还记得第一次提交 Issue 是 [#11][3] 和 [#12][4]，当时只是发现 Github 上有个可以提交 Bug 的地方，于是就随手开了两个 Issue，没想到当天都得到了详细的回复，并在三四天后都得到了解决：[9c21c4f][5] 和 [90a02a8][6]。

这当时让我非常兴奋，因为以前从来没想过会这么快就得到回应，于是后来也积极地参加到其中，积极地提交 Bug，持续了有一年多的时间 [Issued by wangjiezhe][7]，并开始学习 rpm 打包，发布在了 [copr][8] 上。当然这也是我后来对 Python 感兴趣的契机之一。

刚又看了一下，我在 copr 上最早的一次 build 是在 [2014 年 3 月 31 号][9]，而我能够找到的最早介绍 copr 的中文资料是 [Fedora Copr][11]，现在的 copr 网址上线是在 [2013 年 12 月][12]， FZUG 的 [mosquito][13] 也是从 2014 年 6 月才开始建立他的 [myrepo][14] 的，话说国内比我更早开始使用 [copr][10] 的应该不多吧。。。

话说那时 [XuShaohua][16] 的 Github 账户名还是叫 LiuLang，后来他去了 Deepin，网易云音乐的 Linux 版他应该是作者之一。

当然后来因为各种原因我不再维护我的 copr 仓库，包括犯懒（反正有了 mosquito 的 myrepo 源，以及后来的 FZUG 源）、Fedora 的习惯性跳票让我非常不爽（这是在找借口么。。。）等等，加上后来我从 Fedora 转到了 Arch Linux 上（大概是 2015 年暑假吧），这个仓库就彻底荒废了。


## 博客的建立

最早的一些记录文章我都发在了 QQ 空间里，显得格格不入的。后来就想找一个合适的可以放这些东西的地方。

期间考虑过 WordPress，不过觉得比较麻烦，还需要有地方托管；考虑过一些博客托管平台，不过没有找到太喜欢的；觉得 Blogger 不错，但又被 W 掉了。。。

后来看到阮一峰的的介绍文章：[搭建一个免费的，无限流量的Blog----github Pages和Jekyll入门][15]，觉得这是个不错的选择，于是就开始折腾 Github Pages。作为一个审美盲与选择困难症患者，在众多的 Jekyll 主题中完全不知道该怎么选择，于是就随手选了一个自己觉得比较简洁明了的，也就是 ellochen 的博客主题，直接 copy 过来就用了。

嗯，说好听点叫简洁，说不好听呢就叫难看。。。:sob:

话说 ellochen 的 Github 账号已经不存在了，貌似是已经注销了，但好在还存留有 [Fork][17]（话说这就是 Fork 相较于 Star 的好处吧，我之前也有一些被删的 repo 是这么存留下来的，嗯，我指的不是 phuslu 大神，指的是垠神。。。），豆瓣小站 [Gode-Mode][18] 貌似是他建立的。


## 博客的重构

在那之后，博客的页面也小幅修改过几次，但大的主题方面都没有变过。曾经有想过重新选一个更好看的主题，但碍于时间原因一直没有去做。
期间也在其他的 Page 中也曾经尝试过其他的主题，比如 [HMFAYSAL OMEGA][19]，整体不错，但有些华而不实了；也试过 [coleslaw][20]，但又太过简单了。

直到第一次看到 NexT 主题，就像[这个][21]，真的把我惊艳到了，流畅的载入动画，自动展开并追随页面更新的目录，再加上简洁没有多余内容的页面，完全符合我对自己的博客的预期啊。于是最终决定就用这个主题了。

不过 NexT 的主页 [theme-next.org][22] 目前显示 Under Construction，没有最新的文档只有根据旧文档、网上的教程还有源代码自行摸索，网上很多教程和解决方案都是过时的，只好自己边做边摸索了。

然后发现，NexT 的配置又有一大堆，这简直就是在为难选择困难症的患者啊。。。


### 方案选择

NexT 主题总共有 4 种方案：Muse，Mist，Pisces 和 Gemini，为选哪一个我纠结了有近 1 个小时，对比各个博客样例，又在本地挨个试了好几遍，去找它们的不同点。最后发现，Muse 和 Mist 可以算一类，目录都在右侧，可以选择动态载入，也可以选择直接显示或隐藏。Muse 的布局相对宽松一点，顶部标题栏也比较大；Mist 相对紧凑一点，所有标题和标签都放在了最顶上的一栏里。而 Pisces 和 Gemini 又可以算一类，目录和标题栏恒在左边，右边是正文，Pisces 的页面和前两个比较相似，纯黑白布局，连贯性很强；而 Gemini 则更传统一些，每篇文章之间分的清清楚楚。

最终我选择了 Gemini 方案，原因是我觉得目录的动态载入虽然显得比较高级，但文章整体左移的那一下还是显得有些晃眼了，而且目录在右、正文在左的布局让我有些不太习惯；而不用 Pisces 的原因则是文章之间没有明显的分界线，文章中的小标题也不是很显著，于是最后暂定了 Gemini 方案。（嗯，暂定，说不定那天我有回来打自己的脸了）

### 插件

应该说，折腾这些插件是最费时间的，不但要面临各种选择，还要面临选完了发现用不了然后又得换的状况。。。有些插件本身有问题，需要手动修改才能使用，有些则根本不知道该怎么改。。。

#### 数学

数学公式的渲染最开始是打算用 MathJax，和以前保持一致就可以了。本来没有问题，但后来在利用 Travis-CI 自动部署的时候发现，远程安装的 pandoc 的版本不对，没有办法正确渲染，又找不到解决的办法，于是只能弃之而选择 katex。katex 其实我之前就听说过，据说比 MathJax 要快很多（公式一多的话 MathJax 确实太慢了），不过现在 0.10.0-rc1 的版本。由于前面的几篇文章里面还没有数学公式，我还没有真正试验过。

另外吐槽一句，npmjs 上的 hexo-renderer-markdown-it 的版本太老了，直接安装 [Github][23] 上的版本就可以了，这个插件已经更新了，但仓库里的模块还没有更新。

```bash
$ cat package-lock.json | jq .dependencies.\"hexo-renderer-markdown-it\"
{
  "version": "github:hexojs/hexo-renderer-markdown-it#89a5abe048f5a43b42328ad012fb445ded6e665b",
  "from": "github:hexojs/hexo-renderer-markdown-it",
  "requires": {
    "lodash.assign": "^4.2.0",
    "markdown-it": "^8.4.1",
    "markdown-it-abbr": "^1.0.4",
    "markdown-it-cjk-breaks": "^1.1.0",
    "markdown-it-container": "^2.0.0",
    "markdown-it-deflist": "^2.0.3",
    "markdown-it-emoji": "^1.4.0",
    "markdown-it-footnote": "^3.0.1",
    "markdown-it-ins": "^2.0.0",
    "markdown-it-mark": "^2.0.0",
    "markdown-it-sub": "^1.0.0",
    "markdown-it-sup": "^1.0.0",
    "sluggo": "^0.2.0"
  }
}
```

不过该模块会使得 `<!-- more -->` 失效，需要写成
```
<escape><!-- more --></escape>
```
才行。

不过我不喜欢一点进来就到文章半截的模式，所以对我来说没有什么影响，还是乖乖地写 description 吧。

另外这一部分文档严重不足，只能看自带 [wiki][31] 和 markdown-it 的例子来写。

#### 评论

关于评论模块，暂时还是采用了 Disqus 的评论系统，好处是不用折腾，因为是以前就配置好的，直接用就可以了，而且功能也足够强大，不过也有几个问题：
- 必须登录才能评论。不过我看到有文章说 Disqus 现在支持匿名评论了，有时间再去看一下。
- 被 W。这个是最主要的问题，目前看来解决方案有两个，一个是利用其他的服务器转发一下，例如 [fooleap/disqus-php-api][24]，另一个是换用其他的评论系统，比如 [gitment][25]/[gitalk][26] 或者 [Valine][27]，不过这次没有时间在折腾了，留待有时间再解决吧。

#### Pangu

这是一个不错的模块，来自与 [pangu.js][29]，可以在英文和中文之间自动加入空格，让中英文的混排看起来更舒服一下。

#### Han

汉字排版模块，可以调整中文页面的布局，提供了着重号、拼音上标等功能，来自 [Han][30]。 我比较看中的着重号的功能，因为在英文中，强调使用斜体表示的，就像<em lang="en">emphasize</em>这样，而中文一旦<em lang="en">斜体</em>就会变得非常难看。因此如果用*着重号*的话会好看很多。

不过这个插件折腾了我足足半天，原始的 css 文件能够加着重号，但是会把页面变得非常拥挤；[theme-next-han][35] 里的 css 文件倒是不会改变页面布局，但是着重号的功能却没有了。于是我去翻了源代码，然后发现，为了解决 [#1645][32]，[#1780][33] 把很多有用的内容也删掉了，问题倒是解决了，但剩下的基本上就没有什么作用了。于是我又去翻了 [Han][30] 的源码，发现只要把 `well-knit` 模块禁掉就可以了，于是又生成了新的 [han.min.css][34] 文件，使之能够正常显示。

话说我这篇文章写了得有两天的时间，中间有大一部分时间就是去弄这个了。

#### canvas-nest

背景动态渲染，来自 [canvas-nest.js][36]。以前看别人的博客遇到这个觉得很好玩，于是这次自己也就加上了。

不过遗憾的是，Gemini 的博文部分是不显示背景的，好像是把底层背景覆盖了。试了一下四种方案，好像只有 Gemini 是这个样子。。。


### 自动部署

关于 GitHub Pages 的部署，我将源代码存储在 source 分支，然后利用 Travis-CI 自动构建并部署到 master 分支。具体看参见 [使用Travis CI自动部署Hexo博客][28]，基本上 copy 过来就可以了。

另外，我的主题是 Fork 的 Next 的主题，然后在上面进行修改，在用 git submodule 引入进来，结果好几次自动部署失败都是因为修改完主题之后忘记 push 了。。。

而 GitLab Pages 的部署则要简单许多，只需要照着官方的例子写一个 `.gitlab-ci.yml` 文件就可以。


## 待改进的部分

还有一些部分模块这次没有时间弄了，留着下次有时间再解决吧。一部分现在能想到的我先列举在这里，省得以后又忘了：
- [ ] 字数统计
- [ ] 阅读次数统计
- [ ] 分享按钮
- [ ] 站内搜索。试过 LocalSearch，但搜索得到的链接始终不对，还没有找到原因，暂时禁用了。
- [ ] 分类页面。未能正确生成分类的页面。
- [x] 页脚设置
- [ ] 版权设置。增加适合于转载文章的版声明。
- [x] 字体调整。
- [ ] 代码高亮优化。不喜欢现在的高亮主题，
- [ ] 超链接显示颜色


> P.S. 话说我为什么这么爱用话说。。。


[1]: https://github.com/XuShaohua/kwplayer
[2]: https://github.com/XuShaohua/kwplayer/commit/1e0de4c0d889bccd823c5200db3313cb921e066f
[3]: https://github.com/XuShaohua/kwplayer/issues/11
[4]: https://github.com/XuShaohua/kwplayer/issues/12
[5]: https://github.com/XuShaohua/kwplayer/commit/9c21c4f908b02f77f345aa04e6ef8c3a2fba9e56
[6]: https://github.com/XuShaohua/kwplayer/commit/90a02a8508a476889df0f5a24debff7e7084e6fd
[7]: https://github.com/XuShaohua/kwplayer/issues?q=is:issue+author:wangjiezhe
[8]: https://copr.fedorainfracloud.org/coprs/wangjiezhe/
[9]: https://copr.fedorainfracloud.org/coprs/wangjiezhe/kwplayer/build/7604/
[10]: https://copr.fedorainfracloud.org
[11]: https://linuxtoy.org/archives/fedora-copr.html
[12]: https://lists.fedorahosted.org/archives/list/copr-devel@lists.fedorahosted.org/thread/SG7OAH7III5TDCSO7TLXOWIOPG7S7F2X/
[13]: https://github.com/1dot75cm
[14]: https://fedoraproject.org/wiki/User:Mosquito
[15]: http://www.ruanyifeng.com/blog/2012/08/blogging_with_jekyll.html
[16]: https://blog.comebacktome.org/about/
[17]: https://github.com/pii0x/ellochen.github.com
[18]: https://site.douban.com/196781/
[19]: https://github.com/hmfaysal/hmfaysal-omega-theme
[20]: https://github.com/kingcons/coleslaw
[21]: https://icehe.github.io/web/blog_changelog/
[22]: https://theme-next.org
[23]: https://github.com/hexojs/hexo-renderer-markdown-it
[24]: https://github.com/fooleap/disqus-php-api
[25]: https://github.com/imsun/gitment
[26]: https://github.com/gitalk/gitalk
[27]: https://valine.js.org
[28]: https://www.itfanr.cc/2017/08/09/using-travis-ci-automatic-deploy-hexo-blogs/
[29]: https://github.com/vinta/pangu.js
[30]: https://github.com/ethantw/Han
[31]: https://github.com/hexojs/hexo-renderer-markdown-it/wiki/Advanced-Configuration
[32]: https://github.com/iissnan/hexo-theme-next/issues/1645
[33]: https://github.com/iissnan/hexo-theme-next/pull/1780
[34]: https://github.com/wangjiezhe/Han/commit/6e8ce2592a4786b8ad7230a2d387177030c66caf
[35]: https://github.com/theme-next/theme-next-han
[36]: https://github.com/hustcc/canvas-nest.js
