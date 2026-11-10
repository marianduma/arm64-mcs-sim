#!/usr/bin/env bash

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Error: This script must be sourced:"
    echo "  source env.sh"
    exit 1
fi

YOCTO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LAYERS_DIR="${YOCTO_DIR}/layers"
BUILDTOOLS_DIR="${LAYERS_DIR}/openembedded-core/buildtools"
BUILDTOOLS_ENV="${BUILDTOOLS_DIR}/environment-setup-x86_64-pokysdk-linux"

if [ ! -d "${LAYERS_DIR}/openembedded-core" ]; then
    echo "Error: openembedded-core not found in ${LAYERS_DIR}."
    echo "Run ./setup.sh first to clone the repositories."
    return 1
fi

source "${LAYERS_DIR}/openembedded-core/oe-init-build-env" "${YOCTO_DIR}/build"

if [ -f "${BUILDTOOLS_ENV}" ]; then
    source "${BUILDTOOLS_ENV}"
fi