FROM ubuntu:22.04

MAINTAINER Hector Cao <hector.cao@canonical.com>
ARG DEBIAN_FRONTEND=noninteractive

# To have add-apt-repository
RUN apt update && apt install --no-install-recommends --yes software-properties-common

RUN apt update && apt install --no-install-recommends --yes build-essential \
        fakeroot devscripts wget git equivs liblz4-tool sudo \
        unzip curl xz-utils cpio rpm2cpio gawk lintian

# add editors
RUN apt install -y emacs-nox

# remove git, svn, wget to make sure we do not fetch anything at build
RUN apt remove -y git wget svn curl || true

# add kobuk PPA for build-time dependencies
RUN add-apt-repository -y ppa:kobuk-team/tdx

COPY scripts/ /scripts/
RUN chmod 0755 /scripts/*

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /src/

# we have to run as root so that we can apt-get update
ENTRYPOINT ["/scripts/build"]
