#!/bin/bash

set -ex

# do not build in source
rm -rf /src-build
cp -rf /src /src-build
cd /src-build

# clean-up
rm -rf .pc

#./debian/rules binary-generic binary-arch
./debian/rules binary-arch
