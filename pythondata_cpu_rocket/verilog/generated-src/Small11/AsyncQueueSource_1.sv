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

module AsyncQueueSource_1(
  input        clock,
               reset,
  output       io_enq_ready,	// src/main/scala/util/AsyncQueue.scala:71:14
  input        io_enq_valid,	// src/main/scala/util/AsyncQueue.scala:71:14
               io_enq_bits_resumereq,	// src/main/scala/util/AsyncQueue.scala:71:14
  input  [9:0] io_enq_bits_hartsel,	// src/main/scala/util/AsyncQueue.scala:71:14
  input        io_enq_bits_ackhavereset,	// src/main/scala/util/AsyncQueue.scala:71:14
               io_enq_bits_hrmask_0,	// src/main/scala/util/AsyncQueue.scala:71:14
  output       io_async_mem_0_resumereq,	// src/main/scala/util/AsyncQueue.scala:71:14
  output [9:0] io_async_mem_0_hartsel,	// src/main/scala/util/AsyncQueue.scala:71:14
  output       io_async_mem_0_ackhavereset,	// src/main/scala/util/AsyncQueue.scala:71:14
               io_async_mem_0_hrmask_0,	// src/main/scala/util/AsyncQueue.scala:71:14
  input        io_async_ridx,	// src/main/scala/util/AsyncQueue.scala:71:14
  output       io_async_widx,	// src/main/scala/util/AsyncQueue.scala:71:14
  input        io_async_safe_ridx_valid,	// src/main/scala/util/AsyncQueue.scala:71:14
  output       io_async_safe_widx_valid,	// src/main/scala/util/AsyncQueue.scala:71:14
               io_async_safe_source_reset_n,	// src/main/scala/util/AsyncQueue.scala:71:14
  input        io_async_safe_sink_reset_n	// src/main/scala/util/AsyncQueue.scala:71:14
);

  wire       io_async_safe_widx_valid_0;
  wire       widx_incremented;	// src/main/scala/util/AsyncQueue.scala:51:27
  wire       _sink_extend_io_out;	// src/main/scala/util/AsyncQueue.scala:103:30
  wire       _source_valid_0_io_out;	// src/main/scala/util/AsyncQueue.scala:100:32
  wire       io_enq_valid_0 = io_enq_valid;
  wire       io_enq_bits_resumereq_0 = io_enq_bits_resumereq;
  wire [9:0] io_enq_bits_hartsel_0 = io_enq_bits_hartsel;
  wire       io_enq_bits_ackhavereset_0 = io_enq_bits_ackhavereset;
  wire       io_enq_bits_hrmask_0_0 = io_enq_bits_hrmask_0;
  wire       io_async_ridx_0 = io_async_ridx;
  wire       io_async_safe_ridx_valid_0 = io_async_safe_ridx_valid;
  wire       io_async_safe_sink_reset_n_0 = io_async_safe_sink_reset_n;
  wire       io_enq_bits_hasel = 1'h0;
  wire       io_enq_bits_hamask_0 = 1'h0;
  wire       io_async_mem_0_hasel = 1'h0;
  wire       io_async_mem_0_hamask_0 = 1'h0;
  reg        mem_0_resumereq;	// src/main/scala/util/AsyncQueue.scala:80:16
  wire       io_async_mem_0_resumereq_0 = mem_0_resumereq;	// src/main/scala/util/AsyncQueue.scala:80:16
  reg  [9:0] mem_0_hartsel;	// src/main/scala/util/AsyncQueue.scala:80:16
  wire [9:0] io_async_mem_0_hartsel_0 = mem_0_hartsel;	// src/main/scala/util/AsyncQueue.scala:80:16
  reg        mem_0_ackhavereset;	// src/main/scala/util/AsyncQueue.scala:80:16
  wire       io_async_mem_0_ackhavereset_0 = mem_0_ackhavereset;	// src/main/scala/util/AsyncQueue.scala:80:16
  reg        mem_0_hrmask_0;	// src/main/scala/util/AsyncQueue.scala:80:16
  wire       io_enq_ready_0;
  wire       io_async_mem_0_hrmask_0_0 = mem_0_hrmask_0;	// src/main/scala/util/AsyncQueue.scala:80:16
  wire       _widx_T_1 = io_enq_ready_0 & io_enq_valid_0;	// src/main/scala/chisel3/util/Decoupled.scala:52:35
  wire       widx = widx_incremented;	// src/main/scala/util/AsyncQueue.scala:51:27, :54:17
  reg        widx_widx_bin;	// src/main/scala/util/AsyncQueue.scala:52:25
  wire       sink_ready;	// src/main/scala/util/AsyncQueue.scala:79:28
  assign widx_incremented = sink_ready & widx_widx_bin + _widx_T_1;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/util/AsyncQueue.scala:51:27, :52:25, :53:{23,43}, :79:28
  wire       ridx;	// src/main/scala/util/ShiftReg.scala:48:24
  wire       ready = sink_ready & widx != ~ridx;	// src/main/scala/util/AsyncQueue.scala:54:17, :79:28, :83:{26,34,44}, src/main/scala/util/ShiftReg.scala:48:24
  reg        ready_reg;	// src/main/scala/util/AsyncQueue.scala:88:56
  assign io_enq_ready_0 = ready_reg & sink_ready;	// src/main/scala/util/AsyncQueue.scala:79:28, :88:56, :89:29
  reg        widx_gray;	// src/main/scala/util/AsyncQueue.scala:91:55
  wire       io_async_widx_0 = widx_gray;	// src/main/scala/util/AsyncQueue.scala:91:55
  wire       io_async_safe_source_reset_n_0 = ~reset;	// src/main/scala/util/AsyncQueue.scala:121:27
  always @(posedge clock) begin
    if (_widx_T_1) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
      mem_0_resumereq <= io_enq_bits_resumereq_0;	// src/main/scala/util/AsyncQueue.scala:80:16
      mem_0_hartsel <= io_enq_bits_hartsel_0;	// src/main/scala/util/AsyncQueue.scala:80:16
      mem_0_ackhavereset <= io_enq_bits_ackhavereset_0;	// src/main/scala/util/AsyncQueue.scala:80:16
      mem_0_hrmask_0 <= io_enq_bits_hrmask_0_0;	// src/main/scala/util/AsyncQueue.scala:80:16
    end
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      widx_widx_bin <= 1'h0;	// src/main/scala/util/AsyncQueue.scala:52:25
      ready_reg <= 1'h0;	// src/main/scala/util/AsyncQueue.scala:88:56
      widx_gray <= 1'h0;	// src/main/scala/util/AsyncQueue.scala:91:55
    end
    else begin
      widx_widx_bin <= widx_incremented;	// src/main/scala/util/AsyncQueue.scala:51:27, :52:25
      ready_reg <= ready;	// src/main/scala/util/AsyncQueue.scala:83:26, :88:56
      widx_gray <= widx;	// src/main/scala/util/AsyncQueue.scala:54:17, :91:55
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
        mem_0_resumereq = _RANDOM[/*Zero width*/ 1'b0][0];	// src/main/scala/util/AsyncQueue.scala:80:16
        mem_0_hartsel = _RANDOM[/*Zero width*/ 1'b0][10:1];	// src/main/scala/util/AsyncQueue.scala:80:16
        mem_0_ackhavereset = _RANDOM[/*Zero width*/ 1'b0][11];	// src/main/scala/util/AsyncQueue.scala:80:16
        mem_0_hrmask_0 = _RANDOM[/*Zero width*/ 1'b0][14];	// src/main/scala/util/AsyncQueue.scala:80:16
        widx_widx_bin = _RANDOM[/*Zero width*/ 1'b0][15];	// src/main/scala/util/AsyncQueue.scala:52:25, :80:16
        ready_reg = _RANDOM[/*Zero width*/ 1'b0][16];	// src/main/scala/util/AsyncQueue.scala:80:16, :88:56
        widx_gray = _RANDOM[/*Zero width*/ 1'b0][17];	// src/main/scala/util/AsyncQueue.scala:80:16, :91:55
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        widx_widx_bin = 1'h0;	// src/main/scala/util/AsyncQueue.scala:52:25
        ready_reg = 1'h0;	// src/main/scala/util/AsyncQueue.scala:88:56
        widx_gray = 1'h0;	// src/main/scala/util/AsyncQueue.scala:91:55
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  AsyncResetSynchronizerShiftReg_w1_d3_i0 ridx_ridx_gray (	// src/main/scala/util/ShiftReg.scala:45:23
    .clock (clock),
    .reset (reset),
    .io_d  (io_async_ridx_0),
    .io_q  (ridx)
  );	// src/main/scala/util/ShiftReg.scala:45:23
  AsyncValidSync source_valid_0 (	// src/main/scala/util/AsyncQueue.scala:100:32
    .io_in  (1'h1),
    .io_out (_source_valid_0_io_out),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_sink_reset_n_0)	// src/main/scala/util/AsyncQueue.scala:105:{43,46}
  );	// src/main/scala/util/AsyncQueue.scala:100:32
  AsyncValidSync source_valid_1 (	// src/main/scala/util/AsyncQueue.scala:101:32
    .io_in  (_source_valid_0_io_out),	// src/main/scala/util/AsyncQueue.scala:100:32
    .io_out (io_async_safe_widx_valid_0),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_sink_reset_n_0)	// src/main/scala/util/AsyncQueue.scala:105:46, :106:43
  );	// src/main/scala/util/AsyncQueue.scala:101:32
  AsyncValidSync sink_extend (	// src/main/scala/util/AsyncQueue.scala:103:30
    .io_in  (io_async_safe_ridx_valid_0),
    .io_out (_sink_extend_io_out),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_sink_reset_n_0)	// src/main/scala/util/AsyncQueue.scala:105:46, :107:43
  );	// src/main/scala/util/AsyncQueue.scala:103:30
  AsyncValidSync sink_valid (	// src/main/scala/util/AsyncQueue.scala:104:30
    .io_in  (_sink_extend_io_out),	// src/main/scala/util/AsyncQueue.scala:103:30
    .io_out (sink_ready),
    .clock  (clock),
    .reset  (reset)
  );	// src/main/scala/util/AsyncQueue.scala:104:30
  assign io_enq_ready = io_enq_ready_0;
  assign io_async_mem_0_resumereq = io_async_mem_0_resumereq_0;
  assign io_async_mem_0_hartsel = io_async_mem_0_hartsel_0;
  assign io_async_mem_0_ackhavereset = io_async_mem_0_ackhavereset_0;
  assign io_async_mem_0_hrmask_0 = io_async_mem_0_hrmask_0_0;
  assign io_async_widx = io_async_widx_0;
  assign io_async_safe_widx_valid = io_async_safe_widx_valid_0;
  assign io_async_safe_source_reset_n = io_async_safe_source_reset_n_0;
endmodule

