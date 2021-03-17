module Left_Shift1(
	Left_Shift1_Left_Input,
	Left_Shift1_Right_Input,
	Left_Shift1_Select,
	Left_Shift1_Left_Output,
	Left_Shift1_Right_Output,
	Left_Shift1_Finish_Flag,
	clk
);

	//input
	input [28:1] Left_Shift1_Left_Input;
	input [28:1] Left_Shift1_Right_Input;
	input Left_Shift1_Select;
	input clk;
	//output
	output [28:1] Left_Shift1_Left_Output;
	output [28:1] Left_Shift1_Right_Output;
	output Left_Shift1_Finish_Flag;
	//internal register
	reg [28:1] Left;
	reg [28:1] Right;
	reg Left_Shift1_Finish;
	
	assign Left_Shift1_Left_Output = Left;
	assign Left_Shift1_Right_Output = Right;
	assign Left_Shift1_Finish_Flag = Left_Shift1_Finish;
	
	always@(posedge clk) begin
		if(Left_Shift1_Select) begin
			Left <= {Left_Shift1_Left_Input[27:1], Left_Shift1_Left_Input[28]};
			Right <= {Left_Shift1_Right_Input[27:1], Left_Shift1_Right_Input[28]};
			Left_Shift1_Finish <= 1'b1;
		end
		else begin
			Left <= 28'bx;
			Right <= 28'bx;
			Left_Shift1_Finish <= 1'b0;
		end
	end

endmodule