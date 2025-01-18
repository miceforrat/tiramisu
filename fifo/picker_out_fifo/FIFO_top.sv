module FIFO_top;

  logic  clk;
  logic  rst_n;
  logic  wr_en;
  logic  rd_en;
  logic [7:0] wdata;
  logic [7:0] rdata;
  logic  empty;
  logic  full;


 FIFO FIFO(
    .clk(clk),
    .rst_n(rst_n),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .wdata(wdata),
    .rdata(rdata),
    .empty(empty),
    .full(full)
 );


  export "DPI-C" function get_clkxxPfBDHOeu0yc;
  export "DPI-C" function set_clkxxPfBDHOeu0yc;
  export "DPI-C" function get_rst_nxxPfBDHOeu0yc;
  export "DPI-C" function set_rst_nxxPfBDHOeu0yc;
  export "DPI-C" function get_wr_enxxPfBDHOeu0yc;
  export "DPI-C" function set_wr_enxxPfBDHOeu0yc;
  export "DPI-C" function get_rd_enxxPfBDHOeu0yc;
  export "DPI-C" function set_rd_enxxPfBDHOeu0yc;
  export "DPI-C" function get_wdataxxPfBDHOeu0yc;
  export "DPI-C" function set_wdataxxPfBDHOeu0yc;
  export "DPI-C" function get_rdataxxPfBDHOeu0yc;
  export "DPI-C" function set_rdataxxPfBDHOeu0yc;
  export "DPI-C" function get_emptyxxPfBDHOeu0yc;
  export "DPI-C" function set_emptyxxPfBDHOeu0yc;
  export "DPI-C" function get_fullxxPfBDHOeu0yc;
  export "DPI-C" function set_fullxxPfBDHOeu0yc;


  function void get_clkxxPfBDHOeu0yc;
    output logic  value;
    value=clk;
  endfunction

  function void set_clkxxPfBDHOeu0yc;
    input logic  value;
    clk=value;
  endfunction

  function void get_rst_nxxPfBDHOeu0yc;
    output logic  value;
    value=rst_n;
  endfunction

  function void set_rst_nxxPfBDHOeu0yc;
    input logic  value;
    rst_n=value;
  endfunction

  function void get_wr_enxxPfBDHOeu0yc;
    output logic  value;
    value=wr_en;
  endfunction

  function void set_wr_enxxPfBDHOeu0yc;
    input logic  value;
    wr_en=value;
  endfunction

  function void get_rd_enxxPfBDHOeu0yc;
    output logic  value;
    value=rd_en;
  endfunction

  function void set_rd_enxxPfBDHOeu0yc;
    input logic  value;
    rd_en=value;
  endfunction

  function void get_wdataxxPfBDHOeu0yc;
    output logic [7:0] value;
    value=wdata;
  endfunction

  function void set_wdataxxPfBDHOeu0yc;
    input logic [7:0] value;
    wdata=value;
  endfunction

  function void get_rdataxxPfBDHOeu0yc;
    output logic [7:0] value;
    value=rdata;
  endfunction

  function void set_rdataxxPfBDHOeu0yc;
    input logic [7:0] value;
    rdata=value;
  endfunction

  function void get_emptyxxPfBDHOeu0yc;
    output logic  value;
    value=empty;
  endfunction

  function void set_emptyxxPfBDHOeu0yc;
    input logic  value;
    empty=value;
  endfunction

  function void get_fullxxPfBDHOeu0yc;
    output logic  value;
    value=full;
  endfunction

  function void set_fullxxPfBDHOeu0yc;
    input logic  value;
    full=value;
  endfunction



  initial begin
    $dumpfile("FIFO.fst");
    $dumpvars(0, FIFO_top);
  end

  export "DPI-C" function finish_PfBDHOeu0yc;
  function void finish_PfBDHOeu0yc;
    $finish;
  endfunction


endmodule
