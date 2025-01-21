module RVCExpander_top;

  logic [31:0] io_in;
  logic  io_fsIsOff;
  logic [31:0] io_out_bits;
  logic  io_ill;


 RVCExpander RVCExpander(
    .io_in(io_in),
    .io_fsIsOff(io_fsIsOff),
    .io_out_bits(io_out_bits),
    .io_ill(io_ill)
 );


  export "DPI-C" function get_io_inxxPfBDHP6X4rO;
  export "DPI-C" function set_io_inxxPfBDHP6X4rO;
  export "DPI-C" function get_io_fsIsOffxxPfBDHP6X4rO;
  export "DPI-C" function set_io_fsIsOffxxPfBDHP6X4rO;
  export "DPI-C" function get_io_out_bitsxxPfBDHP6X4rO;
  export "DPI-C" function set_io_out_bitsxxPfBDHP6X4rO;
  export "DPI-C" function get_io_illxxPfBDHP6X4rO;
  export "DPI-C" function set_io_illxxPfBDHP6X4rO;


  function void get_io_inxxPfBDHP6X4rO;
    output logic [31:0] value;
    value=io_in;
  endfunction

  function void set_io_inxxPfBDHP6X4rO;
    input logic [31:0] value;
    io_in=value;
  endfunction

  function void get_io_fsIsOffxxPfBDHP6X4rO;
    output logic  value;
    value=io_fsIsOff;
  endfunction

  function void set_io_fsIsOffxxPfBDHP6X4rO;
    input logic  value;
    io_fsIsOff=value;
  endfunction

  function void get_io_out_bitsxxPfBDHP6X4rO;
    output logic [31:0] value;
    value=io_out_bits;
  endfunction

  function void set_io_out_bitsxxPfBDHP6X4rO;
    input logic [31:0] value;
    io_out_bits=value;
  endfunction

  function void get_io_illxxPfBDHP6X4rO;
    output logic  value;
    value=io_ill;
  endfunction

  function void set_io_illxxPfBDHP6X4rO;
    input logic  value;
    io_ill=value;
  endfunction



  initial begin
    $dumpfile("rvc.fst");
    $dumpvars(0, RVCExpander_top);
  end

  export "DPI-C" function finish_PfBDHP6X4rO;
  function void finish_PfBDHP6X4rO;
    $finish;
  endfunction


endmodule
