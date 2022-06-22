`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

wire [31:0]c;
wire [31:0]tmp_res;
wire zero_fg, set, tmp_ct;

alu_1bit a1(.src1(src1[0]), .src2(src2[0]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(ALU_control[2]),
 .operation(ALU_control[1:0]), .result(tmp_res[0]), .cout(c[0]));

alu_1bit a2(.src1(src1[1]), .src2(src2[1]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[0]),
 .operation(ALU_control[1:0]), .result(tmp_res[1]), .cout(c[1]));

alu_1bit a3(.src1(src1[2]), .src2(src2[2]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[1]),
 .operation(ALU_control[1:0]), .result(tmp_res[2]), .cout(c[2]));

alu_1bit a4(.src1(src1[3]), .src2(src2[3]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[2]),
 .operation(ALU_control[1:0]), .result(tmp_res[3]), .cout(c[3]));

alu_1bit a5(.src1(src1[4]), .src2(src2[4]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[3]),
 .operation(ALU_control[1:0]), .result(tmp_res[4]), .cout(c[4]));

alu_1bit a6(.src1(src1[5]), .src2(src2[5]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[4]),
 .operation(ALU_control[1:0]), .result(tmp_res[5]), .cout(c[5]));

alu_1bit a7(.src1(src1[6]), .src2(src2[6]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[5]),
 .operation(ALU_control[1:0]), .result(tmp_res[6]), .cout(c[6]));

alu_1bit a8(.src1(src1[7]), .src2(src2[7]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[6]),
 .operation(ALU_control[1:0]), .result(tmp_res[7]), .cout(c[7]));

alu_1bit a9(.src1(src1[8]), .src2(src2[8]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[7]),
 .operation(ALU_control[1:0]), .result(tmp_res[8]), .cout(c[8]));

alu_1bit a10(.src1(src1[9]), .src2(src2[9]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[8]),
 .operation(ALU_control[1:0]), .result(tmp_res[9]), .cout(c[9]));

alu_1bit a11(.src1(src1[10]), .src2(src2[10]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[9]),
 .operation(ALU_control[1:0]), .result(tmp_res[10]), .cout(c[10]));

alu_1bit a12(.src1(src1[11]), .src2(src2[11]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[10]),
 .operation(ALU_control[1:0]), .result(tmp_res[11]), .cout(c[11]));

alu_1bit a13(.src1(src1[12]), .src2(src2[12]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[11]),
 .operation(ALU_control[1:0]), .result(tmp_res[12]), .cout(c[12]));

alu_1bit a14(.src1(src1[13]), .src2(src2[13]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[12]),
 .operation(ALU_control[1:0]), .result(tmp_res[13]), .cout(c[13]));

alu_1bit a15(.src1(src1[14]), .src2(src2[14]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[13]),
 .operation(ALU_control[1:0]), .result(tmp_res[14]), .cout(c[14]));

alu_1bit a16(.src1(src1[15]), .src2(src2[15]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[14]),
 .operation(ALU_control[1:0]), .result(tmp_res[15]), .cout(c[15]));

alu_1bit a17(.src1(src1[16]), .src2(src2[16]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[15]),
 .operation(ALU_control[1:0]), .result(tmp_res[16]), .cout(c[16]));

alu_1bit a18(.src1(src1[17]), .src2(src2[17]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[16]),
 .operation(ALU_control[1:0]), .result(tmp_res[17]), .cout(c[17]));

alu_1bit a19(.src1(src1[18]), .src2(src2[18]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[17]),
 .operation(ALU_control[1:0]), .result(tmp_res[18]), .cout(c[18]));

alu_1bit a20(.src1(src1[19]), .src2(src2[19]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[18]),
 .operation(ALU_control[1:0]), .result(tmp_res[19]), .cout(c[19]));

alu_1bit a21(.src1(src1[20]), .src2(src2[20]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[19]),
 .operation(ALU_control[1:0]), .result(tmp_res[20]), .cout(c[20]));

alu_1bit a22(.src1(src1[21]), .src2(src2[21]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[20]),
 .operation(ALU_control[1:0]), .result(tmp_res[21]), .cout(c[21]));

alu_1bit a23(.src1(src1[22]), .src2(src2[22]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[21]),
 .operation(ALU_control[1:0]), .result(tmp_res[22]), .cout(c[22]));

alu_1bit a24(.src1(src1[23]), .src2(src2[23]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[22]),
 .operation(ALU_control[1:0]), .result(tmp_res[23]), .cout(c[23]));

alu_1bit a25(.src1(src1[24]), .src2(src2[24]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[23]),
 .operation(ALU_control[1:0]), .result(tmp_res[24]), .cout(c[24]));

alu_1bit a26(.src1(src1[25]), .src2(src2[25]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[24]),
 .operation(ALU_control[1:0]), .result(tmp_res[25]), .cout(c[25]));

alu_1bit a27(.src1(src1[26]), .src2(src2[26]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[25]),
 .operation(ALU_control[1:0]), .result(tmp_res[26]), .cout(c[26]));

alu_1bit a28(.src1(src1[27]), .src2(src2[27]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[26]),
 .operation(ALU_control[1:0]), .result(tmp_res[27]), .cout(c[27]));

alu_1bit a29(.src1(src1[28]), .src2(src2[28]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[27]),
 .operation(ALU_control[1:0]), .result(tmp_res[28]), .cout(c[28]));

alu_1bit a30(.src1(src1[29]), .src2(src2[29]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[28]),
 .operation(ALU_control[1:0]), .result(tmp_res[29]), .cout(c[29]));

alu_1bit a31(.src1(src1[30]), .src2(src2[30]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[29]),
 .operation(ALU_control[1:0]), .result(tmp_res[30]), .cout(c[30]));

alu_1bit a32(.src1(src1[31]), .src2(src2[31]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[30]),
 .operation(ALU_control[1:0]), .result(tmp_res[31]), .cout(c[31]));



alu_1bit fin(.src1(src1[31]), .src2(src2[31]), .less(1'b0), .Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(c[30]),
 .operation(2'b10), .result(set), .cout(tmp_ct));

or (zero_fg,result[0],result[1],result[2],result[3],result[4],result[5],result[7],result[6],result[8],
result[9],result[10],result[11],result[12],result[13],result[14],result[15],result[16],result[17],
result[18],result[19],result[20],result[21],result[22],result[23],result[24],result[25],result[26],
result[27],result[28],result[29],result[30],result[31]); 

always@(*)begin
	if(rst_n)begin
		if(ALU_control[3:0]==4'b0010 || ALU_control[3:0]==4'b0110) begin
			result <= tmp_res;
			zero <= ~zero_fg;
			cout <= c[31];
			overflow <= c[30]^c[31];
		end
		else if(ALU_control[3:0] == 4'b0111)begin
			if(set == 1'b1)begin
				result = 32'b00000000000000000000000000000001;
				zero = 1'b0;
			end
			else begin
				result = 32'b00000000000000000000000000000000;
				zero = 1'b1;
			end
			cout = 1'b0;
			overflow = 1'b0;
		end
		
		else begin
			result <= tmp_res;
			zero <= ~zero_fg;
			cout <= 1'b0;
			overflow <= 1'b0;
		end
	end
	else begin
		result <= 32'b00000000000000000000000000000000;
		zero <= 1'b0;
		cout <= 1'b0;
		overflow <= 1'b0;
	end			
end
endmodule
