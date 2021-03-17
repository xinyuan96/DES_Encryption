module Initial_Permutation(
	Input_Text,
	Initial_Permutation_Select,
	Initial_Permutation_Output,
	Initial_Permutation_Finish_Flag,
	clk
);
	//input
	input [64:1] Input_Text;
	input Initial_Permutation_Select;
	input clk;
	//output
	output [64:1] Initial_Permutation_Output;
	output Initial_Permutation_Finish_Flag;
	//internal register
	reg [64:1] Initial_Permutation;
	reg Initial_Permutation_Finish;
	
	assign Initial_Permutation_Output = Initial_Permutation;
	assign Initial_Permutation_Finish_Flag = Initial_Permutation_Finish;
	
	always@(posedge clk) begin
		if(Initial_Permutation_Select) begin
			Initial_Permutation[64] <= Input_Text[7];
			Initial_Permutation[63] <= Input_Text[15];
			Initial_Permutation[62] <= Input_Text[23];
			Initial_Permutation[61] <= Input_Text[31];
			Initial_Permutation[60] <= Input_Text[39];
			Initial_Permutation[59] <= Input_Text[47];
			Initial_Permutation[58] <= Input_Text[55];
			Initial_Permutation[57] <= Input_Text[63];
		
			Initial_Permutation[56] <= Input_Text[5];
			Initial_Permutation[55] <= Input_Text[13];
			Initial_Permutation[54] <= Input_Text[21];
			Initial_Permutation[53] <= Input_Text[29];
			Initial_Permutation[52] <= Input_Text[37];
			Initial_Permutation[51] <= Input_Text[45];
			Initial_Permutation[50] <= Input_Text[53];
			Initial_Permutation[49] <= Input_Text[61];
		
			Initial_Permutation[48] <= Input_Text[3];
			Initial_Permutation[47] <= Input_Text[11];
			Initial_Permutation[46] <= Input_Text[19];
			Initial_Permutation[45] <= Input_Text[27];
			Initial_Permutation[44] <= Input_Text[35];
			Initial_Permutation[43] <= Input_Text[43];
			Initial_Permutation[42] <= Input_Text[51];
			Initial_Permutation[41] <= Input_Text[59];
		
			Initial_Permutation[40] <= Input_Text[1];
			Initial_Permutation[39] <= Input_Text[9];
			Initial_Permutation[38] <= Input_Text[17];
			Initial_Permutation[37] <= Input_Text[25];
			Initial_Permutation[36] <= Input_Text[33];
			Initial_Permutation[35] <= Input_Text[41];
			Initial_Permutation[34] <= Input_Text[49];
			Initial_Permutation[33] <= Input_Text[57];
		
			Initial_Permutation[32] <= Input_Text[8];
			Initial_Permutation[31] <= Input_Text[16];
			Initial_Permutation[30] <= Input_Text[24];
			Initial_Permutation[29] <= Input_Text[32];
			Initial_Permutation[28] <= Input_Text[40];
			Initial_Permutation[27] <= Input_Text[48];
			Initial_Permutation[26] <= Input_Text[56];
			Initial_Permutation[25] <= Input_Text[64];
		
			Initial_Permutation[24] <= Input_Text[6];
			Initial_Permutation[23] <= Input_Text[14];
			Initial_Permutation[22] <= Input_Text[22];
			Initial_Permutation[21] <= Input_Text[30];
			Initial_Permutation[20] <= Input_Text[38];
			Initial_Permutation[19] <= Input_Text[46];
			Initial_Permutation[18] <= Input_Text[54];
			Initial_Permutation[17] <= Input_Text[62];
		
			Initial_Permutation[16] <= Input_Text[4];
			Initial_Permutation[15] <= Input_Text[12];
			Initial_Permutation[14] <= Input_Text[20];
			Initial_Permutation[13] <= Input_Text[28];
			Initial_Permutation[12] <= Input_Text[36];
			Initial_Permutation[11] <= Input_Text[44];
			Initial_Permutation[10] <= Input_Text[52];
			Initial_Permutation[9] <= Input_Text[60];
		
			Initial_Permutation[8] <= Input_Text[2];
			Initial_Permutation[7] <= Input_Text[10];
			Initial_Permutation[6] <= Input_Text[18];
			Initial_Permutation[5] <= Input_Text[26];
			Initial_Permutation[4] <= Input_Text[34];
			Initial_Permutation[3] <= Input_Text[42];
			Initial_Permutation[2] <= Input_Text[50];
			Initial_Permutation[1] <= Input_Text[58];
			
			Initial_Permutation_Finish <= 1'b1;
		end
		else begin
			Initial_Permutation <= 64'bx;
			Initial_Permutation_Finish <= 1'b0;
		end
	
	end

endmodule