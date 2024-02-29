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

module DivSqrtRecFN_small_1(
  input         clock,
                reset,
  output        io_inReady,	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16
  input         io_inValid,	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16
                io_sqrtOp,	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16
  input  [64:0] io_a,	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16
                io_b,	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16
  input  [2:0]  io_roundingMode,	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16
  output        io_outValid_div,	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16
                io_outValid_sqrt,	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16
  output [64:0] io_out,	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16
  output [4:0]  io_exceptionFlags	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16
);

  wire [4:0]  io_exceptionFlags_0;
  wire [64:0] io_out_0;
  wire        io_outValid_sqrt_0;
  wire        io_outValid_div_0;
  wire        io_inReady_0;
  wire [2:0]  _divSqrtRecFNToRaw_io_roundingModeOut;	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
  wire        _divSqrtRecFNToRaw_io_invalidExc;	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
  wire        _divSqrtRecFNToRaw_io_infiniteExc;	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
  wire        _divSqrtRecFNToRaw_io_rawOut_isNaN;	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
  wire        _divSqrtRecFNToRaw_io_rawOut_isInf;	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
  wire        _divSqrtRecFNToRaw_io_rawOut_isZero;	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
  wire        _divSqrtRecFNToRaw_io_rawOut_sign;	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
  wire [12:0] _divSqrtRecFNToRaw_io_rawOut_sExp;	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
  wire [55:0] _divSqrtRecFNToRaw_io_rawOut_sig;	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
  wire        io_inValid_0 = io_inValid;
  wire        io_sqrtOp_0 = io_sqrtOp;
  wire [64:0] io_a_0 = io_a;
  wire [64:0] io_b_0 = io_b;
  wire [2:0]  io_roundingMode_0 = io_roundingMode;
  wire        io_detectTininess = 1'h1;	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16, :505:15
  DivSqrtRecFNToRaw_small_1 divSqrtRecFNToRaw (	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
    .clock               (clock),
    .reset               (reset),
    .io_inReady          (io_inReady_0),
    .io_inValid          (io_inValid_0),
    .io_sqrtOp           (io_sqrtOp_0),
    .io_a                (io_a_0),
    .io_b                (io_b_0),
    .io_roundingMode     (io_roundingMode_0),
    .io_rawOutValid_div  (io_outValid_div_0),
    .io_rawOutValid_sqrt (io_outValid_sqrt_0),
    .io_roundingModeOut  (_divSqrtRecFNToRaw_io_roundingModeOut),
    .io_invalidExc       (_divSqrtRecFNToRaw_io_invalidExc),
    .io_infiniteExc      (_divSqrtRecFNToRaw_io_infiniteExc),
    .io_rawOut_isNaN     (_divSqrtRecFNToRaw_io_rawOut_isNaN),
    .io_rawOut_isInf     (_divSqrtRecFNToRaw_io_rawOut_isInf),
    .io_rawOut_isZero    (_divSqrtRecFNToRaw_io_rawOut_isZero),
    .io_rawOut_sign      (_divSqrtRecFNToRaw_io_rawOut_sign),
    .io_rawOut_sExp      (_divSqrtRecFNToRaw_io_rawOut_sExp),
    .io_rawOut_sig       (_divSqrtRecFNToRaw_io_rawOut_sig)
  );	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
  RoundRawFNToRecFN_1 roundRawFNToRecFN (	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:505:15
    .io_invalidExc     (_divSqrtRecFNToRaw_io_invalidExc),	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
    .io_infiniteExc    (_divSqrtRecFNToRaw_io_infiniteExc),	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
    .io_in_isNaN       (_divSqrtRecFNToRaw_io_rawOut_isNaN),	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
    .io_in_isInf       (_divSqrtRecFNToRaw_io_rawOut_isInf),	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
    .io_in_isZero      (_divSqrtRecFNToRaw_io_rawOut_isZero),	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
    .io_in_sign        (_divSqrtRecFNToRaw_io_rawOut_sign),	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
    .io_in_sExp        (_divSqrtRecFNToRaw_io_rawOut_sExp),	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
    .io_in_sig         (_divSqrtRecFNToRaw_io_rawOut_sig),	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
    .io_roundingMode   (_divSqrtRecFNToRaw_io_roundingModeOut),	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:490:15
    .io_detectTininess (1'h1),	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:469:16, :505:15
    .io_out            (io_out_0),
    .io_exceptionFlags (io_exceptionFlags_0)
  );	// hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:505:15
  assign io_inReady = io_inReady_0;
  assign io_outValid_div = io_outValid_div_0;
  assign io_outValid_sqrt = io_outValid_sqrt_0;
  assign io_out = io_out_0;
  assign io_exceptionFlags = io_exceptionFlags_0;
endmodule

