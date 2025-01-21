module RVCExpander_top;

  wire [31:0] io_in;
  wire  io_fsIsOff;
  wire [31:0] io_out_bits;
  wire  io_ill;


 RVCExpander RVCExpander(
    .io_in(io_in),
    .io_fsIsOff(io_fsIsOff),
    .io_out_bits(io_out_bits),
    .io_ill(io_ill)
 );


endmodule
