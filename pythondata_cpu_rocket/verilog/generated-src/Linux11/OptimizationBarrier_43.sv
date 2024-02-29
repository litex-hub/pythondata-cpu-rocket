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

module OptimizationBarrier_43(
  input  [9:0]  io_x_reserved_for_future,	// src/main/scala/util/package.scala:260:18
  input  [43:0] io_x_ppn,	// src/main/scala/util/package.scala:260:18
  input  [1:0]  io_x_reserved_for_software,	// src/main/scala/util/package.scala:260:18
  input         io_x_d,	// src/main/scala/util/package.scala:260:18
                io_x_a,	// src/main/scala/util/package.scala:260:18
                io_x_g,	// src/main/scala/util/package.scala:260:18
                io_x_u,	// src/main/scala/util/package.scala:260:18
                io_x_x,	// src/main/scala/util/package.scala:260:18
                io_x_w,	// src/main/scala/util/package.scala:260:18
                io_x_r,	// src/main/scala/util/package.scala:260:18
                io_x_v,	// src/main/scala/util/package.scala:260:18
  output [9:0]  io_y_reserved_for_future,	// src/main/scala/util/package.scala:260:18
  output [43:0] io_y_ppn,	// src/main/scala/util/package.scala:260:18
  output [1:0]  io_y_reserved_for_software,	// src/main/scala/util/package.scala:260:18
  output        io_y_d,	// src/main/scala/util/package.scala:260:18
                io_y_a,	// src/main/scala/util/package.scala:260:18
                io_y_g,	// src/main/scala/util/package.scala:260:18
                io_y_u,	// src/main/scala/util/package.scala:260:18
                io_y_x,	// src/main/scala/util/package.scala:260:18
                io_y_w,	// src/main/scala/util/package.scala:260:18
                io_y_r,	// src/main/scala/util/package.scala:260:18
                io_y_v	// src/main/scala/util/package.scala:260:18
);

  wire [9:0]  io_x_reserved_for_future_0 = io_x_reserved_for_future;
  wire [43:0] io_x_ppn_0 = io_x_ppn;
  wire [1:0]  io_x_reserved_for_software_0 = io_x_reserved_for_software;
  wire        io_x_d_0 = io_x_d;
  wire        io_x_a_0 = io_x_a;
  wire        io_x_g_0 = io_x_g;
  wire        io_x_u_0 = io_x_u;
  wire        io_x_x_0 = io_x_x;
  wire        io_x_w_0 = io_x_w;
  wire        io_x_r_0 = io_x_r;
  wire        io_x_v_0 = io_x_v;
  wire [9:0]  io_y_reserved_for_future_0 = io_x_reserved_for_future_0;
  wire [43:0] io_y_ppn_0 = io_x_ppn_0;
  wire [1:0]  io_y_reserved_for_software_0 = io_x_reserved_for_software_0;
  wire        io_y_d_0 = io_x_d_0;
  wire        io_y_a_0 = io_x_a_0;
  wire        io_y_g_0 = io_x_g_0;
  wire        io_y_u_0 = io_x_u_0;
  wire        io_y_x_0 = io_x_x_0;
  wire        io_y_w_0 = io_x_w_0;
  wire        io_y_r_0 = io_x_r_0;
  wire        io_y_v_0 = io_x_v_0;
  assign io_y_reserved_for_future = io_y_reserved_for_future_0;
  assign io_y_ppn = io_y_ppn_0;
  assign io_y_reserved_for_software = io_y_reserved_for_software_0;
  assign io_y_d = io_y_d_0;
  assign io_y_a = io_y_a_0;
  assign io_y_g = io_y_g_0;
  assign io_y_u = io_y_u_0;
  assign io_y_x = io_y_x_0;
  assign io_y_w = io_y_w_0;
  assign io_y_r = io_y_r_0;
  assign io_y_v = io_y_v_0;
endmodule

