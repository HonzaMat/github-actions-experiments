#!/usr/bin/env bash

# SPDX-License-Identifier: CC0-1.0

# Create a tar.gz archive with the spike binary build.

set -euox pipefail

# Store the build log
cp build_log.txt /opt/riscv-isa-sim

# Store the license & git commit information
cd riscv-isa-sim
cp LICENSE /opt/riscv-isa-sim/spike_license.txt
git show >/opt/riscv-isa-sim/git_commit.txt

# Make the package
cd ..
tar -czvf riscv-isa-sim.tar.gz -C /opt riscv-isa-sim
