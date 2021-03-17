module XOR48(
	XOR48_Input_A,
	XOR48_Input_B,
	XOR48_Select,
	XOR48_Output,
	XOR48_Finish_Flag,
	clk
);

	//input
	input [48:1] XOR48_Input_A;
	input [48:1] XOR48_Input_B;
	input clk;
	input XOR48_Select;
	//output
	output [48:1] XOR48_Output;
	output XOR48_Finish_Flag;
	//internal register
	reg [48:1] XOR48_Reg;
	reg XOR48_Finish;
	
	assign XOR48_Output = XOR48_Reg;
	assign XOR48_Finish_Flag = XOR48_Finish;
	
	always@(posedge clk) begin
		if(XOR48_Select) begin
			XOR48_Reg <= XOR48_Input_A ^ XOR48_Input_B;
			XOR48_Finish <= 1'b1;
		end
		else begin
			XOR48_Finish <= 1'b0;
			XOR48_Reg <= 48'bx;
		end
	end
	

endmodule