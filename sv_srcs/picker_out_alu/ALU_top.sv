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


  export "DPI-C" function get_axxEssxCD7Z95u;
  export "DPI-C" function set_axxEssxCD7Z95u;
  export "DPI-C" function get_bxxEssxCD7Z95u;
  export "DPI-C" function set_bxxEssxCD7Z95u;
  export "DPI-C" function get_alu_selxxEssxCD7Z95u;
  export "DPI-C" function set_alu_selxxEssxCD7Z95u;
  export "DPI-C" function get_alu_outxxEssxCD7Z95u;


  function void get_axxEssxCD7Z95u;
    output logic [7:0] value;
    value=a;
  endfunction

  function void set_axxEssxCD7Z95u;
    input logic [7:0] value;
    a=value;
  endfunction

  function void get_bxxEssxCD7Z95u;
    output logic [7:0] value;
    value=b;
  endfunction

  function void set_bxxEssxCD7Z95u;
    input logic [7:0] value;
    b=value;
  endfunction

  function void get_alu_selxxEssxCD7Z95u;
    output logic [3:0] value;
    value=alu_sel;
  endfunction

  function void set_alu_selxxEssxCD7Z95u;
    input logic [3:0] value;
    alu_sel=value;
  endfunction

  function void get_alu_outxxEssxCD7Z95u;
    output logic [7:0] value;
    value=alu_out;
  endfunction



  initial begin
    $dumpfile("ALU.fst");
    $dumpvars(0, ALU_top);
  end

  export "DPI-C" function finish_EssxCD7Z95u;
  function void finish_EssxCD7Z95u;
    $finish;
  endfunction


endmodule
