#!/bin/bash

CURR_DIR=$(dirname "$(readlink -f "$0")")

#sudo apt install -y docker-buildx

if [ "$1" = "all" ]; then
		docker build -t oracular-pkg-build $CURR_DIR/
fi

if [ "$1" = "-i" ]; then
    # in interactive mode, the LANG=C fakeroot debian/rules binary-generic command fails
    # error : stdout is a console, aborting
    docker run -v ${PWD}:/src  -it --entrypoint="" oracular-pkg-build bash

		# inside the shell, to rebuild the kernel, we can use
		#debuild -us -uc -b
else
    docker run -v ${PWD}:/src/ oracular-pkg-build
fi


