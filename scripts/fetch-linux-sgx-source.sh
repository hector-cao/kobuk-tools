#!/bin/bash

set -e

LINUX_SGX_URL=https://github.com/intel/linux-sgx.git
LINUX_SGX_BRANCH=canonical_packaging_dev
SGX_VERSION=2.23

SGX_SRC_FOLDER_NAME=linux-sgx-${SGX_VERSION}
SGX_SRC_ARCHIVE_NAME=linux-sgx_${SGX_VERSION}.orig.tar.gz

prepare_source() {
		git clone -b canonical_packaging_dev --recursive $LINUX_SGX_URL $SGX_SRC_FOLDER_NAME

		# skip prebuilt download
		cd $SGX_SRC_FOLDER_NAME
		cp Makefile Makefile.bk
		sed -i '/^.*download_prebuilt.*/d' Makefile
		make preparation
		mv Makefile.bk Makefile
		cd -

		# create archive
		tar --exclude-vcs -zcvf $SGX_SRC_ARCHIVE_NAME $SGX_SRC_FOLDER_NAME
}

rm -rf /tmp/linux-sgx-tmp/
mkdir -p /tmp/linux-sgx-tmp/
cd /tmp/linux-sgx-tmp/ && prepare_source

echo "linux-sgx : /tmp/linux-sgx-tmp/$SGX_SRC_ARCHIVE_NAME"
