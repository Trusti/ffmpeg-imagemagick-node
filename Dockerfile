# ffmpeg-nodejs
#
# FFMPEG-VERSION               2.8.1-1
# NODEJS-VERSION               4.2.2
# VERSION               
#
# From https://trac.ffmpeg.org/wiki/CompilationGuide/Centos
# From https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
#
#

FROM          centos:7
MAINTAINER    Raman Nanda <Raman148@gmail.com>


ENV           FFMPEG_VERSION=3.0.7   \
              MPLAYER_VERSION=1.3.0  \
              NASM_VERSION=2.13.01   \
              YASM_VERSION=1.3.0     \
              OGG_VERSION=1.3.2      \
              VORBIS_VERSION=1.3.5   \
              THEORA_VERSION=1.1.1   \
              LAME_VERSION=3.99.5    \
              OPUS_VERSION=1.1.4     \
              FAAC_VERSION=1.28      \
              VPX_VERSION=1.6.1      \
              XVID_VERSION=1.3.4     \
              FDKAAC_VERSION=0.1.5   \
              X265_VERSION=2.3       \
              NODEJS_VERSION=6.9.5   \
              IMAGEMAGICK_VERSION=7.0.6-0

COPY          run.sh /tmp/run.sh
COPY          imagick.sh /tmp/imagick.sh

# See https://github.com/Raman148/ffmpeg-nodejs/blob/master/run.sh
RUN           echo "Installing now" && bash /tmp/run.sh
RUN           echo "Installing now" && bash /tmp/imagick.sh

# Let's make sure the app built correctly
RUN           ffmpeg -buildconf

# Make sure Node.js is installed
RUN           node -v
RUN           npm -v

