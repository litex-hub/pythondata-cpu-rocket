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

module SynchronizerShiftReg_w8_d3(
  input        clock,
  input  [7:0] io_d,	// src/main/scala/util/ShiftReg.scala:36:14
  output [7:0] io_q	// src/main/scala/util/ShiftReg.scala:36:14
);

  wire [7:0] io_d_0 = io_d;
  wire       output_0;	// src/main/scala/util/ShiftReg.scala:48:24
  wire       output_1;	// src/main/scala/util/ShiftReg.scala:48:24
  wire [1:0] io_q_lo_lo = {output_1, output_0};	// src/main/scala/util/ShiftReg.scala:48:24, src/main/scala/util/SynchronizerReg.scala:175:14
  wire       output_2;	// src/main/scala/util/ShiftReg.scala:48:24
  wire       output_3;	// src/main/scala/util/ShiftReg.scala:48:24
  wire [1:0] io_q_lo_hi = {output_3, output_2};	// src/main/scala/util/ShiftReg.scala:48:24, src/main/scala/util/SynchronizerReg.scala:175:14
  wire [3:0] io_q_lo = {io_q_lo_hi, io_q_lo_lo};	// src/main/scala/util/SynchronizerReg.scala:175:14
  wire       output_4;	// src/main/scala/util/ShiftReg.scala:48:24
  wire       output_5;	// src/main/scala/util/ShiftReg.scala:48:24
  wire [1:0] io_q_hi_lo = {output_5, output_4};	// src/main/scala/util/ShiftReg.scala:48:24, src/main/scala/util/SynchronizerReg.scala:175:14
  wire       output_6;	// src/main/scala/util/ShiftReg.scala:48:24
  wire       output_7;	// src/main/scala/util/ShiftReg.scala:48:24
  wire [1:0] io_q_hi_hi = {output_7, output_6};	// src/main/scala/util/ShiftReg.scala:48:24, src/main/scala/util/SynchronizerReg.scala:175:14
  wire [3:0] io_q_hi = {io_q_hi_hi, io_q_hi_lo};	// src/main/scala/util/SynchronizerReg.scala:175:14
  wire [7:0] io_q_0 = {io_q_hi, io_q_lo};	// src/main/scala/util/SynchronizerReg.scala:175:14
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (clock),
    .io_d  (io_d_0[0]),	// src/main/scala/util/SynchronizerReg.scala:173:39
    .io_q  (output_0)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_1 (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (clock),
    .io_d  (io_d_0[1]),	// src/main/scala/util/SynchronizerReg.scala:173:39
    .io_q  (output_1)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_2 (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (clock),
    .io_d  (io_d_0[2]),	// src/main/scala/util/SynchronizerReg.scala:173:39
    .io_q  (output_2)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_3 (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (clock),
    .io_d  (io_d_0[3]),	// src/main/scala/util/SynchronizerReg.scala:173:39
    .io_q  (output_3)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_4 (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (clock),
    .io_d  (io_d_0[4]),	// src/main/scala/util/SynchronizerReg.scala:173:39
    .io_q  (output_4)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_5 (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (clock),
    .io_d  (io_d_0[5]),	// src/main/scala/util/SynchronizerReg.scala:173:39
    .io_q  (output_5)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_6 (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (clock),
    .io_d  (io_d_0[6]),	// src/main/scala/util/SynchronizerReg.scala:173:39
    .io_q  (output_6)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_7 (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (clock),
    .io_d  (io_d_0[7]),	// src/main/scala/util/SynchronizerReg.scala:173:39
    .io_q  (output_7)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  assign io_q = io_q_0;
endmodule

