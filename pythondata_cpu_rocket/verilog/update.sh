#!/usr/bin/sh

# update.sh: Update Rocket Chip Verilog files for the LiteX SoC.
#
# Author: Gabriel L. Somlo <somlo@cmu.edu>
# Copyright (c) 2019, Carnegie Mellon University
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

PATH=/usr/bin:${HOME}/RISCV/bin

# grab a copy of upstream:
rm -rf rocket-chip
git clone --recursive https://github.com/chipsalliance/rocket-chip

# make Rocket's internal bootrom jump to 0x1000_0000, as expected by LiteX:
sed -i '/DRAM_BASE/s/x8/x1/;/hang:/a\  j _start' rocket-chip/bootrom/bootrom.S
make -C rocket-chip/bootrom

# generate LiteX-specific Rocket configuration variants:
# NOTE: uncached (MMIO) access below, cached (RAM) access above 0x8000_0000
cat >> rocket-chip/src/main/scala/subsystem/Configs.scala <<- "EOT"

	class WithMemoryDataBits(dataBits: Int) extends Config((site, here, up) => {
	  case MemoryBusKey => up(MemoryBusKey, site).copy(beatBytes = dataBits/8)
	})

	class WithLitexMemPort extends Config((site, here, up) => {
	  case ExtMem => Some(MemoryPortParams(MasterPortParams(
	                      base = x"8000_0000",
	                      size = x"8000_0000",
	                      beatBytes = site(MemoryBusKey).beatBytes,
	                      idBits = 4), 1))
	})

	class WithLitexMMIOPort extends Config((site, here, up) => {
	  case ExtBus => Some(MasterPortParams(
	                      base = x"1000_0000",
	                      size = x"7000_0000",
	                      beatBytes = site(SystemBusKey).beatBytes,
	                      idBits = 4))
	})

	class WithLitexSlavePort extends Config((site, here, up) => {
	  case ExtIn  => Some(SlavePortParams(
	                      beatBytes = site(SystemBusKey).beatBytes,
	                      idBits = 8,
	                      sourceBits = 4))
	})
	EOT
# NOTE: disable (unused) slave AXI port, ensure sufficient external IRQs
cat >> rocket-chip/src/main/scala/system/Configs.scala <<- "EOT"

	class BaseLitexConfig extends Config(
	  new WithLitexMemPort() ++
	  new WithLitexMMIOPort() ++
	  new WithLitexSlavePort ++
	  new WithNExtTopInterrupts(4) ++
	  new WithCoherentBusTopology ++
	  new BaseConfig
	)

	class LitexConfig extends Config(
	  new WithNSmallCores(1) ++
	  new WithMemoryDataBits(64) ++
	  new BaseLitexConfig
	)

	class LitexLinuxConfig extends Config(
	  new WithNMedCores(1) ++
	  new WithMemoryDataBits(64) ++
	  new BaseLitexConfig
	)

	class LitexLinuxDConfig extends Config(
	  new WithNMedCores(1) ++
	  new WithMemoryDataBits(128) ++
	  new BaseLitexConfig
	)

	class LitexLinuxQConfig extends Config(
	  new WithNMedCores(1) ++
	  new WithMemoryDataBits(256) ++
	  new BaseLitexConfig
	)

	class LitexFullConfig extends Config(
	  new WithNBigCores(1) ++
	  new WithMemoryDataBits(64) ++
	  new BaseLitexConfig
	)
	EOT
for CFG in '' Linux LinuxD LinuxQ Full; do
  make RISCV=${HOME}/RISCV -C rocket-chip/vsim verilog \
       CONFIG=freechips.rocketchip.system.Litex${CFG}Config
done

# install generated files for use by LiteX:
VDIR=rocket-chip/src/main/resources/vsrc
GDIR=rocket-chip/vsim/generated-src
for DIR in ${VDIR} ${GDIR}; do
  rm -rf $(basename ${DIR})
  install -m 0644 ${DIR}/* -D -t $(basename ${DIR})
done

# record upstream git revision:
REV=$(git -C rocket-chip rev-parse --short HEAD)
echo ${REV} > _upstream.rev
echo "
Done; Recommended next steps:
  git add .
  git commit -m 'Update to chipsalliance/rocket-chip commit #${REV}'
"
