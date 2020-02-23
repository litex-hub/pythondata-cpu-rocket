This repository contains a [RocketChip][1] core generated specifically for the [LiteX][2] SoC.

* Rocket's internal bootrom has been modified to jump to 0x1000_0000;
* Rocket's internal  address map was modified to route
  - any addresses between 0x1000_0000 and 0x8000_0000 through the uncached *MMIO* AXI interface, and
  - any addresses above 0x8000_0000 through the cached *MEM* AXI interface.

See `./update.sh` for details.

See `./_upstream.rev` for the upstream revision currently in use.

Run `./update.sh` and commit changes to update to the current upstream revision.

[1]: https://github.com/freechipsproject/rocket-chip
[2]: https://github.com/enjoy-digital/litex
