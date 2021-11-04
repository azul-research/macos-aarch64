#!/bin/bash

set -e

# once STEP

# crosscompile/Dockerfile: set correct jdk version depending on your task
# qemu/debootstrap.sh: set correct --arch depending on your task
# and everywhere in jdkbuild scripts

docker build -t aarch64-cross dockerfiles/crosscompile
docker build -t aarch64-qemu dockerfiles/qemu
docker run -it --rm --privileged -v $PWD:$PWD -w $PWD aarch64-qemu \
  dockerfiles/qemu/debootstrap.sh ./sysroot

echo -e "once step: SUCCESS\n"
