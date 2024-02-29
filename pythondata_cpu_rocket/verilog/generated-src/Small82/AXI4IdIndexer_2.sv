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

module AXI4IdIndexer_2(
  output         auto_in_aw_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_aw_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]   auto_in_aw_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [31:0]  auto_in_aw_bits_addr,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]   auto_in_aw_bits_len,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]   auto_in_aw_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [1:0]   auto_in_aw_bits_burst,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_aw_bits_lock,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]   auto_in_aw_bits_cache,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]   auto_in_aw_bits_prot,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]   auto_in_aw_bits_qos,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_aw_bits_echo_tl_state_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]   auto_in_aw_bits_echo_tl_state_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_in_w_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_w_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [127:0] auto_in_w_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [15:0]  auto_in_w_bits_strb,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_w_bits_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_b_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_in_b_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]   auto_in_b_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]   auto_in_b_bits_resp,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]   auto_in_b_bits_echo_tl_state_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]   auto_in_b_bits_echo_tl_state_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_in_ar_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_ar_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]   auto_in_ar_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [31:0]  auto_in_ar_bits_addr,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]   auto_in_ar_bits_len,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]   auto_in_ar_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [1:0]   auto_in_ar_bits_burst,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_ar_bits_lock,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]   auto_in_ar_bits_cache,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]   auto_in_ar_bits_prot,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]   auto_in_ar_bits_qos,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_in_ar_bits_echo_tl_state_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]   auto_in_ar_bits_echo_tl_state_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_in_r_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_in_r_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]   auto_in_r_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [127:0] auto_in_r_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]   auto_in_r_bits_resp,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]   auto_in_r_bits_echo_tl_state_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]   auto_in_r_bits_echo_tl_state_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_in_r_bits_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_out_aw_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_out_aw_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]   auto_out_aw_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [31:0]  auto_out_aw_bits_addr,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]   auto_out_aw_bits_len,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]   auto_out_aw_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]   auto_out_aw_bits_burst,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_out_aw_bits_lock,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]   auto_out_aw_bits_cache,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]   auto_out_aw_bits_prot,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]   auto_out_aw_bits_qos,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_aw_bits_echo_tl_state_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]   auto_out_aw_bits_echo_tl_state_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]   auto_out_aw_bits_echo_extra_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_out_w_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_out_w_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [127:0] auto_out_w_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [15:0]  auto_out_w_bits_strb,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_out_w_bits_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_b_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_out_b_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]   auto_out_b_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [1:0]   auto_out_b_bits_resp,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]   auto_out_b_bits_echo_tl_state_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]   auto_out_b_bits_echo_tl_state_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]   auto_out_b_bits_echo_extra_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_out_ar_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_out_ar_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]   auto_out_ar_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [31:0]  auto_out_ar_bits_addr,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]   auto_out_ar_bits_len,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]   auto_out_ar_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]   auto_out_ar_bits_burst,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_out_ar_bits_lock,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]   auto_out_ar_bits_cache,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]   auto_out_ar_bits_prot,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]   auto_out_ar_bits_qos,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                 auto_out_ar_bits_echo_tl_state_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]   auto_out_ar_bits_echo_tl_state_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]   auto_out_ar_bits_echo_extra_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output         auto_out_r_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_out_r_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]   auto_out_r_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [127:0] auto_out_r_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [1:0]   auto_out_r_bits_resp,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]   auto_out_r_bits_echo_tl_state_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]   auto_out_r_bits_echo_tl_state_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]   auto_out_r_bits_echo_extra_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input          auto_out_r_bits_last	// src/main/scala/diplomacy/LazyModule.scala:374:18
);

  wire         auto_in_aw_valid_0 = auto_in_aw_valid;
  wire [7:0]   auto_in_aw_bits_id_0 = auto_in_aw_bits_id;
  wire [31:0]  auto_in_aw_bits_addr_0 = auto_in_aw_bits_addr;
  wire [7:0]   auto_in_aw_bits_len_0 = auto_in_aw_bits_len;
  wire [2:0]   auto_in_aw_bits_size_0 = auto_in_aw_bits_size;
  wire [1:0]   auto_in_aw_bits_burst_0 = auto_in_aw_bits_burst;
  wire         auto_in_aw_bits_lock_0 = auto_in_aw_bits_lock;
  wire [3:0]   auto_in_aw_bits_cache_0 = auto_in_aw_bits_cache;
  wire [2:0]   auto_in_aw_bits_prot_0 = auto_in_aw_bits_prot;
  wire [3:0]   auto_in_aw_bits_qos_0 = auto_in_aw_bits_qos;
  wire [3:0]   auto_in_aw_bits_echo_tl_state_size_0 = auto_in_aw_bits_echo_tl_state_size;
  wire [7:0]   auto_in_aw_bits_echo_tl_state_source_0 =
    auto_in_aw_bits_echo_tl_state_source;
  wire         auto_in_w_valid_0 = auto_in_w_valid;
  wire [127:0] auto_in_w_bits_data_0 = auto_in_w_bits_data;
  wire [15:0]  auto_in_w_bits_strb_0 = auto_in_w_bits_strb;
  wire         auto_in_w_bits_last_0 = auto_in_w_bits_last;
  wire         auto_in_b_ready_0 = auto_in_b_ready;
  wire         auto_in_ar_valid_0 = auto_in_ar_valid;
  wire [7:0]   auto_in_ar_bits_id_0 = auto_in_ar_bits_id;
  wire [31:0]  auto_in_ar_bits_addr_0 = auto_in_ar_bits_addr;
  wire [7:0]   auto_in_ar_bits_len_0 = auto_in_ar_bits_len;
  wire [2:0]   auto_in_ar_bits_size_0 = auto_in_ar_bits_size;
  wire [1:0]   auto_in_ar_bits_burst_0 = auto_in_ar_bits_burst;
  wire         auto_in_ar_bits_lock_0 = auto_in_ar_bits_lock;
  wire [3:0]   auto_in_ar_bits_cache_0 = auto_in_ar_bits_cache;
  wire [2:0]   auto_in_ar_bits_prot_0 = auto_in_ar_bits_prot;
  wire [3:0]   auto_in_ar_bits_qos_0 = auto_in_ar_bits_qos;
  wire [3:0]   auto_in_ar_bits_echo_tl_state_size_0 = auto_in_ar_bits_echo_tl_state_size;
  wire [7:0]   auto_in_ar_bits_echo_tl_state_source_0 =
    auto_in_ar_bits_echo_tl_state_source;
  wire         auto_in_r_ready_0 = auto_in_r_ready;
  wire         auto_out_aw_ready_0 = auto_out_aw_ready;
  wire         auto_out_w_ready_0 = auto_out_w_ready;
  wire         auto_out_b_valid_0 = auto_out_b_valid;
  wire [3:0]   auto_out_b_bits_id_0 = auto_out_b_bits_id;
  wire [1:0]   auto_out_b_bits_resp_0 = auto_out_b_bits_resp;
  wire [3:0]   auto_out_b_bits_echo_tl_state_size_0 = auto_out_b_bits_echo_tl_state_size;
  wire [7:0]   auto_out_b_bits_echo_tl_state_source_0 =
    auto_out_b_bits_echo_tl_state_source;
  wire [3:0]   auto_out_b_bits_echo_extra_id_0 = auto_out_b_bits_echo_extra_id;
  wire         auto_out_ar_ready_0 = auto_out_ar_ready;
  wire         auto_out_r_valid_0 = auto_out_r_valid;
  wire [3:0]   auto_out_r_bits_id_0 = auto_out_r_bits_id;
  wire [127:0] auto_out_r_bits_data_0 = auto_out_r_bits_data;
  wire [1:0]   auto_out_r_bits_resp_0 = auto_out_r_bits_resp;
  wire [3:0]   auto_out_r_bits_echo_tl_state_size_0 = auto_out_r_bits_echo_tl_state_size;
  wire [7:0]   auto_out_r_bits_echo_tl_state_source_0 =
    auto_out_r_bits_echo_tl_state_source;
  wire [3:0]   auto_out_r_bits_echo_extra_id_0 = auto_out_r_bits_echo_extra_id;
  wire         auto_out_r_bits_last_0 = auto_out_r_bits_last;
  wire         nodeIn_aw_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_aw_valid = auto_in_aw_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   nodeIn_aw_bits_id = auto_in_aw_bits_id_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0]  nodeIn_aw_bits_addr = auto_in_aw_bits_addr_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   nodeIn_aw_bits_len = auto_in_aw_bits_len_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   nodeIn_aw_bits_size = auto_in_aw_bits_size_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]   nodeIn_aw_bits_burst = auto_in_aw_bits_burst_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_aw_bits_lock = auto_in_aw_bits_lock_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]   nodeIn_aw_bits_cache = auto_in_aw_bits_cache_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   nodeIn_aw_bits_prot = auto_in_aw_bits_prot_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]   nodeIn_aw_bits_qos = auto_in_aw_bits_qos_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]   nodeIn_aw_bits_echo_tl_state_size = auto_in_aw_bits_echo_tl_state_size_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   nodeIn_aw_bits_echo_tl_state_source =
    auto_in_aw_bits_echo_tl_state_source_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_w_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_w_valid = auto_in_w_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [127:0] nodeIn_w_bits_data = auto_in_w_bits_data_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [15:0]  nodeIn_w_bits_strb = auto_in_w_bits_strb_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_w_bits_last = auto_in_w_bits_last_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_b_ready = auto_in_b_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_b_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   nodeIn_b_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]   nodeIn_b_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]   nodeIn_b_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   nodeIn_b_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_ar_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_ar_valid = auto_in_ar_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   nodeIn_ar_bits_id = auto_in_ar_bits_id_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0]  nodeIn_ar_bits_addr = auto_in_ar_bits_addr_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   nodeIn_ar_bits_len = auto_in_ar_bits_len_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   nodeIn_ar_bits_size = auto_in_ar_bits_size_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]   nodeIn_ar_bits_burst = auto_in_ar_bits_burst_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_ar_bits_lock = auto_in_ar_bits_lock_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]   nodeIn_ar_bits_cache = auto_in_ar_bits_cache_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]   nodeIn_ar_bits_prot = auto_in_ar_bits_prot_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]   nodeIn_ar_bits_qos = auto_in_ar_bits_qos_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]   nodeIn_ar_bits_echo_tl_state_size = auto_in_ar_bits_echo_tl_state_size_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   nodeIn_ar_bits_echo_tl_state_source =
    auto_in_ar_bits_echo_tl_state_source_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_r_ready = auto_in_r_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_r_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   nodeIn_r_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [127:0] nodeIn_r_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]   nodeIn_r_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]   nodeIn_r_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   nodeIn_r_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeIn_r_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeOut_aw_ready = auto_out_aw_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_aw_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_aw_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0]  nodeOut_aw_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]   nodeOut_aw_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   nodeOut_aw_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]   nodeOut_aw_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_aw_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_aw_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   nodeOut_aw_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_aw_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_aw_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]   nodeOut_aw_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_aw_bits_echo_extra_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_w_ready = auto_out_w_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_w_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [127:0] nodeOut_w_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [15:0]  nodeOut_w_bits_strb;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_w_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_b_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_b_valid = auto_out_b_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_b_bits_id = auto_out_b_bits_id_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]   nodeOut_b_bits_resp = auto_out_b_bits_resp_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_b_bits_echo_tl_state_size = auto_out_b_bits_echo_tl_state_size_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]   nodeOut_b_bits_echo_tl_state_source =
    auto_out_b_bits_echo_tl_state_source_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_b_bits_echo_extra_id = auto_out_b_bits_echo_extra_id_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_ar_ready = auto_out_ar_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_ar_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_ar_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0]  nodeOut_ar_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]   nodeOut_ar_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   nodeOut_ar_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]   nodeOut_ar_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_ar_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_ar_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   nodeOut_ar_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_ar_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_ar_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]   nodeOut_ar_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_ar_bits_echo_extra_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_r_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_r_valid = auto_out_r_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_r_bits_id = auto_out_r_bits_id_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [127:0] nodeOut_r_bits_data = auto_out_r_bits_data_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]   nodeOut_r_bits_resp = auto_out_r_bits_resp_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_r_bits_echo_tl_state_size = auto_out_r_bits_echo_tl_state_size_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]   nodeOut_r_bits_echo_tl_state_source =
    auto_out_r_bits_echo_tl_state_source_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_r_bits_echo_extra_id = auto_out_r_bits_echo_extra_id_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_r_bits_last = auto_out_r_bits_last_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_in_aw_ready_0 = nodeIn_aw_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeOut_aw_valid = nodeIn_aw_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_addr = nodeIn_aw_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_len = nodeIn_aw_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_size = nodeIn_aw_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_burst = nodeIn_aw_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_lock = nodeIn_aw_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_cache = nodeIn_aw_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_prot = nodeIn_aw_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_qos = nodeIn_aw_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_echo_tl_state_size = nodeIn_aw_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_echo_tl_state_source = nodeIn_aw_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire         auto_in_w_ready_0 = nodeIn_w_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeOut_w_valid = nodeIn_w_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_w_bits_data = nodeIn_w_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_w_bits_strb = nodeIn_w_bits_strb;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_w_bits_last = nodeIn_w_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_b_ready = nodeIn_b_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire         auto_in_b_valid_0 = nodeIn_b_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   auto_in_b_bits_id_0 = nodeIn_b_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]   auto_in_b_bits_resp_0 = nodeIn_b_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]   auto_in_b_bits_echo_tl_state_size_0 = nodeIn_b_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   auto_in_b_bits_echo_tl_state_source_0 = nodeIn_b_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         auto_in_ar_ready_0 = nodeIn_ar_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeOut_ar_valid = nodeIn_ar_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_addr = nodeIn_ar_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_len = nodeIn_ar_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_size = nodeIn_ar_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_burst = nodeIn_ar_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_lock = nodeIn_ar_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_cache = nodeIn_ar_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_prot = nodeIn_ar_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_qos = nodeIn_ar_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_echo_tl_state_size = nodeIn_ar_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_echo_tl_state_source = nodeIn_ar_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_r_ready = nodeIn_r_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire         auto_in_r_valid_0 = nodeIn_r_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   auto_in_r_bits_id_0 = nodeIn_r_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [127:0] auto_in_r_bits_data_0 = nodeIn_r_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]   auto_in_r_bits_resp_0 = nodeIn_r_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]   auto_in_r_bits_echo_tl_state_size_0 = nodeIn_r_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]   auto_in_r_bits_echo_tl_state_source_0 = nodeIn_r_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         auto_in_r_bits_last_0 = nodeIn_r_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeIn_aw_ready = nodeOut_aw_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire         auto_out_aw_valid_0 = nodeOut_aw_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   auto_out_aw_bits_id_0 = nodeOut_aw_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0]  auto_out_aw_bits_addr_0 = nodeOut_aw_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]   auto_out_aw_bits_len_0 = nodeOut_aw_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   auto_out_aw_bits_size_0 = nodeOut_aw_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]   auto_out_aw_bits_burst_0 = nodeOut_aw_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_aw_bits_lock_0 = nodeOut_aw_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   auto_out_aw_bits_cache_0 = nodeOut_aw_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   auto_out_aw_bits_prot_0 = nodeOut_aw_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   auto_out_aw_bits_qos_0 = nodeOut_aw_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   auto_out_aw_bits_echo_tl_state_size_0 = nodeOut_aw_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]   auto_out_aw_bits_echo_tl_state_source_0 =
    nodeOut_aw_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   auto_out_aw_bits_echo_extra_id_0 = nodeOut_aw_bits_echo_extra_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign nodeIn_w_ready = nodeOut_w_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire         auto_out_w_valid_0 = nodeOut_w_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [127:0] auto_out_w_bits_data_0 = nodeOut_w_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [15:0]  auto_out_w_bits_strb_0 = nodeOut_w_bits_strb;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_w_bits_last_0 = nodeOut_w_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_b_ready_0 = nodeOut_b_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign nodeIn_b_valid = nodeOut_b_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_b_bits_resp = nodeOut_b_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_b_bits_echo_tl_state_size = nodeOut_b_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_b_bits_echo_tl_state_source = nodeOut_b_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_ar_ready = nodeOut_ar_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire         auto_out_ar_valid_0 = nodeOut_ar_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   auto_out_ar_bits_id_0 = nodeOut_ar_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0]  auto_out_ar_bits_addr_0 = nodeOut_ar_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]   auto_out_ar_bits_len_0 = nodeOut_ar_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   auto_out_ar_bits_size_0 = nodeOut_ar_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]   auto_out_ar_bits_burst_0 = nodeOut_ar_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_ar_bits_lock_0 = nodeOut_ar_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   auto_out_ar_bits_cache_0 = nodeOut_ar_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   auto_out_ar_bits_prot_0 = nodeOut_ar_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   auto_out_ar_bits_qos_0 = nodeOut_ar_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   auto_out_ar_bits_echo_tl_state_size_0 = nodeOut_ar_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]   auto_out_ar_bits_echo_tl_state_source_0 =
    nodeOut_ar_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   auto_out_ar_bits_echo_extra_id_0 = nodeOut_ar_bits_echo_extra_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         auto_out_r_ready_0 = nodeOut_r_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign nodeIn_r_valid = nodeOut_r_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_r_bits_data = nodeOut_r_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_r_bits_resp = nodeOut_r_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_r_bits_echo_tl_state_size = nodeOut_r_bits_echo_tl_state_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_r_bits_echo_tl_state_source = nodeOut_r_bits_echo_tl_state_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_r_bits_last = nodeOut_r_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_id = nodeIn_ar_bits_id[3:0];	// src/main/scala/amba/axi4/IdIndexer.scala:65:43, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_id = nodeIn_aw_bits_id[3:0];	// src/main/scala/amba/axi4/IdIndexer.scala:68:43, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_ar_bits_echo_extra_id = nodeIn_ar_bits_id[7:4];	// src/main/scala/amba/axi4/IdIndexer.scala:83:56, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_aw_bits_echo_extra_id = nodeIn_aw_bits_id[7:4];	// src/main/scala/amba/axi4/IdIndexer.scala:84:56, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_r_bits_id = {nodeOut_r_bits_echo_extra_id, nodeOut_r_bits_id};	// src/main/scala/amba/axi4/IdIndexer.scala:92:30, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_b_bits_id = {nodeOut_b_bits_echo_extra_id, nodeOut_b_bits_id};	// src/main/scala/amba/axi4/IdIndexer.scala:93:30, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign auto_in_aw_ready = auto_in_aw_ready_0;
  assign auto_in_w_ready = auto_in_w_ready_0;
  assign auto_in_b_valid = auto_in_b_valid_0;
  assign auto_in_b_bits_id = auto_in_b_bits_id_0;
  assign auto_in_b_bits_resp = auto_in_b_bits_resp_0;
  assign auto_in_b_bits_echo_tl_state_size = auto_in_b_bits_echo_tl_state_size_0;
  assign auto_in_b_bits_echo_tl_state_source = auto_in_b_bits_echo_tl_state_source_0;
  assign auto_in_ar_ready = auto_in_ar_ready_0;
  assign auto_in_r_valid = auto_in_r_valid_0;
  assign auto_in_r_bits_id = auto_in_r_bits_id_0;
  assign auto_in_r_bits_data = auto_in_r_bits_data_0;
  assign auto_in_r_bits_resp = auto_in_r_bits_resp_0;
  assign auto_in_r_bits_echo_tl_state_size = auto_in_r_bits_echo_tl_state_size_0;
  assign auto_in_r_bits_echo_tl_state_source = auto_in_r_bits_echo_tl_state_source_0;
  assign auto_in_r_bits_last = auto_in_r_bits_last_0;
  assign auto_out_aw_valid = auto_out_aw_valid_0;
  assign auto_out_aw_bits_id = auto_out_aw_bits_id_0;
  assign auto_out_aw_bits_addr = auto_out_aw_bits_addr_0;
  assign auto_out_aw_bits_len = auto_out_aw_bits_len_0;
  assign auto_out_aw_bits_size = auto_out_aw_bits_size_0;
  assign auto_out_aw_bits_burst = auto_out_aw_bits_burst_0;
  assign auto_out_aw_bits_lock = auto_out_aw_bits_lock_0;
  assign auto_out_aw_bits_cache = auto_out_aw_bits_cache_0;
  assign auto_out_aw_bits_prot = auto_out_aw_bits_prot_0;
  assign auto_out_aw_bits_qos = auto_out_aw_bits_qos_0;
  assign auto_out_aw_bits_echo_tl_state_size = auto_out_aw_bits_echo_tl_state_size_0;
  assign auto_out_aw_bits_echo_tl_state_source = auto_out_aw_bits_echo_tl_state_source_0;
  assign auto_out_aw_bits_echo_extra_id = auto_out_aw_bits_echo_extra_id_0;
  assign auto_out_w_valid = auto_out_w_valid_0;
  assign auto_out_w_bits_data = auto_out_w_bits_data_0;
  assign auto_out_w_bits_strb = auto_out_w_bits_strb_0;
  assign auto_out_w_bits_last = auto_out_w_bits_last_0;
  assign auto_out_b_ready = auto_out_b_ready_0;
  assign auto_out_ar_valid = auto_out_ar_valid_0;
  assign auto_out_ar_bits_id = auto_out_ar_bits_id_0;
  assign auto_out_ar_bits_addr = auto_out_ar_bits_addr_0;
  assign auto_out_ar_bits_len = auto_out_ar_bits_len_0;
  assign auto_out_ar_bits_size = auto_out_ar_bits_size_0;
  assign auto_out_ar_bits_burst = auto_out_ar_bits_burst_0;
  assign auto_out_ar_bits_lock = auto_out_ar_bits_lock_0;
  assign auto_out_ar_bits_cache = auto_out_ar_bits_cache_0;
  assign auto_out_ar_bits_prot = auto_out_ar_bits_prot_0;
  assign auto_out_ar_bits_qos = auto_out_ar_bits_qos_0;
  assign auto_out_ar_bits_echo_tl_state_size = auto_out_ar_bits_echo_tl_state_size_0;
  assign auto_out_ar_bits_echo_tl_state_source = auto_out_ar_bits_echo_tl_state_source_0;
  assign auto_out_ar_bits_echo_extra_id = auto_out_ar_bits_echo_extra_id_0;
  assign auto_out_r_ready = auto_out_r_ready_0;
endmodule

