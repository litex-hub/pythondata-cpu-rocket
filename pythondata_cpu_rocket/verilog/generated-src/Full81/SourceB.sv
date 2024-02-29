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

module SourceB(
  input         clock,
                reset,
  output        io_req_ready,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
  input         io_req_valid,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
  input  [2:0]  io_req_bits_param,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
  input  [14:0] io_req_bits_tag,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
  input  [9:0]  io_req_bits_set,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
  input  [7:0]  io_req_bits_clients,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
  input         io_b_ready,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
  output        io_b_valid,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
  output [1:0]  io_b_bits_param,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
  output [5:0]  io_b_bits_source,	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
  output [31:0] io_b_bits_address	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:35:14
);

  wire        io_req_valid_0 = io_req_valid;
  wire [2:0]  io_req_bits_param_0 = io_req_bits_param;
  wire [14:0] io_req_bits_tag_0 = io_req_bits_tag;
  wire [9:0]  io_req_bits_set_0 = io_req_bits_set;
  wire [7:0]  io_req_bits_clients_0 = io_req_bits_clients;
  wire        io_b_ready_0 = io_b_ready;
  wire        io_b_bits_corrupt = 1'h0;
  wire        b_bits_corrupt = 1'h0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [2:0]  io_b_bits_opcode = 3'h6;
  wire [2:0]  io_b_bits_size = 3'h6;
  wire [2:0]  b_bits_opcode = 3'h6;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [2:0]  b_bits_size = 3'h6;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [7:0]  io_b_bits_mask = 8'hFF;
  wire [7:0]  b_bits_mask = 8'hFF;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [63:0] io_b_bits_data = 64'h0;
  wire [63:0] b_bits_data = 64'h0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [5:0]  b_bits_address_base_y_2 = 6'h0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:221:15
  wire        b_ready = io_b_ready_0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire        b_valid;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [1:0]  b_bits_param;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [5:0]  b_bits_source;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [31:0] b_bits_address;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  reg  [7:0]  remain;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:46:25
  wire        busy = |remain;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:46:25, :51:23
  wire [7:0]  todo = busy ? remain : io_req_bits_clients_0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:46:25, :51:23, :52:19
  wire [6:0]  _next_T_2 = todo[6:0] | {todo[5:0], 1'h0};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:52:19, src/main/scala/util/package.scala:245:{43,53}
  wire [6:0]  _next_T_5 = _next_T_2 | {_next_T_2[4:0], 2'h0};	// src/main/scala/util/package.scala:245:{43,53}
  wire [8:0]  next = {1'h0, {~(_next_T_5 | {_next_T_5[2:0], 4'h0}), 1'h1} & todo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:52:19, :53:{16,37}, src/main/scala/util/package.scala:245:{43,53}
  `ifndef SYNTHESIS	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:59:12
    always @(posedge clock) begin	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:59:12
      if (~reset & ~(~io_req_valid_0 | (|io_req_bits_clients_0))) begin	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:59:{12,13,27,50}
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:59:12
          $error("Assertion failed\n    at SourceB.scala:59 assert (!io.req.valid || io.req.bits.clients =/= 0.U)\n");	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:59:12
        if (`STOP_COND_)	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:59:12
          $fatal;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:59:12
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        io_req_ready_0 = ~busy;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:51:23, :61:21
  wire        _param_T_1 = io_req_ready_0 & io_req_valid_0;	// src/main/scala/chisel3/util/Decoupled.scala:52:35
  wire [7:0]  remain_set = _param_T_1 ? io_req_bits_clients_0 : 8'h0;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:47:30, :62:{24,37}
  wire        io_b_valid_0 = b_valid;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [1:0]  io_b_bits_param_0 = b_bits_param;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [5:0]  io_b_bits_source_0 = b_bits_source;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  wire [31:0] io_b_bits_address_0 = b_bits_address;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  assign b_valid = busy | io_req_valid_0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:51:23, :65:17, :68:21
  wire [7:0]  remain_clr = b_ready & b_valid ? next[7:0] : 8'h0;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:48:30, :53:37, :65:17, :69:{19,32}
  reg  [14:0] tag_r;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:72:52
  wire [14:0] tag = busy ? tag_r : io_req_bits_tag_0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:51:23, :72:{18,52}
  wire [14:0] b_bits_address_base_y = tag;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:221:15, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:72:18
  reg  [9:0]  set_r;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:73:52
  wire [9:0]  set = busy ? set_r : io_req_bits_set_0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:51:23, :73:{18,52}
  wire [9:0]  b_bits_address_base_y_1 = set;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:221:15, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:73:18
  reg  [2:0]  param_r;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:74:56
  wire [2:0]  param = busy ? param_r : io_req_bits_param_0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:51:23, :74:{20,56}
  assign b_bits_param = param[1:0];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17, :74:20, :77:20
  wire [5:0]  _b_bits_source_T_18 =
    (next[0] ? 6'h2C : 6'h0) | (next[1] ? 6'h28 : 6'h0) | (next[2] ? 6'h24 : 6'h0)
    | {next[3], 5'h0};	// src/main/scala/chisel3/util/Mux.scala:30:73, :32:36, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:53:37
  assign b_bits_source =
    {_b_bits_source_T_18[5],
     _b_bits_source_T_18[4:0] | (next[4] ? 5'h1C : 5'h0) | (next[5] ? 5'h18 : 5'h0)
       | (next[6] ? 5'h14 : 5'h0) | {next[7], 4'h0}};	// src/main/scala/chisel3/util/Mux.scala:30:73, :32:36, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:53:37, :65:17
  wire [24:0] b_bits_address_base_hi = {b_bits_address_base_y, b_bits_address_base_y_1};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:221:15, :227:19
  wire [30:0] b_bits_address_base = {b_bits_address_base_hi, 6'h0};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19
  wire [1:0]  b_bits_address_lo_lo_lo_lo = b_bits_address_base[1:0];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [1:0]  b_bits_address_lo_lo_lo_hi = b_bits_address_base[3:2];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [3:0]  b_bits_address_lo_lo_lo =
    {b_bits_address_lo_lo_lo_hi, b_bits_address_lo_lo_lo_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [1:0]  b_bits_address_lo_lo_hi_lo = b_bits_address_base[5:4];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [1:0]  b_bits_address_lo_lo_hi_hi = b_bits_address_base[7:6];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [3:0]  b_bits_address_lo_lo_hi =
    {b_bits_address_lo_lo_hi_hi, b_bits_address_lo_lo_hi_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [7:0]  b_bits_address_lo_lo = {b_bits_address_lo_lo_hi, b_bits_address_lo_lo_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [1:0]  b_bits_address_lo_hi_lo_lo = b_bits_address_base[9:8];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [1:0]  b_bits_address_lo_hi_lo_hi = b_bits_address_base[11:10];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [3:0]  b_bits_address_lo_hi_lo =
    {b_bits_address_lo_hi_lo_hi, b_bits_address_lo_hi_lo_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [1:0]  b_bits_address_lo_hi_hi_lo = b_bits_address_base[13:12];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [1:0]  b_bits_address_lo_hi_hi_hi = b_bits_address_base[15:14];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [3:0]  b_bits_address_lo_hi_hi =
    {b_bits_address_lo_hi_hi_hi, b_bits_address_lo_hi_hi_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [7:0]  b_bits_address_lo_hi = {b_bits_address_lo_hi_hi, b_bits_address_lo_hi_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [15:0] b_bits_address_lo = {b_bits_address_lo_hi, b_bits_address_lo_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [1:0]  b_bits_address_hi_lo_lo_lo = b_bits_address_base[17:16];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [1:0]  b_bits_address_hi_lo_lo_hi = b_bits_address_base[19:18];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [3:0]  b_bits_address_hi_lo_lo =
    {b_bits_address_hi_lo_lo_hi, b_bits_address_hi_lo_lo_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [1:0]  b_bits_address_hi_lo_hi_lo = b_bits_address_base[21:20];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [1:0]  b_bits_address_hi_lo_hi_hi = b_bits_address_base[23:22];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [3:0]  b_bits_address_hi_lo_hi =
    {b_bits_address_hi_lo_hi_hi, b_bits_address_hi_lo_hi_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [7:0]  b_bits_address_hi_lo = {b_bits_address_hi_lo_hi, b_bits_address_hi_lo_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [1:0]  b_bits_address_hi_hi_lo_lo = b_bits_address_base[25:24];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [1:0]  b_bits_address_hi_hi_lo_hi = b_bits_address_base[27:26];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [3:0]  b_bits_address_hi_hi_lo =
    {b_bits_address_hi_hi_lo_hi, b_bits_address_hi_hi_lo_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [1:0]  b_bits_address_hi_hi_hi_lo = b_bits_address_base[29:28];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :230:8
  wire [1:0]  b_bits_address_hi_hi_hi_hi = {1'h0, b_bits_address_base[30]};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:227:19, :229:72, :230:8
  wire [3:0]  b_bits_address_hi_hi_hi =
    {b_bits_address_hi_hi_hi_hi, b_bits_address_hi_hi_hi_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [7:0]  b_bits_address_hi_hi = {b_bits_address_hi_hi_hi, b_bits_address_hi_hi_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  wire [15:0] b_bits_address_hi = {b_bits_address_hi_hi, b_bits_address_hi_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8
  assign b_bits_address = {b_bits_address_hi, b_bits_address_lo};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/Parameters.scala:230:8, src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:65:17
  always @(posedge clock) begin
    if (reset)
      remain <= 8'h0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:46:25
    else
      remain <= (remain | remain_set) & ~remain_clr;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:46:25, :47:30, :48:30, :49:{23,37,39}
    if (_param_T_1) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
      tag_r <= io_req_bits_tag_0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:72:52
      set_r <= io_req_bits_set_0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:73:52
      param_r <= io_req_bits_param_0;	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:74:56
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:1];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          _RANDOM[i[0]] = `RANDOM;
        end
        remain = _RANDOM[1'h0][7:0];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:46:25
        tag_r = _RANDOM[1'h0][22:8];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:46:25, :72:52
        set_r = {_RANDOM[1'h0][31:23], _RANDOM[1'h1][0]};	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:46:25, :73:52
        param_r = _RANDOM[1'h1][3:1];	// src/main/scala/rocket-chip-inclusive-cache/design/craft/inclusivecache/src/SourceB.scala:73:52, :74:56
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_req_ready = io_req_ready_0;
  assign io_b_valid = io_b_valid_0;
  assign io_b_bits_param = io_b_bits_param_0;
  assign io_b_bits_source = io_b_bits_source_0;
  assign io_b_bits_address = io_b_bits_address_0;
endmodule

