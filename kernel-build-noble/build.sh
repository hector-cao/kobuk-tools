#!/bin/bash

CURR_DIR=$(dirname "$(readlink -f "$0")")

sudo apt install -y docker-buildx

if [ "$1" = "all" ]; then
		docker buildx build --build-context kernel-dir=${PWD} --build-context docker=$CURR_DIR -t noble-kernel-build $CURR_DIR/
fi

USER=$(id -u)
GROUP=$(id -g)

DOCKER_ARGS="-v ${PWD}:/src/ \
								"

if [ "$1" = "-i" ]; then
    # in interactive mode, the LANG=C fakeroot debian/rules binary-generic command fails
    # error : stdout is a console, aborting
    docker run $DOCKER_ARGS -it --entrypoint="" noble-kernel-build bash

		# inside the shell, to rebuild the kernel, we can use
		#debuild -us -uc -b
else
    docker run $DOCKER_ARGS noble-kernel-build
fi


