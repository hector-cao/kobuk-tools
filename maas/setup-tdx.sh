#!/bin/bash

rm -rf /tmp/setup-tdx/

mkdir /tmp/setup-tdx/
cd /tmp/setup-tdx/

git clone https://github.com/canonical/tdx.git
cd tdx
git checkout main-next

cd attestation
sudo ./setup-host.sh
