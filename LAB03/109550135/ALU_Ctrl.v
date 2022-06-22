`timescale 1ns/1ps

module ALU_Ctrl(
	input		[4-1:0]	instr,
	input		[2-1:0]	ALUOp,
	output	reg [4-1:0] ALU_Ctrl_o
	);
	
/* Write your code HERE */
reg [4-1:0] ctl;

always @(*) begin
	if(ALUOp == 2'b00)begin //S-type 
		ctl = 4'b0010; //add
	end	
	else if(ALUOp == 2'b01)begin //B-type
		ctl = 4'b0110; //sub
	end	
	else begin //R-type
		if(instr[2:0] == 3'b000)begin //add, sub
			ctl = 4'b0010;
			ctl[2] = (instr[3]==1 ? 1:0); //funct7
		end	
		else if(instr[2:0] == 3'b111)begin //and
			ctl = 4'b0000;//
		end	
		else if(instr[2:0] == 3'b110)begin //or
			ctl = 4'b0001;//
		end	
		else if(instr[2:0] == 3'b100)begin //xor
			ctl = 4'b0111;	
		end
		else if(instr[2:0] == 3'b010)begin //slt
			ctl = 4'b1000;	
		end
		else if(instr[2:0] == 3'b001)begin //sll
			ctl = 4'b1100;	
		end
		else if(instr[2:0] == 3'b101)begin //sra
			ctl = 4'b1010;	
		end
		else begin
			ctl = 4'b1111;	
		end
	end
	ALU_Ctrl_o = ctl;
end	

endmodule
