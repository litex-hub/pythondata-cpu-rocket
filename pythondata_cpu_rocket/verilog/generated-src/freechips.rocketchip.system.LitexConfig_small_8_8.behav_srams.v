
module data_arrays_0_ext(
  input RW0_clk,
  input [8:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [7:0] RW0_wmask,
  input [63:0] RW0_wdata,
  output [63:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [8:0] reg_RW0_addr;
  reg [63:0] ram [511:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 512; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      for(i=0;i<8;i=i+1) begin
        if(RW0_wmask[i]) begin
          ram[RW0_addr][i*8 +: 8] <= RW0_wdata[i*8 +: 8];
        end
      end
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[63:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule

module tag_array_ext(
  input RW0_clk,
  input [5:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [21:0] RW0_wdata,
  output [21:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [5:0] reg_RW0_addr;
  reg [21:0] ram [63:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 64; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      for(i=0;i<1;i=i+1) begin
        ram[RW0_addr][i*22 +: 22] <= RW0_wdata[i*22 +: 22];
      end
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[21:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule

module tag_array_0_ext(
  input RW0_clk,
  input [5:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [0:0] RW0_wmask,
  input [20:0] RW0_wdata,
  output [20:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [5:0] reg_RW0_addr;
  reg [20:0] ram [63:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 64; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      for(i=0;i<1;i=i+1) begin
        if(RW0_wmask[i]) begin
          ram[RW0_addr][i*21 +: 21] <= RW0_wdata[i*21 +: 21];
        end
      end
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[20:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule

module data_arrays_0_0_ext(
  input RW0_clk,
  input [8:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [0:0] RW0_wmask,
  input [31:0] RW0_wdata,
  output [31:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [8:0] reg_RW0_addr;
  reg [31:0] ram [511:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 512; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      for(i=0;i<1;i=i+1) begin
        if(RW0_wmask[i]) begin
          ram[RW0_addr][i*32 +: 32] <= RW0_wdata[i*32 +: 32];
        end
      end
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[31:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule

module mem_ext(
  input W0_clk,
  input [24:0] W0_addr,
  input W0_en,
  input [511:0] W0_data,
  input [63:0] W0_mask,
  input R0_clk,
  input [24:0] R0_addr,
  input R0_en,
  output [511:0] R0_data
);

  reg reg_R0_ren;
  reg [24:0] reg_R0_addr;
  reg [511:0] ram [33554431:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 33554432; initvar = initvar+1)
        ram[initvar] = {16 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][7:0] <= W0_data[7:0];
      if (W0_mask[1]) ram[W0_addr][15:8] <= W0_data[15:8];
      if (W0_mask[2]) ram[W0_addr][23:16] <= W0_data[23:16];
      if (W0_mask[3]) ram[W0_addr][31:24] <= W0_data[31:24];
      if (W0_mask[4]) ram[W0_addr][39:32] <= W0_data[39:32];
      if (W0_mask[5]) ram[W0_addr][47:40] <= W0_data[47:40];
      if (W0_mask[6]) ram[W0_addr][55:48] <= W0_data[55:48];
      if (W0_mask[7]) ram[W0_addr][63:56] <= W0_data[63:56];
      if (W0_mask[8]) ram[W0_addr][71:64] <= W0_data[71:64];
      if (W0_mask[9]) ram[W0_addr][79:72] <= W0_data[79:72];
      if (W0_mask[10]) ram[W0_addr][87:80] <= W0_data[87:80];
      if (W0_mask[11]) ram[W0_addr][95:88] <= W0_data[95:88];
      if (W0_mask[12]) ram[W0_addr][103:96] <= W0_data[103:96];
      if (W0_mask[13]) ram[W0_addr][111:104] <= W0_data[111:104];
      if (W0_mask[14]) ram[W0_addr][119:112] <= W0_data[119:112];
      if (W0_mask[15]) ram[W0_addr][127:120] <= W0_data[127:120];
      if (W0_mask[16]) ram[W0_addr][135:128] <= W0_data[135:128];
      if (W0_mask[17]) ram[W0_addr][143:136] <= W0_data[143:136];
      if (W0_mask[18]) ram[W0_addr][151:144] <= W0_data[151:144];
      if (W0_mask[19]) ram[W0_addr][159:152] <= W0_data[159:152];
      if (W0_mask[20]) ram[W0_addr][167:160] <= W0_data[167:160];
      if (W0_mask[21]) ram[W0_addr][175:168] <= W0_data[175:168];
      if (W0_mask[22]) ram[W0_addr][183:176] <= W0_data[183:176];
      if (W0_mask[23]) ram[W0_addr][191:184] <= W0_data[191:184];
      if (W0_mask[24]) ram[W0_addr][199:192] <= W0_data[199:192];
      if (W0_mask[25]) ram[W0_addr][207:200] <= W0_data[207:200];
      if (W0_mask[26]) ram[W0_addr][215:208] <= W0_data[215:208];
      if (W0_mask[27]) ram[W0_addr][223:216] <= W0_data[223:216];
      if (W0_mask[28]) ram[W0_addr][231:224] <= W0_data[231:224];
      if (W0_mask[29]) ram[W0_addr][239:232] <= W0_data[239:232];
      if (W0_mask[30]) ram[W0_addr][247:240] <= W0_data[247:240];
      if (W0_mask[31]) ram[W0_addr][255:248] <= W0_data[255:248];
      if (W0_mask[32]) ram[W0_addr][263:256] <= W0_data[263:256];
      if (W0_mask[33]) ram[W0_addr][271:264] <= W0_data[271:264];
      if (W0_mask[34]) ram[W0_addr][279:272] <= W0_data[279:272];
      if (W0_mask[35]) ram[W0_addr][287:280] <= W0_data[287:280];
      if (W0_mask[36]) ram[W0_addr][295:288] <= W0_data[295:288];
      if (W0_mask[37]) ram[W0_addr][303:296] <= W0_data[303:296];
      if (W0_mask[38]) ram[W0_addr][311:304] <= W0_data[311:304];
      if (W0_mask[39]) ram[W0_addr][319:312] <= W0_data[319:312];
      if (W0_mask[40]) ram[W0_addr][327:320] <= W0_data[327:320];
      if (W0_mask[41]) ram[W0_addr][335:328] <= W0_data[335:328];
      if (W0_mask[42]) ram[W0_addr][343:336] <= W0_data[343:336];
      if (W0_mask[43]) ram[W0_addr][351:344] <= W0_data[351:344];
      if (W0_mask[44]) ram[W0_addr][359:352] <= W0_data[359:352];
      if (W0_mask[45]) ram[W0_addr][367:360] <= W0_data[367:360];
      if (W0_mask[46]) ram[W0_addr][375:368] <= W0_data[375:368];
      if (W0_mask[47]) ram[W0_addr][383:376] <= W0_data[383:376];
      if (W0_mask[48]) ram[W0_addr][391:384] <= W0_data[391:384];
      if (W0_mask[49]) ram[W0_addr][399:392] <= W0_data[399:392];
      if (W0_mask[50]) ram[W0_addr][407:400] <= W0_data[407:400];
      if (W0_mask[51]) ram[W0_addr][415:408] <= W0_data[415:408];
      if (W0_mask[52]) ram[W0_addr][423:416] <= W0_data[423:416];
      if (W0_mask[53]) ram[W0_addr][431:424] <= W0_data[431:424];
      if (W0_mask[54]) ram[W0_addr][439:432] <= W0_data[439:432];
      if (W0_mask[55]) ram[W0_addr][447:440] <= W0_data[447:440];
      if (W0_mask[56]) ram[W0_addr][455:448] <= W0_data[455:448];
      if (W0_mask[57]) ram[W0_addr][463:456] <= W0_data[463:456];
      if (W0_mask[58]) ram[W0_addr][471:464] <= W0_data[471:464];
      if (W0_mask[59]) ram[W0_addr][479:472] <= W0_data[479:472];
      if (W0_mask[60]) ram[W0_addr][487:480] <= W0_data[487:480];
      if (W0_mask[61]) ram[W0_addr][495:488] <= W0_data[495:488];
      if (W0_mask[62]) ram[W0_addr][503:496] <= W0_data[503:496];
      if (W0_mask[63]) ram[W0_addr][511:504] <= W0_data[511:504];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [511:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[511:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module mem_0_ext(
  input W0_clk,
  input [8:0] W0_addr,
  input W0_en,
  input [63:0] W0_data,
  input [7:0] W0_mask,
  input R0_clk,
  input [8:0] R0_addr,
  input R0_en,
  output [63:0] R0_data
);

  reg reg_R0_ren;
  reg [8:0] reg_R0_addr;
  reg [63:0] ram [511:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 512; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][7:0] <= W0_data[7:0];
      if (W0_mask[1]) ram[W0_addr][15:8] <= W0_data[15:8];
      if (W0_mask[2]) ram[W0_addr][23:16] <= W0_data[23:16];
      if (W0_mask[3]) ram[W0_addr][31:24] <= W0_data[31:24];
      if (W0_mask[4]) ram[W0_addr][39:32] <= W0_data[39:32];
      if (W0_mask[5]) ram[W0_addr][47:40] <= W0_data[47:40];
      if (W0_mask[6]) ram[W0_addr][55:48] <= W0_data[55:48];
      if (W0_mask[7]) ram[W0_addr][63:56] <= W0_data[63:56];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[63:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule
