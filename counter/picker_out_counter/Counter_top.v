module Counter_top;

  wire  clk;
  wire  rst;
  wire [3:0] count;


 Counter Counter(
    .clk(clk),
    .rst(rst),
    .count(count)
 );


endmodule
