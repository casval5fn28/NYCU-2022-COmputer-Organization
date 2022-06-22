`timescale 1ns/1ps

module full_adder(
	input	A,
	input	B,
	input	ccin,
	output reg	sums,
	output reg	ccout
);
	
	wire w1,w2,w3;
	assign w1 = A ^ B;
	assign w2 = w1 & ccin;
	assign w3 = A & B;
	
	always@( * ) begin
		sums = w1 ^ ccin;
		ccout = w2 | w3;
	end
	
endmodule	


module alu_1bit(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input				less,       //1 bit less      (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg          result,     //1 bit result    (output)
	output reg          cout        //1 bit carry out (output)
);

/* Write your code HERE */

	wire a_res,b_res,tmp_res,tmp_cout;
	//wire s1,s2,s3,s4,s5;
	MUX2to1 m2_A(.src1(src1) , .src2(~src1) , .select(Ainvert) , .result(a_res));
	MUX2to1 m2_B(.src1(src2) , .src2(~src2) , .select(Binvert) , .result(b_res));

	assign x1 = a_res & b_res;//and
	assign x2 = a_res | b_res;//or
	buf(x4, less);

	full_adder ad(.A(x1), .B(x2), .ccin(cin), .sums(x3), .ccout(tmp_cout));  
	MUX4to1 m4(.src1(x1), .src2(x2), .src3(x3), .src4(x4), .select(operation), .result(tmp_res)); 
   
	always@( * ) begin
		result <= tmp_res;
		cout <= tmp_cout;
	end

endmodule
