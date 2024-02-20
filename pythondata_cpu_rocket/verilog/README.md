This repository contains a [RocketChip][1] core generated specifically for the [LiteX][2] SoC.

* Rocket's internal bootrom has been modified to jump to 0x1000_0000;
* Rocket's internal  address map was modified to route
  - any addresses between 0x1000_0000 and 0x8000_0000 through the uncached *MMIO* AXI interface, and
  - any addresses above 0x8000_0000 through the cached *MEM* AXI interface.
* Build Dependencies:
  - GCC [cross-compiler toolchain][3]
    - export path unpacked folder as the value of the `$RISCV` env. variable.
  - [`mill`][4] scala build tool
    - after cloning the repo, running `mill` for the first time will
      auto-download a pre-compiled binary to `$HOME/.cache/mill/download/`,
      which may then be exported as the value of the `$MILL` env. variable.
  - [`firtool`][5] build helper tool
    - download the latest `firrtl-bin-*` and export unpacked folder as the
      value of the `$FIRTOOL` env. variable.

See `./update.sh` for details.

See `./_upstream.rev` for the upstream revision currently in use.

Run `./update.sh` and commit changes to update to the current upstream revision.

[1]: https://github.com/freechipsproject/rocket-chip
[2]: https://github.com/enjoy-digital/litex
[3]: http://www.contrib.andrew.cmu.edu/~somlo/BTCP/RISCV-toolchain.tar.xz
[4]: https://github.com/com-lihaoyi/mill
[5]: https://github.com/llvm/circt/releases
