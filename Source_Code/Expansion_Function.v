module Expansion_Function(
	Expansion_Function_Input,
	Expansion_Function_Select,
	Expansion_Function_Output,
	Expansion_Function_Finish_Flag,
	clk
);
	//input
	input [32:1] Expansion_Function_Input;
	input Expansion_Function_Select;
	input clk;
	//output
	output [48:1] Expansion_Function_Output;
	output Expansion_Function_Finish_Flag;
	//internal register
	reg [48:1] Expansion_Function;
	reg Expansion_Function_Finish;
	
	assign Expansion_Function_Output = Expansion_Function;
	assign Expansion_Function_Finish_Flag = Expansion_Function_Finish;
	
	always@(clk) begin
		if(Expansion_Function_Select) begin
			Expansion_Function[48] <= Expansion_Function_Input[1];
			Expansion_Function[47] <= Expansion_Function_Input[32];
			Expansion_Function[46] <= Expansion_Function_Input[31];
			Expansion_Function[45] <= Expansion_Function_Input[30];
			Expansion_Function[44] <= Expansion_Function_Input[29];
			Expansion_Function[43] <= Expansion_Function_Input[28];
			
			Expansion_Function[42] <= Expansion_Function_Input[29];
			Expansion_Function[41] <= Expansion_Function_Input[28];
			Expansion_Function[40] <= Expansion_Function_Input[27];
			Expansion_Function[39] <= Expansion_Function_Input[26];
			Expansion_Function[38] <= Expansion_Function_Input[25];
			Expansion_Function[37] <= Expansion_Function_Input[24];
			
			Expansion_Function[36] <= Expansion_Function_Input[25];
			Expansion_Function[35] <= Expansion_Function_Input[24];
			Expansion_Function[34] <= Expansion_Function_Input[23];
			Expansion_Function[33] <= Expansion_Function_Input[22];
			Expansion_Function[32] <= Expansion_Function_Input[21];
			Expansion_Function[31] <= Expansion_Function_Input[20];
			
			Expansion_Function[30] <= Expansion_Function_Input[21];
			Expansion_Function[29] <= Expansion_Function_Input[20];
			Expansion_Function[28] <= Expansion_Function_Input[19];
			Expansion_Function[27] <= Expansion_Function_Input[18];
			Expansion_Function[26] <= Expansion_Function_Input[17];
			Expansion_Function[25] <= Expansion_Function_Input[16];
			
			Expansion_Function[24] <= Expansion_Function_Input[17];
			Expansion_Function[23] <= Expansion_Function_Input[16];
			Expansion_Function[22] <= Expansion_Function_Input[15];
			Expansion_Function[21] <= Expansion_Function_Input[14];
			Expansion_Function[20] <= Expansion_Function_Input[13];
			Expansion_Function[19] <= Expansion_Function_Input[12];
			
			Expansion_Function[18] <= Expansion_Function_Input[13];
			Expansion_Function[17] <= Expansion_Function_Input[12];
			Expansion_Function[16] <= Expansion_Function_Input[11];
			Expansion_Function[15] <= Expansion_Function_Input[10];
			Expansion_Function[14] <= Expansion_Function_Input[9];
			Expansion_Function[13] <= Expansion_Function_Input[8];
			
			Expansion_Function[12] <= Expansion_Function_Input[9];
			Expansion_Function[11] <= Expansion_Function_Input[8];
			Expansion_Function[10] <= Expansion_Function_Input[7];
			Expansion_Function[9] <= Expansion_Function_Input[6];
			Expansion_Function[8] <= Expansion_Function_Input[5];
			Expansion_Function[7] <= Expansion_Function_Input[4];
			
			Expansion_Function[6] <= Expansion_Function_Input[5];
			Expansion_Function[5] <= Expansion_Function_Input[4];
			Expansion_Function[4] <= Expansion_Function_Input[3];
			Expansion_Function[3] <= Expansion_Function_Input[2];
			Expansion_Function[2] <= Expansion_Function_Input[1];
			Expansion_Function[1] <= Expansion_Function_Input[32];
			
			Expansion_Function_Finish <= 1'b1;
		end
		else begin
			Expansion_Function <= 48'bx;
			Expansion_Function_Finish <= 1'b0;
		end
	end
	
endmodule