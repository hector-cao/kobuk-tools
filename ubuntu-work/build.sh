
#!/bin/bash

CURR_DIR=$(dirname "$(readlink -f "$0")")

docker build -t ubuntu-jammy-src -f Dockerfile.jammy $CURR_DIR/
docker build -t ubuntu-focal-src -f Dockerfile.focal $CURR_DIR/
docker build -t ubuntu-mantic-src -f Dockerfile.mantic $CURR_DIR/
docker build -t ubuntu-noble-src -f Dockerfile.noble $CURR_DIR/
