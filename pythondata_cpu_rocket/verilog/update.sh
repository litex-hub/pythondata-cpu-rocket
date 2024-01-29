#!/bin/bash

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

if [[ ! -v RISCV ]]; then
	echo "rocket-chip needs to define 'RISCV' when building verilog"
	exit 1
fi

PATH="${PATH}:${RISCV}/bin"

# grab a copy of upstream:
function update_repo() {
	local dir="${1}"
	local url="${2}"
	if [[ -d "${dir}" ]]; then
		pushd "${dir}" > /dev/null
		git reset --hard
		git pull origin
		popd > /dev/null
	else
		git clone --recursive ${url} ${git}
	fi
}

update_repo rocket-chip https://github.com/chipsalliance/rocket-chip.git
pushd rocket-chip
# reset to last commit before dev merge that removed SBT, standalone build:
git reset --hard 4f197707eb07d833131395a839974c186069930b
# also grab a copy of the L2 cache repo:
cd src/main/scala
update_repo rocket-chip-inclusive-cache https://github.com/chipsalliance/rocket-chip-inclusive-cache.git
cd rocket-chip-inclusive-cache
# also fix the L2 cache to a known, tested version:
git reset --hard 51d400bd32131e8914c6713bfb71bef690f2fe70
popd

# make Rocket's internal bootrom jump to 0x1000_0000, as expected by LiteX:
sed -i '/DRAM_BASE/s/x8/x1/;/hang:/a\  j _start' rocket-chip/bootrom/bootrom.S

make -C rocket-chip/bootrom || exit 1

# comment out unnecessary (and unsuitable) DTB from internal bootrom:
sed -i '/dtb\.contents/s|++|//++|' rocket-chip/src/main/scala/devices/tilelink/BootROM.scala

# Add LiteX specific Rocket port configuration options:
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

# Configure port settings, ensure sufficient external IRQs:
cat >> rocket-chip/src/main/scala/system/Configs.scala <<- "EOT"

	class BaseLitexConfig extends Config(
	  new WithLitexMemPort() ++
	  new WithLitexMMIOPort() ++
	  new WithLitexSlavePort ++
	  new WithNExtTopInterrupts(8) ++
	  new WithCoherentBusTopology ++
	  new BaseConfig
	)

	class WithLitexHextConfig extends Config(
	  new WithHypervisor ++
	  new WithBitManip ++ new WithBitManipCrypto ++
	  new WithCryptoNIST ++ new WithCryptoSM
	)
	EOT

# Fit Rocket core models to each LiteX model:
declare -r -A CORE_TYPE=(
  ['small']='Small'
  ['medium']='Med'
  ['linux']='Big'
  ['full']='Big'
)
declare -r PFX=freechips.rocketchip.system.LitexConfig

function prepare_core_configuration() {
	local model=${1}
	local cores=${2}
	local width=${3}
	local hext_str=""
	local cache_str=""

	if [[ "${model}" == "full" ]]; then
		hext_str="new WithLitexHextConfig ++"
		cache_str="new WithInclusiveCache() ++"
	fi

	# Generate LiteX variant configuration:
	cat >> rocket-chip/src/main/scala/system/Configs.scala <<- EOT
	class LitexConfig_${model}_${cores}_${width} extends Config(
	  ${hext_str}
	  new WithN${CORE_TYPE[$model]}Cores(${cores}) ++
	  new WithMemoryDataBits($((${width}*64))) ++
	  ${cache_str}
	  new BaseLitexConfig
	)
	EOT
}

for MODEL in small medium linux full; do
  for CORES in 1 2 4 8; do
    for WIDTH in 1 2 4 8; do
	  prepare_core_configuration ${MODEL} ${CORES} ${WIDTH}
    done
  done
done

# Elaborate verilog for each LiteX (sub-)variant:
for MODEL in small medium linux full; do
  for CORES in 1 2 4 8; do
    for WIDTH in 1 2 4 8; do
      make RISCV=${RISCV} -C rocket-chip/vsim verilog \
       CONFIG=freechips.rocketchip.system.LitexConfig_${MODEL}_${CORES}_${WIDTH}
    done
  done
done

# install generated files for use by LiteX:
VDIR=rocket-chip/src/main/resources/vsrc
GDIR=rocket-chip/vsim/generated-src
rm -f ${GDIR}/*.fir # too large for github, and, besides, we don't use them!
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
