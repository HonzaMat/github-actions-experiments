#!/usr/bin/env bash

# SPDX-License-Identifier: CC0-1.0

# Install the dependencies needed to run Spike:
# - device tree compiler
# And dependencies for the run_smoketest.sh script:
# - diff

set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Error: expected exactly one argument (name of the docker container)." >&2
    exit 1
fi

case "$1" in
    "ubuntu:jammy"|"ubuntu:noble"|"ubuntu:resolute"|"debian:12"|"debian:13")
        apt-get update
        apt-get install -y device-tree-compiler
        ;;
    "fedora:44"|"rockylinux:9")
        dnf install -y diff dtc
        ;;
    "rockylinux:8")
        dnf install -y diff
        dnf install --enablerepo=devel -y dtc
        ;;
    *)
        echo "Don't know what dependencies to install on this system." >&2
        exit 2
esac

exit 0
