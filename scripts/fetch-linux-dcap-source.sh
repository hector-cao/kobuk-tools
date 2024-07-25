#!/bin/bash

set -e

LINUX_SGX_URL=https://github.com/intel/SGXDataCenterAttestationPrimitives.git
LINUX_SGX_BRANCH=canonical_packaging_dev
DCAP_VERSION=1.21

DCAP_SRC_FOLDER_NAME=sgx-dcap-${DCAP_VERSION}
DCAP_SRC_ARCHIVE_NAME=sgx-dcap_${DCAP_VERSION}.orig.tar.gz

prepare_source() {
		git clone -b canonical_packaging_dev --recursive $LINUX_SGX_URL $DCAP_SRC_FOLDER_NAME
		(cd ./$DCAP_SRC_FOLDER_NAME &&
				 QuoteVerification/prepare_sgxssl.sh nobuild &&
				 QuoteGeneration/download_prebuilt.sh)
		tar --exclude-vcs -zcvf $DCAP_SRC_ARCHIVE_NAME $DCAP_SRC_FOLDER_NAME
}

rm -rf /tmp/sgx-dcap-tmp/
mkdir -p /tmp/sgx-dcap-tmp/
cd /tmp/sgx-dcap-tmp/ && prepare_source

echo "sgx-dcap : /tmp/sgx-dcap-tmp/$DCAP_SRC_ARCHIVE_NAME"
