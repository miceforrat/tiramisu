module ALU_top;

  wire [7:0] a;
  wire [7:0] b;
  wire [3:0] alu_sel;
  wire [7:0] alu_out;


 ALU ALU(
    .a(a),
    .b(b),
    .alu_sel(alu_sel),
    .alu_out(alu_out)
 );


endmodule
