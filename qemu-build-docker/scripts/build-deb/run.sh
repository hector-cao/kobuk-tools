#!/bin/bash

# build mantic
#

set -ex

apt update
DEBIAN_FRONTEND=noninteractive TZ=Europe/Paris apt install tzdata -y

# do not build in source
rm -rf /src-build
cp -rf /src /src-build
cd /src-build

# clean-up
rm -rf .pc

apt build-dep -y ./
debuild -uc -us -b
