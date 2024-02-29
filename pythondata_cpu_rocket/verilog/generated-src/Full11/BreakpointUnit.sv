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

module BreakpointUnit(
  input         io_status_debug,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_cease,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_wfi,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input  [31:0] io_status_isa,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input  [1:0]  io_status_dprv,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input         io_status_dv,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input  [1:0]  io_status_prv,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input         io_status_v,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_sd,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_mpv,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_gva,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_tsr,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_tw,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_tvm,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_mxr,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_sum,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_mprv,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input  [1:0]  io_status_fs,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_mpp,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input         io_status_spp,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_mpie,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_spie,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_mie,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_status_sie,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_bp_0_control_dmode,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_bp_0_control_action,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input  [1:0]  io_bp_0_control_tmatch,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input         io_bp_0_control_m,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_bp_0_control_s,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_bp_0_control_u,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_bp_0_control_x,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_bp_0_control_w,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_bp_0_control_r,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input  [40:0] io_bp_0_address,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input  [47:0] io_bp_0_textra_pad2,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input         io_bp_0_textra_pad1,	// src/main/scala/rocket/Breakpoint.scala:80:14
  input  [40:0] io_pc,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_ea,	// src/main/scala/rocket/Breakpoint.scala:80:14
  output        io_xcpt_if,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_xcpt_ld,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_xcpt_st,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_debug_if,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_debug_ld,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_debug_st,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_bpwatch_0_rvalid_0,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_bpwatch_0_wvalid_0,	// src/main/scala/rocket/Breakpoint.scala:80:14
                io_bpwatch_0_ivalid_0	// src/main/scala/rocket/Breakpoint.scala:80:14
);

  wire        io_status_debug_0 = io_status_debug;
  wire        io_status_cease_0 = io_status_cease;
  wire        io_status_wfi_0 = io_status_wfi;
  wire [31:0] io_status_isa_0 = io_status_isa;
  wire [1:0]  io_status_dprv_0 = io_status_dprv;
  wire        io_status_dv_0 = io_status_dv;
  wire [1:0]  io_status_prv_0 = io_status_prv;
  wire        io_status_v_0 = io_status_v;
  wire        io_status_sd_0 = io_status_sd;
  wire        io_status_mpv_0 = io_status_mpv;
  wire        io_status_gva_0 = io_status_gva;
  wire        io_status_tsr_0 = io_status_tsr;
  wire        io_status_tw_0 = io_status_tw;
  wire        io_status_tvm_0 = io_status_tvm;
  wire        io_status_mxr_0 = io_status_mxr;
  wire        io_status_sum_0 = io_status_sum;
  wire        io_status_mprv_0 = io_status_mprv;
  wire [1:0]  io_status_fs_0 = io_status_fs;
  wire [1:0]  io_status_mpp_0 = io_status_mpp;
  wire        io_status_spp_0 = io_status_spp;
  wire        io_status_mpie_0 = io_status_mpie;
  wire        io_status_spie_0 = io_status_spie;
  wire        io_status_mie_0 = io_status_mie;
  wire        io_status_sie_0 = io_status_sie;
  wire        io_bp_0_control_dmode_0 = io_bp_0_control_dmode;
  wire        io_bp_0_control_action_0 = io_bp_0_control_action;
  wire [1:0]  io_bp_0_control_tmatch_0 = io_bp_0_control_tmatch;
  wire        io_bp_0_control_m_0 = io_bp_0_control_m;
  wire        io_bp_0_control_s_0 = io_bp_0_control_s;
  wire        io_bp_0_control_u_0 = io_bp_0_control_u;
  wire        io_bp_0_control_x_0 = io_bp_0_control_x;
  wire        io_bp_0_control_w_0 = io_bp_0_control_w;
  wire        io_bp_0_control_r_0 = io_bp_0_control_r;
  wire [40:0] io_bp_0_address_0 = io_bp_0_address;
  wire [47:0] io_bp_0_textra_pad2_0 = io_bp_0_textra_pad2;
  wire        io_bp_0_textra_pad1_0 = io_bp_0_textra_pad1;
  wire [40:0] io_pc_0 = io_pc;
  wire [40:0] io_ea_0 = io_ea;
  wire        cx = 1'h1;	// src/main/scala/rocket/Breakpoint.scala:55:126
  wire        end_0 = 1'h1;	// src/main/scala/rocket/Breakpoint.scala:109:15
  wire [1:0]  io_status_sxl = 2'h2;	// src/main/scala/rocket/Breakpoint.scala:80:14
  wire [1:0]  io_status_uxl = 2'h2;	// src/main/scala/rocket/Breakpoint.scala:80:14
  wire [39:0] io_bp_0_control_reserved = 40'h0;	// src/main/scala/rocket/Breakpoint.scala:80:14
  wire [5:0]  io_bp_0_control_maskmax = 6'h4;	// src/main/scala/rocket/Breakpoint.scala:80:14
  wire [3:0]  io_bp_0_control_ttype = 4'h2;	// src/main/scala/rocket/Breakpoint.scala:80:14
  wire [1:0]  io_status_xs = 2'h0;	// src/main/scala/rocket/Breakpoint.scala:80:14
  wire [1:0]  io_status_vs = 2'h0;	// src/main/scala/rocket/Breakpoint.scala:80:14
  wire [1:0]  io_bp_0_control_zero = 2'h0;	// src/main/scala/rocket/Breakpoint.scala:80:14
  wire [7:0]  io_status_zero1 = 8'h0;	// src/main/scala/rocket/Breakpoint.scala:80:14
  wire        io_status_mbe = 1'h0;
  wire        io_status_sbe = 1'h0;
  wire        io_status_sd_rv32 = 1'h0;
  wire        io_status_ube = 1'h0;
  wire        io_status_upie = 1'h0;
  wire        io_status_hie = 1'h0;
  wire        io_status_uie = 1'h0;
  wire        io_bp_0_control_chain = 1'h0;
  wire        io_bp_0_control_h = 1'h0;
  wire        io_bp_0_textra_mselect = 1'h0;
  wire        io_bp_0_textra_sselect = 1'h0;
  wire [22:0] io_status_zero2 = 23'h0;	// src/main/scala/rocket/Breakpoint.scala:80:14
  wire        r;	// src/main/scala/rocket/Breakpoint.scala:106:58
  wire        w;	// src/main/scala/rocket/Breakpoint.scala:107:58
  wire        x;	// src/main/scala/rocket/Breakpoint.scala:108:58
  wire [1:0]  en_lo = {io_bp_0_control_s_0, io_bp_0_control_u_0};	// src/main/scala/rocket/Breakpoint.scala:30:56
  wire [1:0]  en_hi = {io_bp_0_control_m_0, 1'h0};	// src/main/scala/rocket/Breakpoint.scala:30:56
  wire [3:0]  _en_T_2 = {en_hi, en_lo} >> io_status_prv_0;	// src/main/scala/rocket/Breakpoint.scala:30:{56,68}
  wire        en = ~io_status_debug_0 & _en_T_2[0];	// src/main/scala/rocket/Breakpoint.scala:30:{35,50,68}
  wire        _w_T_2 = io_ea_0 >= io_bp_0_address_0;	// src/main/scala/rocket/Breakpoint.scala:65:8
  wire [40:0] _w_T_5 = ~io_ea_0;	// src/main/scala/rocket/Breakpoint.scala:62:6
  wire        _r_T_8 = io_bp_0_control_tmatch_0[0] & io_bp_0_address_0[0];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, :65:36
  wire        _r_T_10 = _r_T_8 & io_bp_0_address_0[1];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}
  wire [1:0]  r_lo = {_r_T_8, io_bp_0_control_tmatch_0[0]};	// src/main/scala/rocket/Breakpoint.scala:59:73, :65:36, src/main/scala/util/package.scala:37:27
  wire [1:0]  r_hi = {_r_T_10 & io_bp_0_address_0[2], _r_T_10};	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, src/main/scala/util/package.scala:37:27
  wire [40:0] _x_T_15 = ~io_bp_0_address_0;	// src/main/scala/rocket/Breakpoint.scala:62:24
  wire        _r_T_18 = io_bp_0_control_tmatch_0[0] & io_bp_0_address_0[0];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, :65:36
  wire        _r_T_20 = _r_T_18 & io_bp_0_address_0[1];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}
  wire [1:0]  r_lo_1 = {_r_T_18, io_bp_0_control_tmatch_0[0]};	// src/main/scala/rocket/Breakpoint.scala:59:73, :65:36, src/main/scala/util/package.scala:37:27
  wire [1:0]  r_hi_1 = {_r_T_20 & io_bp_0_address_0[2], _r_T_20};	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, src/main/scala/util/package.scala:37:27
  assign r =
    en & io_bp_0_control_r_0
    & (io_bp_0_control_tmatch_0[1]
         ? _w_T_2 ^ io_bp_0_control_tmatch_0[0]
         : {_w_T_5[40:4],
            _w_T_5[3:0]
              | {r_hi, r_lo}} == {_x_T_15[40:4], _x_T_15[3:0] | {r_hi_1, r_lo_1}});	// src/main/scala/rocket/Breakpoint.scala:30:50, :62:{6,9,19,24,33}, :65:{8,20,36}, :68:{8,23}, :106:{16,32,58}, src/main/scala/util/package.scala:37:27
  wire        io_bpwatch_0_rvalid_0_0 = r;	// src/main/scala/rocket/Breakpoint.scala:106:58
  wire        _w_T_8 = io_bp_0_control_tmatch_0[0] & io_bp_0_address_0[0];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, :65:36
  wire        _w_T_10 = _w_T_8 & io_bp_0_address_0[1];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}
  wire [1:0]  w_lo = {_w_T_8, io_bp_0_control_tmatch_0[0]};	// src/main/scala/rocket/Breakpoint.scala:59:73, :65:36, src/main/scala/util/package.scala:37:27
  wire [1:0]  w_hi = {_w_T_10 & io_bp_0_address_0[2], _w_T_10};	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, src/main/scala/util/package.scala:37:27
  wire        _w_T_18 = io_bp_0_control_tmatch_0[0] & io_bp_0_address_0[0];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, :65:36
  wire        _w_T_20 = _w_T_18 & io_bp_0_address_0[1];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}
  wire [1:0]  w_lo_1 = {_w_T_18, io_bp_0_control_tmatch_0[0]};	// src/main/scala/rocket/Breakpoint.scala:59:73, :65:36, src/main/scala/util/package.scala:37:27
  wire [1:0]  w_hi_1 = {_w_T_20 & io_bp_0_address_0[2], _w_T_20};	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, src/main/scala/util/package.scala:37:27
  assign w =
    en & io_bp_0_control_w_0
    & (io_bp_0_control_tmatch_0[1]
         ? _w_T_2 ^ io_bp_0_control_tmatch_0[0]
         : {_w_T_5[40:4],
            _w_T_5[3:0]
              | {w_hi, w_lo}} == {_x_T_15[40:4], _x_T_15[3:0] | {w_hi_1, w_lo_1}});	// src/main/scala/rocket/Breakpoint.scala:30:50, :62:{6,9,19,24,33}, :65:{8,20,36}, :68:{8,23}, :107:{16,32,58}, src/main/scala/util/package.scala:37:27
  wire        io_bpwatch_0_wvalid_0_0 = w;	// src/main/scala/rocket/Breakpoint.scala:107:58
  wire [40:0] _x_T_5 = ~io_pc_0;	// src/main/scala/rocket/Breakpoint.scala:62:6
  wire        _x_T_8 = io_bp_0_control_tmatch_0[0] & io_bp_0_address_0[0];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, :65:36
  wire        _x_T_10 = _x_T_8 & io_bp_0_address_0[1];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}
  wire [1:0]  x_lo = {_x_T_8, io_bp_0_control_tmatch_0[0]};	// src/main/scala/rocket/Breakpoint.scala:59:73, :65:36, src/main/scala/util/package.scala:37:27
  wire [1:0]  x_hi = {_x_T_10 & io_bp_0_address_0[2], _x_T_10};	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, src/main/scala/util/package.scala:37:27
  wire        _x_T_18 = io_bp_0_control_tmatch_0[0] & io_bp_0_address_0[0];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, :65:36
  wire        _x_T_20 = _x_T_18 & io_bp_0_address_0[1];	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}
  wire [1:0]  x_lo_1 = {_x_T_18, io_bp_0_control_tmatch_0[0]};	// src/main/scala/rocket/Breakpoint.scala:59:73, :65:36, src/main/scala/util/package.scala:37:27
  wire [1:0]  x_hi_1 = {_x_T_20 & io_bp_0_address_0[2], _x_T_20};	// src/main/scala/rocket/Breakpoint.scala:59:{73,83}, src/main/scala/util/package.scala:37:27
  assign x =
    en & io_bp_0_control_x_0
    & (io_bp_0_control_tmatch_0[1]
         ? io_pc_0 >= io_bp_0_address_0 ^ io_bp_0_control_tmatch_0[0]
         : {_x_T_5[40:4],
            _x_T_5[3:0]
              | {x_hi, x_lo}} == {_x_T_15[40:4], _x_T_15[3:0] | {x_hi_1, x_lo_1}});	// src/main/scala/rocket/Breakpoint.scala:30:50, :62:{6,9,19,24,33}, :65:{8,20,36}, :68:{8,23}, :108:{16,32,58}, src/main/scala/util/package.scala:37:27
  wire        io_bpwatch_0_ivalid_0_0 = x;	// src/main/scala/rocket/Breakpoint.scala:108:58
  wire [2:0]  io_bpwatch_0_action = {2'h0, io_bp_0_control_action_0};	// src/main/scala/rocket/Breakpoint.scala:80:14, :112:16
  wire        io_xcpt_ld_0 = r & ~io_bp_0_control_action_0;	// src/main/scala/rocket/Breakpoint.scala:97:14, :106:58, :118:{27,40,51}
  wire        io_debug_ld_0 = r & io_bp_0_control_action_0;	// src/main/scala/rocket/Breakpoint.scala:100:15, :106:58, :118:{27,73}
  wire        io_xcpt_st_0 = w & ~io_bp_0_control_action_0;	// src/main/scala/rocket/Breakpoint.scala:98:14, :107:58, :119:{27,40,51}
  wire        io_debug_st_0 = w & io_bp_0_control_action_0;	// src/main/scala/rocket/Breakpoint.scala:101:15, :107:58, :119:{27,73}
  wire        io_xcpt_if_0 = x & ~io_bp_0_control_action_0;	// src/main/scala/rocket/Breakpoint.scala:96:14, :108:58, :120:{27,40,51}
  wire        io_debug_if_0 = x & io_bp_0_control_action_0;	// src/main/scala/rocket/Breakpoint.scala:99:15, :108:58, :120:{27,73}
  wire        io_bpwatch_0_valid_0 = x | w | r;	// src/main/scala/rocket/Breakpoint.scala:106:58, :107:58, :108:58, :118:27, :119:{27,107}, :120:{27,107}
  assign io_xcpt_if = io_xcpt_if_0;
  assign io_xcpt_ld = io_xcpt_ld_0;
  assign io_xcpt_st = io_xcpt_st_0;
  assign io_debug_if = io_debug_if_0;
  assign io_debug_ld = io_debug_ld_0;
  assign io_debug_st = io_debug_st_0;
  assign io_bpwatch_0_rvalid_0 = io_bpwatch_0_rvalid_0_0;
  assign io_bpwatch_0_wvalid_0 = io_bpwatch_0_wvalid_0_0;
  assign io_bpwatch_0_ivalid_0 = io_bpwatch_0_ivalid_0_0;
endmodule
