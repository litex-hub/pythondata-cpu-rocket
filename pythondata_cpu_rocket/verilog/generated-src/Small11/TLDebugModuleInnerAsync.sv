// Generated by CIRCT firtool-1.66.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

// Standard header to adapt well known macros for prints and assertions.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

module TLDebugModuleInnerAsync(
  input  [2:0]  auto_dmiXing_in_a_mem_0_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [8:0]  auto_dmiXing_in_a_mem_0_address,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [31:0] auto_dmiXing_in_a_mem_0_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_dmiXing_in_a_ridx,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_dmiXing_in_a_widx,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_dmiXing_in_a_safe_ridx_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_dmiXing_in_a_safe_widx_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_dmiXing_in_a_safe_source_reset_n,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_dmiXing_in_a_safe_sink_reset_n,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_dmiXing_in_d_mem_0_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]  auto_dmiXing_in_d_mem_0_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_dmiXing_in_d_mem_0_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [31:0] auto_dmiXing_in_d_mem_0_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_dmiXing_in_d_ridx,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_dmiXing_in_d_widx,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_dmiXing_in_d_safe_ridx_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_dmiXing_in_d_safe_widx_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_dmiXing_in_d_safe_source_reset_n,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_dmiXing_in_d_safe_sink_reset_n,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_dmInner_tl_in_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_dmInner_tl_in_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]  auto_dmInner_tl_in_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_dmInner_tl_in_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [1:0]  auto_dmInner_tl_in_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [8:0]  auto_dmInner_tl_in_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [11:0] auto_dmInner_tl_in_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]  auto_dmInner_tl_in_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [63:0] auto_dmInner_tl_in_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_dmInner_tl_in_a_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_dmInner_tl_in_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_dmInner_tl_in_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_dmInner_tl_in_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]  auto_dmInner_tl_in_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [8:0]  auto_dmInner_tl_in_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [63:0] auto_dmInner_tl_in_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         io_debug_clock,	// src/main/scala/devices/debug/Debug.scala:1870:16
                io_debug_reset,	// src/main/scala/devices/debug/Debug.scala:1870:16
                io_tl_clock,	// src/main/scala/devices/debug/Debug.scala:1870:16
                io_tl_reset,	// src/main/scala/devices/debug/Debug.scala:1870:16
                io_dmactive,	// src/main/scala/devices/debug/Debug.scala:1870:16
                io_innerCtrl_mem_0_resumereq,	// src/main/scala/devices/debug/Debug.scala:1870:16
  input  [9:0]  io_innerCtrl_mem_0_hartsel,	// src/main/scala/devices/debug/Debug.scala:1870:16
  input         io_innerCtrl_mem_0_ackhavereset,	// src/main/scala/devices/debug/Debug.scala:1870:16
                io_innerCtrl_mem_0_hrmask_0,	// src/main/scala/devices/debug/Debug.scala:1870:16
  output        io_innerCtrl_ridx,	// src/main/scala/devices/debug/Debug.scala:1870:16
  input         io_innerCtrl_widx,	// src/main/scala/devices/debug/Debug.scala:1870:16
  output        io_innerCtrl_safe_ridx_valid,	// src/main/scala/devices/debug/Debug.scala:1870:16
  input         io_innerCtrl_safe_widx_valid,	// src/main/scala/devices/debug/Debug.scala:1870:16
                io_innerCtrl_safe_source_reset_n,	// src/main/scala/devices/debug/Debug.scala:1870:16
  output        io_innerCtrl_safe_sink_reset_n,	// src/main/scala/devices/debug/Debug.scala:1870:16
                io_hgDebugInt_0,	// src/main/scala/devices/debug/Debug.scala:1870:16
  input         io_hartIsInReset_0	// src/main/scala/devices/debug/Debug.scala:1870:16
);

  wire        io_innerCtrl_safe_sink_reset_n_0;
  wire        io_innerCtrl_safe_ridx_valid_0;
  wire        io_innerCtrl_ridx_0;
  wire        auto_dmiXing_in_d_safe_source_reset_n_0;
  wire        auto_dmiXing_in_d_safe_widx_valid_0;
  wire        auto_dmiXing_in_d_widx_0;
  wire [31:0] auto_dmiXing_in_d_mem_0_data_0;
  wire        auto_dmiXing_in_d_mem_0_source_0;
  wire [1:0]  auto_dmiXing_in_d_mem_0_size_0;
  wire [2:0]  auto_dmiXing_in_d_mem_0_opcode_0;
  wire        auto_dmiXing_in_a_safe_sink_reset_n_0;
  wire        auto_dmiXing_in_a_safe_ridx_valid_0;
  wire        auto_dmiXing_in_a_ridx_0;
  wire        io_hgDebugInt_0_0;
  wire [63:0] auto_dmInner_tl_in_d_bits_data_0;
  wire [8:0]  auto_dmInner_tl_in_d_bits_source_0;
  wire [1:0]  auto_dmInner_tl_in_d_bits_size_0;
  wire [2:0]  auto_dmInner_tl_in_d_bits_opcode_0;
  wire        auto_dmInner_tl_in_d_valid_0;
  wire        auto_dmInner_tl_in_a_ready_0;
  wire        _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid;	// src/main/scala/util/AsyncQueue.scala:207:22
  wire        _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq;	// src/main/scala/util/AsyncQueue.scala:207:22
  wire [9:0]  _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel;	// src/main/scala/util/AsyncQueue.scala:207:22
  wire        _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset;	// src/main/scala/util/AsyncQueue.scala:207:22
  wire        _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hasel;	// src/main/scala/util/AsyncQueue.scala:207:22
  wire        _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hamask_0;	// src/main/scala/util/AsyncQueue.scala:207:22
  wire        _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0;	// src/main/scala/util/AsyncQueue.scala:207:22
  wire        _dmiXing_auto_out_a_valid;	// src/main/scala/devices/debug/Debug.scala:1851:27
  wire [2:0]  _dmiXing_auto_out_a_bits_opcode;	// src/main/scala/devices/debug/Debug.scala:1851:27
  wire [2:0]  _dmiXing_auto_out_a_bits_param;	// src/main/scala/devices/debug/Debug.scala:1851:27
  wire [1:0]  _dmiXing_auto_out_a_bits_size;	// src/main/scala/devices/debug/Debug.scala:1851:27
  wire        _dmiXing_auto_out_a_bits_source;	// src/main/scala/devices/debug/Debug.scala:1851:27
  wire [8:0]  _dmiXing_auto_out_a_bits_address;	// src/main/scala/devices/debug/Debug.scala:1851:27
  wire [3:0]  _dmiXing_auto_out_a_bits_mask;	// src/main/scala/devices/debug/Debug.scala:1851:27
  wire [31:0] _dmiXing_auto_out_a_bits_data;	// src/main/scala/devices/debug/Debug.scala:1851:27
  wire        _dmiXing_auto_out_a_bits_corrupt;	// src/main/scala/devices/debug/Debug.scala:1851:27
  wire        _dmiXing_auto_out_d_ready;	// src/main/scala/devices/debug/Debug.scala:1851:27
  wire        _dmInner_auto_dmi_in_a_ready;	// src/main/scala/devices/debug/Debug.scala:1850:27
  wire        _dmInner_auto_dmi_in_d_valid;	// src/main/scala/devices/debug/Debug.scala:1850:27
  wire [2:0]  _dmInner_auto_dmi_in_d_bits_opcode;	// src/main/scala/devices/debug/Debug.scala:1850:27
  wire [1:0]  _dmInner_auto_dmi_in_d_bits_size;	// src/main/scala/devices/debug/Debug.scala:1850:27
  wire        _dmInner_auto_dmi_in_d_bits_source;	// src/main/scala/devices/debug/Debug.scala:1850:27
  wire [31:0] _dmInner_auto_dmi_in_d_bits_data;	// src/main/scala/devices/debug/Debug.scala:1850:27
  wire [2:0]  auto_dmiXing_in_a_mem_0_opcode_0 = auto_dmiXing_in_a_mem_0_opcode;
  wire [8:0]  auto_dmiXing_in_a_mem_0_address_0 = auto_dmiXing_in_a_mem_0_address;
  wire [31:0] auto_dmiXing_in_a_mem_0_data_0 = auto_dmiXing_in_a_mem_0_data;
  wire        auto_dmiXing_in_a_widx_0 = auto_dmiXing_in_a_widx;
  wire        auto_dmiXing_in_a_safe_widx_valid_0 = auto_dmiXing_in_a_safe_widx_valid;
  wire        auto_dmiXing_in_a_safe_source_reset_n_0 =
    auto_dmiXing_in_a_safe_source_reset_n;
  wire        auto_dmiXing_in_d_ridx_0 = auto_dmiXing_in_d_ridx;
  wire        auto_dmiXing_in_d_safe_ridx_valid_0 = auto_dmiXing_in_d_safe_ridx_valid;
  wire        auto_dmiXing_in_d_safe_sink_reset_n_0 = auto_dmiXing_in_d_safe_sink_reset_n;
  wire        auto_dmInner_tl_in_a_valid_0 = auto_dmInner_tl_in_a_valid;
  wire [2:0]  auto_dmInner_tl_in_a_bits_opcode_0 = auto_dmInner_tl_in_a_bits_opcode;
  wire [2:0]  auto_dmInner_tl_in_a_bits_param_0 = auto_dmInner_tl_in_a_bits_param;
  wire [1:0]  auto_dmInner_tl_in_a_bits_size_0 = auto_dmInner_tl_in_a_bits_size;
  wire [8:0]  auto_dmInner_tl_in_a_bits_source_0 = auto_dmInner_tl_in_a_bits_source;
  wire [11:0] auto_dmInner_tl_in_a_bits_address_0 = auto_dmInner_tl_in_a_bits_address;
  wire [7:0]  auto_dmInner_tl_in_a_bits_mask_0 = auto_dmInner_tl_in_a_bits_mask;
  wire [63:0] auto_dmInner_tl_in_a_bits_data_0 = auto_dmInner_tl_in_a_bits_data;
  wire        auto_dmInner_tl_in_a_bits_corrupt_0 = auto_dmInner_tl_in_a_bits_corrupt;
  wire        auto_dmInner_tl_in_d_ready_0 = auto_dmInner_tl_in_d_ready;
  wire        io_debug_clock_0 = io_debug_clock;
  wire        io_debug_reset_0 = io_debug_reset;
  wire        io_tl_clock_0 = io_tl_clock;
  wire        io_tl_reset_0 = io_tl_reset;
  wire        io_dmactive_0 = io_dmactive;
  wire        io_innerCtrl_mem_0_resumereq_0 = io_innerCtrl_mem_0_resumereq;
  wire [9:0]  io_innerCtrl_mem_0_hartsel_0 = io_innerCtrl_mem_0_hartsel;
  wire        io_innerCtrl_mem_0_ackhavereset_0 = io_innerCtrl_mem_0_ackhavereset;
  wire        io_innerCtrl_mem_0_hrmask_0_0 = io_innerCtrl_mem_0_hrmask_0;
  wire        io_innerCtrl_widx_0 = io_innerCtrl_widx;
  wire        io_innerCtrl_safe_widx_valid_0 = io_innerCtrl_safe_widx_valid;
  wire        io_innerCtrl_safe_source_reset_n_0 = io_innerCtrl_safe_source_reset_n;
  wire        io_hartIsInReset_0_0 = io_hartIsInReset_0;
  wire [31:0] auto_dmiXing_in_b_mem_0_data = 32'h0;	// src/main/scala/devices/debug/Debug.scala:1851:27, src/main/scala/diplomacy/LazyModule.scala:374:18
  wire [31:0] auto_dmiXing_in_c_mem_0_data = 32'h0;	// src/main/scala/devices/debug/Debug.scala:1851:27, src/main/scala/diplomacy/LazyModule.scala:374:18
  wire [3:0]  auto_dmiXing_in_b_mem_0_mask = 4'h0;	// src/main/scala/devices/debug/Debug.scala:1851:27, src/main/scala/diplomacy/LazyModule.scala:374:18
  wire [8:0]  auto_dmiXing_in_b_mem_0_address = 9'h0;	// src/main/scala/devices/debug/Debug.scala:1851:27, src/main/scala/diplomacy/LazyModule.scala:374:18
  wire [8:0]  auto_dmiXing_in_c_mem_0_address = 9'h0;	// src/main/scala/devices/debug/Debug.scala:1851:27, src/main/scala/diplomacy/LazyModule.scala:374:18
  wire [1:0]  auto_dmiXing_in_b_mem_0_param = 2'h0;
  wire [1:0]  auto_dmiXing_in_b_mem_0_size = 2'h0;
  wire [1:0]  auto_dmiXing_in_c_mem_0_size = 2'h0;
  wire [1:0]  auto_dmiXing_in_d_mem_0_param = 2'h0;
  wire [1:0]  auto_dmInner_tl_in_d_bits_param = 2'h0;
  wire [3:0]  auto_dmiXing_in_a_mem_0_mask = 4'hF;	// src/main/scala/devices/debug/Debug.scala:1851:27, src/main/scala/diplomacy/LazyModule.scala:374:18
  wire        auto_dmiXing_in_a_mem_0_source = 1'h0;
  wire        auto_dmiXing_in_a_mem_0_corrupt = 1'h0;
  wire        auto_dmiXing_in_b_mem_0_source = 1'h0;
  wire        auto_dmiXing_in_b_mem_0_corrupt = 1'h0;
  wire        auto_dmiXing_in_b_ridx = 1'h0;
  wire        auto_dmiXing_in_b_widx = 1'h0;
  wire        auto_dmiXing_in_b_safe_ridx_valid = 1'h0;
  wire        auto_dmiXing_in_b_safe_widx_valid = 1'h0;
  wire        auto_dmiXing_in_b_safe_source_reset_n = 1'h0;
  wire        auto_dmiXing_in_b_safe_sink_reset_n = 1'h0;
  wire        auto_dmiXing_in_c_mem_0_source = 1'h0;
  wire        auto_dmiXing_in_c_mem_0_corrupt = 1'h0;
  wire        auto_dmiXing_in_c_ridx = 1'h0;
  wire        auto_dmiXing_in_c_widx = 1'h0;
  wire        auto_dmiXing_in_c_safe_ridx_valid = 1'h0;
  wire        auto_dmiXing_in_c_safe_widx_valid = 1'h0;
  wire        auto_dmiXing_in_c_safe_source_reset_n = 1'h0;
  wire        auto_dmiXing_in_c_safe_sink_reset_n = 1'h0;
  wire        auto_dmiXing_in_d_mem_0_sink = 1'h0;
  wire        auto_dmiXing_in_d_mem_0_denied = 1'h0;
  wire        auto_dmiXing_in_d_mem_0_corrupt = 1'h0;
  wire        auto_dmiXing_in_e_mem_0_sink = 1'h0;
  wire        auto_dmiXing_in_e_ridx = 1'h0;
  wire        auto_dmiXing_in_e_widx = 1'h0;
  wire        auto_dmiXing_in_e_safe_ridx_valid = 1'h0;
  wire        auto_dmiXing_in_e_safe_widx_valid = 1'h0;
  wire        auto_dmiXing_in_e_safe_source_reset_n = 1'h0;
  wire        auto_dmiXing_in_e_safe_sink_reset_n = 1'h0;
  wire        auto_dmInner_custom_in_addr = 1'h0;
  wire        auto_dmInner_custom_in_ready = 1'h0;
  wire        auto_dmInner_custom_in_valid = 1'h0;
  wire        auto_dmInner_tl_in_d_bits_sink = 1'h0;
  wire        auto_dmInner_tl_in_d_bits_denied = 1'h0;
  wire        auto_dmInner_tl_in_d_bits_corrupt = 1'h0;
  wire        io_innerCtrl_mem_0_hasel = 1'h0;
  wire        io_innerCtrl_mem_0_hamask_0 = 1'h0;
  wire        io_debugUnavail_0 = 1'h0;
  wire [1:0]  auto_dmiXing_in_a_mem_0_size = 2'h2;	// src/main/scala/devices/debug/Debug.scala:1851:27, src/main/scala/diplomacy/LazyModule.scala:374:18
  wire [2:0]  auto_dmiXing_in_a_mem_0_param = 3'h0;
  wire [2:0]  auto_dmiXing_in_b_mem_0_opcode = 3'h0;
  wire [2:0]  auto_dmiXing_in_c_mem_0_opcode = 3'h0;
  wire [2:0]  auto_dmiXing_in_c_mem_0_param = 3'h0;
  wire        childClock = io_debug_clock_0;	// src/main/scala/diplomacy/LazyModule.scala:419:31
  wire        childReset = io_debug_reset_0;	// src/main/scala/diplomacy/LazyModule.scala:421:31
  wire        dmactive_synced;	// src/main/scala/util/ShiftReg.scala:48:24
  TLDebugModuleInner dmInner (	// src/main/scala/devices/debug/Debug.scala:1850:27
    .clock                          (io_debug_clock_0),
    .reset                          (io_debug_reset_0),
    .auto_tl_in_a_ready             (auto_dmInner_tl_in_a_ready_0),
    .auto_tl_in_a_valid             (auto_dmInner_tl_in_a_valid_0),
    .auto_tl_in_a_bits_opcode       (auto_dmInner_tl_in_a_bits_opcode_0),
    .auto_tl_in_a_bits_param        (auto_dmInner_tl_in_a_bits_param_0),
    .auto_tl_in_a_bits_size         (auto_dmInner_tl_in_a_bits_size_0),
    .auto_tl_in_a_bits_source       (auto_dmInner_tl_in_a_bits_source_0),
    .auto_tl_in_a_bits_address      (auto_dmInner_tl_in_a_bits_address_0),
    .auto_tl_in_a_bits_mask         (auto_dmInner_tl_in_a_bits_mask_0),
    .auto_tl_in_a_bits_data         (auto_dmInner_tl_in_a_bits_data_0),
    .auto_tl_in_a_bits_corrupt      (auto_dmInner_tl_in_a_bits_corrupt_0),
    .auto_tl_in_d_ready             (auto_dmInner_tl_in_d_ready_0),
    .auto_tl_in_d_valid             (auto_dmInner_tl_in_d_valid_0),
    .auto_tl_in_d_bits_opcode       (auto_dmInner_tl_in_d_bits_opcode_0),
    .auto_tl_in_d_bits_size         (auto_dmInner_tl_in_d_bits_size_0),
    .auto_tl_in_d_bits_source       (auto_dmInner_tl_in_d_bits_source_0),
    .auto_tl_in_d_bits_data         (auto_dmInner_tl_in_d_bits_data_0),
    .auto_dmi_in_a_ready            (_dmInner_auto_dmi_in_a_ready),
    .auto_dmi_in_a_valid            (_dmiXing_auto_out_a_valid),	// src/main/scala/devices/debug/Debug.scala:1851:27
    .auto_dmi_in_a_bits_opcode      (_dmiXing_auto_out_a_bits_opcode),	// src/main/scala/devices/debug/Debug.scala:1851:27
    .auto_dmi_in_a_bits_param       (_dmiXing_auto_out_a_bits_param),	// src/main/scala/devices/debug/Debug.scala:1851:27
    .auto_dmi_in_a_bits_size        (_dmiXing_auto_out_a_bits_size),	// src/main/scala/devices/debug/Debug.scala:1851:27
    .auto_dmi_in_a_bits_source      (_dmiXing_auto_out_a_bits_source),	// src/main/scala/devices/debug/Debug.scala:1851:27
    .auto_dmi_in_a_bits_address     (_dmiXing_auto_out_a_bits_address),	// src/main/scala/devices/debug/Debug.scala:1851:27
    .auto_dmi_in_a_bits_mask        (_dmiXing_auto_out_a_bits_mask),	// src/main/scala/devices/debug/Debug.scala:1851:27
    .auto_dmi_in_a_bits_data        (_dmiXing_auto_out_a_bits_data),	// src/main/scala/devices/debug/Debug.scala:1851:27
    .auto_dmi_in_a_bits_corrupt     (_dmiXing_auto_out_a_bits_corrupt),	// src/main/scala/devices/debug/Debug.scala:1851:27
    .auto_dmi_in_d_ready            (_dmiXing_auto_out_d_ready),	// src/main/scala/devices/debug/Debug.scala:1851:27
    .auto_dmi_in_d_valid            (_dmInner_auto_dmi_in_d_valid),
    .auto_dmi_in_d_bits_opcode      (_dmInner_auto_dmi_in_d_bits_opcode),
    .auto_dmi_in_d_bits_size        (_dmInner_auto_dmi_in_d_bits_size),
    .auto_dmi_in_d_bits_source      (_dmInner_auto_dmi_in_d_bits_source),
    .auto_dmi_in_d_bits_data        (_dmInner_auto_dmi_in_d_bits_data),
    .io_dmactive                    (dmactive_synced),	// src/main/scala/util/ShiftReg.scala:48:24
    .io_innerCtrl_valid
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid),	// src/main/scala/util/AsyncQueue.scala:207:22
    .io_innerCtrl_bits_resumereq
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq),	// src/main/scala/util/AsyncQueue.scala:207:22
    .io_innerCtrl_bits_hartsel
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel),	// src/main/scala/util/AsyncQueue.scala:207:22
    .io_innerCtrl_bits_ackhavereset
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset),	// src/main/scala/util/AsyncQueue.scala:207:22
    .io_innerCtrl_bits_hasel
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hasel),	// src/main/scala/util/AsyncQueue.scala:207:22
    .io_innerCtrl_bits_hamask_0
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hamask_0),	// src/main/scala/util/AsyncQueue.scala:207:22
    .io_innerCtrl_bits_hrmask_0
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0),	// src/main/scala/util/AsyncQueue.scala:207:22
    .io_hgDebugInt_0                (io_hgDebugInt_0_0),
    .io_hartIsInReset_0             (io_hartIsInReset_0_0),
    .io_tl_clock                    (io_tl_clock_0),
    .io_tl_reset                    (io_tl_reset_0)
  );	// src/main/scala/devices/debug/Debug.scala:1850:27
  TLAsyncCrossingSink dmiXing (	// src/main/scala/devices/debug/Debug.scala:1851:27
    .clock                         (childClock),	// src/main/scala/diplomacy/LazyModule.scala:419:31
    .reset                         (childReset),	// src/main/scala/diplomacy/LazyModule.scala:421:31
    .auto_in_a_mem_0_opcode        (auto_dmiXing_in_a_mem_0_opcode_0),
    .auto_in_a_mem_0_address       (auto_dmiXing_in_a_mem_0_address_0),
    .auto_in_a_mem_0_data          (auto_dmiXing_in_a_mem_0_data_0),
    .auto_in_a_ridx                (auto_dmiXing_in_a_ridx_0),
    .auto_in_a_widx                (auto_dmiXing_in_a_widx_0),
    .auto_in_a_safe_ridx_valid     (auto_dmiXing_in_a_safe_ridx_valid_0),
    .auto_in_a_safe_widx_valid     (auto_dmiXing_in_a_safe_widx_valid_0),
    .auto_in_a_safe_source_reset_n (auto_dmiXing_in_a_safe_source_reset_n_0),
    .auto_in_a_safe_sink_reset_n   (auto_dmiXing_in_a_safe_sink_reset_n_0),
    .auto_in_d_mem_0_opcode        (auto_dmiXing_in_d_mem_0_opcode_0),
    .auto_in_d_mem_0_size          (auto_dmiXing_in_d_mem_0_size_0),
    .auto_in_d_mem_0_source        (auto_dmiXing_in_d_mem_0_source_0),
    .auto_in_d_mem_0_data          (auto_dmiXing_in_d_mem_0_data_0),
    .auto_in_d_ridx                (auto_dmiXing_in_d_ridx_0),
    .auto_in_d_widx                (auto_dmiXing_in_d_widx_0),
    .auto_in_d_safe_ridx_valid     (auto_dmiXing_in_d_safe_ridx_valid_0),
    .auto_in_d_safe_widx_valid     (auto_dmiXing_in_d_safe_widx_valid_0),
    .auto_in_d_safe_source_reset_n (auto_dmiXing_in_d_safe_source_reset_n_0),
    .auto_in_d_safe_sink_reset_n   (auto_dmiXing_in_d_safe_sink_reset_n_0),
    .auto_out_a_ready              (_dmInner_auto_dmi_in_a_ready),	// src/main/scala/devices/debug/Debug.scala:1850:27
    .auto_out_a_valid              (_dmiXing_auto_out_a_valid),
    .auto_out_a_bits_opcode        (_dmiXing_auto_out_a_bits_opcode),
    .auto_out_a_bits_param         (_dmiXing_auto_out_a_bits_param),
    .auto_out_a_bits_size          (_dmiXing_auto_out_a_bits_size),
    .auto_out_a_bits_source        (_dmiXing_auto_out_a_bits_source),
    .auto_out_a_bits_address       (_dmiXing_auto_out_a_bits_address),
    .auto_out_a_bits_mask          (_dmiXing_auto_out_a_bits_mask),
    .auto_out_a_bits_data          (_dmiXing_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt       (_dmiXing_auto_out_a_bits_corrupt),
    .auto_out_d_ready              (_dmiXing_auto_out_d_ready),
    .auto_out_d_valid              (_dmInner_auto_dmi_in_d_valid),	// src/main/scala/devices/debug/Debug.scala:1850:27
    .auto_out_d_bits_opcode        (_dmInner_auto_dmi_in_d_bits_opcode),	// src/main/scala/devices/debug/Debug.scala:1850:27
    .auto_out_d_bits_size          (_dmInner_auto_dmi_in_d_bits_size),	// src/main/scala/devices/debug/Debug.scala:1850:27
    .auto_out_d_bits_source        (_dmInner_auto_dmi_in_d_bits_source),	// src/main/scala/devices/debug/Debug.scala:1850:27
    .auto_out_d_bits_data          (_dmInner_auto_dmi_in_d_bits_data)	// src/main/scala/devices/debug/Debug.scala:1850:27
  );	// src/main/scala/devices/debug/Debug.scala:1851:27
  AsyncResetSynchronizerShiftReg_w1_d3_i0 dmactive_synced_dmactive_synced_dmactiveSync (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (childClock),	// src/main/scala/diplomacy/LazyModule.scala:419:31
    .reset (childReset),	// src/main/scala/diplomacy/LazyModule.scala:421:31
    .io_d  (io_dmactive_0),
    .io_q  (dmactive_synced)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  AsyncQueueSink_2 dmactive_synced_dmInner_io_innerCtrl_sink (	// src/main/scala/util/AsyncQueue.scala:207:22
    .clock                        (childClock),	// src/main/scala/diplomacy/LazyModule.scala:419:31
    .reset                        (childReset),	// src/main/scala/diplomacy/LazyModule.scala:421:31
    .io_deq_valid
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid),
    .io_deq_bits_resumereq
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq),
    .io_deq_bits_hartsel
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel),
    .io_deq_bits_ackhavereset
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset),
    .io_deq_bits_hasel
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hasel),
    .io_deq_bits_hamask_0
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hamask_0),
    .io_deq_bits_hrmask_0
      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0),
    .io_async_mem_0_resumereq     (io_innerCtrl_mem_0_resumereq_0),
    .io_async_mem_0_hartsel       (io_innerCtrl_mem_0_hartsel_0),
    .io_async_mem_0_ackhavereset  (io_innerCtrl_mem_0_ackhavereset_0),
    .io_async_mem_0_hrmask_0      (io_innerCtrl_mem_0_hrmask_0_0),
    .io_async_ridx                (io_innerCtrl_ridx_0),
    .io_async_widx                (io_innerCtrl_widx_0),
    .io_async_safe_ridx_valid     (io_innerCtrl_safe_ridx_valid_0),
    .io_async_safe_widx_valid     (io_innerCtrl_safe_widx_valid_0),
    .io_async_safe_source_reset_n (io_innerCtrl_safe_source_reset_n_0),
    .io_async_safe_sink_reset_n   (io_innerCtrl_safe_sink_reset_n_0)
  );	// src/main/scala/util/AsyncQueue.scala:207:22
  assign auto_dmiXing_in_a_ridx = auto_dmiXing_in_a_ridx_0;
  assign auto_dmiXing_in_a_safe_ridx_valid = auto_dmiXing_in_a_safe_ridx_valid_0;
  assign auto_dmiXing_in_a_safe_sink_reset_n = auto_dmiXing_in_a_safe_sink_reset_n_0;
  assign auto_dmiXing_in_d_mem_0_opcode = auto_dmiXing_in_d_mem_0_opcode_0;
  assign auto_dmiXing_in_d_mem_0_size = auto_dmiXing_in_d_mem_0_size_0;
  assign auto_dmiXing_in_d_mem_0_source = auto_dmiXing_in_d_mem_0_source_0;
  assign auto_dmiXing_in_d_mem_0_data = auto_dmiXing_in_d_mem_0_data_0;
  assign auto_dmiXing_in_d_widx = auto_dmiXing_in_d_widx_0;
  assign auto_dmiXing_in_d_safe_widx_valid = auto_dmiXing_in_d_safe_widx_valid_0;
  assign auto_dmiXing_in_d_safe_source_reset_n = auto_dmiXing_in_d_safe_source_reset_n_0;
  assign auto_dmInner_tl_in_a_ready = auto_dmInner_tl_in_a_ready_0;
  assign auto_dmInner_tl_in_d_valid = auto_dmInner_tl_in_d_valid_0;
  assign auto_dmInner_tl_in_d_bits_opcode = auto_dmInner_tl_in_d_bits_opcode_0;
  assign auto_dmInner_tl_in_d_bits_size = auto_dmInner_tl_in_d_bits_size_0;
  assign auto_dmInner_tl_in_d_bits_source = auto_dmInner_tl_in_d_bits_source_0;
  assign auto_dmInner_tl_in_d_bits_data = auto_dmInner_tl_in_d_bits_data_0;
  assign io_innerCtrl_ridx = io_innerCtrl_ridx_0;
  assign io_innerCtrl_safe_ridx_valid = io_innerCtrl_safe_ridx_valid_0;
  assign io_innerCtrl_safe_sink_reset_n = io_innerCtrl_safe_sink_reset_n_0;
  assign io_hgDebugInt_0 = io_hgDebugInt_0_0;
endmodule

