module F3Predecoder_top;

  logic [31:0] io_in_instr_0;
  logic [31:0] io_in_instr_1;
  logic [31:0] io_in_instr_2;
  logic [31:0] io_in_instr_3;
  logic [31:0] io_in_instr_4;
  logic [31:0] io_in_instr_5;
  logic [31:0] io_in_instr_6;
  logic [31:0] io_in_instr_7;
  logic [31:0] io_in_instr_8;
  logic [31:0] io_in_instr_9;
  logic [31:0] io_in_instr_10;
  logic [31:0] io_in_instr_11;
  logic [31:0] io_in_instr_12;
  logic [31:0] io_in_instr_13;
  logic [31:0] io_in_instr_14;
  logic [31:0] io_in_instr_15;
  logic [1:0] io_out_pd_0_brType;
  logic  io_out_pd_0_isCall;
  logic  io_out_pd_0_isRet;
  logic [1:0] io_out_pd_1_brType;
  logic  io_out_pd_1_isCall;
  logic  io_out_pd_1_isRet;
  logic [1:0] io_out_pd_2_brType;
  logic  io_out_pd_2_isCall;
  logic  io_out_pd_2_isRet;
  logic [1:0] io_out_pd_3_brType;
  logic  io_out_pd_3_isCall;
  logic  io_out_pd_3_isRet;
  logic [1:0] io_out_pd_4_brType;
  logic  io_out_pd_4_isCall;
  logic  io_out_pd_4_isRet;
  logic [1:0] io_out_pd_5_brType;
  logic  io_out_pd_5_isCall;
  logic  io_out_pd_5_isRet;
  logic [1:0] io_out_pd_6_brType;
  logic  io_out_pd_6_isCall;
  logic  io_out_pd_6_isRet;
  logic [1:0] io_out_pd_7_brType;
  logic  io_out_pd_7_isCall;
  logic  io_out_pd_7_isRet;
  logic [1:0] io_out_pd_8_brType;
  logic  io_out_pd_8_isCall;
  logic  io_out_pd_8_isRet;
  logic [1:0] io_out_pd_9_brType;
  logic  io_out_pd_9_isCall;
  logic  io_out_pd_9_isRet;
  logic [1:0] io_out_pd_10_brType;
  logic  io_out_pd_10_isCall;
  logic  io_out_pd_10_isRet;
  logic [1:0] io_out_pd_11_brType;
  logic  io_out_pd_11_isCall;
  logic  io_out_pd_11_isRet;
  logic [1:0] io_out_pd_12_brType;
  logic  io_out_pd_12_isCall;
  logic  io_out_pd_12_isRet;
  logic [1:0] io_out_pd_13_brType;
  logic  io_out_pd_13_isCall;
  logic  io_out_pd_13_isRet;
  logic [1:0] io_out_pd_14_brType;
  logic  io_out_pd_14_isCall;
  logic  io_out_pd_14_isRet;
  logic [1:0] io_out_pd_15_brType;
  logic  io_out_pd_15_isCall;
  logic  io_out_pd_15_isRet;


 F3Predecoder F3Predecoder(
    .io_in_instr_0(io_in_instr_0),
    .io_in_instr_1(io_in_instr_1),
    .io_in_instr_2(io_in_instr_2),
    .io_in_instr_3(io_in_instr_3),
    .io_in_instr_4(io_in_instr_4),
    .io_in_instr_5(io_in_instr_5),
    .io_in_instr_6(io_in_instr_6),
    .io_in_instr_7(io_in_instr_7),
    .io_in_instr_8(io_in_instr_8),
    .io_in_instr_9(io_in_instr_9),
    .io_in_instr_10(io_in_instr_10),
    .io_in_instr_11(io_in_instr_11),
    .io_in_instr_12(io_in_instr_12),
    .io_in_instr_13(io_in_instr_13),
    .io_in_instr_14(io_in_instr_14),
    .io_in_instr_15(io_in_instr_15),
    .io_out_pd_0_brType(io_out_pd_0_brType),
    .io_out_pd_0_isCall(io_out_pd_0_isCall),
    .io_out_pd_0_isRet(io_out_pd_0_isRet),
    .io_out_pd_1_brType(io_out_pd_1_brType),
    .io_out_pd_1_isCall(io_out_pd_1_isCall),
    .io_out_pd_1_isRet(io_out_pd_1_isRet),
    .io_out_pd_2_brType(io_out_pd_2_brType),
    .io_out_pd_2_isCall(io_out_pd_2_isCall),
    .io_out_pd_2_isRet(io_out_pd_2_isRet),
    .io_out_pd_3_brType(io_out_pd_3_brType),
    .io_out_pd_3_isCall(io_out_pd_3_isCall),
    .io_out_pd_3_isRet(io_out_pd_3_isRet),
    .io_out_pd_4_brType(io_out_pd_4_brType),
    .io_out_pd_4_isCall(io_out_pd_4_isCall),
    .io_out_pd_4_isRet(io_out_pd_4_isRet),
    .io_out_pd_5_brType(io_out_pd_5_brType),
    .io_out_pd_5_isCall(io_out_pd_5_isCall),
    .io_out_pd_5_isRet(io_out_pd_5_isRet),
    .io_out_pd_6_brType(io_out_pd_6_brType),
    .io_out_pd_6_isCall(io_out_pd_6_isCall),
    .io_out_pd_6_isRet(io_out_pd_6_isRet),
    .io_out_pd_7_brType(io_out_pd_7_brType),
    .io_out_pd_7_isCall(io_out_pd_7_isCall),
    .io_out_pd_7_isRet(io_out_pd_7_isRet),
    .io_out_pd_8_brType(io_out_pd_8_brType),
    .io_out_pd_8_isCall(io_out_pd_8_isCall),
    .io_out_pd_8_isRet(io_out_pd_8_isRet),
    .io_out_pd_9_brType(io_out_pd_9_brType),
    .io_out_pd_9_isCall(io_out_pd_9_isCall),
    .io_out_pd_9_isRet(io_out_pd_9_isRet),
    .io_out_pd_10_brType(io_out_pd_10_brType),
    .io_out_pd_10_isCall(io_out_pd_10_isCall),
    .io_out_pd_10_isRet(io_out_pd_10_isRet),
    .io_out_pd_11_brType(io_out_pd_11_brType),
    .io_out_pd_11_isCall(io_out_pd_11_isCall),
    .io_out_pd_11_isRet(io_out_pd_11_isRet),
    .io_out_pd_12_brType(io_out_pd_12_brType),
    .io_out_pd_12_isCall(io_out_pd_12_isCall),
    .io_out_pd_12_isRet(io_out_pd_12_isRet),
    .io_out_pd_13_brType(io_out_pd_13_brType),
    .io_out_pd_13_isCall(io_out_pd_13_isCall),
    .io_out_pd_13_isRet(io_out_pd_13_isRet),
    .io_out_pd_14_brType(io_out_pd_14_brType),
    .io_out_pd_14_isCall(io_out_pd_14_isCall),
    .io_out_pd_14_isRet(io_out_pd_14_isRet),
    .io_out_pd_15_brType(io_out_pd_15_brType),
    .io_out_pd_15_isCall(io_out_pd_15_isCall),
    .io_out_pd_15_isRet(io_out_pd_15_isRet)
 );


  export "DPI-C" function get_io_in_instr_0xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_0xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_1xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_1xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_2xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_2xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_3xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_3xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_4xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_4xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_5xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_5xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_6xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_6xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_7xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_7xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_8xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_8xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_9xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_9xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_10xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_10xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_11xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_11xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_12xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_12xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_13xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_13xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_14xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_14xxPADpANbXAEG;
  export "DPI-C" function get_io_in_instr_15xxPADpANbXAEG;
  export "DPI-C" function set_io_in_instr_15xxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_0_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_0_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_0_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_0_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_0_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_0_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_1_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_1_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_1_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_1_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_1_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_1_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_2_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_2_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_2_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_2_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_2_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_2_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_3_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_3_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_3_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_3_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_3_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_3_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_4_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_4_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_4_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_4_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_4_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_4_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_5_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_5_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_5_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_5_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_5_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_5_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_6_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_6_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_6_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_6_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_6_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_6_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_7_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_7_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_7_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_7_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_7_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_7_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_8_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_8_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_8_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_8_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_8_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_8_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_9_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_9_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_9_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_9_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_9_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_9_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_10_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_10_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_10_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_10_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_10_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_10_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_11_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_11_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_11_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_11_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_11_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_11_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_12_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_12_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_12_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_12_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_12_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_12_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_13_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_13_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_13_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_13_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_13_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_13_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_14_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_14_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_14_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_14_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_14_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_14_isRetxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_15_brTypexxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_15_brTypexxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_15_isCallxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_15_isCallxxPADpANbXAEG;
  export "DPI-C" function get_io_out_pd_15_isRetxxPADpANbXAEG;
  export "DPI-C" function set_io_out_pd_15_isRetxxPADpANbXAEG;


  function void get_io_in_instr_0xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_0;
  endfunction

  function void set_io_in_instr_0xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_0=value;
  endfunction

  function void get_io_in_instr_1xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_1;
  endfunction

  function void set_io_in_instr_1xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_1=value;
  endfunction

  function void get_io_in_instr_2xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_2;
  endfunction

  function void set_io_in_instr_2xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_2=value;
  endfunction

  function void get_io_in_instr_3xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_3;
  endfunction

  function void set_io_in_instr_3xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_3=value;
  endfunction

  function void get_io_in_instr_4xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_4;
  endfunction

  function void set_io_in_instr_4xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_4=value;
  endfunction

  function void get_io_in_instr_5xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_5;
  endfunction

  function void set_io_in_instr_5xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_5=value;
  endfunction

  function void get_io_in_instr_6xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_6;
  endfunction

  function void set_io_in_instr_6xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_6=value;
  endfunction

  function void get_io_in_instr_7xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_7;
  endfunction

  function void set_io_in_instr_7xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_7=value;
  endfunction

  function void get_io_in_instr_8xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_8;
  endfunction

  function void set_io_in_instr_8xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_8=value;
  endfunction

  function void get_io_in_instr_9xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_9;
  endfunction

  function void set_io_in_instr_9xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_9=value;
  endfunction

  function void get_io_in_instr_10xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_10;
  endfunction

  function void set_io_in_instr_10xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_10=value;
  endfunction

  function void get_io_in_instr_11xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_11;
  endfunction

  function void set_io_in_instr_11xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_11=value;
  endfunction

  function void get_io_in_instr_12xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_12;
  endfunction

  function void set_io_in_instr_12xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_12=value;
  endfunction

  function void get_io_in_instr_13xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_13;
  endfunction

  function void set_io_in_instr_13xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_13=value;
  endfunction

  function void get_io_in_instr_14xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_14;
  endfunction

  function void set_io_in_instr_14xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_14=value;
  endfunction

  function void get_io_in_instr_15xxPADpANbXAEG;
    output logic [31:0] value;
    value=io_in_instr_15;
  endfunction

  function void set_io_in_instr_15xxPADpANbXAEG;
    input logic [31:0] value;
    io_in_instr_15=value;
  endfunction

  function void get_io_out_pd_0_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_0_brType;
  endfunction

  function void set_io_out_pd_0_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_0_brType=value;
  endfunction

  function void get_io_out_pd_0_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_0_isCall;
  endfunction

  function void set_io_out_pd_0_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_0_isCall=value;
  endfunction

  function void get_io_out_pd_0_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_0_isRet;
  endfunction

  function void set_io_out_pd_0_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_0_isRet=value;
  endfunction

  function void get_io_out_pd_1_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_1_brType;
  endfunction

  function void set_io_out_pd_1_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_1_brType=value;
  endfunction

  function void get_io_out_pd_1_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_1_isCall;
  endfunction

  function void set_io_out_pd_1_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_1_isCall=value;
  endfunction

  function void get_io_out_pd_1_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_1_isRet;
  endfunction

  function void set_io_out_pd_1_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_1_isRet=value;
  endfunction

  function void get_io_out_pd_2_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_2_brType;
  endfunction

  function void set_io_out_pd_2_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_2_brType=value;
  endfunction

  function void get_io_out_pd_2_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_2_isCall;
  endfunction

  function void set_io_out_pd_2_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_2_isCall=value;
  endfunction

  function void get_io_out_pd_2_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_2_isRet;
  endfunction

  function void set_io_out_pd_2_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_2_isRet=value;
  endfunction

  function void get_io_out_pd_3_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_3_brType;
  endfunction

  function void set_io_out_pd_3_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_3_brType=value;
  endfunction

  function void get_io_out_pd_3_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_3_isCall;
  endfunction

  function void set_io_out_pd_3_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_3_isCall=value;
  endfunction

  function void get_io_out_pd_3_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_3_isRet;
  endfunction

  function void set_io_out_pd_3_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_3_isRet=value;
  endfunction

  function void get_io_out_pd_4_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_4_brType;
  endfunction

  function void set_io_out_pd_4_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_4_brType=value;
  endfunction

  function void get_io_out_pd_4_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_4_isCall;
  endfunction

  function void set_io_out_pd_4_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_4_isCall=value;
  endfunction

  function void get_io_out_pd_4_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_4_isRet;
  endfunction

  function void set_io_out_pd_4_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_4_isRet=value;
  endfunction

  function void get_io_out_pd_5_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_5_brType;
  endfunction

  function void set_io_out_pd_5_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_5_brType=value;
  endfunction

  function void get_io_out_pd_5_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_5_isCall;
  endfunction

  function void set_io_out_pd_5_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_5_isCall=value;
  endfunction

  function void get_io_out_pd_5_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_5_isRet;
  endfunction

  function void set_io_out_pd_5_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_5_isRet=value;
  endfunction

  function void get_io_out_pd_6_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_6_brType;
  endfunction

  function void set_io_out_pd_6_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_6_brType=value;
  endfunction

  function void get_io_out_pd_6_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_6_isCall;
  endfunction

  function void set_io_out_pd_6_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_6_isCall=value;
  endfunction

  function void get_io_out_pd_6_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_6_isRet;
  endfunction

  function void set_io_out_pd_6_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_6_isRet=value;
  endfunction

  function void get_io_out_pd_7_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_7_brType;
  endfunction

  function void set_io_out_pd_7_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_7_brType=value;
  endfunction

  function void get_io_out_pd_7_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_7_isCall;
  endfunction

  function void set_io_out_pd_7_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_7_isCall=value;
  endfunction

  function void get_io_out_pd_7_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_7_isRet;
  endfunction

  function void set_io_out_pd_7_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_7_isRet=value;
  endfunction

  function void get_io_out_pd_8_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_8_brType;
  endfunction

  function void set_io_out_pd_8_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_8_brType=value;
  endfunction

  function void get_io_out_pd_8_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_8_isCall;
  endfunction

  function void set_io_out_pd_8_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_8_isCall=value;
  endfunction

  function void get_io_out_pd_8_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_8_isRet;
  endfunction

  function void set_io_out_pd_8_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_8_isRet=value;
  endfunction

  function void get_io_out_pd_9_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_9_brType;
  endfunction

  function void set_io_out_pd_9_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_9_brType=value;
  endfunction

  function void get_io_out_pd_9_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_9_isCall;
  endfunction

  function void set_io_out_pd_9_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_9_isCall=value;
  endfunction

  function void get_io_out_pd_9_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_9_isRet;
  endfunction

  function void set_io_out_pd_9_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_9_isRet=value;
  endfunction

  function void get_io_out_pd_10_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_10_brType;
  endfunction

  function void set_io_out_pd_10_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_10_brType=value;
  endfunction

  function void get_io_out_pd_10_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_10_isCall;
  endfunction

  function void set_io_out_pd_10_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_10_isCall=value;
  endfunction

  function void get_io_out_pd_10_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_10_isRet;
  endfunction

  function void set_io_out_pd_10_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_10_isRet=value;
  endfunction

  function void get_io_out_pd_11_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_11_brType;
  endfunction

  function void set_io_out_pd_11_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_11_brType=value;
  endfunction

  function void get_io_out_pd_11_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_11_isCall;
  endfunction

  function void set_io_out_pd_11_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_11_isCall=value;
  endfunction

  function void get_io_out_pd_11_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_11_isRet;
  endfunction

  function void set_io_out_pd_11_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_11_isRet=value;
  endfunction

  function void get_io_out_pd_12_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_12_brType;
  endfunction

  function void set_io_out_pd_12_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_12_brType=value;
  endfunction

  function void get_io_out_pd_12_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_12_isCall;
  endfunction

  function void set_io_out_pd_12_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_12_isCall=value;
  endfunction

  function void get_io_out_pd_12_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_12_isRet;
  endfunction

  function void set_io_out_pd_12_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_12_isRet=value;
  endfunction

  function void get_io_out_pd_13_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_13_brType;
  endfunction

  function void set_io_out_pd_13_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_13_brType=value;
  endfunction

  function void get_io_out_pd_13_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_13_isCall;
  endfunction

  function void set_io_out_pd_13_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_13_isCall=value;
  endfunction

  function void get_io_out_pd_13_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_13_isRet;
  endfunction

  function void set_io_out_pd_13_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_13_isRet=value;
  endfunction

  function void get_io_out_pd_14_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_14_brType;
  endfunction

  function void set_io_out_pd_14_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_14_brType=value;
  endfunction

  function void get_io_out_pd_14_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_14_isCall;
  endfunction

  function void set_io_out_pd_14_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_14_isCall=value;
  endfunction

  function void get_io_out_pd_14_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_14_isRet;
  endfunction

  function void set_io_out_pd_14_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_14_isRet=value;
  endfunction

  function void get_io_out_pd_15_brTypexxPADpANbXAEG;
    output logic [1:0] value;
    value=io_out_pd_15_brType;
  endfunction

  function void set_io_out_pd_15_brTypexxPADpANbXAEG;
    input logic [1:0] value;
    io_out_pd_15_brType=value;
  endfunction

  function void get_io_out_pd_15_isCallxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_15_isCall;
  endfunction

  function void set_io_out_pd_15_isCallxxPADpANbXAEG;
    input logic  value;
    io_out_pd_15_isCall=value;
  endfunction

  function void get_io_out_pd_15_isRetxxPADpANbXAEG;
    output logic  value;
    value=io_out_pd_15_isRet;
  endfunction

  function void set_io_out_pd_15_isRetxxPADpANbXAEG;
    input logic  value;
    io_out_pd_15_isRet=value;
  endfunction



  initial begin
    $dumpfile("F3Predecoder.fst");
    $dumpvars(0, F3Predecoder_top);
  end

  export "DPI-C" function finish_PADpANbXAEG;
  function void finish_PADpANbXAEG;
    $finish;
  endfunction


endmodule
