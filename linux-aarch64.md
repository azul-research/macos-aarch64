В процессе работы над macos/aarch64 можно сломать linux/aarch64. Его следует изредка проверять на простых тестах.

Сборку и запуск OpenJDK linux/aarch64 на linux/x86 машине можно делать с помощью кросс-компиляции и эмуляции. 
https://github.com/openjdk/jdk/blob/master/.github/workflows/submit.yml.

```
# each reboot
$ sudo modprobe binfmt_misc

# once
~/macos-aarch64$ docker build -t aarch64-cross dockerfiles/crosscompile
~/macos-aarch64$ docker build -t aarch64-qemu dockerfiles/qemu
~/macos-aarch64$ docker run -it --rm --privileged -v $PWD:$PWD -w $PWD aarch64-qemu \
  dockerfiles/qemu/debootstrap.sh ./sysroot

# build
~/jdk$ dr() { docker run -it --rm -v $HOME:$HOME -w $PWD -u $(id -u):$(id -g) "$@"; }
~/jdk$ dr aarch64-cross bash configure \
  --openjdk-target=aarch64-linux-gnu \
  --with-sysroot=$HOME/macos-aarch64/sysroot \
  --with-boot-jdk=/opt/zulu17.28.13-ca-jdk17.0.0-linux_x64
~/jdk$ dr aarch64-cross make images

# run
~/jdk$ docker run --privileged -it --rm \
  -v ~/macos-aarch64/sysroot/:/sysroot \
  -v $PWD:/sysroot/pwd/ \
  aarch64-qemu chroot /sysroot /bin/bash
root@7707baaec6f4:/# uname -a
Linux 7707baaec6f4 5.14.9-arch2-1 #1 SMP PREEMPT Fri, 01 Oct 2021 19:03:20 +0000 aarch64 GNU/Linux
root@7707baaec6f4:/# /pwd/build/linux-aarch64-server-release/images/jdk/bin/java -version
openjdk version "18-internal" 2022-03-15
OpenJDK Runtime Environment (build 18-internal+0-adhoc..jdk)
OpenJDK 64-Bit Server VM (build 18-internal+0-adhoc..jdk, mixed mode)
```
