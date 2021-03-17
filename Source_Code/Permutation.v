module Permutation(
	Permutation_Input,
	Permutation_Select,
	Permutation_Output,
	Permutation_Finish_Flag,
	clk
);
	//input
	input [32:1] Permutation_Input;
	input Permutation_Select;
	input clk;
	//output
	output [32:1] Permutation_Output;
	output Permutation_Finish_Flag;
	//internal register
	reg [32:1] Permutation_Reg;
	reg Permutation_Finish;
	
	assign Permutation_Output = Permutation_Reg;
	assign Permutation_Finish_Flag = Permutation_Finish;
	
	always@(posedge clk) begin
		if(Permutation_Select) begin
			Permutation_Reg[32] <= Permutation_Input[17];
			Permutation_Reg[31] <= Permutation_Input[26];
			Permutation_Reg[30] <= Permutation_Input[13];
			Permutation_Reg[29] <= Permutation_Input[12];
			Permutation_Reg[28] <= Permutation_Input[4];
			Permutation_Reg[27] <= Permutation_Input[21];
			Permutation_Reg[26] <= Permutation_Input[5];
			Permutation_Reg[25] <= Permutation_Input[16];
			
			Permutation_Reg[24] <= Permutation_Input[32];
			Permutation_Reg[23] <= Permutation_Input[18];
			Permutation_Reg[22] <= Permutation_Input[10];
			Permutation_Reg[21] <= Permutation_Input[7];
			Permutation_Reg[20] <= Permutation_Input[28];
			Permutation_Reg[19] <= Permutation_Input[15];
			Permutation_Reg[18] <= Permutation_Input[2];
			Permutation_Reg[17] <= Permutation_Input[23];
			
			Permutation_Reg[16] <= Permutation_Input[31];
			Permutation_Reg[15] <= Permutation_Input[25];
			Permutation_Reg[14] <= Permutation_Input[9];
			Permutation_Reg[13] <= Permutation_Input[19];
			Permutation_Reg[12] <= Permutation_Input[1];
			Permutation_Reg[11] <= Permutation_Input[6];
			Permutation_Reg[10] <= Permutation_Input[30];
			Permutation_Reg[9] <= Permutation_Input[24];
			
			Permutation_Reg[8] <= Permutation_Input[14];
			Permutation_Reg[7] <= Permutation_Input[20];
			Permutation_Reg[6] <= Permutation_Input[3];
			Permutation_Reg[5] <= Permutation_Input[27];
			Permutation_Reg[4] <= Permutation_Input[11];
			Permutation_Reg[3] <= Permutation_Input[22];
			Permutation_Reg[2] <= Permutation_Input[29];
			Permutation_Reg[1] <= Permutation_Input[8];
			
			Permutation_Finish <= 1'b1;
		end
		else begin
			Permutation_Reg <= 32'bx;
			Permutation_Finish <= 1'b0;
		end
	end
	
endmodule