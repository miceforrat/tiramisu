module ALU_top;

  logic [7:0] a;
  logic [7:0] b;
  logic [3:0] alu_sel;
  logic [7:0] alu_out;


 ALU ALU(
    .a(a),
    .b(b),
    .alu_sel(alu_sel),
    .alu_out(alu_out)
 );


  export "DPI-C" function get_axxPfBDHPEOP0M;
  export "DPI-C" function set_axxPfBDHPEOP0M;
  export "DPI-C" function get_bxxPfBDHPEOP0M;
  export "DPI-C" function set_bxxPfBDHPEOP0M;
  export "DPI-C" function get_alu_selxxPfBDHPEOP0M;
  export "DPI-C" function set_alu_selxxPfBDHPEOP0M;
  export "DPI-C" function get_alu_outxxPfBDHPEOP0M;
  export "DPI-C" function set_alu_outxxPfBDHPEOP0M;


  function void get_axxPfBDHPEOP0M;
    output logic [7:0] value;
    value=a;
  endfunction

  function void set_axxPfBDHPEOP0M;
    input logic [7:0] value;
    a=value;
  endfunction

  function void get_bxxPfBDHPEOP0M;
    output logic [7:0] value;
    value=b;
  endfunction

  function void set_bxxPfBDHPEOP0M;
    input logic [7:0] value;
    b=value;
  endfunction

  function void get_alu_selxxPfBDHPEOP0M;
    output logic [3:0] value;
    value=alu_sel;
  endfunction

  function void set_alu_selxxPfBDHPEOP0M;
    input logic [3:0] value;
    alu_sel=value;
  endfunction

  function void get_alu_outxxPfBDHPEOP0M;
    output logic [7:0] value;
    value=alu_out;
  endfunction

  function void set_alu_outxxPfBDHPEOP0M;
    input logic [7:0] value;
    alu_out=value;
  endfunction



  initial begin
    $dumpfile("ALU.fst");
    $dumpvars(0, ALU_top);
  end

  export "DPI-C" function finish_PfBDHPEOP0M;
  function void finish_PfBDHPEOP0M;
    $finish;
  endfunction


endmodule
