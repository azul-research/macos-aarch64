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
mv $SYSROOT/lib/aarch64-linux-gnu/libm.a{,.bck}
