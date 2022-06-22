`timescale 1ns/1ps

module Decoder(
	input	[32-1:0] 	instr_i,
	output wire			ALUSrc,
	output wire			RegWrite,
	output wire			Branch,
	output wire [2-1:0]	ALUOp
	);
	
//Internal Signals
wire [7-1:0] opcode;
wire [3-1:0] funct3;
reg	[3-1:0] Instr_field;
reg	[9-1:0] Ctrl_o;

/* Write your code HERE */
assign opcode = instr_i[6:0];
assign funct3 = instr_i[14:12];

always @(*) begin
	if(opcode == 7'b0110011) begin //r-type
		Instr_field = 2'b00;
		Ctrl_o = 9'b000100010;
	end
	else begin
		Instr_field = 2'b00;
		Ctrl_o = 9'b000000000;
	end
end

assign ALUSrc = Ctrl_o[7];
assign RegWrite = Ctrl_o[5];
assign Branch = Ctrl_o[2];
assign ALUOp = Ctrl_o[1:0];

endmodule  
