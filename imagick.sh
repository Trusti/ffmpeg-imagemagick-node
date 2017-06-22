#!/bin/bash

set -euo pipefail

echo "/usr/local/lib" > /etc/ld.so.conf.d/libc.conf

export MAKEFLAGS="-j$[$(nproc) + 1]"
export SRC=/usr/local
export PKG_CONFIG_PATH=${SRC}/lib/pkgconfig

yum install -y autoconf automake gcc gcc-c++ git libtool make nasm zlib-devel \
  openssl-devel tar cmake perl which bzip2

# imagemagick
yum install make gcc gcc-c++ -y
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s https://www.imagemagick.org/download/ImageMagick-${IMAGEMAGICK_VERSION}.tar.gz | \
  tar zxvf - -C . && \
  cd ${DIR}/ImageMagick-${IMAGEMAGICK_VERSION} && \
  ./configure && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}

yum clean all
rm -rf /var/lib/yum/yumdb/*
echo "/usr/local/lib" > /etc/ld.so.conf.d/libc.conf

# ldconfig
ldconfig /usr/local/lib