FROM ubuntu:24.04

MAINTAINER Hector Cao <hector.cao@canonical.com>
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install --no-install-recommends --yes build-essential \
        fakeroot devscripts wget git equivs liblz4-tool sudo python-is-python3 \
        pkg-config unzip curl xz-utils binutils cpio rpm2cpio python3-dev gawk

COPY --from=docker scripts/ /scripts/
RUN chmod 0755 /scripts/*

ENV DEBIAN_FRONTEND=noninteractive

COPY --from=kernel-dir ./ /src

WORKDIR /src

RUN apt update
RUN LANG=C debian/rules clean && apt build-dep -y ./
RUN rm -rf /src

# we have to run as root so that we can apt-get update
ENTRYPOINT ["/scripts/build"]
