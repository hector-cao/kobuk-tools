FROM ubuntu:23.10

MAINTAINER Hector Cao <hector.cao@canonical.com>
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install --no-install-recommends --yes \
        build-essential

# dependencies for SGX & DCAP build
RUN apt update && apt install --no-install-recommends --yes \
               ocamlbuild \
               ocaml \
               autoconf \
               automake \
               binutils \
               libtool \
               cmake \
               libssl-dev \
               protobuf-compiler \
               libprotoc-dev \
               python3-dev \
               nasm \
               python3 \
               python-is-python3 \
               libcurl4-openssl-dev

COPY scripts/ /scripts/
RUN chmod 0755 /scripts/*

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /src/

# we have to run as root so that we can apt-get update
ENTRYPOINT ["/scripts/build"]
