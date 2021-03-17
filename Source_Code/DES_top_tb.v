`timescale 1ns/1ns

`define clk_period 10

module DES_top_tb;
	//input
	wire [64:1] Result;
	wire [4:1] State_in_Tb;
	wire [4:1] Round_in_Tb;
	//output
	reg Clk_Reg, Rst_Reg;
	wire Clk_tb, Rst_tb;
	assign Clk_tb = Clk_Reg;
	assign Rst_tb = Rst_Reg;
	
	wire [64:1] Text;
	reg [64:1] Text_Reg;
	assign Text = Text_Reg;
	
	wire [64:1] Key;
	reg [64:1] Key_Reg;
	assign Key = Key_Reg;
	//internal register
	
	wire [64:1] Initial_Permutation_Output;
	wire [28:1] PC1_Left, PC1_Right;
	wire [28:1] Key_Left, Key_Right;
	wire [28:1] Left_Shift1_Left_Output;
	wire [28:1] Left_Shift1_Right_Output;
	wire [28:1] Left_Shift2_Left_Output;
	wire [28:1] Left_Shift2_Right_Output;
	wire [48:1] Permuted_Choice_2_Output;
	wire [48:1] Expansion_Function_Output;
	wire [48:1] XOR48_Output;
	wire [6:1] S_Box_S2_Input;
	wire [4:1] S_Box_S1_Output;
	wire [4:1] S_Box_S2_Output;
	wire [4:1] S_Box_S3_Output;
	wire [4:1] S_Box_S4_Output;
	wire [4:1] S_Box_S5_Output;
	wire [4:1] S_Box_S6_Output;
	wire [4:1] S_Box_S7_Output;
	wire [4:1] S_Box_S8_Output;
//	wire [48:1] XOR48_Output;
//	wire [4:1] S_Box_S1_Output;
//	wire [32:1] Permutation_Output;
//	
//	wire [64:1] Left_Right_Swap_Output;

	wire [32:1] Text_L;
	wire [32:1] Text_R;
	wire [32:1] XOR32_Output;
	wire [32:1] Permutation_Output;
	wire [64:1] Final_Permutation_Output;
	
	//instance initiation
	DES_top DES_DUV(
		.Text_Input(Text), 
		.Key_Input(Key), 
		.clk(Clk_tb), 
		.rst(Rst_tb), 
		.Final_Result(Result), 
		.State_For_Tb(State_in_Tb), 
		.Round_for_Tb(Round_in_Tb),
		.Initial_Permutation_Output(Initial_Permutation_Output),
		.PC1_Left(PC1_Left),
		.PC1_Right(PC1_Right),
		.Key_Left(Key_Left),
		.Key_Right(Key_Right),
		.Left_Shift1_Left_Output(Left_Shift1_Left_Output),
		.Left_Shift1_Right_Output(Left_Shift1_Right_Output),
		.Left_Shift2_Left_Output(Left_Shift2_Left_Output),
		.Left_Shift2_Right_Output(Left_Shift2_Right_Output),
		.Permuted_Choice_2_Output(Permuted_Choice_2_Output),
		.Expansion_Function_Output(Expansion_Function_Output),
		.XOR48_Output(XOR48_Output),
		.S_Box_S2_Input(S_Box_S2_Input),
		.S_Box_S1_Output(S_Box_S1_Output),
		.S_Box_S2_Output(S_Box_S2_Output),
		.S_Box_S3_Output(S_Box_S3_Output),
		.S_Box_S4_Output(S_Box_S4_Output),
		.S_Box_S5_Output(S_Box_S5_Output),
		.S_Box_S6_Output(S_Box_S6_Output),
		.S_Box_S7_Output(S_Box_S7_Output),
		.S_Box_S8_Output(S_Box_S8_Output),
		.Left_Right_Swap_Input_Left(Text_L),
		.Left_Right_Swap_Input_Right(Text_R),
		.XOR32_Output(XOR32_Output),
		.Permutation_Output(Permutation_Output),
		.Final_Permutation_Output(Final_Permutation_Output)
		);
	
	// initialize test
  initial
    begin
      Rst_Reg <= 1;
		# 22; Rst_Reg <= 0;Text_Reg <= 64'h0123456789ABCDEF; Key_Reg <= 64'h133457799BBCDFF1;
    end

  // generate clock to sequence tests
  always
    begin
      Clk_Reg <= 1; # 5; Clk_Reg <= 0; # 5;
    end

  // check that 7 gets written to address 84
  always@(negedge Clk_tb) begin
	if(State_in_Tb == 11)begin
		# 100;
		$stop;
	end
	
  end
	
endmodule