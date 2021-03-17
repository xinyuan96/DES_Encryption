module Left_Right_Swap(
	Left_Right_Swap_Input_Left,
	Left_Right_Swap_Input_Right,
	Left_Right_Swap_Select,
	Left_Right_Swap_Output,
	Left_Right_Swap_Finish_Flag,
	clk
);

	//input
	input [32:1] Left_Right_Swap_Input_Left;
	input [32:1] Left_Right_Swap_Input_Right;
	input Left_Right_Swap_Select;
	input clk;
	//output
	output [64:1] Left_Right_Swap_Output;
	output Left_Right_Swap_Finish_Flag;
	//internal register
	reg [64:1] Left_Right_Swap;
	reg Left_Right_Swap_Finish;
	
	assign Left_Right_Swap_Output = Left_Right_Swap;
	assign Left_Right_Swap_Finish_Flag = Left_Right_Swap_Finish;
	
	always@(posedge clk) begin
		if(Left_Right_Swap_Select) begin
			Left_Right_Swap <= {Left_Right_Swap_Input_Right, Left_Right_Swap_Input_Left};
			Left_Right_Swap_Finish <= 1'b1;
		end
		else begin
			Left_Right_Swap <= 64'bx;
			Left_Right_Swap_Finish <= 1'b0;
		end
	end
endmodule