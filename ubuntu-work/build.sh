#!/bin/bash

CURR_DIR=$(dirname "$(readlink -f "$0")")

docker build -t ubuntu-jammy-src -f Dockerfile.jammy $CURR_DIR/
