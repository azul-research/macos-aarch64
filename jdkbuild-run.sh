#!/bin/bash

set -e

# run STEP

docker run --privileged --name run-container -i --rm \
  -v $PWD/sysroot/:/sysroot \
  -v $PWD:/sysroot/pwd/ \
  -v $PWD/run-script.sh:/sysroot/run-script.sh \
  aarch64-qemu chroot /sysroot /bin/bash ./run-script.sh;

echo -e "run step: SUCCESS\n"
