	module Final_Permutation(
	Final_Permutation_Input,
	Final_Permutation_Select,
	Final_Permutation_Output,
	Final_Permutation_Finish_Flag,
	clk
);
	//input
	input [64:1] Final_Permutation_Input;
	input Final_Permutation_Select;
	input clk;
	//output
	output [64:1] Final_Permutation_Output;
	output Final_Permutation_Finish_Flag;
	//internal register
	reg [64:1] Final_Permutation;
	reg Final_Permutation_Finish;
	
	assign Final_Permutation_Output = Final_Permutation;
	assign Final_Permutation_Finish_Flag = Final_Permutation_Finish;
	
 always@(posedge clk) begin
	if(Final_Permutation_Select) begin
		Final_Permutation[64] <= Final_Permutation_Input[25];
		Final_Permutation[63] <= Final_Permutation_Input[57];
		Final_Permutation[62] <= Final_Permutation_Input[17];
		Final_Permutation[61] <= Final_Permutation_Input[49];
		Final_Permutation[60] <= Final_Permutation_Input[9];
		Final_Permutation[59] <= Final_Permutation_Input[41];
		Final_Permutation[58] <= Final_Permutation_Input[1];
		Final_Permutation[57] <= Final_Permutation_Input[33];
	
		Final_Permutation[56] <= Final_Permutation_Input[26];
		Final_Permutation[55] <= Final_Permutation_Input[58];
		Final_Permutation[54] <= Final_Permutation_Input[18];
		Final_Permutation[53] <= Final_Permutation_Input[50];
		Final_Permutation[52] <= Final_Permutation_Input[10];
		Final_Permutation[51] <= Final_Permutation_Input[42];
		Final_Permutation[50] <= Final_Permutation_Input[2];
		Final_Permutation[49] <= Final_Permutation_Input[34];
	
		Final_Permutation[48] <= Final_Permutation_Input[27];
		Final_Permutation[47] <= Final_Permutation_Input[59];
		Final_Permutation[46] <= Final_Permutation_Input[19];
		Final_Permutation[45] <= Final_Permutation_Input[51];
		Final_Permutation[44] <= Final_Permutation_Input[11];
		Final_Permutation[43] <= Final_Permutation_Input[43];
		Final_Permutation[42] <= Final_Permutation_Input[3];
		Final_Permutation[41] <= Final_Permutation_Input[35];
	
		Final_Permutation[40] <= Final_Permutation_Input[28];
		Final_Permutation[39] <= Final_Permutation_Input[60];
		Final_Permutation[38] <= Final_Permutation_Input[20];
		Final_Permutation[37] <= Final_Permutation_Input[52];
		Final_Permutation[36] <= Final_Permutation_Input[12];
		Final_Permutation[35] <= Final_Permutation_Input[44];
		Final_Permutation[34] <= Final_Permutation_Input[4];
		Final_Permutation[33] <= Final_Permutation_Input[36];
	
		Final_Permutation[32] <= Final_Permutation_Input[29];
		Final_Permutation[31] <= Final_Permutation_Input[61];
		Final_Permutation[30] <= Final_Permutation_Input[21];
		Final_Permutation[29] <= Final_Permutation_Input[53];
		Final_Permutation[28] <= Final_Permutation_Input[13];
		Final_Permutation[27] <= Final_Permutation_Input[45];
		Final_Permutation[26] <= Final_Permutation_Input[5];
		Final_Permutation[25] <= Final_Permutation_Input[37];
	
		Final_Permutation[24] <= Final_Permutation_Input[30];
		Final_Permutation[23] <= Final_Permutation_Input[62];
		Final_Permutation[22] <= Final_Permutation_Input[22];
		Final_Permutation[21] <= Final_Permutation_Input[54];
		Final_Permutation[20] <= Final_Permutation_Input[14];
		Final_Permutation[19] <= Final_Permutation_Input[46];
		Final_Permutation[18] <= Final_Permutation_Input[6];
		Final_Permutation[17] <= Final_Permutation_Input[38];
	
		Final_Permutation[16] <= Final_Permutation_Input[31];
		Final_Permutation[15] <= Final_Permutation_Input[63];
		Final_Permutation[14] <= Final_Permutation_Input[23];
		Final_Permutation[13] <= Final_Permutation_Input[55];
		Final_Permutation[12] <= Final_Permutation_Input[15];
		Final_Permutation[11] <= Final_Permutation_Input[47];
		Final_Permutation[10] <= Final_Permutation_Input[7];
		Final_Permutation[9] <= Final_Permutation_Input[39];
	
		Final_Permutation[8] <= Final_Permutation_Input[32];
		Final_Permutation[7] <= Final_Permutation_Input[64];
		Final_Permutation[6] <= Final_Permutation_Input[24];
		Final_Permutation[5] <= Final_Permutation_Input[56];
		Final_Permutation[4] <= Final_Permutation_Input[16];
		Final_Permutation[3] <= Final_Permutation_Input[48];
		Final_Permutation[2] <= Final_Permutation_Input[8];
		Final_Permutation[1] <= Final_Permutation_Input[40];
		
		Final_Permutation_Finish <= 1'b1;
	end
	else begin
		Final_Permutation <= 64'bx;
		Final_Permutation_Finish <= 1'b0;
	end
 end
 
endmodule