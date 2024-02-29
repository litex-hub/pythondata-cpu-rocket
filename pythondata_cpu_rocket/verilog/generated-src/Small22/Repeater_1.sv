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

module Repeater_1(
  output        io_enq_ready,	// src/main/scala/util/Repeater.scala:12:14
  input         io_enq_valid,	// src/main/scala/util/Repeater.scala:12:14
  input  [1:0]  io_enq_bits_param,	// src/main/scala/util/Repeater.scala:12:14
  input  [4:0]  io_enq_bits_source,	// src/main/scala/util/Repeater.scala:12:14
  input  [31:0] io_enq_bits_address,	// src/main/scala/util/Repeater.scala:12:14
  input         io_deq_ready,	// src/main/scala/util/Repeater.scala:12:14
  output        io_deq_valid,	// src/main/scala/util/Repeater.scala:12:14
  output [1:0]  io_deq_bits_param,	// src/main/scala/util/Repeater.scala:12:14
  output [4:0]  io_deq_bits_source,	// src/main/scala/util/Repeater.scala:12:14
  output [31:0] io_deq_bits_address	// src/main/scala/util/Repeater.scala:12:14
);

  wire         io_enq_valid_0 = io_enq_valid;
  wire [1:0]   io_enq_bits_param_0 = io_enq_bits_param;
  wire [4:0]   io_enq_bits_source_0 = io_enq_bits_source;
  wire [31:0]  io_enq_bits_address_0 = io_enq_bits_address;
  wire         io_deq_ready_0 = io_deq_ready;
  wire [2:0]   io_enq_bits_opcode = 3'h6;	// src/main/scala/util/Repeater.scala:12:14
  wire [2:0]   io_enq_bits_size = 3'h6;	// src/main/scala/util/Repeater.scala:12:14
  wire [2:0]   io_deq_bits_opcode = 3'h6;	// src/main/scala/util/Repeater.scala:12:14
  wire [2:0]   io_deq_bits_size = 3'h6;	// src/main/scala/util/Repeater.scala:12:14
  wire [15:0]  io_enq_bits_mask = 16'hFFFF;	// src/main/scala/util/Repeater.scala:12:14
  wire [15:0]  io_deq_bits_mask = 16'hFFFF;	// src/main/scala/util/Repeater.scala:12:14
  wire [127:0] io_enq_bits_data = 128'h0;	// src/main/scala/util/Repeater.scala:12:14
  wire [127:0] io_deq_bits_data = 128'h0;	// src/main/scala/util/Repeater.scala:12:14
  wire         io_repeat = 1'h0;
  wire         io_full = 1'h0;
  wire         io_enq_bits_corrupt = 1'h0;
  wire         io_deq_bits_corrupt = 1'h0;
  wire         io_deq_valid_0 = io_enq_valid_0;
  wire [1:0]   io_deq_bits_param_0 = io_enq_bits_param_0;
  wire [4:0]   io_deq_bits_source_0 = io_enq_bits_source_0;
  wire [31:0]  io_deq_bits_address_0 = io_enq_bits_address_0;
  wire         io_enq_ready_0 = io_deq_ready_0;
  assign io_enq_ready = io_enq_ready_0;
  assign io_deq_valid = io_deq_valid_0;
  assign io_deq_bits_param = io_deq_bits_param_0;
  assign io_deq_bits_source = io_deq_bits_source_0;
  assign io_deq_bits_address = io_deq_bits_address_0;
endmodule

