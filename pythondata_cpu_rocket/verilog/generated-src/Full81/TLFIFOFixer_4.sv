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

module TLFIFOFixer_4(
  input         clock,
                reset,
  output        auto_in_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]  auto_in_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]  auto_in_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [31:0] auto_in_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]  auto_in_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [63:0] auto_in_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_a_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_in_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]  auto_in_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [63:0] auto_in_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_d_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_out_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_out_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_out_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]  auto_out_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [31:0] auto_out_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]  auto_out_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [63:0] auto_out_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_out_a_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_out_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]  auto_out_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]  auto_out_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_out_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [63:0] auto_out_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_out_d_bits_corrupt	// src/main/scala/diplomacy/LazyModule.scala:374:18
);

  wire        auto_in_a_valid_0 = auto_in_a_valid;
  wire [2:0]  auto_in_a_bits_opcode_0 = auto_in_a_bits_opcode;
  wire [2:0]  auto_in_a_bits_param_0 = auto_in_a_bits_param;
  wire [2:0]  auto_in_a_bits_size_0 = auto_in_a_bits_size;
  wire [3:0]  auto_in_a_bits_source_0 = auto_in_a_bits_source;
  wire [31:0] auto_in_a_bits_address_0 = auto_in_a_bits_address;
  wire [7:0]  auto_in_a_bits_mask_0 = auto_in_a_bits_mask;
  wire [63:0] auto_in_a_bits_data_0 = auto_in_a_bits_data;
  wire        auto_in_a_bits_corrupt_0 = auto_in_a_bits_corrupt;
  wire        auto_in_d_ready_0 = auto_in_d_ready;
  wire        auto_out_a_ready_0 = auto_out_a_ready;
  wire        auto_out_d_valid_0 = auto_out_d_valid;
  wire [2:0]  auto_out_d_bits_opcode_0 = auto_out_d_bits_opcode;
  wire [2:0]  auto_out_d_bits_size_0 = auto_out_d_bits_size;
  wire [3:0]  auto_out_d_bits_source_0 = auto_out_d_bits_source;
  wire        auto_out_d_bits_denied_0 = auto_out_d_bits_denied;
  wire [63:0] auto_out_d_bits_data_0 = auto_out_d_bits_data;
  wire        auto_out_d_bits_corrupt_0 = auto_out_d_bits_corrupt;
  wire        auto_in_d_bits_sink = 1'h0;
  wire        auto_out_d_bits_sink = 1'h0;
  wire        nodeIn_d_bits_sink = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeOut_d_bits_sink = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        a_noDomain = 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:57:29
  wire [1:0]  auto_in_d_bits_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:374:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25
  wire [1:0]  auto_out_d_bits_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:374:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25
  wire        nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]  nodeIn_d_bits_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:374:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25
  wire [1:0]  nodeOut_d_bits_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:374:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25
  wire        nodeIn_a_valid = auto_in_a_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_a_bits_opcode = auto_in_a_bits_opcode_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_a_bits_param = auto_in_a_bits_param_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_a_bits_size = auto_in_a_bits_size_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]  nodeIn_a_bits_source = auto_in_a_bits_source_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0] nodeIn_a_bits_address = auto_in_a_bits_address_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]  nodeIn_a_bits_mask = auto_in_a_bits_mask_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [63:0] nodeIn_a_bits_data = auto_in_a_bits_data_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_a_bits_corrupt = auto_in_a_bits_corrupt_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_ready = auto_in_d_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]  nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [63:0] nodeIn_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeOut_a_ready = auto_out_a_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]  nodeOut_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0] nodeOut_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]  nodeOut_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0] nodeOut_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_a_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_valid = auto_out_d_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_d_bits_opcode = auto_out_d_bits_opcode_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_d_bits_size = auto_out_d_bits_size_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]  nodeOut_d_bits_source = auto_out_d_bits_source_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_bits_denied = auto_out_d_bits_denied_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0] nodeOut_d_bits_data = auto_out_d_bits_data_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_bits_corrupt = auto_out_d_bits_corrupt_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        auto_in_a_ready_0 = nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeOut_a_valid = nodeIn_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_opcode = nodeIn_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_param = nodeIn_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_size = nodeIn_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_source = nodeIn_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_address = nodeIn_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_mask = nodeIn_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_data = nodeIn_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_corrupt = nodeIn_a_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_d_ready = nodeIn_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        auto_in_d_valid_0 = nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  auto_in_d_bits_opcode_0 = nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  auto_in_d_bits_size_0 = nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]  auto_in_d_bits_source_0 = nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        auto_in_d_bits_denied_0 = nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [63:0] auto_in_d_bits_data_0 = nodeIn_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        auto_in_d_bits_corrupt_0 = nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeIn_a_ready = nodeOut_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        auto_out_a_valid_0 = nodeOut_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  auto_out_a_bits_opcode_0 = nodeOut_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  auto_out_a_bits_param_0 = nodeOut_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  auto_out_a_bits_size_0 = nodeOut_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]  auto_out_a_bits_source_0 = nodeOut_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0] auto_out_a_bits_address_0 = nodeOut_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]  auto_out_a_bits_mask_0 = nodeOut_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0] auto_out_a_bits_data_0 = nodeOut_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        auto_out_a_bits_corrupt_0 = nodeOut_a_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        auto_out_d_ready_0 = nodeOut_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign nodeIn_d_valid = nodeOut_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_opcode = nodeOut_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_size = nodeOut_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_source = nodeOut_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_denied = nodeOut_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_data = nodeOut_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_corrupt = nodeOut_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        _a_first_T = nodeIn_a_ready & nodeIn_a_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [12:0] _a_first_beats1_decode_T_1 = 13'h3F << nodeIn_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/util/package.scala:235:71
  wire [2:0]  a_first_beats1_decode = ~(_a_first_beats1_decode_T_1[5:3]);	// src/main/scala/tilelink/Edges.scala:221:59, src/main/scala/util/package.scala:235:{46,71,76}
  wire        a_first_beats1_opdata = ~(nodeIn_a_bits_opcode[2]);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Edges.scala:93:{28,37}
  wire [2:0]  a_first_beats1 = a_first_beats1_opdata ? a_first_beats1_decode : 3'h0;	// src/main/scala/tilelink/Edges.scala:93:28, :221:59, :222:14
  reg  [2:0]  a_first_counter;	// src/main/scala/tilelink/Edges.scala:230:27
  wire [2:0]  a_first_counter1 = a_first_counter - 3'h1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
  wire        a_first = a_first_counter == 3'h0;	// src/main/scala/tilelink/Edges.scala:230:27, :232:25
  wire        a_first_last = a_first_counter == 3'h1 | a_first_beats1 == 3'h0;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27, :233:{25,33,43}
  wire        a_first_done = a_first_last & _a_first_T;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:233:33, :234:22
  wire [2:0]  a_first_count = a_first_beats1 & ~a_first_counter1;	// src/main/scala/tilelink/Edges.scala:222:14, :231:28, :235:{25,27}
  wire        _d_first_T = nodeOut_d_ready & nodeOut_d_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [12:0] _d_first_beats1_decode_T_1 = 13'h3F << nodeOut_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/util/package.scala:235:71
  wire [2:0]  d_first_beats1_decode = ~(_d_first_beats1_decode_T_1[5:3]);	// src/main/scala/tilelink/Edges.scala:221:59, src/main/scala/util/package.scala:235:{46,71,76}
  wire        d_first_beats1_opdata = nodeOut_d_bits_opcode[0];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:107:36
  wire [2:0]  d_first_beats1 = d_first_beats1_opdata ? d_first_beats1_decode : 3'h0;	// src/main/scala/tilelink/Edges.scala:107:36, :221:59, :222:14
  reg  [2:0]  d_first_counter;	// src/main/scala/tilelink/Edges.scala:230:27
  wire [2:0]  d_first_counter1 = d_first_counter - 3'h1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
  wire        d_first_first = d_first_counter == 3'h0;	// src/main/scala/tilelink/Edges.scala:230:27, :232:25
  wire        d_first_last = d_first_counter == 3'h1 | d_first_beats1 == 3'h0;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27, :233:{25,33,43}
  wire        d_first_done = d_first_last & _d_first_T;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:233:33, :234:22
  wire [2:0]  d_first_count = d_first_beats1 & ~d_first_counter1;	// src/main/scala/tilelink/Edges.scala:222:14, :231:28, :235:{25,27}
  wire        d_first = d_first_first & nodeOut_d_bits_opcode != 3'h6;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:232:25, src/main/scala/tilelink/FIFOFixer.scala:69:{42,63}
  reg         flight_0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_1;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_2;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_3;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_4;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_5;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_6;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_7;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_8;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_9;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  wire        _GEN = a_first & _a_first_T;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:232:25, src/main/scala/tilelink/FIFOFixer.scala:74:21
  wire        _GEN_0 = d_first & nodeIn_d_ready & nodeIn_d_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:69:42, :75:21
  reg  [9:0]  SourceIdFIFOed;	// src/main/scala/tilelink/FIFOFixer.scala:109:35
  wire [15:0] _SourceIdSet_T = 16'h1 << nodeIn_a_bits_source;	// src/main/scala/chisel3/util/OneHot.scala:58:35, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [9:0]  SourceIdSet = _GEN ? _SourceIdSet_T[9:0] : 10'h0;	// src/main/scala/chisel3/util/OneHot.scala:58:35, src/main/scala/tilelink/FIFOFixer.scala:74:21, :110:36, :113:50, :114:21
  wire [15:0] _SourceIdClear_T = 16'h1 << nodeIn_d_bits_source;	// src/main/scala/chisel3/util/OneHot.scala:58:35, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [9:0]  SourceIdClear = _GEN_0 ? _SourceIdClear_T[9:0] : 10'h0;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/chisel3/util/OneHot.scala:58:35, src/main/scala/tilelink/FIFOFixer.scala:75:21, :111:38, :116:36, :117:23
  wire        allIDs_FIFOed = &SourceIdFIFOed;	// src/main/scala/tilelink/FIFOFixer.scala:109:35, :121:41
  always @(posedge clock) begin
    if (reset) begin
      a_first_counter <= 3'h0;	// src/main/scala/tilelink/Edges.scala:230:27
      d_first_counter <= 3'h0;	// src/main/scala/tilelink/Edges.scala:230:27
      flight_0 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_1 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_2 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_3 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_4 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_5 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_6 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_7 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_8 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_9 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      SourceIdFIFOed <= 10'h0;	// src/main/scala/tilelink/FIFOFixer.scala:109:35
    end
    else begin
      if (_a_first_T) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
        if (a_first)	// src/main/scala/tilelink/Edges.scala:232:25
          a_first_counter <= a_first_beats1;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27
        else	// src/main/scala/tilelink/Edges.scala:232:25
          a_first_counter <= a_first_counter1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
      end
      if (_d_first_T) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
        if (d_first_first)	// src/main/scala/tilelink/Edges.scala:232:25
          d_first_counter <= d_first_beats1;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27
        else	// src/main/scala/tilelink/Edges.scala:232:25
          d_first_counter <= d_first_counter1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
      end
      flight_0 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 4'h0)
        & (_GEN & nodeIn_a_bits_source == 4'h0 | flight_0);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_1 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 4'h1)
        & (_GEN & nodeIn_a_bits_source == 4'h1 | flight_1);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Edges.scala:231:28, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_2 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 4'h2)
        & (_GEN & nodeIn_a_bits_source == 4'h2 | flight_2);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_3 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 4'h3)
        & (_GEN & nodeIn_a_bits_source == 4'h3 | flight_3);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_4 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 4'h4)
        & (_GEN & nodeIn_a_bits_source == 4'h4 | flight_4);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_5 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 4'h5)
        & (_GEN & nodeIn_a_bits_source == 4'h5 | flight_5);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_6 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 4'h6)
        & (_GEN & nodeIn_a_bits_source == 4'h6 | flight_6);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_7 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 4'h7)
        & (_GEN & nodeIn_a_bits_source == 4'h7 | flight_7);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_8 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 4'h8)
        & (_GEN & nodeIn_a_bits_source == 4'h8 | flight_8);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_9 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 4'h9)
        & (_GEN & nodeIn_a_bits_source == 4'h9 | flight_9);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      SourceIdFIFOed <= SourceIdFIFOed | SourceIdSet;	// src/main/scala/tilelink/FIFOFixer.scala:109:35, :110:36, :120:40
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:0];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        a_first_counter = _RANDOM[/*Zero width*/ 1'b0][2:0];	// src/main/scala/tilelink/Edges.scala:230:27
        d_first_counter = _RANDOM[/*Zero width*/ 1'b0][5:3];	// src/main/scala/tilelink/Edges.scala:230:27
        flight_0 = _RANDOM[/*Zero width*/ 1'b0][6];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_1 = _RANDOM[/*Zero width*/ 1'b0][7];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_2 = _RANDOM[/*Zero width*/ 1'b0][8];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_3 = _RANDOM[/*Zero width*/ 1'b0][9];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_4 = _RANDOM[/*Zero width*/ 1'b0][10];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_5 = _RANDOM[/*Zero width*/ 1'b0][11];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_6 = _RANDOM[/*Zero width*/ 1'b0][12];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_7 = _RANDOM[/*Zero width*/ 1'b0][13];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_8 = _RANDOM[/*Zero width*/ 1'b0][14];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_9 = _RANDOM[/*Zero width*/ 1'b0][15];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        SourceIdFIFOed = _RANDOM[/*Zero width*/ 1'b0][25:16];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:109:35
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  TLMonitor_34 monitor (	// src/main/scala/tilelink/Nodes.scala:24:25
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (nodeIn_a_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_valid        (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_opcode  (nodeIn_a_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_param   (nodeIn_a_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_size    (nodeIn_a_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_source  (nodeIn_a_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_address (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_mask    (nodeIn_a_bits_mask),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_data    (nodeIn_a_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_corrupt (nodeIn_a_bits_corrupt),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_ready        (nodeIn_d_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_valid        (nodeIn_d_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_size    (nodeIn_d_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_source  (nodeIn_d_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_denied  (nodeIn_d_bits_denied),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_data    (nodeIn_d_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_corrupt (nodeIn_d_bits_corrupt)	// src/main/scala/diplomacy/Nodes.scala:1214:17
  );	// src/main/scala/tilelink/Nodes.scala:24:25
  assign auto_in_a_ready = auto_in_a_ready_0;
  assign auto_in_d_valid = auto_in_d_valid_0;
  assign auto_in_d_bits_opcode = auto_in_d_bits_opcode_0;
  assign auto_in_d_bits_size = auto_in_d_bits_size_0;
  assign auto_in_d_bits_source = auto_in_d_bits_source_0;
  assign auto_in_d_bits_denied = auto_in_d_bits_denied_0;
  assign auto_in_d_bits_data = auto_in_d_bits_data_0;
  assign auto_in_d_bits_corrupt = auto_in_d_bits_corrupt_0;
  assign auto_out_a_valid = auto_out_a_valid_0;
  assign auto_out_a_bits_opcode = auto_out_a_bits_opcode_0;
  assign auto_out_a_bits_param = auto_out_a_bits_param_0;
  assign auto_out_a_bits_size = auto_out_a_bits_size_0;
  assign auto_out_a_bits_source = auto_out_a_bits_source_0;
  assign auto_out_a_bits_address = auto_out_a_bits_address_0;
  assign auto_out_a_bits_mask = auto_out_a_bits_mask_0;
  assign auto_out_a_bits_data = auto_out_a_bits_data_0;
  assign auto_out_a_bits_corrupt = auto_out_a_bits_corrupt_0;
  assign auto_out_d_ready = auto_out_d_ready_0;
endmodule

