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

module TLError_1(
  input          clock,
                 reset,
  output         auto_in_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]   auto_in_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [127:0] auto_in_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [31:0]  auto_in_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_in_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]   auto_in_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]   auto_in_d_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_in_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_d_bits_corrupt	// src/main/scala/diplomacy/LazyModule.scala:374:18
);

  wire            auto_in_a_valid_0 = auto_in_a_valid;
  wire [2:0]      auto_in_a_bits_opcode_0 = auto_in_a_bits_opcode;
  wire [127:0]    auto_in_a_bits_address_0 = auto_in_a_bits_address;
  wire [31:0]     auto_in_a_bits_data_0 = auto_in_a_bits_data;
  wire            auto_in_d_ready_0 = auto_in_d_ready;
  wire            da_bits_denied = 1'h1;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire            a_last = 1'h1;	// src/main/scala/tilelink/Edges.scala:233:33
  wire            da_last = 1'h1;	// src/main/scala/tilelink/Edges.scala:233:33
  wire            c_last_counter1 = 1'h1;	// src/main/scala/tilelink/Edges.scala:231:28
  wire            c_last_first = 1'h1;	// src/main/scala/tilelink/Edges.scala:232:25
  wire            c_last = 1'h1;	// src/main/scala/tilelink/Edges.scala:233:33
  wire            dc_last_counter1 = 1'h1;	// src/main/scala/tilelink/Edges.scala:231:28
  wire            dc_last_first = 1'h1;	// src/main/scala/tilelink/Edges.scala:232:25
  wire            dc_last = 1'h1;	// src/main/scala/tilelink/Edges.scala:233:33
  wire            readys_0 = 1'h1;	// src/main/scala/tilelink/Arbiter.scala:68:27
  wire            readys_1 = 1'h1;	// src/main/scala/tilelink/Arbiter.scala:68:27
  wire            auto_in_a_bits_source = 1'h0;
  wire            auto_in_a_bits_corrupt = 1'h0;
  wire            auto_in_d_bits_source = 1'h0;
  wire            auto_in_d_bits_sink = 1'h0;
  wire            nodeIn_a_bits_source = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_a_bits_corrupt = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_d_bits_source = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_d_bits_sink = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            da_bits_source = 1'h0;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire            da_bits_sink = 1'h0;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire            a_last_beats1_decode = 1'h0;	// src/main/scala/tilelink/Edges.scala:221:59
  wire            a_last_beats1 = 1'h0;	// src/main/scala/tilelink/Edges.scala:222:14
  wire            a_last_count = 1'h0;	// src/main/scala/tilelink/Edges.scala:235:25
  wire            beats1_decode = 1'h0;	// src/main/scala/tilelink/Edges.scala:221:59
  wire            beats1 = 1'h0;	// src/main/scala/tilelink/Edges.scala:222:14
  wire            count = 1'h0;	// src/main/scala/tilelink/Edges.scala:235:25
  wire            c_valid = 1'h0;	// src/main/scala/tilelink/Bundles.scala:260:61
  wire            c_bits_source = 1'h0;	// src/main/scala/tilelink/Bundles.scala:260:61
  wire            c_bits_corrupt = 1'h0;	// src/main/scala/tilelink/Bundles.scala:260:61
  wire            dc_valid = 1'h0;	// src/main/scala/devices/tilelink/Error.scala:46:20
  wire            dc_bits_source = 1'h0;	// src/main/scala/devices/tilelink/Error.scala:46:20
  wire            dc_bits_sink = 1'h0;	// src/main/scala/devices/tilelink/Error.scala:46:20
  wire            dc_bits_denied = 1'h0;	// src/main/scala/devices/tilelink/Error.scala:46:20
  wire            dc_bits_corrupt = 1'h0;	// src/main/scala/devices/tilelink/Error.scala:46:20
  wire            c_last_beats1_decode = 1'h0;	// src/main/scala/tilelink/Edges.scala:221:59
  wire            c_last_beats1_opdata = 1'h0;	// src/main/scala/tilelink/Edges.scala:103:36
  wire            c_last_beats1 = 1'h0;	// src/main/scala/tilelink/Edges.scala:222:14
  wire            c_last_done = 1'h0;	// src/main/scala/tilelink/Edges.scala:234:22
  wire            c_last_count = 1'h0;	// src/main/scala/tilelink/Edges.scala:235:25
  wire            dc_last_beats1_decode = 1'h0;	// src/main/scala/tilelink/Edges.scala:221:59
  wire            dc_last_beats1_opdata = 1'h0;	// src/main/scala/tilelink/Edges.scala:107:36
  wire            dc_last_beats1 = 1'h0;	// src/main/scala/tilelink/Edges.scala:222:14
  wire            dc_last_done = 1'h0;	// src/main/scala/tilelink/Edges.scala:234:22
  wire            dc_last_count = 1'h0;	// src/main/scala/tilelink/Edges.scala:235:25
  wire            decode = 1'h0;	// src/main/scala/tilelink/Edges.scala:221:59
  wire            opdata = 1'h0;	// src/main/scala/tilelink/Edges.scala:107:36
  wire            decode_1 = 1'h0;	// src/main/scala/tilelink/Edges.scala:221:59
  wire            winner_0 = 1'h0;	// src/main/scala/tilelink/Arbiter.scala:71:27
  wire            prefixOR_1 = 1'h0;	// src/main/scala/tilelink/Arbiter.scala:76:48
  wire            maskedBeats_0 = 1'h0;	// src/main/scala/tilelink/Arbiter.scala:82:69
  wire            maskedBeats_1 = 1'h0;	// src/main/scala/tilelink/Arbiter.scala:82:69
  wire            initBeats = 1'h0;	// src/main/scala/tilelink/Arbiter.scala:84:44
  wire [7:0][2:0] _GEN = '{3'h4, 3'h4, 3'h2, 3'h1, 3'h1, 3'h1, 3'h0, 3'h0};
  wire [2:0]      auto_in_a_bits_param = 3'h0;
  wire [2:0]      nodeIn_a_bits_param = 3'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]      c_bits_opcode = 3'h0;	// src/main/scala/tilelink/Bundles.scala:260:61
  wire [2:0]      c_bits_param = 3'h0;	// src/main/scala/tilelink/Bundles.scala:260:61
  wire [1:0]      auto_in_a_bits_size = 2'h2;
  wire [1:0]      nodeIn_a_bits_size = 2'h2;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]      da_bits_size = 2'h2;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire [3:0]      auto_in_a_bits_mask = 4'hF;
  wire [3:0]      nodeIn_a_bits_mask = 4'hF;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0]     auto_in_d_bits_data = 32'h0;
  wire [31:0]     nodeIn_d_bits_data = 32'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0]     da_bits_data = 32'h0;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire [31:0]     c_bits_data = 32'h0;	// src/main/scala/tilelink/Bundles.scala:260:61
  wire [31:0]     dc_bits_data = 32'h0;	// src/main/scala/devices/tilelink/Error.scala:46:20
  wire [1:0]      da_bits_param = 2'h0;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire [1:0]      c_bits_size = 2'h0;	// src/main/scala/tilelink/Bundles.scala:260:61
  wire [1:0]      dc_bits_size = 2'h0;	// src/main/scala/devices/tilelink/Error.scala:46:20
  wire [1:0]      dc_bits_param = 2'h1;	// src/main/scala/devices/tilelink/Error.scala:46:20
  wire [2:0]      dc_bits_opcode = 3'h6;	// src/main/scala/devices/tilelink/Error.scala:46:20
  wire            nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [127:0]    c_bits_address = 128'h0;	// src/main/scala/tilelink/Bundles.scala:260:61
  wire            nodeIn_a_valid = auto_in_a_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]      nodeIn_a_bits_opcode = auto_in_a_bits_opcode_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [127:0]    nodeIn_a_bits_address = auto_in_a_bits_address_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0]     nodeIn_a_bits_data = auto_in_a_bits_data_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_d_ready = auto_in_d_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]      nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]      nodeIn_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]      nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            auto_in_a_ready_0 = nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            auto_in_d_valid_0 = nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]      auto_in_d_bits_opcode_0 = nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]      auto_in_d_bits_param_0 = nodeIn_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]      auto_in_d_bits_size_0 = nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            muxState_1;	// src/main/scala/tilelink/Arbiter.scala:89:25
  wire            auto_in_d_bits_denied_0 = nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            auto_in_d_bits_corrupt_0 = nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            da_bits_corrupt_opdata;	// src/main/scala/tilelink/Edges.scala:107:36
  reg             idle;	// src/main/scala/devices/tilelink/Error.scala:26:23
  wire            a_last_done = nodeIn_a_ready & nodeIn_a_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Edges.scala:234:22
  wire            a_last_beats1_opdata = ~(nodeIn_a_bits_opcode[2]);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Edges.scala:93:{28,37}
  reg             a_last_counter;	// src/main/scala/tilelink/Edges.scala:230:27
  wire            a_last_counter1 = a_last_counter - 1'h1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
  wire            a_last_first = ~a_last_counter;	// src/main/scala/tilelink/Edges.scala:230:27, :232:25
  wire            da_ready;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire            da_valid;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire            done = da_ready & da_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/tilelink/Edges.scala:234:22
  wire [2:0]      da_bits_opcode;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire            beats1_opdata = da_bits_opcode[0];	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/tilelink/Edges.scala:107:36
  assign da_bits_corrupt_opdata = da_bits_opcode[0];	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/tilelink/Edges.scala:107:36
  wire            opdata_1 = da_bits_opcode[0];	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/tilelink/Edges.scala:107:36
  reg             counter;	// src/main/scala/tilelink/Edges.scala:230:27
  wire            counter1 = counter - 1'h1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
  wire            da_first = ~counter;	// src/main/scala/tilelink/Edges.scala:230:27, :232:25
  assign nodeIn_a_ready = da_ready & idle;	// src/main/scala/devices/tilelink/Error.scala:25:18, :26:23, :32:37, src/main/scala/diplomacy/Nodes.scala:1214:17
  assign da_valid = nodeIn_a_valid & idle;	// src/main/scala/devices/tilelink/Error.scala:25:18, :26:23, :33:35, src/main/scala/diplomacy/Nodes.scala:1214:17
  assign da_bits_opcode = _GEN[nodeIn_a_bits_opcode];	// src/main/scala/devices/tilelink/Error.scala:25:18, :35:21, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            da_bits_corrupt = da_bits_corrupt_opdata;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/tilelink/Edges.scala:107:36
  wire            dc_ready;	// src/main/scala/devices/tilelink/Error.scala:46:20
  wire            c_ready = dc_ready;	// src/main/scala/devices/tilelink/Error.scala:46:20, src/main/scala/tilelink/Bundles.scala:260:61
  reg             beatsLeft;	// src/main/scala/tilelink/Arbiter.scala:60:30
  wire            idle_1 = ~beatsLeft;	// src/main/scala/tilelink/Arbiter.scala:60:30, :61:28
  wire            latch = idle_1 & nodeIn_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Arbiter.scala:61:28, :62:24
  wire            winner_1 = readys_1 & da_valid;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/tilelink/Arbiter.scala:68:27, :71:{27,69}
  `ifndef SYNTHESIS	// src/main/scala/devices/tilelink/Error.scala:31:12
    always @(posedge clock) begin	// src/main/scala/devices/tilelink/Error.scala:31:12
      if (~reset & ~(idle | da_first)) begin	// src/main/scala/devices/tilelink/Error.scala:26:23, :31:{12,18}, src/main/scala/tilelink/Edges.scala:232:25
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/devices/tilelink/Error.scala:31:12
          $error("Assertion failed\n    at Error.scala:31 assert (idle || da_first) // we only send Grant, never GrantData => simplified flow control below\n");	// src/main/scala/devices/tilelink/Error.scala:31:12
        if (`STOP_COND_)	// src/main/scala/devices/tilelink/Error.scala:31:12
          $fatal;	// src/main/scala/devices/tilelink/Error.scala:31:12
      end
      if (~reset & ~(~da_valid | winner_1)) begin	// src/main/scala/devices/tilelink/Error.scala:25:18, :31:12, src/main/scala/tilelink/Arbiter.scala:71:27, :79:{14,15,36}
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/tilelink/Arbiter.scala:79:14
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");	// src/main/scala/tilelink/Arbiter.scala:79:14
        if (`STOP_COND_)	// src/main/scala/tilelink/Arbiter.scala:79:14
          $fatal;	// src/main/scala/tilelink/Arbiter.scala:79:14
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg             state_0;	// src/main/scala/tilelink/Arbiter.scala:88:26
  reg             state_1;	// src/main/scala/tilelink/Arbiter.scala:88:26
  wire            muxState_0 = ~idle_1 & state_0;	// src/main/scala/tilelink/Arbiter.scala:61:28, :88:26, :89:25
  assign muxState_1 = idle_1 ? winner_1 : state_1;	// src/main/scala/tilelink/Arbiter.scala:61:28, :71:27, :88:26, :89:25
  assign nodeIn_d_bits_denied = muxState_1;	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Arbiter.scala:89:25
  wire            allowed_0 = idle_1 ? readys_0 : state_0;	// src/main/scala/tilelink/Arbiter.scala:61:28, :68:27, :88:26, :92:24
  wire            allowed_1 = idle_1 ? readys_1 : state_1;	// src/main/scala/tilelink/Arbiter.scala:61:28, :68:27, :88:26, :92:24
  assign dc_ready = nodeIn_d_ready & allowed_0;	// src/main/scala/devices/tilelink/Error.scala:46:20, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Arbiter.scala:92:24, :94:31
  assign da_ready = nodeIn_d_ready & allowed_1;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Arbiter.scala:92:24, :94:31
  assign nodeIn_d_valid = (idle_1 | state_1) & da_valid;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Arbiter.scala:61:28, :88:26, :96:24
  assign nodeIn_d_bits_corrupt = muxState_1 & da_bits_corrupt;	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Arbiter.scala:89:25
  assign nodeIn_d_bits_size = {muxState_1, 1'h0};	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Arbiter.scala:89:25
  assign nodeIn_d_bits_param = {1'h0, muxState_0};	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Arbiter.scala:89:25
  assign nodeIn_d_bits_opcode =
    (muxState_0 ? 3'h6 : 3'h0) | (muxState_1 ? da_bits_opcode : 3'h0);	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Arbiter.scala:89:25
  always @(posedge clock) begin
    if (reset) begin
      idle <= 1'h1;	// src/main/scala/devices/tilelink/Error.scala:26:23
      a_last_counter <= 1'h0;	// src/main/scala/tilelink/Edges.scala:230:27
      counter <= 1'h0;	// src/main/scala/tilelink/Edges.scala:230:27
      beatsLeft <= 1'h0;	// src/main/scala/tilelink/Arbiter.scala:60:30
      state_0 <= 1'h0;	// src/main/scala/tilelink/Arbiter.scala:88:26
      state_1 <= 1'h0;	// src/main/scala/tilelink/Arbiter.scala:88:26
    end
    else begin
      idle <= ~(done & da_bits_opcode == 3'h4) & idle;	// src/main/scala/devices/tilelink/Error.scala:25:18, :26:23, :52:{21,39,50,57}, src/main/scala/tilelink/Edges.scala:234:22
      if (a_last_done)	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:234:22
        a_last_counter <= ~a_last_first & a_last_counter1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28, :232:25, :237:21
      if (done)	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:234:22
        counter <= ~da_first & counter1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28, :232:25, :237:21
      beatsLeft <= ~latch & beatsLeft - (nodeIn_d_ready & nodeIn_d_valid);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Arbiter.scala:60:30, :62:24, :85:{23,52}
      state_0 <= muxState_0;	// src/main/scala/tilelink/Arbiter.scala:88:26, :89:25
      state_1 <= muxState_1;	// src/main/scala/tilelink/Arbiter.scala:88:26, :89:25
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
        idle = _RANDOM[/*Zero width*/ 1'b0][0];	// src/main/scala/devices/tilelink/Error.scala:26:23
        a_last_counter = _RANDOM[/*Zero width*/ 1'b0][1];	// src/main/scala/devices/tilelink/Error.scala:26:23, src/main/scala/tilelink/Edges.scala:230:27
        counter = _RANDOM[/*Zero width*/ 1'b0][2];	// src/main/scala/devices/tilelink/Error.scala:26:23, src/main/scala/tilelink/Edges.scala:230:27
        beatsLeft = _RANDOM[/*Zero width*/ 1'b0][5];	// src/main/scala/devices/tilelink/Error.scala:26:23, src/main/scala/tilelink/Arbiter.scala:60:30
        state_0 = _RANDOM[/*Zero width*/ 1'b0][6];	// src/main/scala/devices/tilelink/Error.scala:26:23, src/main/scala/tilelink/Arbiter.scala:88:26
        state_1 = _RANDOM[/*Zero width*/ 1'b0][7];	// src/main/scala/devices/tilelink/Error.scala:26:23, src/main/scala/tilelink/Arbiter.scala:88:26
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  TLMonitor_66 monitor (	// src/main/scala/tilelink/Nodes.scala:24:25
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (nodeIn_a_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_valid        (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_opcode  (nodeIn_a_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_address (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_data    (nodeIn_a_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_ready        (nodeIn_d_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_valid        (nodeIn_d_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_param   (nodeIn_d_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_size    (nodeIn_d_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_denied  (nodeIn_d_bits_denied),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_corrupt (nodeIn_d_bits_corrupt)	// src/main/scala/diplomacy/Nodes.scala:1214:17
  );	// src/main/scala/tilelink/Nodes.scala:24:25
  assign auto_in_a_ready = auto_in_a_ready_0;
  assign auto_in_d_valid = auto_in_d_valid_0;
  assign auto_in_d_bits_opcode = auto_in_d_bits_opcode_0;
  assign auto_in_d_bits_param = auto_in_d_bits_param_0;
  assign auto_in_d_bits_size = auto_in_d_bits_size_0;
  assign auto_in_d_bits_denied = auto_in_d_bits_denied_0;
  assign auto_in_d_bits_corrupt = auto_in_d_bits_corrupt_0;
endmodule

