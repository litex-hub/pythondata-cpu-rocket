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

module TLError(
  input         clock,
                reset,
  output        auto_in_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]  auto_in_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]  auto_in_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [4:0]  auto_in_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [13:0] auto_in_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]  auto_in_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [63:0] auto_in_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_a_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_in_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]  auto_in_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [4:0]  auto_in_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_d_bits_corrupt	// src/main/scala/diplomacy/LazyModule.scala:374:18
);

  wire            a_q_io_deq_ready;	// src/main/scala/devices/tilelink/Error.scala:32:46
  wire            _a_q_io_deq_valid;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire [2:0]      _a_q_io_deq_bits_opcode;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire [3:0]      _a_q_io_deq_bits_size;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire            auto_in_a_valid_0 = auto_in_a_valid;
  wire [2:0]      auto_in_a_bits_opcode_0 = auto_in_a_bits_opcode;
  wire [2:0]      auto_in_a_bits_param_0 = auto_in_a_bits_param;
  wire [3:0]      auto_in_a_bits_size_0 = auto_in_a_bits_size;
  wire [4:0]      auto_in_a_bits_source_0 = auto_in_a_bits_source;
  wire [13:0]     auto_in_a_bits_address_0 = auto_in_a_bits_address;
  wire [7:0]      auto_in_a_bits_mask_0 = auto_in_a_bits_mask;
  wire [63:0]     auto_in_a_bits_data_0 = auto_in_a_bits_data;
  wire            auto_in_a_bits_corrupt_0 = auto_in_a_bits_corrupt;
  wire            auto_in_d_ready_0 = auto_in_d_ready;
  wire            auto_in_d_bits_denied = 1'h1;
  wire            nodeIn_d_bits_denied = 1'h1;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            da_bits_denied = 1'h1;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire            auto_in_d_bits_sink = 1'h0;
  wire            nodeIn_d_bits_sink = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            da_bits_sink = 1'h0;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire [7:0][2:0] _GEN = '{3'h4, 3'h4, 3'h2, 3'h1, 3'h1, 3'h1, 3'h0, 3'h0};
  wire [1:0]      auto_in_d_bits_param = 2'h0;
  wire [1:0]      nodeIn_d_bits_param = 2'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]      da_bits_param = 2'h0;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire [63:0]     auto_in_d_bits_data = 64'h0;
  wire [63:0]     nodeIn_d_bits_data = 64'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [63:0]     da_bits_data = 64'h0;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire            nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_a_valid = auto_in_a_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]      nodeIn_a_bits_opcode = auto_in_a_bits_opcode_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]      nodeIn_a_bits_param = auto_in_a_bits_param_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]      nodeIn_a_bits_size = auto_in_a_bits_size_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [4:0]      nodeIn_a_bits_source = auto_in_a_bits_source_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [13:0]     nodeIn_a_bits_address = auto_in_a_bits_address_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]      nodeIn_a_bits_mask = auto_in_a_bits_mask_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [63:0]     nodeIn_a_bits_data = auto_in_a_bits_data_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_a_bits_corrupt = auto_in_a_bits_corrupt_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_d_ready = auto_in_d_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]      nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]      nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [4:0]      nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            auto_in_a_ready_0 = nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            da_ready = nodeIn_d_ready;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            da_valid;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire            auto_in_d_valid_0 = nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]      da_bits_opcode;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire [2:0]      auto_in_d_bits_opcode_0 = nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]      da_bits_size;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire [3:0]      auto_in_d_bits_size_0 = nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [4:0]      da_bits_source;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire [4:0]      auto_in_d_bits_source_0 = nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            da_bits_corrupt;	// src/main/scala/devices/tilelink/Error.scala:25:18
  wire            auto_in_d_bits_corrupt_0 = nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeIn_d_valid = da_valid;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeIn_d_bits_opcode = da_bits_opcode;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeIn_d_bits_size = da_bits_size;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeIn_d_bits_source = da_bits_source;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            da_bits_corrupt_opdata;	// src/main/scala/tilelink/Edges.scala:107:36
  assign nodeIn_d_bits_corrupt = da_bits_corrupt;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire            _a_last_T = a_q_io_deq_ready & _a_q_io_deq_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, :376:21, src/main/scala/devices/tilelink/Error.scala:32:46
  wire [26:0]     _a_last_beats1_decode_T_1 = 27'hFFF << _a_q_io_deq_bits_size;	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/util/package.scala:235:71
  wire [8:0]      a_last_beats1_decode = ~(_a_last_beats1_decode_T_1[11:3]);	// src/main/scala/tilelink/Edges.scala:221:59, src/main/scala/util/package.scala:235:{46,71,76}
  wire            a_last_beats1_opdata = ~(_a_q_io_deq_bits_opcode[2]);	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/tilelink/Edges.scala:93:{28,37}
  wire [8:0]      a_last_beats1 = a_last_beats1_opdata ? a_last_beats1_decode : 9'h0;	// src/main/scala/tilelink/Edges.scala:93:28, :221:59, :222:14
  reg  [8:0]      a_last_counter;	// src/main/scala/tilelink/Edges.scala:230:27
  wire [8:0]      a_last_counter1 = a_last_counter - 9'h1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
  wire            a_last_first = a_last_counter == 9'h0;	// src/main/scala/tilelink/Edges.scala:230:27, :232:25
  wire            a_last = a_last_counter == 9'h1 | a_last_beats1 == 9'h0;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27, :233:{25,33,43}
  wire            a_last_done = a_last & _a_last_T;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:233:33, :234:22
  wire [8:0]      a_last_count = a_last_beats1 & ~a_last_counter1;	// src/main/scala/tilelink/Edges.scala:222:14, :231:28, :235:{25,27}
  wire            _GEN_0 = da_ready & da_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/devices/tilelink/Error.scala:25:18
  wire [26:0]     _beats1_decode_T_1 = 27'hFFF << da_bits_size;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/util/package.scala:235:71
  wire [8:0]      beats1_decode = ~(_beats1_decode_T_1[11:3]);	// src/main/scala/tilelink/Edges.scala:221:59, src/main/scala/util/package.scala:235:{46,71,76}
  wire            beats1_opdata = da_bits_opcode[0];	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/tilelink/Edges.scala:107:36
  assign da_bits_corrupt_opdata = da_bits_opcode[0];	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/tilelink/Edges.scala:107:36
  wire [8:0]      beats1 = beats1_opdata ? beats1_decode : 9'h0;	// src/main/scala/tilelink/Edges.scala:107:36, :221:59, :222:14
  reg  [8:0]      counter;	// src/main/scala/tilelink/Edges.scala:230:27
  wire [8:0]      counter1 = counter - 9'h1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
  wire            da_first = counter == 9'h0;	// src/main/scala/tilelink/Edges.scala:230:27, :232:25
  wire            da_last = counter == 9'h1 | beats1 == 9'h0;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27, :233:{25,33,43}
  wire            done = da_last & _GEN_0;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:233:33, :234:22
  wire [8:0]      count = beats1 & ~counter1;	// src/main/scala/tilelink/Edges.scala:222:14, :231:28, :235:{25,27}
  assign a_q_io_deq_ready = da_ready & da_last | ~a_last;	// src/main/scala/devices/tilelink/Error.scala:25:18, :32:{26,46,49}, src/main/scala/tilelink/Edges.scala:233:33
  assign da_valid = _a_q_io_deq_valid & a_last;	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/devices/tilelink/Error.scala:25:18, :33:25, src/main/scala/tilelink/Edges.scala:233:33
  assign da_bits_opcode = _GEN[_a_q_io_deq_bits_opcode];	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/devices/tilelink/Error.scala:25:18, :35:21
  assign da_bits_corrupt = da_bits_corrupt_opdata;	// src/main/scala/devices/tilelink/Error.scala:25:18, src/main/scala/tilelink/Edges.scala:107:36
  always @(posedge clock) begin
    if (reset) begin
      a_last_counter <= 9'h0;	// src/main/scala/tilelink/Edges.scala:230:27
      counter <= 9'h0;	// src/main/scala/tilelink/Edges.scala:230:27
    end
    else begin
      if (_a_last_T) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
        if (a_last_first)	// src/main/scala/tilelink/Edges.scala:232:25
          a_last_counter <= a_last_beats1;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27
        else	// src/main/scala/tilelink/Edges.scala:232:25
          a_last_counter <= a_last_counter1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
      end
      if (_GEN_0) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
        if (da_first)	// src/main/scala/tilelink/Edges.scala:232:25
          counter <= beats1;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27
        else	// src/main/scala/tilelink/Edges.scala:232:25
          counter <= counter1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
      end
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
        a_last_counter = _RANDOM[/*Zero width*/ 1'b0][9:1];	// src/main/scala/tilelink/Edges.scala:230:27
        counter = _RANDOM[/*Zero width*/ 1'b0][18:10];	// src/main/scala/tilelink/Edges.scala:230:27
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  TLMonitor_15 monitor (	// src/main/scala/tilelink/Nodes.scala:24:25
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
    .io_in_d_bits_corrupt (nodeIn_d_bits_corrupt)	// src/main/scala/diplomacy/Nodes.scala:1214:17
  );	// src/main/scala/tilelink/Nodes.scala:24:25
  Queue_46 a_q (	// src/main/scala/chisel3/util/Decoupled.scala:376:21
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (nodeIn_a_ready),
    .io_enq_valid        (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_opcode  (nodeIn_a_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_param   (nodeIn_a_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_size    (nodeIn_a_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_source  (nodeIn_a_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_address (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_mask    (nodeIn_a_bits_mask),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_data    (nodeIn_a_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_corrupt (nodeIn_a_bits_corrupt),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_deq_ready        (a_q_io_deq_ready),	// src/main/scala/devices/tilelink/Error.scala:32:46
    .io_deq_valid        (_a_q_io_deq_valid),
    .io_deq_bits_opcode  (_a_q_io_deq_bits_opcode),
    .io_deq_bits_size    (_a_q_io_deq_bits_size),
    .io_deq_bits_source  (da_bits_source)
  );	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  assign da_bits_size = _a_q_io_deq_bits_size;	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/devices/tilelink/Error.scala:25:18
  assign auto_in_a_ready = auto_in_a_ready_0;
  assign auto_in_d_valid = auto_in_d_valid_0;
  assign auto_in_d_bits_opcode = auto_in_d_bits_opcode_0;
  assign auto_in_d_bits_size = auto_in_d_bits_size_0;
  assign auto_in_d_bits_source = auto_in_d_bits_source_0;
  assign auto_in_d_bits_corrupt = auto_in_d_bits_corrupt_0;
endmodule

