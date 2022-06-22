`timescale 1ns/1ps

module Adder(
    input  [32-1:0] src1_i,
	input  [32-1:0] src2_i,
	output [32-1:0] sum_o
	);
    
/* Write your code HERE */

reg[32-1:0] res;
assign sum_o = res;

always @(*) begin
	res = src1_i + src2_i;
end

endmodule