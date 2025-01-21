module PreDecode_top;

  logic [15:0] io_in_bits_data_0;
  logic [15:0] io_in_bits_data_1;
  logic [15:0] io_in_bits_data_2;
  logic [15:0] io_in_bits_data_3;
  logic [15:0] io_in_bits_data_4;
  logic [15:0] io_in_bits_data_5;
  logic [15:0] io_in_bits_data_6;
  logic [15:0] io_in_bits_data_7;
  logic [15:0] io_in_bits_data_8;
  logic [15:0] io_in_bits_data_9;
  logic [15:0] io_in_bits_data_10;
  logic [15:0] io_in_bits_data_11;
  logic [15:0] io_in_bits_data_12;
  logic [15:0] io_in_bits_data_13;
  logic [15:0] io_in_bits_data_14;
  logic [15:0] io_in_bits_data_15;
  logic [15:0] io_in_bits_data_16;
  logic  io_out_pd_0_isRVC;
  logic  io_out_pd_1_valid;
  logic  io_out_pd_1_isRVC;
  logic  io_out_pd_2_valid;
  logic  io_out_pd_2_isRVC;
  logic  io_out_pd_3_valid;
  logic  io_out_pd_3_isRVC;
  logic  io_out_pd_4_valid;
  logic  io_out_pd_4_isRVC;
  logic  io_out_pd_5_valid;
  logic  io_out_pd_5_isRVC;
  logic  io_out_pd_6_valid;
  logic  io_out_pd_6_isRVC;
  logic  io_out_pd_7_valid;
  logic  io_out_pd_7_isRVC;
  logic  io_out_pd_8_valid;
  logic  io_out_pd_8_isRVC;
  logic  io_out_pd_9_valid;
  logic  io_out_pd_9_isRVC;
  logic  io_out_pd_10_valid;
  logic  io_out_pd_10_isRVC;
  logic  io_out_pd_11_valid;
  logic  io_out_pd_11_isRVC;
  logic  io_out_pd_12_valid;
  logic  io_out_pd_12_isRVC;
  logic  io_out_pd_13_valid;
  logic  io_out_pd_13_isRVC;
  logic  io_out_pd_14_valid;
  logic  io_out_pd_14_isRVC;
  logic  io_out_pd_15_valid;
  logic  io_out_pd_15_isRVC;
  logic  io_out_hasHalfValid_2;
  logic  io_out_hasHalfValid_3;
  logic  io_out_hasHalfValid_4;
  logic  io_out_hasHalfValid_5;
  logic  io_out_hasHalfValid_6;
  logic  io_out_hasHalfValid_7;
  logic  io_out_hasHalfValid_8;
  logic  io_out_hasHalfValid_9;
  logic  io_out_hasHalfValid_10;
  logic  io_out_hasHalfValid_11;
  logic  io_out_hasHalfValid_12;
  logic  io_out_hasHalfValid_13;
  logic  io_out_hasHalfValid_14;
  logic  io_out_hasHalfValid_15;
  logic [31:0] io_out_instr_0;
  logic [31:0] io_out_instr_1;
  logic [31:0] io_out_instr_2;
  logic [31:0] io_out_instr_3;
  logic [31:0] io_out_instr_4;
  logic [31:0] io_out_instr_5;
  logic [31:0] io_out_instr_6;
  logic [31:0] io_out_instr_7;
  logic [31:0] io_out_instr_8;
  logic [31:0] io_out_instr_9;
  logic [31:0] io_out_instr_10;
  logic [31:0] io_out_instr_11;
  logic [31:0] io_out_instr_12;
  logic [31:0] io_out_instr_13;
  logic [31:0] io_out_instr_14;
  logic [31:0] io_out_instr_15;
  logic [63:0] io_out_jumpOffset_0;
  logic [63:0] io_out_jumpOffset_1;
  logic [63:0] io_out_jumpOffset_2;
  logic [63:0] io_out_jumpOffset_3;
  logic [63:0] io_out_jumpOffset_4;
  logic [63:0] io_out_jumpOffset_5;
  logic [63:0] io_out_jumpOffset_6;
  logic [63:0] io_out_jumpOffset_7;
  logic [63:0] io_out_jumpOffset_8;
  logic [63:0] io_out_jumpOffset_9;
  logic [63:0] io_out_jumpOffset_10;
  logic [63:0] io_out_jumpOffset_11;
  logic [63:0] io_out_jumpOffset_12;
  logic [63:0] io_out_jumpOffset_13;
  logic [63:0] io_out_jumpOffset_14;
  logic [63:0] io_out_jumpOffset_15;


 PreDecode PreDecode(
    .io_in_bits_data_0(io_in_bits_data_0),
    .io_in_bits_data_1(io_in_bits_data_1),
    .io_in_bits_data_2(io_in_bits_data_2),
    .io_in_bits_data_3(io_in_bits_data_3),
    .io_in_bits_data_4(io_in_bits_data_4),
    .io_in_bits_data_5(io_in_bits_data_5),
    .io_in_bits_data_6(io_in_bits_data_6),
    .io_in_bits_data_7(io_in_bits_data_7),
    .io_in_bits_data_8(io_in_bits_data_8),
    .io_in_bits_data_9(io_in_bits_data_9),
    .io_in_bits_data_10(io_in_bits_data_10),
    .io_in_bits_data_11(io_in_bits_data_11),
    .io_in_bits_data_12(io_in_bits_data_12),
    .io_in_bits_data_13(io_in_bits_data_13),
    .io_in_bits_data_14(io_in_bits_data_14),
    .io_in_bits_data_15(io_in_bits_data_15),
    .io_in_bits_data_16(io_in_bits_data_16),
    .io_out_pd_0_isRVC(io_out_pd_0_isRVC),
    .io_out_pd_1_valid(io_out_pd_1_valid),
    .io_out_pd_1_isRVC(io_out_pd_1_isRVC),
    .io_out_pd_2_valid(io_out_pd_2_valid),
    .io_out_pd_2_isRVC(io_out_pd_2_isRVC),
    .io_out_pd_3_valid(io_out_pd_3_valid),
    .io_out_pd_3_isRVC(io_out_pd_3_isRVC),
    .io_out_pd_4_valid(io_out_pd_4_valid),
    .io_out_pd_4_isRVC(io_out_pd_4_isRVC),
    .io_out_pd_5_valid(io_out_pd_5_valid),
    .io_out_pd_5_isRVC(io_out_pd_5_isRVC),
    .io_out_pd_6_valid(io_out_pd_6_valid),
    .io_out_pd_6_isRVC(io_out_pd_6_isRVC),
    .io_out_pd_7_valid(io_out_pd_7_valid),
    .io_out_pd_7_isRVC(io_out_pd_7_isRVC),
    .io_out_pd_8_valid(io_out_pd_8_valid),
    .io_out_pd_8_isRVC(io_out_pd_8_isRVC),
    .io_out_pd_9_valid(io_out_pd_9_valid),
    .io_out_pd_9_isRVC(io_out_pd_9_isRVC),
    .io_out_pd_10_valid(io_out_pd_10_valid),
    .io_out_pd_10_isRVC(io_out_pd_10_isRVC),
    .io_out_pd_11_valid(io_out_pd_11_valid),
    .io_out_pd_11_isRVC(io_out_pd_11_isRVC),
    .io_out_pd_12_valid(io_out_pd_12_valid),
    .io_out_pd_12_isRVC(io_out_pd_12_isRVC),
    .io_out_pd_13_valid(io_out_pd_13_valid),
    .io_out_pd_13_isRVC(io_out_pd_13_isRVC),
    .io_out_pd_14_valid(io_out_pd_14_valid),
    .io_out_pd_14_isRVC(io_out_pd_14_isRVC),
    .io_out_pd_15_valid(io_out_pd_15_valid),
    .io_out_pd_15_isRVC(io_out_pd_15_isRVC),
    .io_out_hasHalfValid_2(io_out_hasHalfValid_2),
    .io_out_hasHalfValid_3(io_out_hasHalfValid_3),
    .io_out_hasHalfValid_4(io_out_hasHalfValid_4),
    .io_out_hasHalfValid_5(io_out_hasHalfValid_5),
    .io_out_hasHalfValid_6(io_out_hasHalfValid_6),
    .io_out_hasHalfValid_7(io_out_hasHalfValid_7),
    .io_out_hasHalfValid_8(io_out_hasHalfValid_8),
    .io_out_hasHalfValid_9(io_out_hasHalfValid_9),
    .io_out_hasHalfValid_10(io_out_hasHalfValid_10),
    .io_out_hasHalfValid_11(io_out_hasHalfValid_11),
    .io_out_hasHalfValid_12(io_out_hasHalfValid_12),
    .io_out_hasHalfValid_13(io_out_hasHalfValid_13),
    .io_out_hasHalfValid_14(io_out_hasHalfValid_14),
    .io_out_hasHalfValid_15(io_out_hasHalfValid_15),
    .io_out_instr_0(io_out_instr_0),
    .io_out_instr_1(io_out_instr_1),
    .io_out_instr_2(io_out_instr_2),
    .io_out_instr_3(io_out_instr_3),
    .io_out_instr_4(io_out_instr_4),
    .io_out_instr_5(io_out_instr_5),
    .io_out_instr_6(io_out_instr_6),
    .io_out_instr_7(io_out_instr_7),
    .io_out_instr_8(io_out_instr_8),
    .io_out_instr_9(io_out_instr_9),
    .io_out_instr_10(io_out_instr_10),
    .io_out_instr_11(io_out_instr_11),
    .io_out_instr_12(io_out_instr_12),
    .io_out_instr_13(io_out_instr_13),
    .io_out_instr_14(io_out_instr_14),
    .io_out_instr_15(io_out_instr_15),
    .io_out_jumpOffset_0(io_out_jumpOffset_0),
    .io_out_jumpOffset_1(io_out_jumpOffset_1),
    .io_out_jumpOffset_2(io_out_jumpOffset_2),
    .io_out_jumpOffset_3(io_out_jumpOffset_3),
    .io_out_jumpOffset_4(io_out_jumpOffset_4),
    .io_out_jumpOffset_5(io_out_jumpOffset_5),
    .io_out_jumpOffset_6(io_out_jumpOffset_6),
    .io_out_jumpOffset_7(io_out_jumpOffset_7),
    .io_out_jumpOffset_8(io_out_jumpOffset_8),
    .io_out_jumpOffset_9(io_out_jumpOffset_9),
    .io_out_jumpOffset_10(io_out_jumpOffset_10),
    .io_out_jumpOffset_11(io_out_jumpOffset_11),
    .io_out_jumpOffset_12(io_out_jumpOffset_12),
    .io_out_jumpOffset_13(io_out_jumpOffset_13),
    .io_out_jumpOffset_14(io_out_jumpOffset_14),
    .io_out_jumpOffset_15(io_out_jumpOffset_15)
 );


  export "DPI-C" function get_io_in_bits_data_0xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_0xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_1xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_1xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_2xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_2xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_3xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_3xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_4xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_4xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_5xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_5xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_6xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_6xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_7xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_7xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_8xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_8xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_9xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_9xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_10xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_10xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_11xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_11xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_12xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_12xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_13xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_13xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_14xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_14xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_15xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_15xxPfBDHOSr3yT;
  export "DPI-C" function get_io_in_bits_data_16xxPfBDHOSr3yT;
  export "DPI-C" function set_io_in_bits_data_16xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_0_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_0_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_1_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_1_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_1_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_1_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_2_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_2_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_2_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_2_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_3_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_3_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_3_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_3_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_4_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_4_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_4_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_4_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_5_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_5_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_5_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_5_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_6_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_6_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_6_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_6_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_7_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_7_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_7_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_7_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_8_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_8_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_8_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_8_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_9_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_9_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_9_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_9_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_10_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_10_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_10_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_10_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_11_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_11_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_11_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_11_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_12_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_12_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_12_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_12_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_13_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_13_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_13_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_13_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_14_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_14_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_14_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_14_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_15_validxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_15_validxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_pd_15_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_pd_15_isRVCxxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_2xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_2xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_3xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_3xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_4xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_4xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_5xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_5xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_6xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_6xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_7xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_7xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_8xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_8xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_9xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_9xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_10xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_10xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_11xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_11xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_12xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_12xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_13xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_13xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_14xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_14xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_hasHalfValid_15xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_hasHalfValid_15xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_0xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_0xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_1xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_1xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_2xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_2xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_3xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_3xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_4xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_4xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_5xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_5xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_6xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_6xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_7xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_7xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_8xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_8xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_9xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_9xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_10xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_10xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_11xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_11xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_12xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_12xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_13xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_13xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_14xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_14xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_instr_15xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_instr_15xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_0xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_0xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_1xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_1xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_2xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_2xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_3xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_3xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_4xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_4xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_5xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_5xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_6xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_6xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_7xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_7xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_8xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_8xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_9xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_9xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_10xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_10xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_11xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_11xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_12xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_12xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_13xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_13xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_14xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_14xxPfBDHOSr3yT;
  export "DPI-C" function get_io_out_jumpOffset_15xxPfBDHOSr3yT;
  export "DPI-C" function set_io_out_jumpOffset_15xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_0xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_1xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_2xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_3xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_4xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_5xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_6xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_7xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_8xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_9xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_10xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_11xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_12xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_13xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_14xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_currentIsRVC_15xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_validEnd_1xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_validEnd_2xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_validEnd_2xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_validEnd_3xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_validEnd_3xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_validEnd_4xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_validEnd_4xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_validEnd_5xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_validEnd_5xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_validEnd_6xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_validEnd_6xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_validEnd_7xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_validEnd_7xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_lastIsValidEnd_23xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_lastIsValidEnd_23xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_lastIsValidEnd_24xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_lastIsValidEnd_24xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_lastIsValidEnd_25xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_lastIsValidEnd_25xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_lastIsValidEnd_26xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_lastIsValidEnd_26xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_lastIsValidEnd_27xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_lastIsValidEnd_27xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_lastIsValidEnd_30xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_lastIsValidEnd_30xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_lastIsValidEnd_31xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_lastIsValidEnd_31xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_lastIsValidEnd_32xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_lastIsValidEnd_32xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_lastIsValidEnd_33xxPfBDHOSr3yT;
  export "DPI-C" function get_PreDecode_h_lastIsValidEnd_33xxPfBDHOSr3yT;


  function void get_io_in_bits_data_0xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_0;
  endfunction

  function void set_io_in_bits_data_0xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_0=value;
  endfunction

  function void get_io_in_bits_data_1xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_1;
  endfunction

  function void set_io_in_bits_data_1xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_1=value;
  endfunction

  function void get_io_in_bits_data_2xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_2;
  endfunction

  function void set_io_in_bits_data_2xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_2=value;
  endfunction

  function void get_io_in_bits_data_3xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_3;
  endfunction

  function void set_io_in_bits_data_3xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_3=value;
  endfunction

  function void get_io_in_bits_data_4xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_4;
  endfunction

  function void set_io_in_bits_data_4xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_4=value;
  endfunction

  function void get_io_in_bits_data_5xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_5;
  endfunction

  function void set_io_in_bits_data_5xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_5=value;
  endfunction

  function void get_io_in_bits_data_6xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_6;
  endfunction

  function void set_io_in_bits_data_6xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_6=value;
  endfunction

  function void get_io_in_bits_data_7xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_7;
  endfunction

  function void set_io_in_bits_data_7xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_7=value;
  endfunction

  function void get_io_in_bits_data_8xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_8;
  endfunction

  function void set_io_in_bits_data_8xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_8=value;
  endfunction

  function void get_io_in_bits_data_9xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_9;
  endfunction

  function void set_io_in_bits_data_9xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_9=value;
  endfunction

  function void get_io_in_bits_data_10xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_10;
  endfunction

  function void set_io_in_bits_data_10xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_10=value;
  endfunction

  function void get_io_in_bits_data_11xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_11;
  endfunction

  function void set_io_in_bits_data_11xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_11=value;
  endfunction

  function void get_io_in_bits_data_12xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_12;
  endfunction

  function void set_io_in_bits_data_12xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_12=value;
  endfunction

  function void get_io_in_bits_data_13xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_13;
  endfunction

  function void set_io_in_bits_data_13xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_13=value;
  endfunction

  function void get_io_in_bits_data_14xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_14;
  endfunction

  function void set_io_in_bits_data_14xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_14=value;
  endfunction

  function void get_io_in_bits_data_15xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_15;
  endfunction

  function void set_io_in_bits_data_15xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_15=value;
  endfunction

  function void get_io_in_bits_data_16xxPfBDHOSr3yT;
    output logic [15:0] value;
    value=io_in_bits_data_16;
  endfunction

  function void set_io_in_bits_data_16xxPfBDHOSr3yT;
    input logic [15:0] value;
    io_in_bits_data_16=value;
  endfunction

  function void get_io_out_pd_0_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_0_isRVC;
  endfunction

  function void set_io_out_pd_0_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_0_isRVC=value;
  endfunction

  function void get_io_out_pd_1_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_1_valid;
  endfunction

  function void set_io_out_pd_1_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_1_valid=value;
  endfunction

  function void get_io_out_pd_1_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_1_isRVC;
  endfunction

  function void set_io_out_pd_1_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_1_isRVC=value;
  endfunction

  function void get_io_out_pd_2_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_2_valid;
  endfunction

  function void set_io_out_pd_2_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_2_valid=value;
  endfunction

  function void get_io_out_pd_2_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_2_isRVC;
  endfunction

  function void set_io_out_pd_2_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_2_isRVC=value;
  endfunction

  function void get_io_out_pd_3_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_3_valid;
  endfunction

  function void set_io_out_pd_3_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_3_valid=value;
  endfunction

  function void get_io_out_pd_3_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_3_isRVC;
  endfunction

  function void set_io_out_pd_3_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_3_isRVC=value;
  endfunction

  function void get_io_out_pd_4_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_4_valid;
  endfunction

  function void set_io_out_pd_4_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_4_valid=value;
  endfunction

  function void get_io_out_pd_4_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_4_isRVC;
  endfunction

  function void set_io_out_pd_4_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_4_isRVC=value;
  endfunction

  function void get_io_out_pd_5_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_5_valid;
  endfunction

  function void set_io_out_pd_5_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_5_valid=value;
  endfunction

  function void get_io_out_pd_5_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_5_isRVC;
  endfunction

  function void set_io_out_pd_5_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_5_isRVC=value;
  endfunction

  function void get_io_out_pd_6_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_6_valid;
  endfunction

  function void set_io_out_pd_6_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_6_valid=value;
  endfunction

  function void get_io_out_pd_6_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_6_isRVC;
  endfunction

  function void set_io_out_pd_6_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_6_isRVC=value;
  endfunction

  function void get_io_out_pd_7_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_7_valid;
  endfunction

  function void set_io_out_pd_7_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_7_valid=value;
  endfunction

  function void get_io_out_pd_7_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_7_isRVC;
  endfunction

  function void set_io_out_pd_7_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_7_isRVC=value;
  endfunction

  function void get_io_out_pd_8_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_8_valid;
  endfunction

  function void set_io_out_pd_8_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_8_valid=value;
  endfunction

  function void get_io_out_pd_8_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_8_isRVC;
  endfunction

  function void set_io_out_pd_8_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_8_isRVC=value;
  endfunction

  function void get_io_out_pd_9_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_9_valid;
  endfunction

  function void set_io_out_pd_9_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_9_valid=value;
  endfunction

  function void get_io_out_pd_9_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_9_isRVC;
  endfunction

  function void set_io_out_pd_9_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_9_isRVC=value;
  endfunction

  function void get_io_out_pd_10_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_10_valid;
  endfunction

  function void set_io_out_pd_10_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_10_valid=value;
  endfunction

  function void get_io_out_pd_10_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_10_isRVC;
  endfunction

  function void set_io_out_pd_10_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_10_isRVC=value;
  endfunction

  function void get_io_out_pd_11_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_11_valid;
  endfunction

  function void set_io_out_pd_11_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_11_valid=value;
  endfunction

  function void get_io_out_pd_11_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_11_isRVC;
  endfunction

  function void set_io_out_pd_11_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_11_isRVC=value;
  endfunction

  function void get_io_out_pd_12_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_12_valid;
  endfunction

  function void set_io_out_pd_12_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_12_valid=value;
  endfunction

  function void get_io_out_pd_12_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_12_isRVC;
  endfunction

  function void set_io_out_pd_12_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_12_isRVC=value;
  endfunction

  function void get_io_out_pd_13_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_13_valid;
  endfunction

  function void set_io_out_pd_13_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_13_valid=value;
  endfunction

  function void get_io_out_pd_13_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_13_isRVC;
  endfunction

  function void set_io_out_pd_13_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_13_isRVC=value;
  endfunction

  function void get_io_out_pd_14_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_14_valid;
  endfunction

  function void set_io_out_pd_14_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_14_valid=value;
  endfunction

  function void get_io_out_pd_14_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_14_isRVC;
  endfunction

  function void set_io_out_pd_14_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_14_isRVC=value;
  endfunction

  function void get_io_out_pd_15_validxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_15_valid;
  endfunction

  function void set_io_out_pd_15_validxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_15_valid=value;
  endfunction

  function void get_io_out_pd_15_isRVCxxPfBDHOSr3yT;
    output logic  value;
    value=io_out_pd_15_isRVC;
  endfunction

  function void set_io_out_pd_15_isRVCxxPfBDHOSr3yT;
    input logic  value;
    io_out_pd_15_isRVC=value;
  endfunction

  function void get_io_out_hasHalfValid_2xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_2;
  endfunction

  function void set_io_out_hasHalfValid_2xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_2=value;
  endfunction

  function void get_io_out_hasHalfValid_3xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_3;
  endfunction

  function void set_io_out_hasHalfValid_3xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_3=value;
  endfunction

  function void get_io_out_hasHalfValid_4xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_4;
  endfunction

  function void set_io_out_hasHalfValid_4xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_4=value;
  endfunction

  function void get_io_out_hasHalfValid_5xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_5;
  endfunction

  function void set_io_out_hasHalfValid_5xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_5=value;
  endfunction

  function void get_io_out_hasHalfValid_6xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_6;
  endfunction

  function void set_io_out_hasHalfValid_6xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_6=value;
  endfunction

  function void get_io_out_hasHalfValid_7xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_7;
  endfunction

  function void set_io_out_hasHalfValid_7xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_7=value;
  endfunction

  function void get_io_out_hasHalfValid_8xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_8;
  endfunction

  function void set_io_out_hasHalfValid_8xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_8=value;
  endfunction

  function void get_io_out_hasHalfValid_9xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_9;
  endfunction

  function void set_io_out_hasHalfValid_9xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_9=value;
  endfunction

  function void get_io_out_hasHalfValid_10xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_10;
  endfunction

  function void set_io_out_hasHalfValid_10xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_10=value;
  endfunction

  function void get_io_out_hasHalfValid_11xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_11;
  endfunction

  function void set_io_out_hasHalfValid_11xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_11=value;
  endfunction

  function void get_io_out_hasHalfValid_12xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_12;
  endfunction

  function void set_io_out_hasHalfValid_12xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_12=value;
  endfunction

  function void get_io_out_hasHalfValid_13xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_13;
  endfunction

  function void set_io_out_hasHalfValid_13xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_13=value;
  endfunction

  function void get_io_out_hasHalfValid_14xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_14;
  endfunction

  function void set_io_out_hasHalfValid_14xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_14=value;
  endfunction

  function void get_io_out_hasHalfValid_15xxPfBDHOSr3yT;
    output logic  value;
    value=io_out_hasHalfValid_15;
  endfunction

  function void set_io_out_hasHalfValid_15xxPfBDHOSr3yT;
    input logic  value;
    io_out_hasHalfValid_15=value;
  endfunction

  function void get_io_out_instr_0xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_0;
  endfunction

  function void set_io_out_instr_0xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_0=value;
  endfunction

  function void get_io_out_instr_1xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_1;
  endfunction

  function void set_io_out_instr_1xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_1=value;
  endfunction

  function void get_io_out_instr_2xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_2;
  endfunction

  function void set_io_out_instr_2xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_2=value;
  endfunction

  function void get_io_out_instr_3xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_3;
  endfunction

  function void set_io_out_instr_3xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_3=value;
  endfunction

  function void get_io_out_instr_4xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_4;
  endfunction

  function void set_io_out_instr_4xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_4=value;
  endfunction

  function void get_io_out_instr_5xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_5;
  endfunction

  function void set_io_out_instr_5xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_5=value;
  endfunction

  function void get_io_out_instr_6xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_6;
  endfunction

  function void set_io_out_instr_6xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_6=value;
  endfunction

  function void get_io_out_instr_7xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_7;
  endfunction

  function void set_io_out_instr_7xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_7=value;
  endfunction

  function void get_io_out_instr_8xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_8;
  endfunction

  function void set_io_out_instr_8xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_8=value;
  endfunction

  function void get_io_out_instr_9xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_9;
  endfunction

  function void set_io_out_instr_9xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_9=value;
  endfunction

  function void get_io_out_instr_10xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_10;
  endfunction

  function void set_io_out_instr_10xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_10=value;
  endfunction

  function void get_io_out_instr_11xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_11;
  endfunction

  function void set_io_out_instr_11xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_11=value;
  endfunction

  function void get_io_out_instr_12xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_12;
  endfunction

  function void set_io_out_instr_12xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_12=value;
  endfunction

  function void get_io_out_instr_13xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_13;
  endfunction

  function void set_io_out_instr_13xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_13=value;
  endfunction

  function void get_io_out_instr_14xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_14;
  endfunction

  function void set_io_out_instr_14xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_14=value;
  endfunction

  function void get_io_out_instr_15xxPfBDHOSr3yT;
    output logic [31:0] value;
    value=io_out_instr_15;
  endfunction

  function void set_io_out_instr_15xxPfBDHOSr3yT;
    input logic [31:0] value;
    io_out_instr_15=value;
  endfunction

  function void get_io_out_jumpOffset_0xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_0;
  endfunction

  function void set_io_out_jumpOffset_0xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_0=value;
  endfunction

  function void get_io_out_jumpOffset_1xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_1;
  endfunction

  function void set_io_out_jumpOffset_1xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_1=value;
  endfunction

  function void get_io_out_jumpOffset_2xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_2;
  endfunction

  function void set_io_out_jumpOffset_2xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_2=value;
  endfunction

  function void get_io_out_jumpOffset_3xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_3;
  endfunction

  function void set_io_out_jumpOffset_3xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_3=value;
  endfunction

  function void get_io_out_jumpOffset_4xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_4;
  endfunction

  function void set_io_out_jumpOffset_4xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_4=value;
  endfunction

  function void get_io_out_jumpOffset_5xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_5;
  endfunction

  function void set_io_out_jumpOffset_5xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_5=value;
  endfunction

  function void get_io_out_jumpOffset_6xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_6;
  endfunction

  function void set_io_out_jumpOffset_6xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_6=value;
  endfunction

  function void get_io_out_jumpOffset_7xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_7;
  endfunction

  function void set_io_out_jumpOffset_7xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_7=value;
  endfunction

  function void get_io_out_jumpOffset_8xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_8;
  endfunction

  function void set_io_out_jumpOffset_8xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_8=value;
  endfunction

  function void get_io_out_jumpOffset_9xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_9;
  endfunction

  function void set_io_out_jumpOffset_9xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_9=value;
  endfunction

  function void get_io_out_jumpOffset_10xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_10;
  endfunction

  function void set_io_out_jumpOffset_10xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_10=value;
  endfunction

  function void get_io_out_jumpOffset_11xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_11;
  endfunction

  function void set_io_out_jumpOffset_11xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_11=value;
  endfunction

  function void get_io_out_jumpOffset_12xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_12;
  endfunction

  function void set_io_out_jumpOffset_12xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_12=value;
  endfunction

  function void get_io_out_jumpOffset_13xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_13;
  endfunction

  function void set_io_out_jumpOffset_13xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_13=value;
  endfunction

  function void get_io_out_jumpOffset_14xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_14;
  endfunction

  function void set_io_out_jumpOffset_14xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_14=value;
  endfunction

  function void get_io_out_jumpOffset_15xxPfBDHOSr3yT;
    output logic [63:0] value;
    value=io_out_jumpOffset_15;
  endfunction

  function void set_io_out_jumpOffset_15xxPfBDHOSr3yT;
    input logic [63:0] value;
    io_out_jumpOffset_15=value;
  endfunction

  function void get_PreDecode_currentIsRVC_0xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_0;
  endfunction

  function void get_PreDecode_currentIsRVC_1xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_1;
  endfunction

  function void get_PreDecode_currentIsRVC_2xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_2;
  endfunction

  function void get_PreDecode_currentIsRVC_3xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_3;
  endfunction

  function void get_PreDecode_currentIsRVC_4xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_4;
  endfunction

  function void get_PreDecode_currentIsRVC_5xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_5;
  endfunction

  function void get_PreDecode_currentIsRVC_6xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_6;
  endfunction

  function void get_PreDecode_currentIsRVC_7xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_7;
  endfunction

  function void get_PreDecode_currentIsRVC_8xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_8;
  endfunction

  function void get_PreDecode_currentIsRVC_9xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_9;
  endfunction

  function void get_PreDecode_currentIsRVC_10xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_10;
  endfunction

  function void get_PreDecode_currentIsRVC_11xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_11;
  endfunction

  function void get_PreDecode_currentIsRVC_12xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_12;
  endfunction

  function void get_PreDecode_currentIsRVC_13xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_13;
  endfunction

  function void get_PreDecode_currentIsRVC_14xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_14;
  endfunction

  function void get_PreDecode_currentIsRVC_15xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.currentIsRVC_15;
  endfunction

  function void get_PreDecode_validEnd_1xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.validEnd_1;
  endfunction

  function void get_PreDecode_validEnd_2xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.validEnd_2;
  endfunction

  function void get_PreDecode_h_validEnd_2xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_validEnd_2;
  endfunction

  function void get_PreDecode_validEnd_3xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.validEnd_3;
  endfunction

  function void get_PreDecode_h_validEnd_3xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_validEnd_3;
  endfunction

  function void get_PreDecode_validEnd_4xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.validEnd_4;
  endfunction

  function void get_PreDecode_h_validEnd_4xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_validEnd_4;
  endfunction

  function void get_PreDecode_validEnd_5xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.validEnd_5;
  endfunction

  function void get_PreDecode_h_validEnd_5xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_validEnd_5;
  endfunction

  function void get_PreDecode_validEnd_6xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.validEnd_6;
  endfunction

  function void get_PreDecode_h_validEnd_6xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_validEnd_6;
  endfunction

  function void get_PreDecode_validEnd_7xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.validEnd_7;
  endfunction

  function void get_PreDecode_h_validEnd_7xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_validEnd_7;
  endfunction

  function void get_PreDecode_lastIsValidEnd_23xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.lastIsValidEnd_23;
  endfunction

  function void get_PreDecode_h_lastIsValidEnd_23xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_lastIsValidEnd_23;
  endfunction

  function void get_PreDecode_lastIsValidEnd_24xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.lastIsValidEnd_24;
  endfunction

  function void get_PreDecode_h_lastIsValidEnd_24xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_lastIsValidEnd_24;
  endfunction

  function void get_PreDecode_lastIsValidEnd_25xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.lastIsValidEnd_25;
  endfunction

  function void get_PreDecode_h_lastIsValidEnd_25xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_lastIsValidEnd_25;
  endfunction

  function void get_PreDecode_lastIsValidEnd_26xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.lastIsValidEnd_26;
  endfunction

  function void get_PreDecode_h_lastIsValidEnd_26xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_lastIsValidEnd_26;
  endfunction

  function void get_PreDecode_lastIsValidEnd_27xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.lastIsValidEnd_27;
  endfunction

  function void get_PreDecode_h_lastIsValidEnd_27xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_lastIsValidEnd_27;
  endfunction

  function void get_PreDecode_lastIsValidEnd_30xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.lastIsValidEnd_30;
  endfunction

  function void get_PreDecode_h_lastIsValidEnd_30xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_lastIsValidEnd_30;
  endfunction

  function void get_PreDecode_lastIsValidEnd_31xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.lastIsValidEnd_31;
  endfunction

  function void get_PreDecode_h_lastIsValidEnd_31xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_lastIsValidEnd_31;
  endfunction

  function void get_PreDecode_lastIsValidEnd_32xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.lastIsValidEnd_32;
  endfunction

  function void get_PreDecode_h_lastIsValidEnd_32xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_lastIsValidEnd_32;
  endfunction

  function void get_PreDecode_lastIsValidEnd_33xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.lastIsValidEnd_33;
  endfunction

  function void get_PreDecode_h_lastIsValidEnd_33xxPfBDHOSr3yT;
    output logic  value;
    value=PreDecode.h_lastIsValidEnd_33;
  endfunction



  initial begin
    $dumpfile("PreDecode.fst");
    $dumpvars(0, PreDecode_top);
  end

  export "DPI-C" function finish_PfBDHOSr3yT;
  function void finish_PfBDHOSr3yT;
    $finish;
  endfunction


endmodule
