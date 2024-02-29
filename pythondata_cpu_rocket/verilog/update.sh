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

export | grep -q ' RISCV=' || {
  echo "Please \`export RISCV='/path/to/RISCV'\` (software toolchain)!"
  exit 1
}
export PATH="${PATH}:${RISCV}/bin"

export | grep -q ' MILL=' || {
  echo "Please \`export MILL='/path/to/mill'\` (scala builder)!"
  exit 1
}

export | grep -q ' FIRTOOL=' || {
  echo "Please \`export FIRTOOL='/path/to/FIRTOOL'\` (build helper tool)!"
  exit 1
}
export PATH="${PATH}:${FIRTOOL}/bin"

# grab a copy of upstream:
rm -rf rocket-chip
git clone --recursive https://github.com/chipsalliance/rocket-chip
pushd rocket-chip

# also grab a copy of the L2 cache repo:
cd src/main/scala
git clone https://github.com/chipsalliance/rocket-chip-inclusive-cache
cd rocket-chip-inclusive-cache
# FIXME: current cache versions won't build with current rocket-chip -- Why?
git reset --hard 51d400bd32131e8914c6713bfb71bef690f2fe70
popd

# make Rocket's internal bootrom jump to 0x1000_0000, as expected by LiteX:
sed -i '/DRAM_BASE/s/x8/x1/;/hang:/a\  j _start' rocket-chip/bootrom/bootrom.S

make -C rocket-chip/bootrom || exit 1

# comment out unnecessary (and unsuitable) DTB from internal bootrom:
sed -i '/dtb\.contents/s|++|//++|' rocket-chip/src/main/scala/devices/tilelink/BootROM.scala

# workaround for rocket:firtool "impedance mismatch":
sed -i '/"-dedup",/d' rocket-chip/build.sc

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
	EOT

# Fit Rocket core models to each LiteX model:
declare -A CORE_TYPE=(
  ['Small']='Small'
  ['Medium']='Med'
  ['Linux']='Big'
  ['Full']='Big'
)

# variant prefix string:
VPFX='freechips.rocketchip.system.'

# add specified litex variant to rocket sources:
add_variant () {
  local MODEL=$1
  local CORES=$2
  local WIDTH=$3
  local VARIANT="LitexConfig${MODEL}${CORES}${WIDTH}"
  {
    echo
    echo "class ${VARIANT} extends Config("
    [ "${MODEL}" == "Full" ] && {
      echo '  new WithHypervisor ++'
    }
    echo "  new WithN${CORE_TYPE[$MODEL]}Cores(${CORES}) ++"
    echo "  new WithMemoryDataBits($((${WIDTH}*64))) ++"
    [ "${MODEL}" == "Full" -a "${WIDTH}" == "1" ] && {
      # NOTE: cache only works with 64-bit wide memory port!
      echo '  new WithInclusiveCache() ++'
    }
    echo '  new BaseLitexConfig'
    echo ')'
  } >> rocket-chip/src/main/scala/system/Configs.scala
  local OBJ_EMU="(\"${VPFX}TestHarness\", \"${VPFX}${VARIANT}\")"
  sed -i "/^object emulator /,/^)$/s/^)$/  ${OBJ_EMU},\n)/" rocket-chip/build.sc
}

# Generate LiteX variant configurations:
for MODEL in Small Medium Linux Full; do
  for CORES in 1 2 4 8; do
    for WIDTH in 1 2 4 8; do
      add_variant ${MODEL} ${CORES} ${WIDTH}
    done
  done
done

# build specified litex variant:
build_variant () {
  local MODEL=$1
  local CORES=$2
  local WIDTH=$3
  local CONFIG="${VPFX}LitexConfig${MODEL}${CORES}${WIDTH}"
  make -C rocket-chip verilog CONFIG=${CONFIG}
}

# install root:
INSTALLROOT='./generated-src'

# install specified litex variant:
install_variant () {
  local MODEL=$1
  local CORES=$2
  local WIDTH=$3
  local VARIANT="${MODEL}${CORES}${WIDTH}"
  local BUILDROOT="rocket-chip/out/emulator/${VPFX}TestHarness"
  local BUILDDIR="${BUILDROOT}/${VPFX}LitexConfig${VARIANT}"
  local ELAB='generator/elaborate.dest'
  local COMP='mfccompiler/compile.dest'
  local INSTALLDIR="${INSTALLROOT}/${VARIANT}"
  # remove unwanted build files:
  rm -f ${BUILDDIR}/${ELAB}/TestHarness.*
  rm -f ${BUILDDIR}/${ELAB}/*.plusArgs
  rm -f ${BUILDDIR}/${COMP}/*.f
  rm -f ${BUILDDIR}/${COMP}/SimDTM.*
  rm -f ${BUILDDIR}/${COMP}/TestHarness.sv
  rm -f ${BUILDDIR}/${COMP}/extern_modules.sv
  # install build files:
  install -D -m 0644 ${BUILDDIR}/${ELAB}/* -t ${INSTALLDIR}
  install -D -m 0644 ${BUILDDIR}/${COMP}/*.v -t ${INSTALLDIR}
  install -D -m 0644 ${BUILDDIR}/${COMP}/*.sv -t ${INSTALLDIR}
}

# start with a clean install root:
rm -rf ${INSTALLROOT}

# Elaborate and install verilog for each LiteX (sub-)variant:
for MODEL in Small Medium Linux Full; do
  for CORES in 1 2 4 8; do
    for WIDTH in 1 2 4 8; do
      build_variant ${MODEL} ${CORES} ${WIDTH}
      install_variant ${MODEL} ${CORES} ${WIDTH}
    done
  done
done

# record upstream git revision:
REV=$(git -C rocket-chip rev-parse --short HEAD)
echo ${REV} > _upstream.rev
echo "
Done; Recommended next steps:
  git add .
  git commit -m 'Update to chipsalliance/rocket-chip commit #${REV}'
"
