#!/bin/bash

set -e

# if "-c" flag specified => rebuild configure & make clean, first

if [[ ($# > 0) && ("$1" = "-c") ]]
then
  configure=1
else
  configure=0
fi

# build STEP

dr() { docker run -it --rm -v $HOME:$HOME -w $PWD -u $(id -u):$(id -g) "$@"; }

# set jdk version as in crosscompile/Dockerfile
ZULU_VERSION=15.36.13-ca-jdk15.0.5
BOOT_JDK=zulu${ZULU_VERSION}-linux_x64

if [[ $configure = 1 ]]
then

  dr aarch64-cross bash configure \
    --openjdk-target=aarch64-linux-gnu \
    --with-sysroot=$PWD/sysroot \
    --with-boot-jdk=/opt/$BOOT_JDK \
    --with-zlib=bundled \
    --with-extra-cxxflags="-std=c++11" \
    --with-num-cores=3    
  echo ""

  dr aarch64-cross make clean

fi

dr aarch64-cross make images

echo -e "build step: SUCCESS\n"
