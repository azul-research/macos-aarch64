#!/bin/bash

set -e

# each reboot
sudo modprobe binfmt_misc

# you need to have for next steps:

# dockerfiles/
# - crosscompile/
# -- Docker
# - qemu/
# -- debootstrap.sh
# -- Dockerfile
# -- entrypoint.sh

# once -> build STEPS
./jdkbuild-once.sh
./jdkbuild-build.sh -c
./jdkbuild-run.sh

echo "jdkbuild: SUCCESS"
