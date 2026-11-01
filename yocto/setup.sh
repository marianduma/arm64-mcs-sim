#!/usr/bin/env bash

YOCTO_DIR=$(dirname $(realpath $0))
LAYERS_DIR=${YOCTO_DIR}/layers

mkdir -p ${LAYERS_DIR}

git clone -b yocto-6.0 https://git.openembedded.org/bitbake ${LAYERS_DIR}/bitbake
git clone -b yocto-6.0 https://git.openembedded.org/openembedded-core ${LAYERS_DIR}/openembedded-core
git clone -b yocto-6.0 https://git.yoctoproject.org/meta-yocto ${LAYERS_DIR}/meta-yocto

# source layers/openembedded-core/oe-init-build-env 
# bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn
# install-buildtools
# source ${LAYERS_DIR}/openembedded-core/buildtools/environment-setup-x86_64-pokysdk-linux
# bitbake-layers create-layer ../layers/meta-mcs
# bitbake-layers add-layer ../layers/meta-mcs
# bitbake core-image-minimal
# sudo /home/marian/Projects/arm64-mcs-sim/yocto/layers/openembedded-core/scripts/runqemu-gen-tapdevs 1000 4