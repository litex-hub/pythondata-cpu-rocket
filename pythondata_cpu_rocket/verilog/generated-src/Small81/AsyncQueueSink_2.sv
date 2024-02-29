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

module AsyncQueueSink_2(
  input        clock,
               reset,
  output       io_deq_valid,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_resumereq,	// src/main/scala/util/AsyncQueue.scala:135:14
  output [9:0] io_deq_bits_hartsel,	// src/main/scala/util/AsyncQueue.scala:135:14
  output       io_deq_bits_ackhavereset,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hasel,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hamask_0,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hamask_1,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hamask_2,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hamask_3,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hamask_4,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hamask_5,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hamask_6,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hamask_7,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hrmask_0,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hrmask_1,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hrmask_2,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hrmask_3,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hrmask_4,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hrmask_5,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hrmask_6,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_deq_bits_hrmask_7,	// src/main/scala/util/AsyncQueue.scala:135:14
  input        io_async_mem_0_resumereq,	// src/main/scala/util/AsyncQueue.scala:135:14
  input  [9:0] io_async_mem_0_hartsel,	// src/main/scala/util/AsyncQueue.scala:135:14
  input        io_async_mem_0_ackhavereset,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hasel,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hamask_0,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hamask_1,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hamask_2,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hamask_3,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hamask_4,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hamask_5,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hamask_6,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hamask_7,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hrmask_0,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hrmask_1,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hrmask_2,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hrmask_3,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hrmask_4,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hrmask_5,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hrmask_6,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_mem_0_hrmask_7,	// src/main/scala/util/AsyncQueue.scala:135:14
  output       io_async_ridx,	// src/main/scala/util/AsyncQueue.scala:135:14
  input        io_async_widx,	// src/main/scala/util/AsyncQueue.scala:135:14
  output       io_async_safe_ridx_valid,	// src/main/scala/util/AsyncQueue.scala:135:14
  input        io_async_safe_widx_valid,	// src/main/scala/util/AsyncQueue.scala:135:14
               io_async_safe_source_reset_n,	// src/main/scala/util/AsyncQueue.scala:135:14
  output       io_async_safe_sink_reset_n	// src/main/scala/util/AsyncQueue.scala:135:14
);

  wire        io_async_safe_ridx_valid_0;
  wire        ridx_incremented;	// src/main/scala/util/AsyncQueue.scala:51:27
  wire        _source_extend_io_out;	// src/main/scala/util/AsyncQueue.scala:171:31
  wire        _sink_valid_0_io_out;	// src/main/scala/util/AsyncQueue.scala:168:33
  wire [28:0] _io_deq_bits_deq_bits_reg_io_q;	// src/main/scala/util/SynchronizerReg.scala:207:25
  wire        io_async_mem_0_resumereq_0 = io_async_mem_0_resumereq;
  wire [9:0]  io_async_mem_0_hartsel_0 = io_async_mem_0_hartsel;
  wire        io_async_mem_0_ackhavereset_0 = io_async_mem_0_ackhavereset;
  wire        io_async_mem_0_hasel_0 = io_async_mem_0_hasel;
  wire        io_async_mem_0_hamask_0_0 = io_async_mem_0_hamask_0;
  wire        io_async_mem_0_hamask_1_0 = io_async_mem_0_hamask_1;
  wire        io_async_mem_0_hamask_2_0 = io_async_mem_0_hamask_2;
  wire        io_async_mem_0_hamask_3_0 = io_async_mem_0_hamask_3;
  wire        io_async_mem_0_hamask_4_0 = io_async_mem_0_hamask_4;
  wire        io_async_mem_0_hamask_5_0 = io_async_mem_0_hamask_5;
  wire        io_async_mem_0_hamask_6_0 = io_async_mem_0_hamask_6;
  wire        io_async_mem_0_hamask_7_0 = io_async_mem_0_hamask_7;
  wire        io_async_mem_0_hrmask_0_0 = io_async_mem_0_hrmask_0;
  wire        io_async_mem_0_hrmask_1_0 = io_async_mem_0_hrmask_1;
  wire        io_async_mem_0_hrmask_2_0 = io_async_mem_0_hrmask_2;
  wire        io_async_mem_0_hrmask_3_0 = io_async_mem_0_hrmask_3;
  wire        io_async_mem_0_hrmask_4_0 = io_async_mem_0_hrmask_4;
  wire        io_async_mem_0_hrmask_5_0 = io_async_mem_0_hrmask_5;
  wire        io_async_mem_0_hrmask_6_0 = io_async_mem_0_hrmask_6;
  wire        io_async_mem_0_hrmask_7_0 = io_async_mem_0_hrmask_7;
  wire        io_async_widx_0 = io_async_widx;
  wire        io_async_safe_widx_valid_0 = io_async_safe_widx_valid;
  wire        io_async_safe_source_reset_n_0 = io_async_safe_source_reset_n;
  wire        io_deq_ready = 1'h1;
  wire        ridx = ridx_incremented;	// src/main/scala/util/AsyncQueue.scala:51:27, :54:17
  reg         ridx_ridx_bin;	// src/main/scala/util/AsyncQueue.scala:52:25
  wire        io_deq_valid_0;
  wire        source_ready;	// src/main/scala/util/AsyncQueue.scala:143:30
  assign ridx_incremented = source_ready & ridx_ridx_bin + io_deq_valid_0;	// src/main/scala/util/AsyncQueue.scala:51:27, :52:25, :53:{23,43}, :143:30
  wire        widx;	// src/main/scala/util/ShiftReg.scala:48:24
  wire        valid = source_ready & ridx != widx;	// src/main/scala/util/AsyncQueue.scala:54:17, :143:30, :146:{28,36}, src/main/scala/util/ShiftReg.scala:48:24
  wire [1:0]  io_deq_bits_deq_bits_reg_io_d_lo_lo_lo =
    {io_async_mem_0_hrmask_1_0, io_async_mem_0_hrmask_0_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [1:0]  io_deq_bits_deq_bits_reg_io_d_lo_lo_hi_hi =
    {io_async_mem_0_hrmask_4_0, io_async_mem_0_hrmask_3_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [2:0]  io_deq_bits_deq_bits_reg_io_d_lo_lo_hi =
    {io_deq_bits_deq_bits_reg_io_d_lo_lo_hi_hi, io_async_mem_0_hrmask_2_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [4:0]  io_deq_bits_deq_bits_reg_io_d_lo_lo =
    {io_deq_bits_deq_bits_reg_io_d_lo_lo_hi, io_deq_bits_deq_bits_reg_io_d_lo_lo_lo};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [1:0]  io_deq_bits_deq_bits_reg_io_d_lo_hi_lo =
    {io_async_mem_0_hrmask_6_0, io_async_mem_0_hrmask_5_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [1:0]  io_deq_bits_deq_bits_reg_io_d_lo_hi_hi_hi =
    {io_async_mem_0_hamask_1_0, io_async_mem_0_hamask_0_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [2:0]  io_deq_bits_deq_bits_reg_io_d_lo_hi_hi =
    {io_deq_bits_deq_bits_reg_io_d_lo_hi_hi_hi, io_async_mem_0_hrmask_7_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [4:0]  io_deq_bits_deq_bits_reg_io_d_lo_hi =
    {io_deq_bits_deq_bits_reg_io_d_lo_hi_hi, io_deq_bits_deq_bits_reg_io_d_lo_hi_lo};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [9:0]  io_deq_bits_deq_bits_reg_io_d_lo =
    {io_deq_bits_deq_bits_reg_io_d_lo_hi, io_deq_bits_deq_bits_reg_io_d_lo_lo};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [1:0]  io_deq_bits_deq_bits_reg_io_d_hi_lo_lo =
    {io_async_mem_0_hamask_3_0, io_async_mem_0_hamask_2_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [1:0]  io_deq_bits_deq_bits_reg_io_d_hi_lo_hi_hi =
    {io_async_mem_0_hamask_6_0, io_async_mem_0_hamask_5_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [2:0]  io_deq_bits_deq_bits_reg_io_d_hi_lo_hi =
    {io_deq_bits_deq_bits_reg_io_d_hi_lo_hi_hi, io_async_mem_0_hamask_4_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [4:0]  io_deq_bits_deq_bits_reg_io_d_hi_lo =
    {io_deq_bits_deq_bits_reg_io_d_hi_lo_hi, io_deq_bits_deq_bits_reg_io_d_hi_lo_lo};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [1:0]  io_deq_bits_deq_bits_reg_io_d_hi_hi_lo =
    {io_async_mem_0_hasel_0, io_async_mem_0_hamask_7_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [10:0] io_deq_bits_deq_bits_reg_io_d_hi_hi_hi_hi =
    {io_async_mem_0_resumereq_0, io_async_mem_0_hartsel_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [11:0] io_deq_bits_deq_bits_reg_io_d_hi_hi_hi =
    {io_deq_bits_deq_bits_reg_io_d_hi_hi_hi_hi, io_async_mem_0_ackhavereset_0};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [13:0] io_deq_bits_deq_bits_reg_io_d_hi_hi =
    {io_deq_bits_deq_bits_reg_io_d_hi_hi_hi, io_deq_bits_deq_bits_reg_io_d_hi_hi_lo};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire [18:0] io_deq_bits_deq_bits_reg_io_d_hi =
    {io_deq_bits_deq_bits_reg_io_d_hi_hi, io_deq_bits_deq_bits_reg_io_d_hi_lo};	// src/main/scala/util/SynchronizerReg.scala:209:24
  wire        io_deq_bits_hrmask_0_0 = _io_deq_bits_deq_bits_reg_io_q[0];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hrmask_1_0 = _io_deq_bits_deq_bits_reg_io_q[1];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hrmask_2_0 = _io_deq_bits_deq_bits_reg_io_q[2];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hrmask_3_0 = _io_deq_bits_deq_bits_reg_io_q[3];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hrmask_4_0 = _io_deq_bits_deq_bits_reg_io_q[4];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hrmask_5_0 = _io_deq_bits_deq_bits_reg_io_q[5];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hrmask_6_0 = _io_deq_bits_deq_bits_reg_io_q[6];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hrmask_7_0 = _io_deq_bits_deq_bits_reg_io_q[7];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hamask_0_0 = _io_deq_bits_deq_bits_reg_io_q[8];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hamask_1_0 = _io_deq_bits_deq_bits_reg_io_q[9];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hamask_2_0 = _io_deq_bits_deq_bits_reg_io_q[10];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hamask_3_0 = _io_deq_bits_deq_bits_reg_io_q[11];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hamask_4_0 = _io_deq_bits_deq_bits_reg_io_q[12];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hamask_5_0 = _io_deq_bits_deq_bits_reg_io_q[13];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hamask_6_0 = _io_deq_bits_deq_bits_reg_io_q[14];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hamask_7_0 = _io_deq_bits_deq_bits_reg_io_q[15];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_hasel_0 = _io_deq_bits_deq_bits_reg_io_q[16];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_ackhavereset_0 = _io_deq_bits_deq_bits_reg_io_q[17];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire [9:0]  io_deq_bits_hartsel_0 = _io_deq_bits_deq_bits_reg_io_q[27:18];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  wire        io_deq_bits_resumereq_0 = _io_deq_bits_deq_bits_reg_io_q[28];	// src/main/scala/util/SynchronizerReg.scala:207:25, :211:26
  reg         valid_reg;	// src/main/scala/util/AsyncQueue.scala:161:56
  assign io_deq_valid_0 = valid_reg & source_ready;	// src/main/scala/util/AsyncQueue.scala:143:30, :161:56, :162:29
  reg         ridx_gray;	// src/main/scala/util/AsyncQueue.scala:164:55
  wire        io_async_ridx_0 = ridx_gray;	// src/main/scala/util/AsyncQueue.scala:164:55
  wire        io_async_safe_sink_reset_n_0 = ~reset;	// src/main/scala/util/AsyncQueue.scala:189:25
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ridx_ridx_bin <= 1'h0;	// src/main/scala/util/AsyncQueue.scala:52:25
      valid_reg <= 1'h0;	// src/main/scala/util/AsyncQueue.scala:161:56
      ridx_gray <= 1'h0;	// src/main/scala/util/AsyncQueue.scala:164:55
    end
    else begin
      ridx_ridx_bin <= ridx_incremented;	// src/main/scala/util/AsyncQueue.scala:51:27, :52:25
      valid_reg <= valid;	// src/main/scala/util/AsyncQueue.scala:146:28, :161:56
      ridx_gray <= ridx;	// src/main/scala/util/AsyncQueue.scala:54:17, :164:55
    end
  end // always @(posedge, posedge)
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
        ridx_ridx_bin = _RANDOM[/*Zero width*/ 1'b0][0];	// src/main/scala/util/AsyncQueue.scala:52:25
        valid_reg = _RANDOM[/*Zero width*/ 1'b0][1];	// src/main/scala/util/AsyncQueue.scala:52:25, :161:56
        ridx_gray = _RANDOM[/*Zero width*/ 1'b0][2];	// src/main/scala/util/AsyncQueue.scala:52:25, :164:55
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        ridx_ridx_bin = 1'h0;	// src/main/scala/util/AsyncQueue.scala:52:25
        valid_reg = 1'h0;	// src/main/scala/util/AsyncQueue.scala:161:56
        ridx_gray = 1'h0;	// src/main/scala/util/AsyncQueue.scala:164:55
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  AsyncResetSynchronizerShiftReg_w1_d3_i0 widx_widx_gray (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (clock),
    .reset (reset),
    .io_d  (io_async_widx_0),
    .io_q  (widx)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  ClockCrossingReg_w29 io_deq_bits_deq_bits_reg (	// src/main/scala/util/SynchronizerReg.scala:207:25
    .clock (clock),
    .io_d  ({io_deq_bits_deq_bits_reg_io_d_hi, io_deq_bits_deq_bits_reg_io_d_lo}),	// src/main/scala/util/SynchronizerReg.scala:209:24
    .io_q  (_io_deq_bits_deq_bits_reg_io_q),
    .io_en (valid)	// src/main/scala/util/AsyncQueue.scala:146:28
  );	// src/main/scala/util/SynchronizerReg.scala:207:25
  AsyncValidSync sink_valid_0 (	// src/main/scala/util/AsyncQueue.scala:168:33
    .io_in  (1'h1),
    .io_out (_sink_valid_0_io_out),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_source_reset_n_0)	// src/main/scala/util/AsyncQueue.scala:173:{42,45}
  );	// src/main/scala/util/AsyncQueue.scala:168:33
  AsyncValidSync sink_valid_1 (	// src/main/scala/util/AsyncQueue.scala:169:33
    .io_in  (_sink_valid_0_io_out),	// src/main/scala/util/AsyncQueue.scala:168:33
    .io_out (io_async_safe_ridx_valid_0),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_source_reset_n_0)	// src/main/scala/util/AsyncQueue.scala:173:45, :174:42
  );	// src/main/scala/util/AsyncQueue.scala:169:33
  AsyncValidSync source_extend (	// src/main/scala/util/AsyncQueue.scala:171:31
    .io_in  (io_async_safe_widx_valid_0),
    .io_out (_source_extend_io_out),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_source_reset_n_0)	// src/main/scala/util/AsyncQueue.scala:173:45, :175:42
  );	// src/main/scala/util/AsyncQueue.scala:171:31
  AsyncValidSync source_valid (	// src/main/scala/util/AsyncQueue.scala:172:31
    .io_in  (_source_extend_io_out),	// src/main/scala/util/AsyncQueue.scala:171:31
    .io_out (source_ready),
    .clock  (clock),
    .reset  (reset)
  );	// src/main/scala/util/AsyncQueue.scala:172:31
  assign io_deq_valid = io_deq_valid_0;
  assign io_deq_bits_resumereq = io_deq_bits_resumereq_0;
  assign io_deq_bits_hartsel = io_deq_bits_hartsel_0;
  assign io_deq_bits_ackhavereset = io_deq_bits_ackhavereset_0;
  assign io_deq_bits_hasel = io_deq_bits_hasel_0;
  assign io_deq_bits_hamask_0 = io_deq_bits_hamask_0_0;
  assign io_deq_bits_hamask_1 = io_deq_bits_hamask_1_0;
  assign io_deq_bits_hamask_2 = io_deq_bits_hamask_2_0;
  assign io_deq_bits_hamask_3 = io_deq_bits_hamask_3_0;
  assign io_deq_bits_hamask_4 = io_deq_bits_hamask_4_0;
  assign io_deq_bits_hamask_5 = io_deq_bits_hamask_5_0;
  assign io_deq_bits_hamask_6 = io_deq_bits_hamask_6_0;
  assign io_deq_bits_hamask_7 = io_deq_bits_hamask_7_0;
  assign io_deq_bits_hrmask_0 = io_deq_bits_hrmask_0_0;
  assign io_deq_bits_hrmask_1 = io_deq_bits_hrmask_1_0;
  assign io_deq_bits_hrmask_2 = io_deq_bits_hrmask_2_0;
  assign io_deq_bits_hrmask_3 = io_deq_bits_hrmask_3_0;
  assign io_deq_bits_hrmask_4 = io_deq_bits_hrmask_4_0;
  assign io_deq_bits_hrmask_5 = io_deq_bits_hrmask_5_0;
  assign io_deq_bits_hrmask_6 = io_deq_bits_hrmask_6_0;
  assign io_deq_bits_hrmask_7 = io_deq_bits_hrmask_7_0;
  assign io_async_ridx = io_async_ridx_0;
  assign io_async_safe_ridx_valid = io_async_safe_ridx_valid_0;
  assign io_async_safe_sink_reset_n = io_async_safe_sink_reset_n_0;
endmodule

