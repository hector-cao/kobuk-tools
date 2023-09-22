FROM ubuntu:23.10

MAINTAINER Hector Cao <hector.cao@canonical.com>
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install --no-install-recommends --yes \
		build-essential \
    fakeroot \
		devscripts \
		wget \
		git \
		equivs \
		liblz4-tool \
		sudo \
		python-is-python3 \
    pkg-config \
		unzip \
		curl \
		xz-utils \
		binutils \
		cpio \
		rpm2cpio \
		python3-dev

# docker build should be run in the qemu source code
# to install all dependencies
ADD ./ /tmp/qemu-src
WORKDIR /tmp/qemu-src
RUN apt build-dep -y ./
RUN rm -rf /tmp/qemu-src

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /src

ENTRYPOINT ["/build-scripts/run.sh"]


