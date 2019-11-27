---
title: 压缩发送微信的视频文件
date: 2019-10-31 17:07:47
updated: 2019-10-31 17:07:47
categories: 工作
tags:
    - 视频
    - 微信
    - 压缩
description: 把视频压缩到 25M 以下，满足微信电脑版发送文件的限制
mathjax: true
---

这几天需要给我的学生在微信群里发一些视频讲解，但是由于在录播室录制的视频体积较大，无法通过微信发送。5分钟之内的视频倒是可以直接通过微信手机版发送，但是 1080p 的视频自动被压成 640p，清晰度损得太多了。于是就想自己手动压缩，在保证视频大小的基础上，尽可能的提高清晰度。

之前在网上搜过各种视频剪辑、转化工具，诸如爱剪辑之类的，但效果都不是很理想，最主要的问题是没法控制最终生成的文件的大小。

最终，还是决定回归最原始的工具————FFmpeg。

在查阅文档[^1]时候发现，有两种比较好的压缩码率的方式，一种是使用 CRF 参数，另一种是 2 pass 模式。

使用 CRF 参数，可以较好的控制生成视频的质量，但不太好控制视频的大小，而使用 2 pass 模式可以通过指定码率来控制文件的大小。因此我最终采用了第二种方法。

基本的思路是，先通过计算确定所需的码率：

{% note primary %}

总码率 = （文件大小[单位：MB] $\times$ 1024 $\times$ 8）/（时长）
视频码率 = 总码率 - 音频码率

{% endnote %}

这里面 `×8` 的目的是把单位从 `KiB` 转化为 `kBit`。

然后使用计算得到的视频码率（例如：400kBit/s）对原视频进行转码。这里采用 `H.265` 编码，相比原始的 `H.264` 编码，可以在同等质量下得到更小的文件。

```bash
ffmpeg -y -i input.mp4 -c:v libx265 -b:v 400k -x265-params pass=1 -an -f mp4 /dev/null && \
    ffmpeg -i input.mp4 -c:v libx265 -b:v 400k -x265-params pass=2 -c:a copy output.mp4
```

得到的文件基本就会满足我们对于文件大小的要求。

需要注意的是，在设置文件大小的时候需要设成 `24M` 而不是 `25M`，因为这里得到的只是一个平均码率，有可能得到的文件会比设置的稍微大一点，但实测不会大超过 `1M`。

完整的脚本[^2]如下：

```bash
#!/usr/bin/env bash

out_size=24
length=$(mediainfo --Inform="Video;%Duration%" "$1")
bitrate_all=$(echo "${out_size}*8192/(${length}/1000)" | bc)

bitrate_audio_orig=$(mediainfo --Inform="Audio;%BitRate%" "$1")
if [ -z ${bitrate_audio_orig} ]; then
    bitrate_audio_orig=$(mediainfo --Inform="Audio;%BitRate_Nominal%" "$1")
fi

if [ ${bitrate_audio_orig} -gt 150000 ]; then
    convert_audio=true
    bitrate_audio=128
else
    bitrate_audio=$(echo "${bitrate_audio_orig}/1000" | bc)
fi

if [ ${bitrate_all} -lt 250 ]; then
    convert_audio=true
    bitrate_audio=48
fi

bitrate_video=$(echo "${bitrate_all}-${bitrate_audio}" | bc)

in_file="$1"
out_file=$(echo ${in_file} | sed -e 's/.mp4/_25M.mp4/')

ffmpeg -y -i ${in_file} -c:v libx265 -b:v ${bitrate_video}k -x265-params pass=1 -an -f mp4 /dev/null
if [ ${convert_audio} = true ]; then
    ffmpeg -i "$1" -c:v libx265 -b:v ${bitrate_video}k -x265-params pass=2 -c:a aac -b:a ${bitrate_audio}k ${out_file}
else
    ffmpeg -i "$1" -c:v libx265 -b:v ${bitrate_video}k -x265-params pass=2 -c:a copy ${out_file}
fi
```

[^1]: https://trac.ffmpeg.org/wiki/Encode/H.265
[^2]: https://gist.github.com/wangjiezhe/576a3820b2519d8684aab39859340cb9
