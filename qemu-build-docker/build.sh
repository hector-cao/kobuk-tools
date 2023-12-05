#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

#sudo apt install -y docker-buildx

if [ "$1" = "all" ]; then
		docker build -f ${SCRIPT_DIR}/Dockerfile -t qemu-build ./
fi

if [ "$1" = "-i" ]; then
    # in interactive mode, the LANG=C fakeroot debian/rules binary-generic command fails
    # error : stdout is a console, aborting
		docker run -v ${SCRIPT_DIR}/scripts/build-deb/:/build-scripts -v ${PWD}:/src/ -it --entrypoint="" qemu-build bash

		# inside the shell, to rebuild the kernel, we can use
		#debuild -us -uc -b
else
		docker run -v ${SCRIPT_DIR}/scripts/build-deb/:/build-scripts -v ${PWD}:/src/ qemu-build
fi
