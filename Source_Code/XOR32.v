module XOR32(
	XOR32_Input_A,
	XOR32_Input_B,
	XOR32_Select,
	XOR32_Output,
	XOR32_Finish_Flag,
	clk
);

	//input
	input [32:1] XOR32_Input_A;
	input [32:1] XOR32_Input_B;
	input clk;
	input XOR32_Select;
	//output
	output [32:1] XOR32_Output;
	output XOR32_Finish_Flag;
	//internal register
	reg [32:1] XOR32_Reg;
	reg XOR32_Finish;
	assign XOR32_Output = XOR32_Reg;
	assign XOR32_Finish_Flag = XOR32_Finish;
	
	always@(posedge clk) begin
		if(XOR32_Select) begin
			XOR32_Reg <= XOR32_Input_A ^ XOR32_Input_B;
			XOR32_Finish <= 1'b1;
		end
		else begin
			XOR32_Finish <= 1'b0;
			XOR32_Reg <= 32'bx;
		end
	end

endmodule