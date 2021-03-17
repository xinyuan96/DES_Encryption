module Left_Shift2(
	Left_Shift2_Left_Input,
	Left_Shift2_Right_Input,
	Left_Shift2_Select,
	Left_Shift2_Left_Output,
	Left_Shift2_Right_Output,
	Left_Shift2_Finish_Flag,
	clk
);

	//input
	input wire [28:1] Left_Shift2_Left_Input;
	input wire [28:1] Left_Shift2_Right_Input;
	input wire Left_Shift2_Select;
	input clk;
	//output
	output [28:1] Left_Shift2_Left_Output;
	output [28:1] Left_Shift2_Right_Output;
	output Left_Shift2_Finish_Flag;
	//internal register
	reg [28:1] Left;
	reg [28:1] Right;
	reg Left_Shift2_Finish;
	
	assign Left_Shift2_Left_Output = Left;
	assign Left_Shift2_Right_Output = Right;
	assign Left_Shift2_Finish_Flag = Left_Shift2_Finish;
	//
	always@(posedge clk) begin
		if(Left_Shift2_Select) begin
			Left <= {Left_Shift2_Left_Input[26:1], Left_Shift2_Left_Input[28:27]};
			Right <= {Left_Shift2_Right_Input[26:1], Left_Shift2_Right_Input[28:27]};
			Left_Shift2_Finish <= 1'b1;
		end
		else begin
			Left <= 28'bx;
			Right <= 28'bx;
			Left_Shift2_Finish <= 1'b0;
		end
	end
	
endmodule