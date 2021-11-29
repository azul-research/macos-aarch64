#!/bin/bash

set -e

# test STEP

# hardcode path to jtreg
JT_HOME=/home/gleb/tabs/azul/jtreg/build/images/jtreg/

docker run --privileged --name run-container -i --rm \
  -v $PWD/sysroot/:/sysroot \
  -v $PWD:/sysroot/pwd/ \
  -v $JT_HOME:/sysroot/pwd/jtreg/ \
  aarch64-qemu chroot /sysroot /bin/bash pwd/test-script.sh;

echo -e "test step: SUCCESS\n"
