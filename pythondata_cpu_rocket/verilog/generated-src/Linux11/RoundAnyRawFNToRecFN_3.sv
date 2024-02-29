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

module RoundAnyRawFNToRecFN_3(
  input         io_invalidExc,	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16
                io_in_isNaN,	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16
                io_in_isInf,	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16
                io_in_isZero,	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16
                io_in_sign,	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16
  input  [12:0] io_in_sExp,	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16
  input  [53:0] io_in_sig,	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16
  input  [2:0]  io_roundingMode,	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16
  output [32:0] io_out,	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16
  output [4:0]  io_exceptionFlags	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16
);

  wire        io_invalidExc_0 = io_invalidExc;
  wire        io_in_isNaN_0 = io_in_isNaN;
  wire        io_in_isInf_0 = io_in_isInf;
  wire        io_in_isZero_0 = io_in_isZero;
  wire        io_in_sign_0 = io_in_sign;
  wire [12:0] io_in_sExp_0 = io_in_sExp;
  wire [53:0] io_in_sig_0 = io_in_sig;
  wire [2:0]  io_roundingMode_0 = io_roundingMode;
  wire        io_detectTininess = 1'h1;
  wire        io_infiniteExc = 1'h0;
  wire        notNaN_isSpecialInfOut = io_in_isInf_0;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:235:49
  wire        roundingMode_near_even = io_roundingMode_0 == 3'h0;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:89:53
  wire        roundingMode_minMag = io_roundingMode_0 == 3'h1;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:90:53
  wire        roundingMode_min = io_roundingMode_0 == 3'h2;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:91:53
  wire        roundingMode_max = io_roundingMode_0 == 3'h3;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:92:53
  wire        roundingMode_near_maxMag = io_roundingMode_0 == 3'h4;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:93:53
  wire        roundingMode_odd = io_roundingMode_0 == 3'h6;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:94:53
  wire        roundMagUp =
    roundingMode_min & io_in_sign_0 | roundingMode_max & ~io_in_sign_0;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:91:53, :92:53, :97:{27,42,63,66}
  wire [13:0] sAdjustedExp = {io_in_sExp_0[12], io_in_sExp_0} - 14'h700;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:109:24
  wire [26:0] adjustedSig = {io_in_sig_0[53:28], |(io_in_sig_0[27:0])};	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:115:{23,66}, :116:{26,60}
  wire [8:0]  _roundMask_T_1 = ~(sAdjustedExp[8:0]);	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:109:24, :155:37, hardfloat/hardfloat/src/main/scala/primitives.scala:52:21
  wire        roundMask_msb = _roundMask_T_1[8];	// hardfloat/hardfloat/src/main/scala/primitives.scala:52:21, :58:25
  wire [7:0]  roundMask_lsbs = _roundMask_T_1[7:0];	// hardfloat/hardfloat/src/main/scala/primitives.scala:52:21, :59:26
  wire        roundMask_msb_1 = roundMask_lsbs[7];	// hardfloat/hardfloat/src/main/scala/primitives.scala:58:25, :59:26
  wire [6:0]  roundMask_lsbs_1 = roundMask_lsbs[6:0];	// hardfloat/hardfloat/src/main/scala/primitives.scala:59:26
  wire        roundMask_msb_2 = roundMask_lsbs_1[6];	// hardfloat/hardfloat/src/main/scala/primitives.scala:58:25, :59:26
  wire        roundMask_msb_3 = roundMask_lsbs_1[6];	// hardfloat/hardfloat/src/main/scala/primitives.scala:58:25, :59:26
  wire [5:0]  roundMask_lsbs_2 = roundMask_lsbs_1[5:0];	// hardfloat/hardfloat/src/main/scala/primitives.scala:59:26
  wire [5:0]  roundMask_lsbs_3 = roundMask_lsbs_1[5:0];	// hardfloat/hardfloat/src/main/scala/primitives.scala:59:26
  wire [64:0] roundMask_shift = $signed(65'sh10000000000000000 >>> roundMask_lsbs_2);	// hardfloat/hardfloat/src/main/scala/primitives.scala:59:26, :76:56
  wire [64:0] roundMask_shift_1 = $signed(65'sh10000000000000000 >>> roundMask_lsbs_3);	// hardfloat/hardfloat/src/main/scala/primitives.scala:59:26, :76:56
  wire [26:0] roundMask =
    {roundMask_msb
       ? (roundMask_msb_1
            ? {~(roundMask_msb_2
                   ? 22'h0
                   : ~{roundMask_shift[42],
                       roundMask_shift[43],
                       roundMask_shift[44],
                       roundMask_shift[45],
                       roundMask_shift[46],
                       {{roundMask_shift[47:46], roundMask_shift[49]} & 3'h5, 1'h0}
                         | {roundMask_shift[49:48], roundMask_shift[51:50]} & 4'h5,
                       roundMask_shift[51],
                       roundMask_shift[52],
                       roundMask_shift[53],
                       roundMask_shift[54],
                       roundMask_shift[55],
                       roundMask_shift[56],
                       roundMask_shift[57],
                       roundMask_shift[58],
                       roundMask_shift[59],
                       roundMask_shift[60],
                       roundMask_shift[61],
                       roundMask_shift[62],
                       roundMask_shift[63]}),
               3'h7}
            : {22'h0,
               roundMask_msb_3
                 ? {roundMask_shift_1[0], roundMask_shift_1[1], roundMask_shift_1[2]}
                 : 3'h0})
       : 25'h0,
     2'h3};	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:158:42, hardfloat/hardfloat/src/main/scala/primitives.scala:58:25, :62:24, :67:24, :68:58, :73:{17,21,32}, :76:56, :77:20, :78:22
  wire [26:0] shiftedRoundMask = {1'h0, roundMask[26:1]};	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:158:42, :161:53
  wire [26:0] roundPosMask = ~shiftedRoundMask & roundMask;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:158:42, :161:53, :162:{28,46}
  wire        roundPosBit = |(adjustedSig & roundPosMask);	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:115:66, :162:46, :163:{40,56}
  wire        anyRoundExtra = |(adjustedSig & shiftedRoundMask);	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:115:66, :161:53, :164:{42,62}
  wire        anyRound = roundPosBit | anyRoundExtra;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:163:56, :164:62, :165:36
  wire        _overflow_roundMagUp_T = roundingMode_near_even | roundingMode_near_maxMag;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:89:53, :93:53, :168:38
  wire        roundIncr = _overflow_roundMagUp_T & roundPosBit | roundMagUp & anyRound;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:97:42, :163:56, :165:36, :168:{38,67}, :169:31, :170:29
  wire [25:0] roundedSig =
    roundIncr
      ? {1'h0, adjustedSig[26:2] | roundMask[26:2]} + 26'h1
        & ~(roundingMode_near_even & roundPosBit & ~anyRoundExtra
              ? roundMask[26:1]
              : 26'h0)
      : {1'h0, adjustedSig[26:2] & ~(roundMask[26:2])}
        | (roundingMode_odd & anyRound ? roundPosMask[26:1] : 26'h0);	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:89:53, :94:53, :115:66, :158:42, :162:46, :163:56, :164:62, :165:36, :169:31, :172:16, :173:{32,49,57}, :174:{21,25,49,64}, :175:30, :176:35, :179:{30,32,43,47}, :180:{24,42,67}
  wire [14:0] sRoundedExp = {sAdjustedExp[13], sAdjustedExp} + {13'h0, roundedSig[25:24]};	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:109:24, :172:16, :184:{40,54}
  wire [8:0]  common_expOut = sRoundedExp[8:0];	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:121:31, :184:40, :186:37
  wire [22:0] common_fractOut = roundedSig[22:0];	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:122:31, :172:16, :190:27
  wire        common_overflow = $signed(sRoundedExp[14:7]) > 8'sh2;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:123:37, :184:40, :195:{30,50}
  wire        common_totalUnderflow = $signed(sRoundedExp) < 15'sh6B;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:124:37, :184:40, :199:31
  wire        unboundedRange_roundPosBit = adjustedSig[1];	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:115:66, :202:{16,61}
  wire        unboundedRange_anyRound = |(adjustedSig[1:0]);	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:115:66, :204:{49,63,70}
  wire        unboundedRange_roundIncr =
    _overflow_roundMagUp_T & unboundedRange_roundPosBit | roundMagUp
    & unboundedRange_anyRound;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:97:42, :168:38, :202:16, :204:49, :206:67, :207:46, :208:29
  wire        roundCarry = roundedSig[24];	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:172:16, :210:16, :212:27
  wire        common_underflow =
    common_totalUnderflow | anyRound & $signed(sAdjustedExp[13:8]) < 6'sh1 & roundMask[2]
    & ~(~(roundMask[3]) & roundCarry & roundPosBit & unboundedRange_roundIncr);	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:109:24, :124:37, :125:37, :158:42, :163:56, :165:36, :207:46, :210:16, :216:40, :219:{32,49,64,72}, :220:{57,71,76}, :221:27, :222:34, :225:38, :226:{45,60}
  wire        common_inexact = common_totalUnderflow | anyRound;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:124:37, :126:37, :165:36, :229:49
  wire        isNaNOut = io_invalidExc_0 | io_in_isNaN_0;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:234:34
  wire        commonCase = ~isNaNOut & ~notNaN_isSpecialInfOut & ~io_in_isZero_0;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:234:34, :235:49, :236:{22,33,36,61,64}
  wire        overflow = commonCase & common_overflow;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:123:37, :236:61, :237:32
  wire        underflow = commonCase & common_underflow;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:125:37, :236:61, :238:32
  wire        inexact = overflow | commonCase & common_inexact;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:126:37, :236:61, :237:32, :239:{28,43}
  wire        overflow_roundMagUp = _overflow_roundMagUp_T | roundMagUp;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:97:42, :168:38, :242:60
  wire        pegMinNonzeroMagOut =
    commonCase & common_totalUnderflow & (roundMagUp | roundingMode_odd);	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:94:53, :97:42, :124:37, :236:61, :244:{20,45,60}
  wire        pegMaxFiniteMagOut = overflow & ~overflow_roundMagUp;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:237:32, :242:60, :245:{39,42}
  wire        notNaN_isInfOut = notNaN_isSpecialInfOut | overflow & overflow_roundMagUp;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:235:49, :237:32, :242:60, :247:{32,45}
  wire        signOut = ~isNaNOut & io_in_sign_0;	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:234:34, :249:22
  wire [8:0]  expOut =
    common_expOut & ~(io_in_isZero_0 | common_totalUnderflow ? 9'h1C0 : 9'h0)
    & ~(pegMinNonzeroMagOut ? 9'h194 : 9'h0) & {1'h1, ~pegMaxFiniteMagOut, 7'h7F}
    & {2'h3, ~notNaN_isInfOut, 6'h3F} | (pegMinNonzeroMagOut ? 9'h6B : 9'h0)
    | (pegMaxFiniteMagOut ? 9'h17F : 9'h0) | (notNaN_isInfOut ? 9'h180 : 9'h0)
    | (isNaNOut ? 9'h1C0 : 9'h0);	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:121:31, :124:37, :234:34, :244:45, :245:39, :247:32, :251:24, :252:{14,18,32}, :255:17, :256:{14,18}, :259:17, :260:{14,18}, :263:17, :264:{14,18}, :267:18, :268:16, :271:15, :272:16, :275:15, :276:{16,73}, :277:16
  wire [22:0] fractOut =
    (isNaNOut | io_in_isZero_0 | common_totalUnderflow
       ? {isNaNOut, 22'h0}
       : common_fractOut) | {23{pegMaxFiniteMagOut}};	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:122:31, :124:37, :234:34, :245:39, :279:{12,22,38}, :280:16, :282:11, :283:13
  wire [32:0] io_out_0 = {signOut, expOut, fractOut};	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:249:22, :276:73, :282:11, :285:33
  wire [4:0]  io_exceptionFlags_0 = {io_invalidExc_0, 1'h0, overflow, underflow, inexact};	// hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:237:32, :238:32, :239:28, :287:66
  assign io_out = io_out_0;
  assign io_exceptionFlags = io_exceptionFlags_0;
endmodule

