FROM ubuntu:22.04

MAINTAINER Hector Cao <hector.cao@canonical.com>
ARG DEBIAN_FRONTEND=noninteractive

# To have add-apt-repository
RUN apt update && apt install --no-install-recommends --yes software-properties-common binutils wget zstd

RUN echo 'deb [signed-by=/etc/apt/keyrings/intel-sgx-keyring.asc arch=amd64] https://download.01.org/intel-sgx/sgx_repo/ubuntu jammy main' > /etc/apt/sources.list.d/intel-sgx.list
RUN wget https://download.01.org/intel-sgx/sgx_repo/ubuntu/intel-sgx-deb.key
RUN cat intel-sgx-deb.key > /etc/apt/keyrings/intel-sgx-keyring.asc

RUN apt update

COPY scripts/ /scripts/
RUN chmod 0755 /scripts/*

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /src/

# we have to run as root so that we can apt-get update
ENTRYPOINT ["/scripts/build"]
