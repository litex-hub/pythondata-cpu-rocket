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

module TLBroadcastTracker_1(
  input          clock,
                 reset,
                 io_in_a_first,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output         io_in_a_ready,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input          io_in_a_valid,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input  [2:0]   io_in_a_bits_opcode,	// src/main/scala/tilelink/Broadcast.scala:401:14
                 io_in_a_bits_param,	// src/main/scala/tilelink/Broadcast.scala:401:14
                 io_in_a_bits_size,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input  [4:0]   io_in_a_bits_source,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input  [31:0]  io_in_a_bits_address,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input  [63:0]  io_in_a_bits_mask,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input  [511:0] io_in_a_bits_data,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input          io_in_a_bits_corrupt,	// src/main/scala/tilelink/Broadcast.scala:401:14
                 io_out_a_ready,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output         io_out_a_valid,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output [2:0]   io_out_a_bits_opcode,	// src/main/scala/tilelink/Broadcast.scala:401:14
                 io_out_a_bits_param,	// src/main/scala/tilelink/Broadcast.scala:401:14
                 io_out_a_bits_size,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output [6:0]   io_out_a_bits_source,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output [31:0]  io_out_a_bits_address,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output [63:0]  io_out_a_bits_mask,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output [511:0] io_out_a_bits_data,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input          io_probe_valid,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input  [1:0]   io_probe_bits_count,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input          io_probenack,	// src/main/scala/tilelink/Broadcast.scala:401:14
                 io_probedack,	// src/main/scala/tilelink/Broadcast.scala:401:14
                 io_probesack,	// src/main/scala/tilelink/Broadcast.scala:401:14
                 io_d_last,	// src/main/scala/tilelink/Broadcast.scala:401:14
                 io_e_last,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output [4:0]   io_source,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output [25:0]  io_line,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output         io_idle,	// src/main/scala/tilelink/Broadcast.scala:401:14
                 io_need_d,	// src/main/scala/tilelink/Broadcast.scala:401:14
  output [1:0]   io_cacheOH,	// src/main/scala/tilelink/Broadcast.scala:401:14
  input  [1:0]   io_clearOH	// src/main/scala/tilelink/Broadcast.scala:401:14
);

  wire [511:0] io_out_a_bits_data_0;
  wire [63:0]  io_out_a_bits_mask_0;
  wire         _o_data_q_io_deq_valid;	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  wire         io_in_a_first_0 = io_in_a_first;
  wire         io_in_a_valid_0 = io_in_a_valid;
  wire [2:0]   io_in_a_bits_opcode_0 = io_in_a_bits_opcode;
  wire [2:0]   io_in_a_bits_param_0 = io_in_a_bits_param;
  wire [2:0]   io_in_a_bits_size_0 = io_in_a_bits_size;
  wire [4:0]   io_in_a_bits_source_0 = io_in_a_bits_source;
  wire [31:0]  io_in_a_bits_address_0 = io_in_a_bits_address;
  wire [63:0]  io_in_a_bits_mask_0 = io_in_a_bits_mask;
  wire [511:0] io_in_a_bits_data_0 = io_in_a_bits_data;
  wire         io_in_a_bits_corrupt_0 = io_in_a_bits_corrupt;
  wire         io_out_a_ready_0 = io_out_a_ready;
  wire         io_probe_valid_0 = io_probe_valid;
  wire [1:0]   io_probe_bits_count_0 = io_probe_bits_count;
  wire         io_probenack_0 = io_probenack;
  wire         io_probedack_0 = io_probedack;
  wire         io_probesack_0 = io_probesack;
  wire         io_d_last_0 = io_d_last;
  wire         io_e_last_0 = io_e_last;
  wire [1:0]   io_clearOH_0 = io_clearOH;
  wire         io_in_a_bits_user_amba_prot_bufferable = 1'h0;
  wire         io_in_a_bits_user_amba_prot_modifiable = 1'h0;
  wire         io_in_a_bits_user_amba_prot_readalloc = 1'h0;
  wire         io_in_a_bits_user_amba_prot_writealloc = 1'h0;
  wire         io_in_a_bits_user_amba_prot_privileged = 1'h0;
  wire         io_in_a_bits_user_amba_prot_secure = 1'h0;
  wire         io_in_a_bits_user_amba_prot_fetch = 1'h0;
  wire         io_out_a_bits_user_amba_prot_bufferable = 1'h0;
  wire         io_out_a_bits_user_amba_prot_modifiable = 1'h0;
  wire         io_out_a_bits_user_amba_prot_readalloc = 1'h0;
  wire         io_out_a_bits_user_amba_prot_writealloc = 1'h0;
  wire         io_out_a_bits_user_amba_prot_privileged = 1'h0;
  wire         io_out_a_bits_user_amba_prot_secure = 1'h0;
  wire         io_out_a_bits_user_amba_prot_fetch = 1'h0;
  wire         io_out_a_bits_corrupt = 1'h0;
  wire [1:0]   io_probe_bits_cacheOH = 2'h3;
  wire [63:0]  i_data_bits_mask = io_in_a_bits_mask_0;	// src/main/scala/tilelink/Broadcast.scala:483:20
  wire [511:0] i_data_bits_data = io_in_a_bits_data_0;	// src/main/scala/tilelink/Broadcast.scala:483:20
  wire         idle;	// src/main/scala/tilelink/Broadcast.scala:436:23
  reg          got_e;	// src/main/scala/tilelink/Broadcast.scala:424:24
  reg          sent_d;	// src/main/scala/tilelink/Broadcast.scala:425:24
  reg          shared;	// src/main/scala/tilelink/Broadcast.scala:426:20
  reg  [2:0]   opcode;	// src/main/scala/tilelink/Broadcast.scala:427:20
  reg  [2:0]   param;	// src/main/scala/tilelink/Broadcast.scala:428:20
  reg  [2:0]   size;	// src/main/scala/tilelink/Broadcast.scala:429:20
  wire [2:0]   io_out_a_bits_size_0 = size;	// src/main/scala/tilelink/Broadcast.scala:429:20
  reg  [4:0]   source;	// src/main/scala/tilelink/Broadcast.scala:430:20
  wire [4:0]   io_source_0 = source;	// src/main/scala/tilelink/Broadcast.scala:430:20
  reg  [31:0]  address;	// src/main/scala/tilelink/Broadcast.scala:433:24
  wire [31:0]  io_out_a_bits_address_0 = address;	// src/main/scala/tilelink/Broadcast.scala:433:24
  reg  [1:0]   count;	// src/main/scala/tilelink/Broadcast.scala:434:20
  reg  [1:0]   cacheOH;	// src/main/scala/tilelink/Broadcast.scala:435:20
  wire [1:0]   io_cacheOH_0 = cacheOH;	// src/main/scala/tilelink/Broadcast.scala:435:20
  assign idle = got_e & sent_d;	// src/main/scala/tilelink/Broadcast.scala:424:24, :425:24, :436:23
  wire         io_in_a_ready_0;
  wire         io_idle_0 = idle;	// src/main/scala/tilelink/Broadcast.scala:436:23
  wire         _GEN = io_in_a_ready_0 & io_in_a_valid_0 & io_in_a_first_0;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Broadcast.scala:438:22
  wire         _GEN_0 = io_probenack_0 | io_probedack_0;	// src/main/scala/tilelink/Broadcast.scala:468:22
  wire         probe_done = count == 2'h0;	// src/main/scala/tilelink/Broadcast.scala:434:20, :469:19, :491:26
  `ifndef SYNTHESIS	// src/main/scala/tilelink/Broadcast.scala:439:12
    always @(posedge clock) begin	// src/main/scala/tilelink/Broadcast.scala:439:12
      if (_GEN & ~reset & ~idle) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Broadcast.scala:436:23, :438:22, :439:12
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/tilelink/Broadcast.scala:439:12
          $error("Assertion failed\n    at Broadcast.scala:439 assert (idle)\n");	// src/main/scala/tilelink/Broadcast.scala:439:12
        if (`STOP_COND_)	// src/main/scala/tilelink/Broadcast.scala:439:12
          $fatal;	// src/main/scala/tilelink/Broadcast.scala:439:12
      end
      if (io_d_last_0 & ~reset & sent_d) begin	// src/main/scala/tilelink/Broadcast.scala:425:24, :439:12, :460:12
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/tilelink/Broadcast.scala:460:12
          $error("Assertion failed\n    at Broadcast.scala:460 assert (!sent_d)\n");	// src/main/scala/tilelink/Broadcast.scala:460:12
        if (`STOP_COND_)	// src/main/scala/tilelink/Broadcast.scala:460:12
          $fatal;	// src/main/scala/tilelink/Broadcast.scala:460:12
      end
      if (io_e_last_0 & ~reset & got_e) begin	// src/main/scala/tilelink/Broadcast.scala:424:24, :439:12, :464:12
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/tilelink/Broadcast.scala:464:12
          $error("Assertion failed\n    at Broadcast.scala:464 assert (!got_e)\n");	// src/main/scala/tilelink/Broadcast.scala:464:12
        if (`STOP_COND_)	// src/main/scala/tilelink/Broadcast.scala:464:12
          $fatal;	// src/main/scala/tilelink/Broadcast.scala:464:12
      end
      if (_GEN_0 & ~reset & probe_done) begin	// src/main/scala/tilelink/Broadcast.scala:439:12, :468:22, :469:12, :491:26
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/tilelink/Broadcast.scala:469:12
          $error("Assertion failed\n    at Broadcast.scala:469 assert (count > 0.U)\n");	// src/main/scala/tilelink/Broadcast.scala:469:12
        if (`STOP_COND_)	// src/main/scala/tilelink/Broadcast.scala:469:12
          $fatal;	// src/main/scala/tilelink/Broadcast.scala:469:12
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire         io_need_d_0 = ~sent_d;	// src/main/scala/tilelink/Broadcast.scala:425:24, :478:16
  wire [25:0]  io_line_0 = address[31:6];	// src/main/scala/tilelink/Broadcast.scala:433:24, :480:22
  wire         i_data_ready;	// src/main/scala/tilelink/Broadcast.scala:483:20
  assign io_in_a_ready_0 = (idle | ~io_in_a_first_0) & i_data_ready;	// src/main/scala/tilelink/Broadcast.scala:436:23, :483:20, :486:{26,29,45}
  wire         i_data_valid = (idle | ~io_in_a_first_0) & io_in_a_valid_0;	// src/main/scala/tilelink/Broadcast.scala:436:23, :483:20, :486:29, :487:{25,44}
  wire         acquire = opcode == 3'h6 | (&opcode);	// src/main/scala/tilelink/Broadcast.scala:427:20, :492:{24,52,62}
  wire [1:0]   transform = {1'h1, ~shared};	// src/main/scala/tilelink/Broadcast.scala:426:20, :494:22
  wire         io_out_a_valid_0 = _o_data_q_io_deq_valid & probe_done;	// src/main/scala/chisel3/util/Decoupled.scala:376:21, src/main/scala/tilelink/Broadcast.scala:491:26, :497:34
  wire [2:0]   io_out_a_bits_opcode_0 = acquire ? 3'h4 : opcode;	// src/main/scala/tilelink/Broadcast.scala:427:20, :492:52, :498:31
  wire [2:0]   io_out_a_bits_param_0 = acquire ? 3'h0 : param;	// src/main/scala/tilelink/Broadcast.scala:428:20, :492:52, :499:31
  wire [6:0]   io_out_a_bits_source_0 = {acquire ? transform : 2'h0, source};	// src/main/scala/tilelink/Broadcast.scala:430:20, :492:52, :494:22, :501:{31,35}
  always @(posedge clock) begin
    if (reset) begin
      got_e <= 1'h1;	// src/main/scala/tilelink/Broadcast.scala:424:24
      sent_d <= 1'h1;	// src/main/scala/tilelink/Broadcast.scala:425:24
      address <= 32'h40;	// src/main/scala/tilelink/Broadcast.scala:433:24
    end
    else begin
      got_e <=
        io_e_last_0
        | (_GEN ? io_in_a_bits_opcode_0 != 3'h6 & io_in_a_bits_opcode_0 != 3'h7 : got_e);	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Broadcast.scala:424:24, :438:{22,40}, :442:{13,36,64,87}, :463:20, :465:11
      sent_d <= io_d_last_0 | ~_GEN & sent_d;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Broadcast.scala:425:24, :438:{22,40}, :440:13, :459:20, :461:12
      if (_GEN)	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Broadcast.scala:438:22
        address <= io_in_a_bits_address_0;	// src/main/scala/tilelink/Broadcast.scala:433:24
    end
    shared <= io_probesack_0 | ~_GEN & shared;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Broadcast.scala:425:24, :426:20, :438:{22,40}, :440:13, :441:13, :473:23, :474:12
    if (_GEN) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Broadcast.scala:438:22
      opcode <= io_in_a_bits_opcode_0;	// src/main/scala/tilelink/Broadcast.scala:427:20
      param <= io_in_a_bits_param_0;	// src/main/scala/tilelink/Broadcast.scala:428:20
      size <= io_in_a_bits_size_0;	// src/main/scala/tilelink/Broadcast.scala:429:20
      source <= io_in_a_bits_source_0;	// src/main/scala/tilelink/Broadcast.scala:430:20
    end
    if (_GEN_0)	// src/main/scala/tilelink/Broadcast.scala:468:22
      count <= count - (io_probenack_0 & io_probedack_0 ? 2'h2 : 2'h1);	// src/main/scala/tilelink/Broadcast.scala:434:20, :470:{20,25,39}
    else if (io_probe_valid_0)
      count <= io_probe_bits_count_0;	// src/main/scala/tilelink/Broadcast.scala:434:20
    else if (_GEN)	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Broadcast.scala:438:22
      count <= 2'h1;	// src/main/scala/tilelink/Broadcast.scala:434:20
    if (io_probe_valid_0)
      cacheOH <= 2'h3;	// src/main/scala/tilelink/Broadcast.scala:435:20
    else
      cacheOH <= cacheOH & ~io_clearOH_0;	// src/main/scala/tilelink/Broadcast.scala:435:20, :453:{22,24}
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
        got_e = _RANDOM[1'h0][0];	// src/main/scala/tilelink/Broadcast.scala:424:24
        sent_d = _RANDOM[1'h0][1];	// src/main/scala/tilelink/Broadcast.scala:424:24, :425:24
        shared = _RANDOM[1'h0][2];	// src/main/scala/tilelink/Broadcast.scala:424:24, :426:20
        opcode = _RANDOM[1'h0][5:3];	// src/main/scala/tilelink/Broadcast.scala:424:24, :427:20
        param = _RANDOM[1'h0][8:6];	// src/main/scala/tilelink/Broadcast.scala:424:24, :428:20
        size = _RANDOM[1'h0][11:9];	// src/main/scala/tilelink/Broadcast.scala:424:24, :429:20
        source = _RANDOM[1'h0][16:12];	// src/main/scala/tilelink/Broadcast.scala:424:24, :430:20
        address = {_RANDOM[1'h0][31:24], _RANDOM[1'h1][23:0]};	// src/main/scala/tilelink/Broadcast.scala:424:24, :433:24
        count = _RANDOM[1'h1][25:24];	// src/main/scala/tilelink/Broadcast.scala:433:24, :434:20
        cacheOH = _RANDOM[1'h1][27:26];	// src/main/scala/tilelink/Broadcast.scala:433:24, :435:20
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  Queue_83 o_data_q (	// src/main/scala/chisel3/util/Decoupled.scala:376:21
    .clock            (clock),
    .reset            (reset),
    .io_enq_ready     (i_data_ready),
    .io_enq_valid     (i_data_valid),	// src/main/scala/tilelink/Broadcast.scala:483:20
    .io_enq_bits_mask (i_data_bits_mask),	// src/main/scala/tilelink/Broadcast.scala:483:20
    .io_enq_bits_data (i_data_bits_data),	// src/main/scala/tilelink/Broadcast.scala:483:20
    .io_deq_ready     (io_out_a_ready_0 & probe_done),	// src/main/scala/tilelink/Broadcast.scala:491:26, :496:34
    .io_deq_valid     (_o_data_q_io_deq_valid),
    .io_deq_bits_mask (io_out_a_bits_mask_0),
    .io_deq_bits_data (io_out_a_bits_data_0)
  );	// src/main/scala/chisel3/util/Decoupled.scala:376:21
  assign io_in_a_ready = io_in_a_ready_0;
  assign io_out_a_valid = io_out_a_valid_0;
  assign io_out_a_bits_opcode = io_out_a_bits_opcode_0;
  assign io_out_a_bits_param = io_out_a_bits_param_0;
  assign io_out_a_bits_size = io_out_a_bits_size_0;
  assign io_out_a_bits_source = io_out_a_bits_source_0;
  assign io_out_a_bits_address = io_out_a_bits_address_0;
  assign io_out_a_bits_mask = io_out_a_bits_mask_0;
  assign io_out_a_bits_data = io_out_a_bits_data_0;
  assign io_source = io_source_0;
  assign io_line = io_line_0;
  assign io_idle = io_idle_0;
  assign io_need_d = io_need_d_0;
  assign io_cacheOH = io_cacheOH_0;
endmodule

