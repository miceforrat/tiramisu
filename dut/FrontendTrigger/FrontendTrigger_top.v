module FrontendTrigger_top;

  wire  clock;
  wire  reset;
  wire  io_frontendTrigger_tUpdate_valid;
  wire [1:0] io_frontendTrigger_tUpdate_bits_addr;
  wire [1:0] io_frontendTrigger_tUpdate_bits_tdata_matchType;
  wire  io_frontendTrigger_tUpdate_bits_tdata_select;
  wire [3:0] io_frontendTrigger_tUpdate_bits_tdata_action;
  wire  io_frontendTrigger_tUpdate_bits_tdata_chain;
  wire [63:0] io_frontendTrigger_tUpdate_bits_tdata_tdata2;
  wire  io_frontendTrigger_tEnableVec_0;
  wire  io_frontendTrigger_tEnableVec_1;
  wire  io_frontendTrigger_tEnableVec_2;
  wire  io_frontendTrigger_tEnableVec_3;
  wire  io_frontendTrigger_debugMode;
  wire  io_frontendTrigger_triggerCanRaiseBpExp;
  wire [3:0] io_triggered_0;
  wire [3:0] io_triggered_1;
  wire [3:0] io_triggered_2;
  wire [3:0] io_triggered_3;
  wire [3:0] io_triggered_4;
  wire [3:0] io_triggered_5;
  wire [3:0] io_triggered_6;
  wire [3:0] io_triggered_7;
  wire [3:0] io_triggered_8;
  wire [3:0] io_triggered_9;
  wire [3:0] io_triggered_10;
  wire [3:0] io_triggered_11;
  wire [3:0] io_triggered_12;
  wire [3:0] io_triggered_13;
  wire [3:0] io_triggered_14;
  wire [3:0] io_triggered_15;
  wire [49:0] io_pc_0;
  wire [49:0] io_pc_1;
  wire [49:0] io_pc_2;
  wire [49:0] io_pc_3;
  wire [49:0] io_pc_4;
  wire [49:0] io_pc_5;
  wire [49:0] io_pc_6;
  wire [49:0] io_pc_7;
  wire [49:0] io_pc_8;
  wire [49:0] io_pc_9;
  wire [49:0] io_pc_10;
  wire [49:0] io_pc_11;
  wire [49:0] io_pc_12;
  wire [49:0] io_pc_13;
  wire [49:0] io_pc_14;
  wire [49:0] io_pc_15;


 FrontendTrigger FrontendTrigger(
    .clock(clock),
    .reset(reset),
    .io_frontendTrigger_tUpdate_valid(io_frontendTrigger_tUpdate_valid),
    .io_frontendTrigger_tUpdate_bits_addr(io_frontendTrigger_tUpdate_bits_addr),
    .io_frontendTrigger_tUpdate_bits_tdata_matchType(io_frontendTrigger_tUpdate_bits_tdata_matchType),
    .io_frontendTrigger_tUpdate_bits_tdata_select(io_frontendTrigger_tUpdate_bits_tdata_select),
    .io_frontendTrigger_tUpdate_bits_tdata_action(io_frontendTrigger_tUpdate_bits_tdata_action),
    .io_frontendTrigger_tUpdate_bits_tdata_chain(io_frontendTrigger_tUpdate_bits_tdata_chain),
    .io_frontendTrigger_tUpdate_bits_tdata_tdata2(io_frontendTrigger_tUpdate_bits_tdata_tdata2),
    .io_frontendTrigger_tEnableVec_0(io_frontendTrigger_tEnableVec_0),
    .io_frontendTrigger_tEnableVec_1(io_frontendTrigger_tEnableVec_1),
    .io_frontendTrigger_tEnableVec_2(io_frontendTrigger_tEnableVec_2),
    .io_frontendTrigger_tEnableVec_3(io_frontendTrigger_tEnableVec_3),
    .io_frontendTrigger_debugMode(io_frontendTrigger_debugMode),
    .io_frontendTrigger_triggerCanRaiseBpExp(io_frontendTrigger_triggerCanRaiseBpExp),
    .io_triggered_0(io_triggered_0),
    .io_triggered_1(io_triggered_1),
    .io_triggered_2(io_triggered_2),
    .io_triggered_3(io_triggered_3),
    .io_triggered_4(io_triggered_4),
    .io_triggered_5(io_triggered_5),
    .io_triggered_6(io_triggered_6),
    .io_triggered_7(io_triggered_7),
    .io_triggered_8(io_triggered_8),
    .io_triggered_9(io_triggered_9),
    .io_triggered_10(io_triggered_10),
    .io_triggered_11(io_triggered_11),
    .io_triggered_12(io_triggered_12),
    .io_triggered_13(io_triggered_13),
    .io_triggered_14(io_triggered_14),
    .io_triggered_15(io_triggered_15),
    .io_pc_0(io_pc_0),
    .io_pc_1(io_pc_1),
    .io_pc_2(io_pc_2),
    .io_pc_3(io_pc_3),
    .io_pc_4(io_pc_4),
    .io_pc_5(io_pc_5),
    .io_pc_6(io_pc_6),
    .io_pc_7(io_pc_7),
    .io_pc_8(io_pc_8),
    .io_pc_9(io_pc_9),
    .io_pc_10(io_pc_10),
    .io_pc_11(io_pc_11),
    .io_pc_12(io_pc_12),
    .io_pc_13(io_pc_13),
    .io_pc_14(io_pc_14),
    .io_pc_15(io_pc_15)
 );


endmodule
