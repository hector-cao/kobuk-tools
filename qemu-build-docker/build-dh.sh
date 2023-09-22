#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

docker build -f ${SCRIPT_DIR}/Dockerfile -t qemu-build ./

docker run -v ${SCRIPT_DIR}/scripts/build-dh/:/build-scripts -v ${PWD}:/src/ qemu-build

# in interactive mode, the LANG=C fakeroot debian/rules binary-generic command fails
# Error : stdout is a console, aborting
# docker run -v ${PWD}:/src  -it --entrypoint="" qemu-build bash
