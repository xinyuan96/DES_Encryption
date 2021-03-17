//The "Left" and "Right" halves of the table show which bits 
//from the input key form the left and right sections of the 
//key schedule state. Note that only 56 bits of the 64 bits 
//of the input are selected; 
//the remaining eight (8, 16, 24, 32, 40, 48, 56, 64) were 
//specified for use as parity bits.

module Permuted_Choice_1(
	Permuted_Choice_1_Input,
	Permuted_Choice_1_Select,
	Left,
	Right,
	Permuted_Choice_1_Finish_Flag,
	clk
);
	//input 
	input [64:1] Permuted_Choice_1_Input;
	input wire Permuted_Choice_1_Select;
	input clk;
	//output
	output [28:1] Left;
	output [28:1] Right;
	output Permuted_Choice_1_Finish_Flag;
	//internal register
	reg [56:1] PC1_Permutation;
	reg Permuted_Choice_1_Finish;
	
	assign Left = PC1_Permutation[56:29];
	assign Right = PC1_Permutation[28:1];
	
	assign Permuted_Choice_1_Finish_Flag = Permuted_Choice_1_Finish;
	
	always@(posedge clk) begin
		if(Permuted_Choice_1_Select) begin
			PC1_Permutation[56] <= Permuted_Choice_1_Input[8];
			PC1_Permutation[55] <= Permuted_Choice_1_Input[16];
			PC1_Permutation[54] <= Permuted_Choice_1_Input[24];
			PC1_Permutation[53] <= Permuted_Choice_1_Input[32];
			PC1_Permutation[52] <= Permuted_Choice_1_Input[40];
			PC1_Permutation[51] <= Permuted_Choice_1_Input[48];
			PC1_Permutation[50] <= Permuted_Choice_1_Input[56];
			PC1_Permutation[49] <= Permuted_Choice_1_Input[64];
			PC1_Permutation[48] <= Permuted_Choice_1_Input[7];
			PC1_Permutation[47] <= Permuted_Choice_1_Input[15];
			PC1_Permutation[46] <= Permuted_Choice_1_Input[23];
			PC1_Permutation[45] <= Permuted_Choice_1_Input[31];
			PC1_Permutation[44] <= Permuted_Choice_1_Input[39];
			PC1_Permutation[43] <= Permuted_Choice_1_Input[47];
			PC1_Permutation[42] <= Permuted_Choice_1_Input[55];
			PC1_Permutation[41] <= Permuted_Choice_1_Input[63];
			PC1_Permutation[40] <= Permuted_Choice_1_Input[6];
			PC1_Permutation[39] <= Permuted_Choice_1_Input[14];
			PC1_Permutation[38] <= Permuted_Choice_1_Input[22];
			PC1_Permutation[37] <= Permuted_Choice_1_Input[30];
			PC1_Permutation[36] <= Permuted_Choice_1_Input[38];
			PC1_Permutation[35] <= Permuted_Choice_1_Input[46];
			PC1_Permutation[34] <= Permuted_Choice_1_Input[54];
			PC1_Permutation[33] <= Permuted_Choice_1_Input[62];
			PC1_Permutation[32] <= Permuted_Choice_1_Input[5];
			PC1_Permutation[31] <= Permuted_Choice_1_Input[13];
			PC1_Permutation[30] <= Permuted_Choice_1_Input[21];
			PC1_Permutation[29] <= Permuted_Choice_1_Input[29];
			//----------------right part----------------
			PC1_Permutation[28] <= Permuted_Choice_1_Input[2];
			PC1_Permutation[27] <= Permuted_Choice_1_Input[10];
			PC1_Permutation[26] <= Permuted_Choice_1_Input[18];
			PC1_Permutation[25] <= Permuted_Choice_1_Input[26];
			PC1_Permutation[24] <= Permuted_Choice_1_Input[34];
			PC1_Permutation[23] <= Permuted_Choice_1_Input[42];
			PC1_Permutation[22] <= Permuted_Choice_1_Input[50];
			PC1_Permutation[21] <= Permuted_Choice_1_Input[58];
			PC1_Permutation[20] <= Permuted_Choice_1_Input[3];
			PC1_Permutation[19] <= Permuted_Choice_1_Input[11];
			PC1_Permutation[18] <= Permuted_Choice_1_Input[19];
			PC1_Permutation[17] <= Permuted_Choice_1_Input[27];
			PC1_Permutation[16] <= Permuted_Choice_1_Input[35];
			PC1_Permutation[15] <= Permuted_Choice_1_Input[43];
			PC1_Permutation[14] <= Permuted_Choice_1_Input[51];
			PC1_Permutation[13] <= Permuted_Choice_1_Input[59];
			PC1_Permutation[12] <= Permuted_Choice_1_Input[4];
			PC1_Permutation[11] <= Permuted_Choice_1_Input[12];
			PC1_Permutation[10] <= Permuted_Choice_1_Input[20];
			PC1_Permutation[9] <= Permuted_Choice_1_Input[28];
			PC1_Permutation[8] <= Permuted_Choice_1_Input[36];
			PC1_Permutation[7] <= Permuted_Choice_1_Input[44];
			PC1_Permutation[6] <= Permuted_Choice_1_Input[52];
			PC1_Permutation[5] <= Permuted_Choice_1_Input[60];
			PC1_Permutation[4] <= Permuted_Choice_1_Input[37];
			PC1_Permutation[3] <= Permuted_Choice_1_Input[45];
			PC1_Permutation[2] <= Permuted_Choice_1_Input[53];
			PC1_Permutation[1] <= Permuted_Choice_1_Input[61];
			
			Permuted_Choice_1_Finish <= 1'b1;
		end
		else begin
			PC1_Permutation <= 64'bx;
			Permuted_Choice_1_Finish <= 1'b0;
		end
	end

endmodule