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

module IntSyncCrossingSource_15(
  input  clock,
         reset,
         auto_in_0,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_in_1,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_in_2,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_in_3,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_in_4,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_in_5,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_in_6,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_in_7,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output auto_out_sync_0,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_out_sync_1,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_out_sync_2,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_out_sync_3,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_out_sync_4,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_out_sync_5,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_out_sync_6,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_out_sync_7	// src/main/scala/diplomacy/LazyModule.scala:374:18
);

  wire [7:0] _reg_io_q;	// src/main/scala/util/AsyncResetReg.scala:86:21
  wire       auto_in_0_0 = auto_in_0;
  wire       auto_in_1_0 = auto_in_1;
  wire       auto_in_2_0 = auto_in_2;
  wire       auto_in_3_0 = auto_in_3;
  wire       auto_in_4_0 = auto_in_4;
  wire       auto_in_5_0 = auto_in_5;
  wire       auto_in_6_0 = auto_in_6;
  wire       auto_in_7_0 = auto_in_7;
  wire       nodeIn_0 = auto_in_0_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire       nodeIn_1 = auto_in_1_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire       nodeIn_2 = auto_in_2_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire       nodeIn_3 = auto_in_3_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire       nodeIn_4 = auto_in_4_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire       nodeIn_5 = auto_in_5_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire       nodeIn_6 = auto_in_6_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire       nodeIn_7 = auto_in_7_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire       nodeOut_sync_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       nodeOut_sync_1;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       nodeOut_sync_2;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       nodeOut_sync_3;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       nodeOut_sync_4;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       nodeOut_sync_5;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       nodeOut_sync_6;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       nodeOut_sync_7;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       auto_out_sync_0_0 = nodeOut_sync_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       auto_out_sync_1_0 = nodeOut_sync_1;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       auto_out_sync_2_0 = nodeOut_sync_2;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       auto_out_sync_3_0 = nodeOut_sync_3;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       auto_out_sync_4_0 = nodeOut_sync_4;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       auto_out_sync_5_0 = nodeOut_sync_5;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       auto_out_sync_6_0 = nodeOut_sync_6;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire       auto_out_sync_7_0 = nodeOut_sync_7;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0] lo_lo = {nodeIn_1, nodeIn_0};	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/interrupts/Crossing.scala:44:38
  wire [1:0] lo_hi = {nodeIn_3, nodeIn_2};	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/interrupts/Crossing.scala:44:38
  wire [3:0] lo = {lo_hi, lo_lo};	// src/main/scala/interrupts/Crossing.scala:44:38
  wire [1:0] hi_lo = {nodeIn_5, nodeIn_4};	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/interrupts/Crossing.scala:44:38
  wire [1:0] hi_hi = {nodeIn_7, nodeIn_6};	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/interrupts/Crossing.scala:44:38
  wire [3:0] hi = {hi_hi, hi_lo};	// src/main/scala/interrupts/Crossing.scala:44:38
  assign nodeOut_sync_0 = _reg_io_q[0];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/interrupts/Crossing.scala:44:52, src/main/scala/util/AsyncResetReg.scala:86:21
  assign nodeOut_sync_1 = _reg_io_q[1];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/interrupts/Crossing.scala:44:52, src/main/scala/util/AsyncResetReg.scala:86:21
  assign nodeOut_sync_2 = _reg_io_q[2];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/interrupts/Crossing.scala:44:52, src/main/scala/util/AsyncResetReg.scala:86:21
  assign nodeOut_sync_3 = _reg_io_q[3];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/interrupts/Crossing.scala:44:52, src/main/scala/util/AsyncResetReg.scala:86:21
  assign nodeOut_sync_4 = _reg_io_q[4];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/interrupts/Crossing.scala:44:52, src/main/scala/util/AsyncResetReg.scala:86:21
  assign nodeOut_sync_5 = _reg_io_q[5];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/interrupts/Crossing.scala:44:52, src/main/scala/util/AsyncResetReg.scala:86:21
  assign nodeOut_sync_6 = _reg_io_q[6];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/interrupts/Crossing.scala:44:52, src/main/scala/util/AsyncResetReg.scala:86:21
  assign nodeOut_sync_7 = _reg_io_q[7];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/interrupts/Crossing.scala:44:52, src/main/scala/util/AsyncResetReg.scala:86:21
  AsyncResetRegVec_w8_i0 reg_0 (	// src/main/scala/util/AsyncResetReg.scala:86:21
    .clock (clock),
    .reset (reset),
    .io_d  ({hi, lo}),	// src/main/scala/interrupts/Crossing.scala:44:38
    .io_q  (_reg_io_q)
  );	// src/main/scala/util/AsyncResetReg.scala:86:21
  assign auto_out_sync_0 = auto_out_sync_0_0;
  assign auto_out_sync_1 = auto_out_sync_1_0;
  assign auto_out_sync_2 = auto_out_sync_2_0;
  assign auto_out_sync_3 = auto_out_sync_3_0;
  assign auto_out_sync_4 = auto_out_sync_4_0;
  assign auto_out_sync_5 = auto_out_sync_5_0;
  assign auto_out_sync_6 = auto_out_sync_6_0;
  assign auto_out_sync_7 = auto_out_sync_7_0;
endmodule

