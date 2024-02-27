#!/bin/bash

set -e

LINUX_SGX_URL=https://github.com/intel/SGXDataCenterAttestationPrimitives.git
LINUX_SGX_BRANCH=canonical_packaging_dev
DCAP_VERSION=1.20

DCAP_SRC_FOLDER_NAME=sgx-dcap-${DCAP_VERSION}
DCAP_SRC_ARCHIVE_NAME=linux-sgx_${DCAP_VERSION}.orig.tar.gz

prepare_source() {
		git clone -b canonical_packaging_dev --recursive $LINUX_SGX_URL $DCAP_SRC_FOLDER_NAME
		#(cd ./$DCAP_SRC_FOLDER_NAME && make preparation)
		tar --exclude-vcs -zcvf $DCAP_SRC_ARCHIVE_NAME $DCAP_SRC_FOLDER_NAME
}

rm -rf /tmp/sgx-dcap-tmp/
mkdir -p /tmp/sgx-dcap-tmp/
cd /tmp/sgx-dcap-tmp/ && prepare_source

echo "linux-sgx : /tmp/sgx-dcap-tmp/$DCAP_SRC_ARCHIVE_NAME"
