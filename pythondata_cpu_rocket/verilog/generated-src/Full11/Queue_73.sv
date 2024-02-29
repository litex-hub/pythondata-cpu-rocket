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

module Queue_73(
  input         clock,
                reset,
  output        io_enq_ready,	// src/main/scala/chisel3/util/Decoupled.scala:273:14
  input         io_enq_valid,	// src/main/scala/chisel3/util/Decoupled.scala:273:14
  input  [31:0] io_enq_bits_address,	// src/main/scala/chisel3/util/Decoupled.scala:273:14
  input         io_deq_ready,	// src/main/scala/chisel3/util/Decoupled.scala:273:14
  output        io_deq_valid,	// src/main/scala/chisel3/util/Decoupled.scala:273:14
  output [31:0] io_deq_bits_address	// src/main/scala/chisel3/util/Decoupled.scala:273:14
);

  wire        io_enq_valid_0 = io_enq_valid;
  wire [31:0] io_enq_bits_address_0 = io_enq_bits_address;
  wire        io_deq_ready_0 = io_deq_ready;
  wire        ptr_match = 1'h1;	// src/main/scala/chisel3/util/Decoupled.scala:278:33
  wire        enq_ptr_value = 1'h0;	// src/main/scala/chisel3/util/Counter.scala:61:73
  wire        deq_ptr_value = 1'h0;	// src/main/scala/chisel3/util/Counter.scala:61:73
  wire        ptr_diff = 1'h0;	// src/main/scala/chisel3/util/Decoupled.scala:327:32
  reg  [31:0] ram_address;	// src/main/scala/chisel3/util/Decoupled.scala:274:95
  wire [31:0] io_deq_bits_address_0 = ram_address;	// src/main/scala/chisel3/util/Decoupled.scala:274:95
  reg         maybe_full;	// src/main/scala/chisel3/util/Decoupled.scala:277:27
  wire        io_count = maybe_full;	// src/main/scala/chisel3/util/Decoupled.scala:277:27
  wire        full = maybe_full;	// src/main/scala/chisel3/util/Decoupled.scala:277:27, :280:24
  wire        empty = ~maybe_full;	// src/main/scala/chisel3/util/Decoupled.scala:277:27, :279:{25,28}
  wire        io_enq_ready_0;
  wire        do_enq = io_enq_ready_0 & io_enq_valid_0;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, :281:27
  wire        io_deq_valid_0;
  wire        do_deq = io_deq_ready_0 & io_deq_valid_0;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, :282:27
  assign io_deq_valid_0 = ~empty;	// src/main/scala/chisel3/util/Decoupled.scala:279:25, :303:19
  assign io_enq_ready_0 = ~full;	// src/main/scala/chisel3/util/Decoupled.scala:280:24, :304:19
  always @(posedge clock) begin
    if (do_enq)	// src/main/scala/chisel3/util/Decoupled.scala:281:27
      ram_address <= io_enq_bits_address_0;	// src/main/scala/chisel3/util/Decoupled.scala:274:95
    if (reset)
      maybe_full <= 1'h0;	// src/main/scala/chisel3/util/Decoupled.scala:277:27
    else if (~(do_enq == do_deq))	// src/main/scala/chisel3/util/Decoupled.scala:277:27, :281:27, :282:27, :294:{15,27}, :295:16
      maybe_full <= do_enq;	// src/main/scala/chisel3/util/Decoupled.scala:277:27, :281:27
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
        ram_address = {_RANDOM[1'h0][31:1], _RANDOM[1'h1][0]};	// src/main/scala/chisel3/util/Decoupled.scala:274:95
        maybe_full = _RANDOM[1'h0][0];	// src/main/scala/chisel3/util/Decoupled.scala:274:95, :277:27
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_enq_ready = io_enq_ready_0;
  assign io_deq_valid = io_deq_valid_0;
  assign io_deq_bits_address = io_deq_bits_address_0;
endmodule
