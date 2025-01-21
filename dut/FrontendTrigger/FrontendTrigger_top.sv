module FrontendTrigger_top;

  logic  clock;
  logic  reset;
  logic  io_frontendTrigger_tUpdate_valid;
  logic [1:0] io_frontendTrigger_tUpdate_bits_addr;
  logic [1:0] io_frontendTrigger_tUpdate_bits_tdata_matchType;
  logic  io_frontendTrigger_tUpdate_bits_tdata_select;
  logic [3:0] io_frontendTrigger_tUpdate_bits_tdata_action;
  logic  io_frontendTrigger_tUpdate_bits_tdata_chain;
  logic [63:0] io_frontendTrigger_tUpdate_bits_tdata_tdata2;
  logic  io_frontendTrigger_tEnableVec_0;
  logic  io_frontendTrigger_tEnableVec_1;
  logic  io_frontendTrigger_tEnableVec_2;
  logic  io_frontendTrigger_tEnableVec_3;
  logic  io_frontendTrigger_debugMode;
  logic  io_frontendTrigger_triggerCanRaiseBpExp;
  logic [3:0] io_triggered_0;
  logic [3:0] io_triggered_1;
  logic [3:0] io_triggered_2;
  logic [3:0] io_triggered_3;
  logic [3:0] io_triggered_4;
  logic [3:0] io_triggered_5;
  logic [3:0] io_triggered_6;
  logic [3:0] io_triggered_7;
  logic [3:0] io_triggered_8;
  logic [3:0] io_triggered_9;
  logic [3:0] io_triggered_10;
  logic [3:0] io_triggered_11;
  logic [3:0] io_triggered_12;
  logic [3:0] io_triggered_13;
  logic [3:0] io_triggered_14;
  logic [3:0] io_triggered_15;
  logic [49:0] io_pc_0;
  logic [49:0] io_pc_1;
  logic [49:0] io_pc_2;
  logic [49:0] io_pc_3;
  logic [49:0] io_pc_4;
  logic [49:0] io_pc_5;
  logic [49:0] io_pc_6;
  logic [49:0] io_pc_7;
  logic [49:0] io_pc_8;
  logic [49:0] io_pc_9;
  logic [49:0] io_pc_10;
  logic [49:0] io_pc_11;
  logic [49:0] io_pc_12;
  logic [49:0] io_pc_13;
  logic [49:0] io_pc_14;
  logic [49:0] io_pc_15;


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


  export "DPI-C" function get_clockxxkBLV2pztI8;
  export "DPI-C" function set_clockxxkBLV2pztI8;
  export "DPI-C" function get_resetxxkBLV2pztI8;
  export "DPI-C" function set_resetxxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_validxxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_validxxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_addrxxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_addrxxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_tdata_matchTypexxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_tdata_matchTypexxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_tdata_selectxxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_tdata_selectxxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_tdata_actionxxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_tdata_actionxxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_tdata_chainxxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_tdata_chainxxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_tdata_tdata2xxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_tdata_tdata2xxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tEnableVec_0xxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tEnableVec_0xxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tEnableVec_1xxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tEnableVec_1xxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tEnableVec_2xxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tEnableVec_2xxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_tEnableVec_3xxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_tEnableVec_3xxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_debugModexxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_debugModexxkBLV2pztI8;
  export "DPI-C" function get_io_frontendTrigger_triggerCanRaiseBpExpxxkBLV2pztI8;
  export "DPI-C" function set_io_frontendTrigger_triggerCanRaiseBpExpxxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_0xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_0xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_1xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_1xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_2xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_2xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_3xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_3xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_4xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_4xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_5xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_5xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_6xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_6xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_7xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_7xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_8xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_8xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_9xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_9xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_10xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_10xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_11xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_11xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_12xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_12xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_13xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_13xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_14xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_14xxkBLV2pztI8;
  export "DPI-C" function get_io_triggered_15xxkBLV2pztI8;
  export "DPI-C" function set_io_triggered_15xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_0xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_0xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_1xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_1xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_2xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_2xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_3xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_3xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_4xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_4xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_5xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_5xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_6xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_6xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_7xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_7xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_8xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_8xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_9xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_9xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_10xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_10xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_11xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_11xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_12xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_12xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_13xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_13xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_14xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_14xxkBLV2pztI8;
  export "DPI-C" function get_io_pc_15xxkBLV2pztI8;
  export "DPI-C" function set_io_pc_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_0_matchTypexxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_0_selectxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_0_timingxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_0_actionxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_0_chainxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_0_tdata2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_1_matchTypexxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_1_selectxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_1_timingxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_1_actionxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_1_chainxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_1_tdata2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_2_matchTypexxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_2_selectxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_2_timingxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_2_actionxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_2_chainxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_2_tdata2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_3_matchTypexxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_3_selectxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_3_timingxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_3_actionxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_3_chainxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_tdataVec_3_tdata2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerEnableVec_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerEnableVec_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerEnableVec_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerEnableVec_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCEqualxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPC1EqualxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCGreaterxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCLessxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_0_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_1_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_2_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_3_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_4_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_5_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_6_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_7_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_8_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_9_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_10_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_11_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_12_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_13_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_14_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_15_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCEqual_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPC1Equal_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCGreater_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCLess_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_1_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_1_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_1_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_1_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_0_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_1_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_2_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_3_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_4_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_5_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_6_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_7_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_8_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_9_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_10_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_11_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_12_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_13_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_14_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_15_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCEqual_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPC1Equal_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCGreater_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCLess_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_2_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_2_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_2_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_2_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_0_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_1_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_2_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_3_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_4_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_5_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_6_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_7_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_8_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_9_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_10_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_11_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_12_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_13_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_14_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_15_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCEqual_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPC1Equal_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCGreater_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_highPCLess_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carry_3_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCEqual_3_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_lowPCGreater_3_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerHitVec_carryRight_3_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_trigger2TimingSameVec_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_trigger2TimingSameVec_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_trigger2TimingSameVec_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_encxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireActionxxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_1_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_1_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_1_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_2_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_2_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_2_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_3_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_3_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_3_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_3xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_4_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_4_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_4_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_4xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_5_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_5_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_5_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_5xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_6_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_6_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_6_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_6xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_7_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_7_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_7_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_7xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_8_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_8_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_8_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_8xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_9_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_9_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_9_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_9xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_10_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_10_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_10_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_10xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_11_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_11_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_11_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_11xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_12_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_12_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_12_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_12xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_13_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_13_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_13_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_13xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_14_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_14_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_14_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_14xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_15_0xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_15_1xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerCanFireVec_15_2xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireOH_enc_15xxkBLV2pztI8;
  export "DPI-C" function get_FrontendTrigger_triggerFireAction_15xxkBLV2pztI8;


  function void get_clockxxkBLV2pztI8;
    output logic  value;
    value=clock;
  endfunction

  function void set_clockxxkBLV2pztI8;
    input logic  value;
    clock=value;
  endfunction

  function void get_resetxxkBLV2pztI8;
    output logic  value;
    value=reset;
  endfunction

  function void set_resetxxkBLV2pztI8;
    input logic  value;
    reset=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_validxxkBLV2pztI8;
    output logic  value;
    value=io_frontendTrigger_tUpdate_valid;
  endfunction

  function void set_io_frontendTrigger_tUpdate_validxxkBLV2pztI8;
    input logic  value;
    io_frontendTrigger_tUpdate_valid=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_addrxxkBLV2pztI8;
    output logic [1:0] value;
    value=io_frontendTrigger_tUpdate_bits_addr;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_addrxxkBLV2pztI8;
    input logic [1:0] value;
    io_frontendTrigger_tUpdate_bits_addr=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_tdata_matchTypexxkBLV2pztI8;
    output logic [1:0] value;
    value=io_frontendTrigger_tUpdate_bits_tdata_matchType;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_tdata_matchTypexxkBLV2pztI8;
    input logic [1:0] value;
    io_frontendTrigger_tUpdate_bits_tdata_matchType=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_tdata_selectxxkBLV2pztI8;
    output logic  value;
    value=io_frontendTrigger_tUpdate_bits_tdata_select;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_tdata_selectxxkBLV2pztI8;
    input logic  value;
    io_frontendTrigger_tUpdate_bits_tdata_select=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_tdata_actionxxkBLV2pztI8;
    output logic [3:0] value;
    value=io_frontendTrigger_tUpdate_bits_tdata_action;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_tdata_actionxxkBLV2pztI8;
    input logic [3:0] value;
    io_frontendTrigger_tUpdate_bits_tdata_action=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_tdata_chainxxkBLV2pztI8;
    output logic  value;
    value=io_frontendTrigger_tUpdate_bits_tdata_chain;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_tdata_chainxxkBLV2pztI8;
    input logic  value;
    io_frontendTrigger_tUpdate_bits_tdata_chain=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_tdata_tdata2xxkBLV2pztI8;
    output logic [63:0] value;
    value=io_frontendTrigger_tUpdate_bits_tdata_tdata2;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_tdata_tdata2xxkBLV2pztI8;
    input logic [63:0] value;
    io_frontendTrigger_tUpdate_bits_tdata_tdata2=value;
  endfunction

  function void get_io_frontendTrigger_tEnableVec_0xxkBLV2pztI8;
    output logic  value;
    value=io_frontendTrigger_tEnableVec_0;
  endfunction

  function void set_io_frontendTrigger_tEnableVec_0xxkBLV2pztI8;
    input logic  value;
    io_frontendTrigger_tEnableVec_0=value;
  endfunction

  function void get_io_frontendTrigger_tEnableVec_1xxkBLV2pztI8;
    output logic  value;
    value=io_frontendTrigger_tEnableVec_1;
  endfunction

  function void set_io_frontendTrigger_tEnableVec_1xxkBLV2pztI8;
    input logic  value;
    io_frontendTrigger_tEnableVec_1=value;
  endfunction

  function void get_io_frontendTrigger_tEnableVec_2xxkBLV2pztI8;
    output logic  value;
    value=io_frontendTrigger_tEnableVec_2;
  endfunction

  function void set_io_frontendTrigger_tEnableVec_2xxkBLV2pztI8;
    input logic  value;
    io_frontendTrigger_tEnableVec_2=value;
  endfunction

  function void get_io_frontendTrigger_tEnableVec_3xxkBLV2pztI8;
    output logic  value;
    value=io_frontendTrigger_tEnableVec_3;
  endfunction

  function void set_io_frontendTrigger_tEnableVec_3xxkBLV2pztI8;
    input logic  value;
    io_frontendTrigger_tEnableVec_3=value;
  endfunction

  function void get_io_frontendTrigger_debugModexxkBLV2pztI8;
    output logic  value;
    value=io_frontendTrigger_debugMode;
  endfunction

  function void set_io_frontendTrigger_debugModexxkBLV2pztI8;
    input logic  value;
    io_frontendTrigger_debugMode=value;
  endfunction

  function void get_io_frontendTrigger_triggerCanRaiseBpExpxxkBLV2pztI8;
    output logic  value;
    value=io_frontendTrigger_triggerCanRaiseBpExp;
  endfunction

  function void set_io_frontendTrigger_triggerCanRaiseBpExpxxkBLV2pztI8;
    input logic  value;
    io_frontendTrigger_triggerCanRaiseBpExp=value;
  endfunction

  function void get_io_triggered_0xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_0;
  endfunction

  function void set_io_triggered_0xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_0=value;
  endfunction

  function void get_io_triggered_1xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_1;
  endfunction

  function void set_io_triggered_1xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_1=value;
  endfunction

  function void get_io_triggered_2xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_2;
  endfunction

  function void set_io_triggered_2xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_2=value;
  endfunction

  function void get_io_triggered_3xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_3;
  endfunction

  function void set_io_triggered_3xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_3=value;
  endfunction

  function void get_io_triggered_4xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_4;
  endfunction

  function void set_io_triggered_4xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_4=value;
  endfunction

  function void get_io_triggered_5xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_5;
  endfunction

  function void set_io_triggered_5xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_5=value;
  endfunction

  function void get_io_triggered_6xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_6;
  endfunction

  function void set_io_triggered_6xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_6=value;
  endfunction

  function void get_io_triggered_7xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_7;
  endfunction

  function void set_io_triggered_7xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_7=value;
  endfunction

  function void get_io_triggered_8xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_8;
  endfunction

  function void set_io_triggered_8xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_8=value;
  endfunction

  function void get_io_triggered_9xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_9;
  endfunction

  function void set_io_triggered_9xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_9=value;
  endfunction

  function void get_io_triggered_10xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_10;
  endfunction

  function void set_io_triggered_10xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_10=value;
  endfunction

  function void get_io_triggered_11xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_11;
  endfunction

  function void set_io_triggered_11xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_11=value;
  endfunction

  function void get_io_triggered_12xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_12;
  endfunction

  function void set_io_triggered_12xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_12=value;
  endfunction

  function void get_io_triggered_13xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_13;
  endfunction

  function void set_io_triggered_13xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_13=value;
  endfunction

  function void get_io_triggered_14xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_14;
  endfunction

  function void set_io_triggered_14xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_14=value;
  endfunction

  function void get_io_triggered_15xxkBLV2pztI8;
    output logic [3:0] value;
    value=io_triggered_15;
  endfunction

  function void set_io_triggered_15xxkBLV2pztI8;
    input logic [3:0] value;
    io_triggered_15=value;
  endfunction

  function void get_io_pc_0xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_0;
  endfunction

  function void set_io_pc_0xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_0=value;
  endfunction

  function void get_io_pc_1xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_1;
  endfunction

  function void set_io_pc_1xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_1=value;
  endfunction

  function void get_io_pc_2xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_2;
  endfunction

  function void set_io_pc_2xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_2=value;
  endfunction

  function void get_io_pc_3xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_3;
  endfunction

  function void set_io_pc_3xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_3=value;
  endfunction

  function void get_io_pc_4xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_4;
  endfunction

  function void set_io_pc_4xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_4=value;
  endfunction

  function void get_io_pc_5xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_5;
  endfunction

  function void set_io_pc_5xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_5=value;
  endfunction

  function void get_io_pc_6xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_6;
  endfunction

  function void set_io_pc_6xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_6=value;
  endfunction

  function void get_io_pc_7xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_7;
  endfunction

  function void set_io_pc_7xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_7=value;
  endfunction

  function void get_io_pc_8xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_8;
  endfunction

  function void set_io_pc_8xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_8=value;
  endfunction

  function void get_io_pc_9xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_9;
  endfunction

  function void set_io_pc_9xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_9=value;
  endfunction

  function void get_io_pc_10xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_10;
  endfunction

  function void set_io_pc_10xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_10=value;
  endfunction

  function void get_io_pc_11xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_11;
  endfunction

  function void set_io_pc_11xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_11=value;
  endfunction

  function void get_io_pc_12xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_12;
  endfunction

  function void set_io_pc_12xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_12=value;
  endfunction

  function void get_io_pc_13xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_13;
  endfunction

  function void set_io_pc_13xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_13=value;
  endfunction

  function void get_io_pc_14xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_14;
  endfunction

  function void set_io_pc_14xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_14=value;
  endfunction

  function void get_io_pc_15xxkBLV2pztI8;
    output logic [49:0] value;
    value=io_pc_15;
  endfunction

  function void set_io_pc_15xxkBLV2pztI8;
    input logic [49:0] value;
    io_pc_15=value;
  endfunction

  function void get_FrontendTrigger_tdataVec_0_matchTypexxkBLV2pztI8;
    output logic [1:0] value;
    value=FrontendTrigger.tdataVec_0_matchType;
  endfunction

  function void get_FrontendTrigger_tdataVec_0_selectxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_0_select;
  endfunction

  function void get_FrontendTrigger_tdataVec_0_timingxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_0_timing;
  endfunction

  function void get_FrontendTrigger_tdataVec_0_actionxxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.tdataVec_0_action;
  endfunction

  function void get_FrontendTrigger_tdataVec_0_chainxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_0_chain;
  endfunction

  function void get_FrontendTrigger_tdataVec_0_tdata2xxkBLV2pztI8;
    output logic [63:0] value;
    value=FrontendTrigger.tdataVec_0_tdata2;
  endfunction

  function void get_FrontendTrigger_tdataVec_1_matchTypexxkBLV2pztI8;
    output logic [1:0] value;
    value=FrontendTrigger.tdataVec_1_matchType;
  endfunction

  function void get_FrontendTrigger_tdataVec_1_selectxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_1_select;
  endfunction

  function void get_FrontendTrigger_tdataVec_1_timingxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_1_timing;
  endfunction

  function void get_FrontendTrigger_tdataVec_1_actionxxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.tdataVec_1_action;
  endfunction

  function void get_FrontendTrigger_tdataVec_1_chainxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_1_chain;
  endfunction

  function void get_FrontendTrigger_tdataVec_1_tdata2xxkBLV2pztI8;
    output logic [63:0] value;
    value=FrontendTrigger.tdataVec_1_tdata2;
  endfunction

  function void get_FrontendTrigger_tdataVec_2_matchTypexxkBLV2pztI8;
    output logic [1:0] value;
    value=FrontendTrigger.tdataVec_2_matchType;
  endfunction

  function void get_FrontendTrigger_tdataVec_2_selectxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_2_select;
  endfunction

  function void get_FrontendTrigger_tdataVec_2_timingxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_2_timing;
  endfunction

  function void get_FrontendTrigger_tdataVec_2_actionxxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.tdataVec_2_action;
  endfunction

  function void get_FrontendTrigger_tdataVec_2_chainxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_2_chain;
  endfunction

  function void get_FrontendTrigger_tdataVec_2_tdata2xxkBLV2pztI8;
    output logic [63:0] value;
    value=FrontendTrigger.tdataVec_2_tdata2;
  endfunction

  function void get_FrontendTrigger_tdataVec_3_matchTypexxkBLV2pztI8;
    output logic [1:0] value;
    value=FrontendTrigger.tdataVec_3_matchType;
  endfunction

  function void get_FrontendTrigger_tdataVec_3_selectxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_3_select;
  endfunction

  function void get_FrontendTrigger_tdataVec_3_timingxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_3_timing;
  endfunction

  function void get_FrontendTrigger_tdataVec_3_actionxxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.tdataVec_3_action;
  endfunction

  function void get_FrontendTrigger_tdataVec_3_chainxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.tdataVec_3_chain;
  endfunction

  function void get_FrontendTrigger_tdataVec_3_tdata2xxkBLV2pztI8;
    output logic [63:0] value;
    value=FrontendTrigger.tdataVec_3_tdata2;
  endfunction

  function void get_FrontendTrigger_triggerEnableVec_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerEnableVec_0;
  endfunction

  function void get_FrontendTrigger_triggerEnableVec_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerEnableVec_1;
  endfunction

  function void get_FrontendTrigger_triggerEnableVec_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerEnableVec_2;
  endfunction

  function void get_FrontendTrigger_triggerEnableVec_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerEnableVec_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCEqualxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCEqual;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPC1EqualxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPC1Equal;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCGreaterxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCGreater;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCLessxxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCLess;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_0_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_0_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_1_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_1_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_2_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_2_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_3_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_3_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_4_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_4_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_5_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_5_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_6_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_6_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_7_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_7_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_8_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_8_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_9_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_9_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_10_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_10_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_11_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_11_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_12_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_12_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_13_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_13_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_14_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_14_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_15_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_15_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCEqual_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCEqual_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPC1Equal_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPC1Equal_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCGreater_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCGreater_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCLess_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCLess_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_1_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_1_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_1_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_1_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_1_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_1_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_1_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_1_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_0_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_0_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_1_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_1_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_2_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_2_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_3_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_3_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_4_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_4_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_5_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_5_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_6_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_6_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_7_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_7_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_8_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_8_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_9_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_9_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_10_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_10_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_11_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_11_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_12_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_12_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_13_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_13_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_14_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_14_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_15_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_15_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCEqual_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCEqual_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPC1Equal_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPC1Equal_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCGreater_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCGreater_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCLess_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCLess_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_2_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_2_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_2_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_2_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_2_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_2_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_2_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_2_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_0_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_0_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_1_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_1_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_2_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_2_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_3_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_3_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_4_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_4_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_5_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_5_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_6_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_6_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_7_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_7_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_8_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_8_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_9_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_9_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_10_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_10_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_11_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_11_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_12_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_12_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_13_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_13_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_14_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_14_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_15_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_15_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCEqual_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCEqual_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPC1Equal_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPC1Equal_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCGreater_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCGreater_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_highPCLess_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_highPCLess_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carry_3_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carry_3_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCEqual_3_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCEqual_3_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_14;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_lowPCGreater_3_15xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_lowPCGreater_3_15;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_0;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_1;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_2;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_3;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_4xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_4;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_5xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_5;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_6xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_6;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_7xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_7;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_8xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_8;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_9xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_9;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_10xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_10;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_11xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_11;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_12xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_12;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_13xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_13;
  endfunction

  function void get_FrontendTrigger_triggerHitVec_carryRight_3_14xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerHitVec_carryRight_3_14;
  endfunction

  function void get_FrontendTrigger_trigger2TimingSameVec_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.trigger2TimingSameVec_1;
  endfunction

  function void get_FrontendTrigger_trigger2TimingSameVec_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.trigger2TimingSameVec_2;
  endfunction

  function void get_FrontendTrigger_trigger2TimingSameVec_3xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.trigger2TimingSameVec_3;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_encxxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc;
  endfunction

  function void get_FrontendTrigger_triggerFireActionxxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_1_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_1_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_1_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_1_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_1_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_1_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_1xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_1;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_1xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_2_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_2_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_2_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_2_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_2_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_2_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_2xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_2;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_2xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_2;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_3_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_3_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_3_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_3_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_3_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_3_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_3xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_3;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_3xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_3;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_4_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_4_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_4_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_4_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_4_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_4_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_4xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_4;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_4xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_4;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_5_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_5_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_5_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_5_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_5_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_5_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_5xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_5;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_5xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_5;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_6_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_6_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_6_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_6_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_6_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_6_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_6xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_6;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_6xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_6;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_7_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_7_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_7_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_7_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_7_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_7_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_7xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_7;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_7xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_7;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_8_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_8_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_8_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_8_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_8_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_8_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_8xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_8;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_8xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_8;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_9_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_9_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_9_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_9_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_9_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_9_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_9xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_9;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_9xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_9;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_10_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_10_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_10_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_10_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_10_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_10_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_10xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_10;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_10xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_10;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_11_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_11_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_11_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_11_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_11_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_11_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_11xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_11;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_11xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_11;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_12_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_12_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_12_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_12_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_12_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_12_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_12xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_12;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_12xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_12;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_13_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_13_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_13_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_13_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_13_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_13_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_13xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_13;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_13xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_13;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_14_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_14_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_14_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_14_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_14_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_14_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_14xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_14;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_14xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_14;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_15_0xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_15_0;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_15_1xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_15_1;
  endfunction

  function void get_FrontendTrigger_triggerCanFireVec_15_2xxkBLV2pztI8;
    output logic  value;
    value=FrontendTrigger.triggerCanFireVec_15_2;
  endfunction

  function void get_FrontendTrigger_triggerFireOH_enc_15xxkBLV2pztI8;
    output logic [2:0] value;
    value=FrontendTrigger.triggerFireOH_enc_15;
  endfunction

  function void get_FrontendTrigger_triggerFireAction_15xxkBLV2pztI8;
    output logic [3:0] value;
    value=FrontendTrigger.triggerFireAction_15;
  endfunction



  initial begin
    $dumpfile("FrontendTrigger.fst");
    $dumpvars(0, FrontendTrigger_top);
  end

  export "DPI-C" function finish_kBLV2pztI8;
  function void finish_kBLV2pztI8;
    $finish;
  endfunction


endmodule
