module Counter (
    input clk,
    input rst,
    output [3:0] count
);

reg [3:0] count_reg = 4'b0000;
assign count = count_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count_reg <= 4'b0000;
    end else begin
        count_reg <= count_reg + 1;
    end
end

endmodule
