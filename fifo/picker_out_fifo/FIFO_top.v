module FIFO_top;

  wire  clk;
  wire  rst_n;
  wire  wr_en;
  wire  rd_en;
  wire [7:0] wdata;
  wire [7:0] rdata;
  wire  empty;
  wire  full;


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


endmodule
