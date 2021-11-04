#!/bin/sh

# https://github.com/openjdk/jdk/blob/83b2219220266c1365466970d08606fef766c4fa/.github/workflows/submit.yml#L514

SYSROOT=$1

qemu-debootstrap \
	--arch=arm64 \
	--verbose \
	--include=fakeroot,symlinks,build-essential,libx11-dev,libxext-dev,libxrender-dev,libxrandr-dev,libxtst-dev,libxt-dev,libcups2-dev,libfontconfig1-dev,libasound2-dev,libfreetype6-dev,libpng-dev \
	--resolve-deps \
	buster \
	$SYSROOT \
	http://httpredir.debian.org/debian

# JDK fails to build with the static libm

OLD_NAME=$SYSROOT/lib/aarch64-linux-gnu/libm.a
NEW_NAME=$OLD_NAME.bck

[ -f $OLD_NAME ] && mv $OLD_NAME $NEW_NAME

if [ ! -f $NEW_NAME ] ; then
  echo "$NEW_NAME is missing, aborting"
  exit 1
fi
