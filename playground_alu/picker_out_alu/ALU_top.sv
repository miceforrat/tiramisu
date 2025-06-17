module ALU_top();

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


  export "DPI-C" function get_axxCrm2EQU4gl7;
  export "DPI-C" function set_axxCrm2EQU4gl7;
  export "DPI-C" function get_bxxCrm2EQU4gl7;
  export "DPI-C" function set_bxxCrm2EQU4gl7;
  export "DPI-C" function get_alu_selxxCrm2EQU4gl7;
  export "DPI-C" function set_alu_selxxCrm2EQU4gl7;
  export "DPI-C" function get_alu_outxxCrm2EQU4gl7;


  function void get_axxCrm2EQU4gl7;
    output logic [7:0] value;
    value=a;
  endfunction

  function void set_axxCrm2EQU4gl7;
    input logic [7:0] value;
    a=value;
  endfunction

  function void get_bxxCrm2EQU4gl7;
    output logic [7:0] value;
    value=b;
  endfunction

  function void set_bxxCrm2EQU4gl7;
    input logic [7:0] value;
    b=value;
  endfunction

  function void get_alu_selxxCrm2EQU4gl7;
    output logic [3:0] value;
    value=alu_sel;
  endfunction

  function void set_alu_selxxCrm2EQU4gl7;
    input logic [3:0] value;
    alu_sel=value;
  endfunction

  function void get_alu_outxxCrm2EQU4gl7;
    output logic [7:0] value;
    value=alu_out;
  endfunction



  initial begin
    $dumpfile("ALU.fst");
    $dumpvars(0, ALU_top);
  end

  export "DPI-C" function finish_Crm2EQU4gl7;
  function void finish_Crm2EQU4gl7;
    $finish;
  endfunction


endmodule
