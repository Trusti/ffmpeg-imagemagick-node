
FFMPEG/Nodejs for Docker on Centos7
============================

Forked from jrottenberg/ffmpeg

This repo has a Dockerfile to create a Docker image wth FFMPEG and Nodejs. It compiles FFMPEG from sources following instructions from the [Centos Compilation Guide](https://trac.ffmpeg.org/wiki/CompilationGuide/Centos) and installs Node.js from [Joyent/Node Installation Guide](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#enterprise-linux-and-fedora)

You can install the latest build of this image by running `docker pull raman148/ffmpeg-node`.

Please use [Github issues](https://github.com/jrottenberg/ffmpeg/issues/new) to report any bug or missing feature.

Test
----

```
$ docker run raman148/ffmpeg-node ffmpeg -buildconf
ffmpeg version 2.8.1 Copyright (c) 2000-2015 the FFmpeg developers
  built with gcc 4.8.3 (GCC) 20140911 (Red Hat 4.8.3-9)
  configuration: --prefix=/usr/local --extra-cflags=-I/usr/local/include --extra-ldflags=-L/usr/local/lib --bindir=/usr/local/bin --extra-libs=-ldl --enable-version3 --enable-libfaac --enable-libmp3lame --enable-libx264 --enable-libxvid --enable-gpl --enable-postproc --enable-nonfree --enable-avresample --enable-libfdk_aac --disable-debug --enable-small --enable-openssl --enable-libtheora --enable-libx265 --enable-libopus --enable-libvorbis --enable-libvpx
  libavutil      54. 31.100 / 54. 31.100
  libavcodec     56. 60.100 / 56. 60.100
  libavformat    56. 40.101 / 56. 40.101
  libavdevice    56.  4.100 / 56.  4.100
  libavfilter     5. 40.101 /  5. 40.101
  libavresample   2.  1.  0 /  2.  1.  0
  libswscale      3.  1.101 /  3.  1.101
  libswresample   1.  2.101 /  1.  2.101
  libpostproc    53.  3.100 / 53.  3.100

  configuration:
    --prefix=/usr/local
    --extra-cflags=-I/usr/local/include
    --extra-ldflags=-L/usr/local/lib
    --bindir=/usr/local/bin
    --extra-libs=-ldl
    --enable-version3
    --enable-libfaac
    --enable-libmp3lame
    --enable-libx264
    --enable-libxvid
    --enable-gpl
    --enable-postproc
    --enable-nonfree
    --enable-avresample
    --enable-libfdk_aac
    --disable-debug
    --enable-small
    --enable-openssl
    --enable-libtheora
    --enable-libx265
    --enable-libopus
    --enable-libvorbis
    --enable-libvpx
```

Capture output from the container to the host running the command

```
 docker run raman148/ffmpeg-node ffmpeg \
            -i http://url/to/media.mp4 \
            -stats \
            $ffmpeg_options  - > out.mp4
```

### Example

```
 docker run raman148/ffmpeg-node ffmpeg -stats  \
        -i http://archive.org/download/thethreeagesbusterkeaton/Buster.Keaton.The.Three.Ages.ogv \
        -loop 0  \
        -final_delay 500 -c:v gif -f gif -ss 00:49:42 -t 5 - > trow_ball.gif
```

See what's inside the beast
---------------------------

```
$ docker run -ti raman148/ffmpeg-node bash
bash-4.1#
```

Keep uptodate
-------------

-	FFMPEG_VERSION https://github.com/FFmpeg/FFmpeg/blob/master/Changelog
-	MPLAYER_VERSION http://www.mplayerhq.hu/MPlayer/releases/
-	YASM_VERSION https://github.com/yasm/yasm/releases
-	OGG_VERSION https://xiph.org/downloads/
-	VORBIS_VERSION https://xiph.org/downloads/
-	THEORA_VERSION https://xiph.org/downloads/
-	LAME_VERSION http://lame.sourceforge.net/download.php
-	OPUS_VERSION https://www.opus-codec.org/downloads/
-	FAAC_VERSION http://www.audiocoding.com/downloads.html
-	VPX_VERSION https://github.com/webmproject/libvpx/releases
-	XVID_VERSION https://labs.xvid.com/source/
-	FDKAAC_VERSION https://github.com/mstorsjo/fdk-aac/releases
-	X265_VERSION https://bitbucket.org/multicoreware/x265/downloads
- NODEJS_VERSION http://nodejs.org/dist/
