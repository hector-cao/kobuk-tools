#!/bin/bash

CURR_DIR=$(dirname "$(readlink -f "$0")")

if [ "$1" = "all" ]; then
		docker build -t dcap-jammy $CURR_DIR/
fi

if [ "$1" = "-i" ]; then
    # in interactive mode, the LANG=C fakeroot debian/rules binary-generic command fails
    # error : stdout is a console, aborting
    docker run -v ${PWD}:/src  -it --entrypoint="" dcap-jammy bash
else
    docker run -v ${PWD}:/src/ dcap-jammy
fi


