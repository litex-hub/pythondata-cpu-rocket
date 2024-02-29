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

module BankBinder(
  input          clock,
                 reset,
  output         auto_in_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]   auto_in_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [6:0]   auto_in_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [31:0]  auto_in_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_a_bits_user_amba_prot_bufferable,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_a_bits_user_amba_prot_modifiable,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_a_bits_user_amba_prot_readalloc,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_a_bits_user_amba_prot_writealloc,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_a_bits_user_amba_prot_privileged,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_a_bits_user_amba_prot_secure,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [15:0]  auto_in_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [127:0] auto_in_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_in_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]   auto_in_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [6:0]   auto_in_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_in_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [127:0] auto_in_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_in_d_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_out_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_out_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]   auto_out_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [6:0]   auto_out_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [31:0]  auto_out_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_out_a_bits_user_amba_prot_bufferable,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_a_bits_user_amba_prot_modifiable,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_a_bits_user_amba_prot_readalloc,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_a_bits_user_amba_prot_writealloc,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_a_bits_user_amba_prot_privileged,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_a_bits_user_amba_prot_secure,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [15:0]  auto_out_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [127:0] auto_out_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_out_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_out_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]   auto_out_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [6:0]   auto_out_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_out_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [127:0] auto_out_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_out_d_bits_corrupt	// src/main/scala/diplomacy/LazyModule.scala:374:18
);

  wire         auto_in_a_valid_0 = auto_in_a_valid;
  wire [2:0]   auto_in_a_bits_opcode_0 = auto_in_a_bits_opcode;
  wire [2:0]   auto_in_a_bits_param_0 = auto_in_a_bits_param;
  wire [2:0]   auto_in_a_bits_size_0 = auto_in_a_bits_size;
  wire [6:0]   auto_in_a_bits_source_0 = auto_in_a_bits_source;
  wire [31:0]  auto_in_a_bits_address_0 = auto_in_a_bits_address;
  wire         auto_in_a_bits_user_amba_prot_bufferable_0 =
    auto_in_a_bits_user_amba_prot_bufferable;
  wire         auto_in_a_bits_user_amba_prot_modifiable_0 =
    auto_in_a_bits_user_amba_prot_modifiable;
  wire         auto_in_a_bits_user_amba_prot_readalloc_0 =
    auto_in_a_bits_user_amba_prot_readalloc;
  wire         auto_in_a_bits_user_amba_prot_writealloc_0 =
    auto_in_a_bits_user_amba_prot_writealloc;
  wire         auto_in_a_bits_user_amba_prot_privileged_0 =
    auto_in_a_bits_user_amba_prot_privileged;
  wire         auto_in_a_bits_user_amba_prot_secure_0 =
    auto_in_a_bits_user_amba_prot_secure;
  wire [15:0]  auto_in_a_bits_mask_0 = auto_in_a_bits_mask;
  wire [127:0] auto_in_a_bits_data_0 = auto_in_a_bits_data;
  wire         auto_in_d_ready_0 = auto_in_d_ready;
  wire         auto_out_a_ready_0 = auto_out_a_ready;
  wire         auto_out_d_valid_0 = auto_out_d_valid;
  wire [2:0]   auto_out_d_bits_opcode_0 = auto_out_d_bits_opcode;
  wire [2:0]   auto_out_d_bits_size_0 = auto_out_d_bits_size;
  wire [6:0]   auto_out_d_bits_source_0 = auto_out_d_bits_source;
  wire         auto_out_d_bits_denied_0 = auto_out_d_bits_denied;
  wire [127:0] auto_out_d_bits_data_0 = auto_out_d_bits_data;
  wire         auto_out_d_bits_corrupt_0 = auto_out_d_bits_corrupt;
  wire [1:0]   auto_in_d_bits_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:374:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25
  wire [1:0]   auto_out_d_bits_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:374:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25
  wire [1:0]   nodeIn_d_bits_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:374:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25
  wire [1:0]   nodeOut_d_bits_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:374:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25
  wire         auto_in_a_bits_user_amba_prot_fetch = 1'h0;
  wire         auto_in_a_bits_corrupt = 1'h0;
  wire         auto_in_d_bits_sink = 1'h0;
  wire         auto_out_a_bits_user_amba_prot_fetch = 1'h0;
  wire         auto_out_a_bits_corrupt = 1'h0;
  wire         auto_out_d_bits_sink = 1'h0;
  wire         nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_a_bits_user_amba_prot_fetch = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_a_bits_corrupt = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_d_bits_sink = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeOut_a_bits_user_amba_prot_fetch = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_a_bits_corrupt = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_d_bits_sink = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeIn_a_valid = auto_in_a_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   nodeIn_a_bits_opcode = auto_in_a_bits_opcode_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   nodeIn_a_bits_param = auto_in_a_bits_param_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   nodeIn_a_bits_size = auto_in_a_bits_size_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [6:0]   nodeIn_a_bits_source = auto_in_a_bits_source_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0]  nodeIn_a_bits_address = auto_in_a_bits_address_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_a_bits_user_amba_prot_bufferable =
    auto_in_a_bits_user_amba_prot_bufferable_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_a_bits_user_amba_prot_modifiable =
    auto_in_a_bits_user_amba_prot_modifiable_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_a_bits_user_amba_prot_readalloc =
    auto_in_a_bits_user_amba_prot_readalloc_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_a_bits_user_amba_prot_writealloc =
    auto_in_a_bits_user_amba_prot_writealloc_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_a_bits_user_amba_prot_privileged =
    auto_in_a_bits_user_amba_prot_privileged_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_a_bits_user_amba_prot_secure =
    auto_in_a_bits_user_amba_prot_secure_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [15:0]  nodeIn_a_bits_mask = auto_in_a_bits_mask_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [127:0] nodeIn_a_bits_data = auto_in_a_bits_data_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_d_ready = auto_in_d_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [6:0]   nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [127:0] nodeIn_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeOut_a_ready = auto_out_a_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   nodeOut_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   nodeOut_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   nodeOut_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [6:0]   nodeOut_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0]  nodeOut_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_a_bits_user_amba_prot_bufferable;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_a_bits_user_amba_prot_modifiable;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_a_bits_user_amba_prot_readalloc;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_a_bits_user_amba_prot_writealloc;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_a_bits_user_amba_prot_privileged;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_a_bits_user_amba_prot_secure;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [15:0]  nodeOut_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [127:0] nodeOut_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_d_valid = auto_out_d_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   nodeOut_d_bits_opcode = auto_out_d_bits_opcode_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   nodeOut_d_bits_size = auto_out_d_bits_size_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [6:0]   nodeOut_d_bits_source = auto_out_d_bits_source_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_d_bits_denied = auto_out_d_bits_denied_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [127:0] nodeOut_d_bits_data = auto_out_d_bits_data_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_d_bits_corrupt = auto_out_d_bits_corrupt_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_in_a_ready_0 = nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeOut_a_valid = nodeIn_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_opcode = nodeIn_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_param = nodeIn_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_size = nodeIn_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_source = nodeIn_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_address = nodeIn_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_user_amba_prot_bufferable =
    nodeIn_a_bits_user_amba_prot_bufferable;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_user_amba_prot_modifiable =
    nodeIn_a_bits_user_amba_prot_modifiable;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_user_amba_prot_readalloc = nodeIn_a_bits_user_amba_prot_readalloc;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_user_amba_prot_writealloc =
    nodeIn_a_bits_user_amba_prot_writealloc;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_user_amba_prot_privileged =
    nodeIn_a_bits_user_amba_prot_privileged;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_user_amba_prot_secure = nodeIn_a_bits_user_amba_prot_secure;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_mask = nodeIn_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_data = nodeIn_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_d_ready = nodeIn_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire         auto_in_d_valid_0 = nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   auto_in_d_bits_opcode_0 = nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   auto_in_d_bits_size_0 = nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [6:0]   auto_in_d_bits_source_0 = nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         auto_in_d_bits_denied_0 = nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [127:0] auto_in_d_bits_data_0 = nodeIn_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         auto_in_d_bits_corrupt_0 = nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeIn_a_ready = nodeOut_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire         auto_out_a_valid_0 = nodeOut_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   auto_out_a_bits_opcode_0 = nodeOut_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   auto_out_a_bits_param_0 = nodeOut_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   auto_out_a_bits_size_0 = nodeOut_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [6:0]   auto_out_a_bits_source_0 = nodeOut_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0]  auto_out_a_bits_address_0 = nodeOut_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_a_bits_user_amba_prot_bufferable_0 =
    nodeOut_a_bits_user_amba_prot_bufferable;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_a_bits_user_amba_prot_modifiable_0 =
    nodeOut_a_bits_user_amba_prot_modifiable;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_a_bits_user_amba_prot_readalloc_0 =
    nodeOut_a_bits_user_amba_prot_readalloc;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_a_bits_user_amba_prot_writealloc_0 =
    nodeOut_a_bits_user_amba_prot_writealloc;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_a_bits_user_amba_prot_privileged_0 =
    nodeOut_a_bits_user_amba_prot_privileged;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_a_bits_user_amba_prot_secure_0 =
    nodeOut_a_bits_user_amba_prot_secure;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [15:0]  auto_out_a_bits_mask_0 = nodeOut_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [127:0] auto_out_a_bits_data_0 = nodeOut_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_d_ready_0 = nodeOut_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign nodeIn_d_valid = nodeOut_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_opcode = nodeOut_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_size = nodeOut_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_source = nodeOut_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_denied = nodeOut_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_data = nodeOut_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_corrupt = nodeOut_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  TLMonitor_29 monitor (	// src/main/scala/tilelink/Nodes.scala:24:25
    .clock                                  (clock),
    .reset                                  (reset),
    .io_in_a_ready                          (nodeIn_a_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_valid                          (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_opcode                    (nodeIn_a_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_param                     (nodeIn_a_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_size                      (nodeIn_a_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_source                    (nodeIn_a_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_address                   (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_user_amba_prot_bufferable (nodeIn_a_bits_user_amba_prot_bufferable),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_user_amba_prot_modifiable (nodeIn_a_bits_user_amba_prot_modifiable),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_user_amba_prot_readalloc  (nodeIn_a_bits_user_amba_prot_readalloc),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_user_amba_prot_writealloc (nodeIn_a_bits_user_amba_prot_writealloc),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_user_amba_prot_privileged (nodeIn_a_bits_user_amba_prot_privileged),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_user_amba_prot_secure     (nodeIn_a_bits_user_amba_prot_secure),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_mask                      (nodeIn_a_bits_mask),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_data                      (nodeIn_a_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_ready                          (nodeIn_d_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_valid                          (nodeIn_d_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_opcode                    (nodeIn_d_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_size                      (nodeIn_d_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_source                    (nodeIn_d_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_denied                    (nodeIn_d_bits_denied),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_data                      (nodeIn_d_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_corrupt                   (nodeIn_d_bits_corrupt)	// src/main/scala/diplomacy/Nodes.scala:1214:17
  );	// src/main/scala/tilelink/Nodes.scala:24:25
  assign auto_in_a_ready = auto_in_a_ready_0;
  assign auto_in_d_valid = auto_in_d_valid_0;
  assign auto_in_d_bits_opcode = auto_in_d_bits_opcode_0;
  assign auto_in_d_bits_size = auto_in_d_bits_size_0;
  assign auto_in_d_bits_source = auto_in_d_bits_source_0;
  assign auto_in_d_bits_denied = auto_in_d_bits_denied_0;
  assign auto_in_d_bits_data = auto_in_d_bits_data_0;
  assign auto_in_d_bits_corrupt = auto_in_d_bits_corrupt_0;
  assign auto_out_a_valid = auto_out_a_valid_0;
  assign auto_out_a_bits_opcode = auto_out_a_bits_opcode_0;
  assign auto_out_a_bits_param = auto_out_a_bits_param_0;
  assign auto_out_a_bits_size = auto_out_a_bits_size_0;
  assign auto_out_a_bits_source = auto_out_a_bits_source_0;
  assign auto_out_a_bits_address = auto_out_a_bits_address_0;
  assign auto_out_a_bits_user_amba_prot_bufferable =
    auto_out_a_bits_user_amba_prot_bufferable_0;
  assign auto_out_a_bits_user_amba_prot_modifiable =
    auto_out_a_bits_user_amba_prot_modifiable_0;
  assign auto_out_a_bits_user_amba_prot_readalloc =
    auto_out_a_bits_user_amba_prot_readalloc_0;
  assign auto_out_a_bits_user_amba_prot_writealloc =
    auto_out_a_bits_user_amba_prot_writealloc_0;
  assign auto_out_a_bits_user_amba_prot_privileged =
    auto_out_a_bits_user_amba_prot_privileged_0;
  assign auto_out_a_bits_user_amba_prot_secure = auto_out_a_bits_user_amba_prot_secure_0;
  assign auto_out_a_bits_mask = auto_out_a_bits_mask_0;
  assign auto_out_a_bits_data = auto_out_a_bits_data_0;
  assign auto_out_d_ready = auto_out_d_ready_0;
endmodule

