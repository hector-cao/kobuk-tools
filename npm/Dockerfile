FROM ubuntu:23.10

MAINTAINER Hector Cao <hector.cao@canonical.com>
ARG DEBIAN_FRONTEND=noninteractive

# To have add-apt-repository
RUN apt update && apt install --no-install-recommends --yes software-properties-common

RUN apt update && apt install --no-install-recommends --yes build-essential \
        fakeroot devscripts wget git equivs liblz4-tool sudo \
        unzip curl xz-utils cpio rpm2cpio gawk

RUN apt install --no-install-recommends --yes nodejs npm

# add kobuk PPA for build-time dependencies
RUN add-apt-repository -y ppa:kobuk-team/tdx

COPY scripts/ /scripts/
RUN chmod 0755 /scripts/*

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /src/

# we have to run as root so that we can apt-get update
ENTRYPOINT ["/scripts/build"]
