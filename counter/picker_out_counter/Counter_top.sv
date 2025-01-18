module Counter_top;

  logic  clk;
  logic  rst;
  logic [3:0] count;


 Counter Counter(
    .clk(clk),
    .rst(rst),
    .count(count)
 );


  export "DPI-C" function get_clkxxPfBDHPxWZhx;
  export "DPI-C" function set_clkxxPfBDHPxWZhx;
  export "DPI-C" function get_rstxxPfBDHPxWZhx;
  export "DPI-C" function set_rstxxPfBDHPxWZhx;
  export "DPI-C" function get_countxxPfBDHPxWZhx;
  export "DPI-C" function set_countxxPfBDHPxWZhx;


  function void get_clkxxPfBDHPxWZhx;
    output logic  value;
    value=clk;
  endfunction

  function void set_clkxxPfBDHPxWZhx;
    input logic  value;
    clk=value;
  endfunction

  function void get_rstxxPfBDHPxWZhx;
    output logic  value;
    value=rst;
  endfunction

  function void set_rstxxPfBDHPxWZhx;
    input logic  value;
    rst=value;
  endfunction

  function void get_countxxPfBDHPxWZhx;
    output logic [3:0] value;
    value=count;
  endfunction

  function void set_countxxPfBDHPxWZhx;
    input logic [3:0] value;
    count=value;
  endfunction



  initial begin
    $dumpfile("Counter.fst");
    $dumpvars(0, Counter_top);
  end

  export "DPI-C" function finish_PfBDHPxWZhx;
  function void finish_PfBDHPxWZhx;
    $finish;
  endfunction


endmodule
