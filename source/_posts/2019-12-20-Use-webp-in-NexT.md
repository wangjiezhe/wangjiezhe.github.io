---
title: 自动使用 WebP 图片
date: 2019-12-20 07:13:43
updated: 2019-12-20 07:13:43
categories:
  - 博客
tags:
  - Hexo
  - NexT
  - WebP
description: 对支持 WebP 格式的浏览器自动加载 WebP 图片，其余则加载原始的 jpg/png 图片
---

最开始我的图片是放到 [sm.ms][1] 图床上，但是访问起来加载得非常慢。后来发现，是因为每个图片都比较大，图片一多就显得比较慢了。
于是就把图片都换成了 WebP 格式，这样图片的大小就缩小了很多。但是由于 [sm.ms][1] 不支持 WebP 格式，于是只能把图片存在 Github 上。

直到有一天我用我的 iPad 打开自己的网页，咦，我的图片呢？？？

后来才知道，万恶的 Safari 依然不支持 WebP 格式！！！

没有办法，只好自己添加判断代码。对于支持 WebP 格式的浏览器自动加载 WebP 图片，其余则加载原始的 jpg/png 图片。

我的 `_config.yml` 配置文件中是：

```yaml
custom_file_path:
  footer: source/_data/footer.swig
lazyload: true
pjax: false
```

本来是一直启用 pjax 的，但是发现网页跳转后，我添加的代码不会自动执行，于是只好暂时禁用了，待找到解决办法再启用吧。

在 `博客文件夹/source/_data/footer.swig` 中添加如下代码：

```js
<script{{ pjax }}>
function checkWebp(callback) {
    var img = new Image();
    img.onload = function () { callback((img.width > 0) && (img.height > 0)); };
    img.onerror = function () { callback(false); };
    img.src = 'data:image/webp;base64,UklGRiIAAABXRUJQVlA4IBYAAAAwAQCdASoBAAEADsD+JaQAA3AAAAAA';
}
function showImage(useWebp) {
    var imgs = [].slice.call(document.querySelectorAll('img'));
    imgs.forEach(function (e) {
        if (useWebp) {
            var src = e.getAttribute('data-src')
            src = src.replace(/\.jpg$/, '.webp').replace(/\.png$/, '.webp');
            e.setAttribute('data-src', src);
        }
    });
}
checkWebp(showImage);
</script>
```

注意如果没有启用 `lazyload` 功能的话，应该把 `data-src` 都变成 `src`。

然后插入图片的时候正常插入就可以了，然后使用 `cwebp` 把图片都转成 WebP 格式，注意放到相同的文件夹内，并使用相同的文件名（不含后缀）。`cwebp` 命令的使用格式：

```bash
cwebp result.png -o result.webp
```

当然也可以借助 [智图][2] 等工具进行转化。

---

参考资料：

- <https://akarin.dev/2019/10/22/upgrade-to-webp/>
- <https://segmentfault.com/a/1190000007482148>


[1]: https://sm.ms/
[2]: https://zhitu.isux.us/
