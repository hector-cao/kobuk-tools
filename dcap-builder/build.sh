#!/bin/bash

CURR_DIR=$(dirname "$(readlink -f "$0")")

#sudo apt install -y docker-buildx

if [ "$1" = "all" ]; then
		docker build -t mantic-dcap-build $CURR_DIR/
fi

# network = none : check the build does not need internet access
DOCKER_ARGS="-v ${PWD}:/src/ \
             --network none \
								"

if [ "$1" = "-i" ]; then
    # in interactive mode, the LANG=C fakeroot debian/rules binary-generic command fails
    # error : stdout is a console, aborting
    docker run $DOCKER_ARGS  -it --entrypoint="" mantic-dcap-build bash

		# inside the shell, to rebuild the kernel, we can use
		#debuild -us -uc -b
else
    docker run $DOCKER_ARGS mantic-dcap-build
fi


