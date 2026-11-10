#!/usr/bin/env bash
set -euo pipefail

YOCTO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LAYERS_DIR="${YOCTO_DIR}/layers"

mkdir -p "${LAYERS_DIR}"

if [ ! -d "${LAYERS_DIR}/bitbake" ]; then
    git clone -b yocto-6.0 https://git.openembedded.org/bitbake "${LAYERS_DIR}/bitbake"
fi

if [ ! -d "${LAYERS_DIR}/openembedded-core" ]; then
    git clone -b yocto-6.0 https://git.openembedded.org/openembedded-core "${LAYERS_DIR}/openembedded-core"
fi

BUILDTOOLS_DIR="${LAYERS_DIR}/openembedded-core/buildtools"
if [ ! -d "${BUILDTOOLS_DIR}" ]; then
    "${LAYERS_DIR}/openembedded-core/scripts/install-buildtools" --install-dir "${BUILDTOOLS_DIR}"
fi

source "${YOCTO_DIR}/env.sh"

bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn || true
bitbake-layers add-layer "${LAYERS_DIR}/meta-mcs"
bitbake mcs-image

sudo "${LAYERS_DIR}/openembedded-core/scripts/runqemu-gen-tapdevs" 1000 4