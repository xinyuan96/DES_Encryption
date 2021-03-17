//This permutation selects the 48-bit subkey for 
//each round from the 56-bit key-schedule state. 
//This permutation will ignore 8 bits below:
//Permuted Choice 2 "PC-2" Ignored bits 9,18,22,25,35,38,43,54.


module Permuted_Choice_2(
	Permuted_Choice_2_Input,
	Permuted_Choice_2_Select,
	Permuted_Choice_2_Output,
	Permuted_Choice_2_Finish_Flag,
	clk
);
	//input
	input [56:1] Permuted_Choice_2_Input;
	input Permuted_Choice_2_Select;
	input clk;
	//output
	output [48:1] 	Permuted_Choice_2_Output;
	output Permuted_Choice_2_Finish_Flag;
	//internal register
	reg [48:1] Permuted_Choice_2;
	reg Permuted_Choice_2_Finish;
	
	assign Permuted_Choice_2_Output = Permuted_Choice_2;
	assign Permuted_Choice_2_Finish_Flag = Permuted_Choice_2_Finish;
	
	always@(posedge clk) begin
		if(Permuted_Choice_2_Select) begin
			Permuted_Choice_2[48] <= Permuted_Choice_2_Input[43];
			Permuted_Choice_2[47] <= Permuted_Choice_2_Input[40];
			Permuted_Choice_2[46] <= Permuted_Choice_2_Input[46];
			Permuted_Choice_2[45] <= Permuted_Choice_2_Input[33];
			Permuted_Choice_2[44] <= Permuted_Choice_2_Input[56];
			Permuted_Choice_2[43] <= Permuted_Choice_2_Input[52];
			
			Permuted_Choice_2[42] <= Permuted_Choice_2_Input[54];
			Permuted_Choice_2[41] <= Permuted_Choice_2_Input[29];
			Permuted_Choice_2[40] <= Permuted_Choice_2_Input[42];
			Permuted_Choice_2[39] <= Permuted_Choice_2_Input[51];
			Permuted_Choice_2[38] <= Permuted_Choice_2_Input[36];
			Permuted_Choice_2[37] <= Permuted_Choice_2_Input[47];
			
			Permuted_Choice_2[36] <= Permuted_Choice_2_Input[34];
			Permuted_Choice_2[35] <= Permuted_Choice_2_Input[38];
			Permuted_Choice_2[34] <= Permuted_Choice_2_Input[45];
			Permuted_Choice_2[33] <= Permuted_Choice_2_Input[53];
			Permuted_Choice_2[32] <= Permuted_Choice_2_Input[31];
			Permuted_Choice_2[31] <= Permuted_Choice_2_Input[49];
			
			Permuted_Choice_2[30] <= Permuted_Choice_2_Input[41];
			Permuted_Choice_2[29] <= Permuted_Choice_2_Input[50];
			Permuted_Choice_2[28] <= Permuted_Choice_2_Input[30];
			Permuted_Choice_2[27] <= Permuted_Choice_2_Input[37];
			Permuted_Choice_2[26] <= Permuted_Choice_2_Input[44];
			Permuted_Choice_2[25] <= Permuted_Choice_2_Input[55];
			
			Permuted_Choice_2[24] <= Permuted_Choice_2_Input[16];
			Permuted_Choice_2[23] <= Permuted_Choice_2_Input[5];
			Permuted_Choice_2[22] <= Permuted_Choice_2_Input[26];
			Permuted_Choice_2[21] <= Permuted_Choice_2_Input[20];
			Permuted_Choice_2[20] <= Permuted_Choice_2_Input[10];
			Permuted_Choice_2[19] <= Permuted_Choice_2_Input[2];
			
			Permuted_Choice_2[18] <= Permuted_Choice_2_Input[27];
			Permuted_Choice_2[17] <= Permuted_Choice_2_Input[17];
			Permuted_Choice_2[16] <= Permuted_Choice_2_Input[6];
			Permuted_Choice_2[15] <= Permuted_Choice_2_Input[12];
			Permuted_Choice_2[14] <= Permuted_Choice_2_Input[24];
			Permuted_Choice_2[13] <= Permuted_Choice_2_Input[9];
			
			Permuted_Choice_2[12] <= Permuted_Choice_2_Input[13];
			Permuted_Choice_2[11] <= Permuted_Choice_2_Input[8];
			Permuted_Choice_2[10] <= Permuted_Choice_2_Input[18];
			Permuted_Choice_2[9] <= Permuted_Choice_2_Input[1];
			Permuted_Choice_2[8] <= Permuted_Choice_2_Input[23];
			Permuted_Choice_2[7] <= Permuted_Choice_2_Input[4];
			
			Permuted_Choice_2[6] <= Permuted_Choice_2_Input[11];
			Permuted_Choice_2[5] <= Permuted_Choice_2_Input[15];
			Permuted_Choice_2[4] <= Permuted_Choice_2_Input[7];
			Permuted_Choice_2[3] <= Permuted_Choice_2_Input[21];
			Permuted_Choice_2[2] <= Permuted_Choice_2_Input[28];
			Permuted_Choice_2[1] <= Permuted_Choice_2_Input[25];
			
			Permuted_Choice_2_Finish <= 1'b1;
		end
		else begin
			Permuted_Choice_2[48:1] <= 48'bx;
			Permuted_Choice_2_Finish <= 1'b0;
		end
	end

endmodule