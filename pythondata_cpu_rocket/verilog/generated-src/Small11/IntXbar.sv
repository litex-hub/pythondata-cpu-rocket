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

module IntXbar(
  input  auto_int_in_0,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_in_1,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_in_2,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_in_3,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_in_4,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_in_5,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_in_6,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_in_7,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output auto_int_out_0,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_out_1,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_out_2,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_out_3,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_out_4,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_out_5,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_out_6,	// src/main/scala/diplomacy/LazyModule.scala:374:18
         auto_int_out_7	// src/main/scala/diplomacy/LazyModule.scala:374:18
);

  wire auto_int_in_0_0 = auto_int_in_0;
  wire auto_int_in_1_0 = auto_int_in_1;
  wire auto_int_in_2_0 = auto_int_in_2;
  wire auto_int_in_3_0 = auto_int_in_3;
  wire auto_int_in_4_0 = auto_int_in_4;
  wire auto_int_in_5_0 = auto_int_in_5;
  wire auto_int_in_6_0 = auto_int_in_6;
  wire auto_int_in_7_0 = auto_int_in_7;
  wire intnodeIn_0 = auto_int_in_0_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire intnodeIn_1 = auto_int_in_1_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire intnodeIn_2 = auto_int_in_2_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire intnodeIn_3 = auto_int_in_3_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire intnodeIn_4 = auto_int_in_4_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire intnodeIn_5 = auto_int_in_5_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire intnodeIn_6 = auto_int_in_6_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire intnodeIn_7 = auto_int_in_7_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire intnodeOut_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire intnodeOut_1;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire intnodeOut_2;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire intnodeOut_3;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire intnodeOut_4;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire intnodeOut_5;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire intnodeOut_6;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire intnodeOut_7;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign intnodeOut_0 = intnodeIn_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign intnodeOut_1 = intnodeIn_1;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign intnodeOut_2 = intnodeIn_2;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign intnodeOut_3 = intnodeIn_3;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign intnodeOut_4 = intnodeIn_4;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign intnodeOut_5 = intnodeIn_5;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign intnodeOut_6 = intnodeIn_6;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign intnodeOut_7 = intnodeIn_7;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire auto_int_out_0_0 = intnodeOut_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire auto_int_out_1_0 = intnodeOut_1;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire auto_int_out_2_0 = intnodeOut_2;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire auto_int_out_3_0 = intnodeOut_3;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire auto_int_out_4_0 = intnodeOut_4;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire auto_int_out_5_0 = intnodeOut_5;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire auto_int_out_6_0 = intnodeOut_6;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire auto_int_out_7_0 = intnodeOut_7;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_int_out_0 = auto_int_out_0_0;
  assign auto_int_out_1 = auto_int_out_1_0;
  assign auto_int_out_2 = auto_int_out_2_0;
  assign auto_int_out_3 = auto_int_out_3_0;
  assign auto_int_out_4 = auto_int_out_4_0;
  assign auto_int_out_5 = auto_int_out_5_0;
  assign auto_int_out_6 = auto_int_out_6_0;
  assign auto_int_out_7 = auto_int_out_7_0;
endmodule

