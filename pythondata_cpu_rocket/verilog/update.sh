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
	  new WithHypervisor
	)
	EOT

# Upstream rocket-chip use '_' as config delimiter, this break
# LiteX build
# TODO: This should be fixed by changing new name in upstream
sed -i "s/('_')/('|')/" rocket-chip/build.sc

rm -rf generated-src vsrc
mkdir generated-src vsrc

# Fit Rocket core models to each LiteX model:
declare -r -A CORE_TYPE=(
  ['small']='Small'
  ['medium']='Med'
  ['linux']='Big'
  ['full']='Big'
)
declare -r PFX=freechips.rocketchip.system.LitexConfig

function build_core() {
	local model=${1}
	local cores=${2}
	local width=${3}
	local hext_str=""
	local cache_str=""
	local target="${PFX}_${model}_${cores}_${width}"
	local target_dir="${PFX}/${model}/${cores}/${width}"

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

	# Add build target
	sed -i "/Cross\[Emulator\](/a (\"freechips.rocketchip.system.TestHarness\", \"${target}\")," rocket-chip/build.sc

	# Elaborate verilog for LiteX (sub-)variant:
	make RISCV=${RISCV} -C rocket-chip verilog CONFIG=${target} || exit 1

	# Install generated files for use by LiteX:
	local out=rocket-chip/out/emulator/freechips.rocketchip.system.TestHarness/${target}/
	# fir should also be removed
	rm -f ${out}/generator/elaborate.dest/TestHarness.*

	install -D -m 0644 ${out}/generator/elaborate.dest/* -t generated-src/
	install -D -m 0644 ${out}/mfccompiler/compile.dest/*.sv -t generated-src/${target_dir}/
}

for MODEL in small medium linux full; do
  for CORES in 1 2 4 8; do
    for WIDTH in 1 2 4 8; do
      build_core ${MODEL} ${CORES} ${WIDTH}
    done
  done
done

# install common vsrc for use by LiteX:
install -m 0644 rocket-chip/src/main/resources/vsrc/* -D -t vsrc

# record upstream git revision:
REV=$(git -C rocket-chip rev-parse --short HEAD)
echo ${REV} > _upstream.rev
echo "
Done; Recommended next steps:
  git add .
  git commit -m 'Update to chipsalliance/rocket-chip commit #${REV}'
"
