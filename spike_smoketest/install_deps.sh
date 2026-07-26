#!/usr/bin/env bash

# SPDX-License-Identifier: CC0-1.0

# Install runtime dependencies needed by Spike (currently
# this is the device tree compiler only).

set -euo pipefail

if command -v dnf >/dev/null 2>&1; then
    # RockyLinux, AlmaLinux, Fedora
    dnf install -y dtc
elif command -v apt-get >/dev/null 2>&1; then
    # Ubuntu, Debian
    apt-get install -y device-tree-compiler
else
    echo "Don't know how to install spike dependencies on this system." >&2
    exit 1
fi
