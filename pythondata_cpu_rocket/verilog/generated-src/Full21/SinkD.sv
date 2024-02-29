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

module SinkD(
  input         clock,
                reset,
  output        io_resp_valid,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
                io_resp_bits_last,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  output [2:0]  io_resp_bits_opcode,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
                io_resp_bits_param,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
                io_resp_bits_source,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
                io_resp_bits_sink,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  output        io_resp_bits_denied,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
                io_d_ready,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input         io_d_valid,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input  [2:0]  io_d_bits_opcode,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input  [1:0]  io_d_bits_param,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input  [2:0]  io_d_bits_size,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
                io_d_bits_source,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
                io_d_bits_sink,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input         io_d_bits_denied,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input  [63:0] io_d_bits_data,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input         io_d_bits_corrupt,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  output [2:0]  io_source,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input  [2:0]  io_way,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input  [9:0]  io_set,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input         io_bs_adr_ready,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  output        io_bs_adr_valid,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
                io_bs_adr_bits_noop,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  output [2:0]  io_bs_adr_bits_way,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  output [9:0]  io_bs_adr_bits_set,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  output [2:0]  io_bs_adr_bits_beat,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  output [63:0] io_bs_dat_data,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  output [9:0]  io_grant_req_set,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  output [2:0]  io_grant_req_way,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
  input         io_grant_safe	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:36:14
);

  wire [63:0] io_bs_dat_data_0;
  wire        io_d_ready_0;
  wire [2:0]  io_resp_bits_sink_0;
  wire        d_q_io_deq_ready;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:63:30
  wire        _d_q_io_deq_valid;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire [2:0]  _d_q_io_deq_bits_opcode;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire [1:0]  _d_q_io_deq_bits_param;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire [2:0]  _d_q_io_deq_bits_size;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire [2:0]  _d_q_io_deq_bits_source;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire        _d_q_io_deq_bits_denied;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire        _d_q_io_deq_bits_corrupt;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire        io_d_valid_0 = io_d_valid;
  wire [2:0]  io_d_bits_opcode_0 = io_d_bits_opcode;
  wire [1:0]  io_d_bits_param_0 = io_d_bits_param;
  wire [2:0]  io_d_bits_size_0 = io_d_bits_size;
  wire [2:0]  io_d_bits_source_0 = io_d_bits_source;
  wire [2:0]  io_d_bits_sink_0 = io_d_bits_sink;
  wire        io_d_bits_denied_0 = io_d_bits_denied;
  wire [63:0] io_d_bits_data_0 = io_d_bits_data;
  wire        io_d_bits_corrupt_0 = io_d_bits_corrupt;
  wire [2:0]  io_way_0 = io_way;
  wire [9:0]  io_set_0 = io_set;
  wire        io_bs_adr_ready_0 = io_bs_adr_ready;
  wire        io_grant_safe_0 = io_grant_safe;
  wire        io_bs_adr_bits_mask = 1'h1;
  wire        last;	// src/main/scala/tilelink/Edges.scala:233:33
  wire [2:0]  io_bs_adr_bits_way_0 = io_way_0;
  wire [2:0]  io_grant_req_way_0 = io_way_0;
  wire [9:0]  io_bs_adr_bits_set_0 = io_set_0;
  wire [9:0]  io_grant_req_set_0 = io_set_0;
  wire        _io_resp_valid_T_1 = d_q_io_deq_ready & _d_q_io_deq_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, :376:21, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:63:30
  wire [12:0] _beats1_decode_T_1 = 13'h3F << _d_q_io_deq_bits_size;	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/util/package.scala:235:71
  wire [2:0]  beats1_decode = ~(_beats1_decode_T_1[5:3]);	// src/main/scala/tilelink/Edges.scala:221:59, src/main/scala/util/package.scala:235:{46,71,76}
  wire        beats1_opdata = _d_q_io_deq_bits_opcode[0];	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/tilelink/Edges.scala:107:36
  wire        hasData = _d_q_io_deq_bits_opcode[0];	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/tilelink/Edges.scala:107:36
  wire [2:0]  beats1 = beats1_opdata ? beats1_decode : 3'h0;	// src/main/scala/tilelink/Edges.scala:107:36, :221:59, :222:14
  reg  [2:0]  counter;	// src/main/scala/tilelink/Edges.scala:230:27
  wire [2:0]  counter1 = counter - 3'h1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
  wire        first = counter == 3'h0;	// src/main/scala/tilelink/Edges.scala:230:27, :232:25
  assign last = counter == 3'h1 | beats1 == 3'h0;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27, :233:{25,33,43}
  wire        io_resp_bits_last_0 = last;	// src/main/scala/tilelink/Edges.scala:233:33
  wire        done = last & _io_resp_valid_T_1;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:233:33, :234:22
  wire [2:0]  beat = beats1 & ~counter1;	// src/main/scala/tilelink/Edges.scala:222:14, :231:28, :235:{25,27}
  reg  [2:0]  io_source_r;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:57:53
  wire [2:0]  io_source_0 = _d_q_io_deq_valid ? _d_q_io_deq_bits_source : io_source_r;	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:57:{19,53}
  wire        io_resp_valid_0 = (first | last) & _io_resp_valid_T_1;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:62:{27,36}, src/main/scala/tilelink/Edges.scala:232:25, :233:33
  assign d_q_io_deq_ready = io_bs_adr_ready_0 & (~first | io_grant_safe_0);	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:63:{30,34,41}, src/main/scala/tilelink/Edges.scala:232:25
  wire        io_bs_adr_valid_0 = ~first | _d_q_io_deq_valid & io_grant_safe_0;	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:63:34, :64:{29,41}, src/main/scala/tilelink/Edges.scala:232:25
  wire [2:0]  io_resp_bits_param_0 = {1'h0, _d_q_io_deq_bits_param};	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:70:23
  wire        io_bs_adr_bits_noop_0 = ~_d_q_io_deq_valid | ~hasData;	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:75:{26,35,38}, src/main/scala/tilelink/Edges.scala:107:36
  reg  [2:0]  io_bs_adr_bits_beat_r;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:78:54
  wire [2:0]  io_bs_adr_bits_beat_0 = _d_q_io_deq_valid ? beat : io_bs_adr_bits_beat_r;	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:78:{29,54}, src/main/scala/tilelink/Edges.scala:235:25
  `ifndef SYNTHESIS	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:82:10
    always @(posedge clock) begin	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:82:10
      if (~reset & _d_q_io_deq_valid & _d_q_io_deq_bits_corrupt
          & ~_d_q_io_deq_bits_denied) begin	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:82:{10,21,39,42}
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:82:10
          $error("Assertion failed: Data poisoning unsupported\n    at SinkD.scala:82 assert (!(d.valid && d.bits.corrupt && !d.bits.denied), \"Data poisoning unsupported\")\n");	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:82:10
        if (`STOP_COND_)	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:82:10
          $fatal;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:82:10
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin
    if (reset)
      counter <= 3'h0;	// src/main/scala/tilelink/Edges.scala:230:27
    else if (_io_resp_valid_T_1) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
      if (first)	// src/main/scala/tilelink/Edges.scala:232:25
        counter <= beats1;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27
      else	// src/main/scala/tilelink/Edges.scala:232:25
        counter <= counter1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
    end
    if (_d_q_io_deq_valid) begin	// src/main/scala/chisel3/util/Decoupled.scala:376:21
      io_source_r <= _d_q_io_deq_bits_source;	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:57:53
      io_bs_adr_bits_beat_r <= beat + {2'h0, io_bs_adr_ready_0};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:78:{54,60}, src/main/scala/tilelink/Edges.scala:235:25
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
        counter = _RANDOM[/*Zero width*/ 1'b0][2:0];	// src/main/scala/tilelink/Edges.scala:230:27
        io_source_r = _RANDOM[/*Zero width*/ 1'b0][5:3];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:57:53, src/main/scala/tilelink/Edges.scala:230:27
        io_bs_adr_bits_beat_r = _RANDOM[/*Zero width*/ 1'b0][8:6];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:78:54, src/main/scala/tilelink/Edges.scala:230:27
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  Queue_81 d_q (	// src/main/scala/chisel3/util/Decoupled.scala:376:21
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (io_d_ready_0),
    .io_enq_valid        (io_d_valid_0),
    .io_enq_bits_opcode  (io_d_bits_opcode_0),
    .io_enq_bits_param   (io_d_bits_param_0),
    .io_enq_bits_size    (io_d_bits_size_0),
    .io_enq_bits_source  (io_d_bits_source_0),
    .io_enq_bits_sink    (io_d_bits_sink_0),
    .io_enq_bits_denied  (io_d_bits_denied_0),
    .io_enq_bits_data    (io_d_bits_data_0),
    .io_enq_bits_corrupt (io_d_bits_corrupt_0),
    .io_deq_ready        (d_q_io_deq_ready),	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SinkD.scala:63:30
    .io_deq_valid        (_d_q_io_deq_valid),
    .io_deq_bits_opcode  (_d_q_io_deq_bits_opcode),
    .io_deq_bits_param   (_d_q_io_deq_bits_param),
    .io_deq_bits_size    (_d_q_io_deq_bits_size),
    .io_deq_bits_source  (_d_q_io_deq_bits_source),
    .io_deq_bits_sink    (io_resp_bits_sink_0),
    .io_deq_bits_denied  (_d_q_io_deq_bits_denied),
    .io_deq_bits_data    (io_bs_dat_data_0),
    .io_deq_bits_corrupt (_d_q_io_deq_bits_corrupt)
  );	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire [2:0]  io_resp_bits_opcode_0;
  assign io_resp_bits_opcode_0 = _d_q_io_deq_bits_opcode;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire [2:0]  io_resp_bits_source_0;
  assign io_resp_bits_source_0 = _d_q_io_deq_bits_source;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire        io_resp_bits_denied_0;
  assign io_resp_bits_denied_0 = _d_q_io_deq_bits_denied;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  assign io_resp_valid = io_resp_valid_0;
  assign io_resp_bits_last = io_resp_bits_last_0;
  assign io_resp_bits_opcode = io_resp_bits_opcode_0;
  assign io_resp_bits_param = io_resp_bits_param_0;
  assign io_resp_bits_source = io_resp_bits_source_0;
  assign io_resp_bits_sink = io_resp_bits_sink_0;
  assign io_resp_bits_denied = io_resp_bits_denied_0;
  assign io_d_ready = io_d_ready_0;
  assign io_source = io_source_0;
  assign io_bs_adr_valid = io_bs_adr_valid_0;
  assign io_bs_adr_bits_noop = io_bs_adr_bits_noop_0;
  assign io_bs_adr_bits_way = io_bs_adr_bits_way_0;
  assign io_bs_adr_bits_set = io_bs_adr_bits_set_0;
  assign io_bs_adr_bits_beat = io_bs_adr_bits_beat_0;
  assign io_bs_dat_data = io_bs_dat_data_0;
  assign io_grant_req_set = io_grant_req_set_0;
  assign io_grant_req_way = io_grant_req_way_0;
endmodule

