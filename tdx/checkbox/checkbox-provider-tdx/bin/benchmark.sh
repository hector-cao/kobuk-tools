#!/bin/bash

setup() {
    # installation
    sudo DEBIAN_FRONTEND=noninteractive apt install -y php-cli php-xml build-essential unzip

    wget https://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_10.8.4_all.deb
    sudo DEBIAN_FRONTEND=noninteractive apt install -y ./phoronix-test-suite_10.8.4_all.deb

    # phoronix configuration
    phoronix-test-suite user-config-set \
            UploadResults=FALSE \
            PromptForTestIdentifier=FALSE \
            PromptForTestDescription=FALSE \
            PromptSaveName=FALSE \
            RunAllTestCombinations=TRUE \
            Configured=TRUE \
            DropNoisyResults=TRUE
}

echo " start setup $(date +%s)"

setup &> /dev/null

echo " end start setup $(date +%s)"

# run
phoronix-test-suite batch-install stream
phoronix-test-suite batch-run stream

phoronix-test-suite benchmark memory

echo " end test $(date +%s)"
