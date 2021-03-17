	module DES_top(
	Text_Input,
	Key_Input,
	clk,
	rst,
	Final_Result,
	State_For_Tb,
	Round_for_Tb,
	Initial_Permutation_Output,
	PC1_Left, 
	PC1_Right,
	Key_Left,
	Key_Right,
	Left_Shift1_Left_Output,
	Left_Shift1_Right_Output,
	Left_Shift2_Left_Output,
	Left_Shift2_Right_Output,
	Permuted_Choice_2_Output,
	Expansion_Function_Output,
	XOR48_Output,
	S_Box_S2_Input,
	S_Box_S1_Output,
	S_Box_S2_Output,
	S_Box_S3_Output,
	S_Box_S4_Output,
	S_Box_S5_Output,
	S_Box_S6_Output,
	S_Box_S7_Output,
	S_Box_S8_Output,
	Left_Right_Swap_Input_Left,
	Left_Right_Swap_Input_Right,
	XOR32_Output,
	Permutation_Output,
	Final_Permutation_Output
);

	//input
	input wire [64:1] Text_Input;
	input wire [64:1] Key_Input;
	input wire clk;
	input wire rst;
	//output
	output wire [64:1] Final_Result;
	reg [64:1] Final_Result_Reg;
	assign Final_Result = Final_Result_Reg;
	output wire [4:1] State_For_Tb;

	//-------------Internal Constants--------------------------
	parameter ROUND = 15; //must include 
	//=============Internal Register======================
	reg [4:1] state;
	assign State_For_Tb = state;
	reg [4:1] Round_Counter;
	//
	output wire [4:1] Round_for_Tb;
	assign Round_for_Tb = Round_Counter;
	reg [32:1] Text_Left;
	reg [32:1] Text_Right;
	
	output wire [28:1] Key_Left;
	reg [28:1] Key_Left_Reg;
	assign Key_Left = Key_Left_Reg;
	
	output wire [28:1]Key_Right;
	reg [28:1] Key_Right_Reg;
	assign Key_Right = Key_Right_Reg;
	
	reg [48:1] Subkey;
	reg [48:1] Temp48;
	
	
	//----------Initiate Instance and their veriable------------------------
	wire Initial_Permutation_Select;
	reg Initial_Permutation_Select_Reg;
	assign Initial_Permutation_Select = Initial_Permutation_Select_Reg;
	output wire [64:1] Initial_Permutation_Output;
	wire Initial_Permutation_Finish_Flag;
	Initial_Permutation IP(Text_Input, Initial_Permutation_Select, Initial_Permutation_Output, Initial_Permutation_Finish_Flag, clk);
	
	wire Permuted_Choice_1_Select;
	reg Permuted_Choice_1_Select_Reg;
	assign Permuted_Choice_1_Select = Permuted_Choice_1_Select_Reg;
	output wire [28:1] PC1_Left, PC1_Right;
	wire Permuted_Choice_1_Finish_Flag;
	Permuted_Choice_1 PC1(Key_Input, Permuted_Choice_1_Select, PC1_Left, PC1_Right, Permuted_Choice_1_Finish_Flag, clk);
	
	wire Left_Shift1_Select;
	reg Left_Shift1_Select_Reg;
	assign Left_Shift1_Select = Left_Shift1_Select_Reg;
	wire [28:1] Left_Shift1_Left, Left_Shift1_Right;
	reg [28:1] Left_Shift1_Left_Reg, Left_Shift1_Right_Reg;
	assign Left_Shift1_Left = Left_Shift1_Left_Reg;
	assign Left_Shift1_Right = Left_Shift1_Right_Reg;
	output wire [28:1] Left_Shift1_Left_Output;
	output wire [28:1] Left_Shift1_Right_Output;
	wire Left_Shift1_Finish_Flag;
	Left_Shift1 LS1(Left_Shift1_Left, Left_Shift1_Right, Left_Shift1_Select, Left_Shift1_Left_Output, Left_Shift1_Right_Output, Left_Shift1_Finish_Flag, clk);
		
	wire Left_Shift2_Select;
	reg Left_Shift2_Select_Reg;
	assign Left_Shift2_Select = Left_Shift2_Select_Reg;
	wire [28:1] Left_Shift2_Left, Left_Shift2_Right;
	reg [28:1] Left_Shift2_Left_Reg, Left_Shift2_Right_Reg;
	assign Left_Shift2_Left = Left_Shift2_Left_Reg;
	assign Left_Shift2_Right = Left_Shift2_Right_Reg;
	output wire [28:1] Left_Shift2_Left_Output;
	output wire [28:1] Left_Shift2_Right_Output;
	wire Left_Shift2_Finish_Flag;
	Left_Shift2 LS2(Left_Shift2_Left, Left_Shift2_Right, Left_Shift2_Select, Left_Shift2_Left_Output, Left_Shift2_Right_Output, Left_Shift2_Finish_Flag, clk);
	
	wire [56:1] Permuted_Choice_2_Input;
	reg [56:1] Permuted_Choice_2_Input_Reg;
	assign Permuted_Choice_2_Input = Permuted_Choice_2_Input_Reg;
	wire Permuted_Choice_2_Select;
	reg Permuted_Choice_2_Select_Reg;
	assign Permuted_Choice_2_Select = Permuted_Choice_2_Select_Reg;
	output wire [48:1] Permuted_Choice_2_Output;
	wire Permuted_Choice_2_Finish_Flag;
	Permuted_Choice_2 PC2(Permuted_Choice_2_Input, Permuted_Choice_2_Select, Permuted_Choice_2_Output, Permuted_Choice_2_Finish_Flag, clk);
	
	wire [32:1] Expansion_Function_Input;
	//reg [32:1] Expansion_Function_Input_Reg;
	assign Expansion_Function_Input = Text_Right;
	wire Expansion_Function_Select;
	reg Expansion_Function_Select_Reg;
	assign Expansion_Function_Select = Expansion_Function_Select_Reg;
	output wire[48:1] Expansion_Function_Output;
	wire Expansion_Function_Finish_Flag;
	Expansion_Function EF(Expansion_Function_Input, Expansion_Function_Select, Expansion_Function_Output, Expansion_Function_Finish_Flag, clk);
	
	
	wire [48:1] XOR48_Input_A;
	wire [48:1] XOR48_Input_B;
	assign XOR48_Input_A = Subkey;
	assign XOR48_Input_B = Temp48;
	output wire [48:1] XOR48_Output;
	wire XOR48_Select;
	reg XOR48_Select_Reg;
	assign XOR48_Select = XOR48_Select_Reg;
	wire XOR48_Finish_Flag;
	XOR48 Exlclusive_Or_48(XOR48_Input_A, XOR48_Input_B, XOR48_Select, XOR48_Output, XOR48_Finish_Flag, clk);
	
	wire [6:1] S_Box_S1_Input;
	reg [6:1] S_Box_S1_Input_Reg;
	assign S_Box_S1_Input = S_Box_S1_Input_Reg;
	wire S_Box_S1_Select;
	reg S_Box_S1_Select_Reg;
	assign S_Box_S1_Select = S_Box_S1_Select_Reg;
	output wire [4:1] S_Box_S1_Output;
	wire S_Box_S1_Finish_Flag;
	S_Box_S1 SB1(S_Box_S1_Input, S_Box_S1_Select, S_Box_S1_Output, S_Box_S1_Finish_Flag, clk);
	
	output wire [6:1] S_Box_S2_Input;
	reg [6:1] S_Box_S2_Input_Reg;
	assign S_Box_S2_Input = S_Box_S2_Input_Reg;
	wire S_Box_S2_Select;
	reg S_Box_S2_Select_Reg;
	assign S_Box_S2_Select = S_Box_S2_Select_Reg;
	output wire [4:1] S_Box_S2_Output;
	wire S_Box_S2_Finish_Flag;
	S_Box_S2 SB2(S_Box_S2_Input, S_Box_S2_Select, S_Box_S2_Output, S_Box_S2_Finish_Flag, clk);
	
	wire [6:1] S_Box_S3_Input;
	reg [6:1] S_Box_S3_Input_Reg;
	assign S_Box_S3_Input = S_Box_S3_Input_Reg;
	wire S_Box_S3_Select;
	reg S_Box_S3_Select_Reg;
	assign S_Box_S3_Select = S_Box_S3_Select_Reg;
	output wire [4:1] S_Box_S3_Output;
	wire S_Box_S3_Finish_Flag;
	S_Box_S3 SB3(S_Box_S3_Input, S_Box_S3_Select, S_Box_S3_Output, S_Box_S3_Finish_Flag, clk);
	
	wire [6:1] S_Box_S4_Input;
	reg [6:1] S_Box_S4_Input_Reg;
	assign S_Box_S4_Input = S_Box_S4_Input_Reg;
	wire S_Box_S4_Select;
	reg S_Box_S4_Select_Reg;
	assign S_Box_S4_Select = S_Box_S4_Select_Reg;
	output wire [4:1] S_Box_S4_Output;
	wire S_Box_S4_Finish_Flag;
	S_Box_S4 SB4(S_Box_S4_Input, S_Box_S4_Select, S_Box_S4_Output, S_Box_S4_Finish_Flag, clk);
	
	wire [6:1] S_Box_S5_Input;
	reg [6:1] S_Box_S5_Input_Reg;
	assign S_Box_S5_Input = S_Box_S5_Input_Reg;
	wire S_Box_S5_Select;
	reg S_Box_S5_Select_Reg;
	assign S_Box_S5_Select = S_Box_S5_Select_Reg;
	output wire [4:1] S_Box_S5_Output;
	S_Box_S5 SB5(S_Box_S5_Input, S_Box_S5_Select, S_Box_S5_Output, S_Box_S5_Finish_Flag, clk);
	
	wire [6:1] S_Box_S6_Input;
	reg [6:1] S_Box_S6_Input_Reg;
	assign S_Box_S6_Input = S_Box_S6_Input_Reg;
	wire S_Box_S6_Select;
	reg S_Box_S6_Select_Reg;
	assign S_Box_S6_Select = S_Box_S6_Select_Reg;
	output wire [4:1] S_Box_S6_Output;
	wire S_Box_S6_Finish_Flag;
	S_Box_S6 SB6(S_Box_S6_Input, S_Box_S6_Select, S_Box_S6_Output, S_Box_S6_Finish_Flag, clk);
	
	wire [6:1] S_Box_S7_Input;
	reg [6:1] S_Box_S7_Input_Reg;
	assign S_Box_S7_Input = S_Box_S7_Input_Reg;
	wire S_Box_S7_Select;
	reg S_Box_S7_Select_Reg;
	assign S_Box_S7_Select = S_Box_S7_Select_Reg;
	output wire [4:1] S_Box_S7_Output;
	wire S_Box_S7_Finish_Flag;
	S_Box_S7 SB7(S_Box_S7_Input, S_Box_S7_Select, S_Box_S7_Output, S_Box_S7_Finish_Flag, clk);
	
	wire [6:1] S_Box_S8_Input;
	reg [6:1] S_Box_S8_Input_Reg;
	assign S_Box_S8_Input = S_Box_S8_Input_Reg;
	wire S_Box_S8_Select;
	reg S_Box_S8_Select_Reg;
	assign S_Box_S8_Select = S_Box_S8_Select_Reg;
	output wire [4:1] S_Box_S8_Output;
	wire S_Box_S8_Finish_Flag;
	S_Box_S8 SB8(S_Box_S8_Input, S_Box_S8_Select, S_Box_S8_Output, S_Box_S8_Finish_Flag, clk);
	
	wire [32:1] Permutation_Input;
	reg [32:1] Permutation_Input_Reg;
	assign Permutation_Input = Permutation_Input_Reg;
	wire Permutation_Select;
	reg Permutation_Select_Reg;
	assign Permutation_Select = Permutation_Select_Reg;
	output wire [32:1] Permutation_Output;
	wire Permutation_Finish_Flag;
	Permutation P(Permutation_Input, Permutation_Select, Permutation_Output, Permutation_Finish_Flag, clk);
	
	wire [32:1] XOR32_Input_A;
	assign XOR32_Input_A = Text_Left;
	wire [32:1] XOR32_Input_B;
	reg [32:1] XOR32_Input_B_Reg;
	assign XOR32_Input_B = XOR32_Input_B_Reg;
	output wire [32:1] XOR32_Output;
	wire XOR32_Select;
	reg XOR32_Select_Reg;
	assign XOR32_Select = XOR32_Select_Reg;
	wire XOR32_Finish_Flag;
	XOR32 Exlclusive_Or_32(XOR32_Input_A, XOR32_Input_B, XOR32_Select, XOR32_Output, XOR32_Finish_Flag, clk);
	
	output wire [32:1] Left_Right_Swap_Input_Left;
	assign Left_Right_Swap_Input_Left = Text_Left;
	output wire [32:1] Left_Right_Swap_Input_Right;
	assign Left_Right_Swap_Input_Right = Text_Right;
	wire Left_Right_Swap_Select;
	reg Left_Right_Swap_Select_Reg;
	assign Left_Right_Swap_Select = Left_Right_Swap_Select_Reg;
	wire [64:1] Left_Right_Swap_Output;
	wire Left_Right_Swap_Finish_Flag;
	Left_Right_Swap LRS(Left_Right_Swap_Input_Left, Left_Right_Swap_Input_Right, Left_Right_Swap_Select, 
								Left_Right_Swap_Output, Left_Right_Swap_Finish_Flag, clk);
	
	wire [64:1] Final_Permutation_Input;
	assign Final_Permutation_Input = {Text_Left, Text_Right};
	wire Final_Permutation_Select;
	reg Final_Permutation_Select_Reg;
	assign Final_Permutation_Select = Final_Permutation_Select_Reg;
	output wire [64:1] Final_Permutation_Output;
	wire Final_Permutation_Finish_Flag;
	Final_Permutation FP(Final_Permutation_Input, Final_Permutation_Select, Final_Permutation_Output, Final_Permutation_Finish_Flag, clk);
	
	//----------Code startes Here------------------------
	always@(posedge clk or posedge rst) begin
		if(rst) begin
			//net alot of correction
			state <= 4'd0;
			Round_Counter <= 4'd0;
			
			Initial_Permutation_Select_Reg <= 1'b0;
			Permuted_Choice_1_Select_Reg <= 1'b0;
			Left_Shift1_Select_Reg <= 1'b0;
			Left_Shift2_Select_Reg <= 1'b0;
			Permuted_Choice_2_Select_Reg <= 1'b0;
			Expansion_Function_Select_Reg <= 1'b0;
			XOR48_Select_Reg <= 1'b0;
			S_Box_S1_Select_Reg <= 1'b0;
			S_Box_S2_Select_Reg <= 1'b0;
			S_Box_S3_Select_Reg <= 1'b0;
			S_Box_S4_Select_Reg <= 1'b0;
			S_Box_S5_Select_Reg <= 1'b0;
			S_Box_S6_Select_Reg <= 1'b0;
			S_Box_S7_Select_Reg <= 1'b0;
			S_Box_S8_Select_Reg <= 1'b0;
			Permutation_Select_Reg <= 1'b0;
			XOR32_Select_Reg <= 1'b0;
			Left_Right_Swap_Select_Reg <= 1'b0;
			Final_Permutation_Select_Reg <= 1'b0;
		end
		else begin
			case(state)
				//execute initial permutaion and permuted choice 1
				4'd0: begin
					Initial_Permutation_Select_Reg <= 1'b1;
					Permuted_Choice_1_Select_Reg <= 1'b1;
					if(Initial_Permutation_Finish_Flag & Permuted_Choice_1_Finish_Flag)begin
						state <= 4'd1;
						Text_Left <= Initial_Permutation_Output[64:33];
						Text_Right <= Initial_Permutation_Output[32:1];
						Key_Left_Reg <= PC1_Left;
						Key_Right_Reg <= PC1_Right;
						Initial_Permutation_Select_Reg <= 1'b0;
						Permuted_Choice_1_Select_Reg <= 1'b0;
					end
					else begin
						state <= 4'd0;
					end
				end
				//decide how many bit need shift, state 2 for 1 bit and state 3 for 2 bits
				4'd1: begin
					if((Round_Counter == 0) || (Round_Counter == 1) || (Round_Counter == 8) || (Round_Counter == 15)) begin
						state <= 4'd2;
						//Round_Counter <= Round_Counter + 4'd1;
					end
					else begin
						state <= 4'd3;
						//Round_Counter <= Round_Counter + 4'd1;
					end
				end
				
				//left shift 1 bits rotation
				4'd2: begin
					Left_Shift1_Select_Reg <= 1'b1;
					Left_Shift1_Left_Reg <= Key_Left_Reg;
					Left_Shift1_Right_Reg <= Key_Right_Reg;
					if(Left_Shift1_Finish_Flag) begin
						state <= 4'd4;
						Left_Shift1_Select_Reg <= 1'b0;
						Key_Left_Reg <= Left_Shift1_Left_Output;
						Key_Right_Reg <= Left_Shift1_Right_Output;
					end
					else begin
						state <= 4'd2;
					end
				end
				//left shift 2 bits rotation
				4'd3: begin
					Left_Shift2_Select_Reg <= 1'b1;
					Left_Shift2_Left_Reg <= Key_Left_Reg;
					Left_Shift2_Right_Reg <= Key_Right_Reg;
					if(Left_Shift2_Finish_Flag) begin
						state <= 4'd4;
						Left_Shift2_Select_Reg <= 1'b0;
						Key_Left_Reg <= Left_Shift2_Left_Output;
						Key_Right_Reg <= Left_Shift2_Right_Output;
					end
					else begin
						state <= 4'd3;
					end
				end
				//execute CP2 and expansion Function, wait till result of pc2 and E reached, then go to next state
				4'd4: begin
					Permuted_Choice_2_Select_Reg <= 1'b1;
					Permuted_Choice_2_Input_Reg <= {Key_Left_Reg, Key_Right_Reg};
					Expansion_Function_Select_Reg <= 1'b1;
					//Expansion_Function_Input_Reg <= Text_Right;
					if(Permuted_Choice_2_Finish_Flag & Expansion_Function_Finish_Flag) begin
						Subkey <= Permuted_Choice_2_Output;
						Permuted_Choice_2_Select_Reg <= 1'b0;
						Temp48 <= Expansion_Function_Output;
						Expansion_Function_Select_Reg <= 1'b0;
						state <= 4'd5;
					end
					else begin
						state <= 4'd4;
					end
				end
				
				//feed result of pc2 and E to xor, when xor result reached, store into Sbox input register
				4'd5: begin
					XOR48_Select_Reg <= 1'b1;
					if(XOR48_Finish_Flag) begin
						XOR48_Select_Reg <= 1'b0;
						S_Box_S1_Input_Reg <= XOR48_Output[48:43];
						S_Box_S2_Input_Reg <= XOR48_Output[42:37];
						S_Box_S3_Input_Reg <= XOR48_Output[36:31];
						S_Box_S4_Input_Reg <= XOR48_Output[30:25];
						
						S_Box_S5_Input_Reg <= XOR48_Output[24:19];
						S_Box_S6_Input_Reg <= XOR48_Output[18:13];
						S_Box_S7_Input_Reg <= XOR48_Output[12:7];
						S_Box_S8_Input_Reg <= XOR48_Output[6:1];
						state <= 4'd6;
					end
					else begin
						state <= 4'd5;
					end
					
				end
				
				4'd6: begin
					S_Box_S1_Select_Reg <= 1'b1;
					S_Box_S2_Select_Reg <= 1'b1;
					S_Box_S3_Select_Reg <= 1'b1;
					S_Box_S4_Select_Reg <= 1'b1;
					S_Box_S5_Select_Reg <= 1'b1;
					S_Box_S6_Select_Reg <= 1'b1;
					S_Box_S7_Select_Reg <= 1'b1;
					S_Box_S8_Select_Reg <= 1'b1;
					if({S_Box_S1_Finish_Flag, S_Box_S1_Finish_Flag,S_Box_S1_Finish_Flag,S_Box_S1_Finish_Flag,
									S_Box_S1_Finish_Flag,S_Box_S1_Finish_Flag,S_Box_S1_Finish_Flag,S_Box_S1_Finish_Flag} == 8'b1111_1111)begin
						
						S_Box_S1_Select_Reg <= 1'b0;
						S_Box_S2_Select_Reg <= 1'b0;
						S_Box_S3_Select_Reg <= 1'b0;
						S_Box_S4_Select_Reg <= 1'b0;
						S_Box_S5_Select_Reg <= 1'b0;
						S_Box_S6_Select_Reg <= 1'b0;
						S_Box_S7_Select_Reg <= 1'b0;
						S_Box_S8_Select_Reg <= 1'b0;
						
						Permutation_Input_Reg <= {S_Box_S1_Output, S_Box_S2_Output, S_Box_S3_Output, S_Box_S4_Output, 
							S_Box_S5_Output,S_Box_S6_Output, S_Box_S7_Output, S_Box_S8_Output};
						
						state <= 4'd7;
					end
					else begin
						state <= 4'd6;
					end
				end

				//execute permutation
				4'd7: begin
					Permutation_Select_Reg <= 1'b1;
					if(Permutation_Finish_Flag) begin
						//Permutation_Output reached and pass result to xor32
						XOR32_Input_B_Reg <= Permutation_Output;
						Permutation_Select_Reg <= 1'b0;
						state <= 4'd8;
					end
					else begin
						state <= 4'd7;
					end
				end
				
				4'd8: begin
					XOR32_Select_Reg <= 1'b1;
					if(XOR32_Finish_Flag) begin
						Text_Right <= XOR32_Output;
						Text_Left <= Text_Right;
						XOR32_Select_Reg <= 1'b0;
						if(Round_Counter == 15) begin
							state <= 4'd9;
						end
						else begin
							Round_Counter <= Round_Counter + 4'd1;
							state <= 4'd1;
						end
					end
					else begin
						state <= 4'd8;
					end
				end
				
				//execute left and right swap
				4'd9: begin
					Left_Right_Swap_Select_Reg <= 1'b1;
					if(Left_Right_Swap_Finish_Flag) begin
						Text_Left <= Left_Right_Swap_Output[64:33];
						Text_Right <= Left_Right_Swap_Output[32:1];
						Left_Right_Swap_Select_Reg <= 1'b0;
						state <= 4'd10;
					end
					else begin
						state <= 4'd9;
					end
				end
				//execute final permutation
				4'd10:begin
					Final_Permutation_Select_Reg <= 1'b1;
					if(Final_Permutation_Finish_Flag) begin
						Final_Result_Reg <= Final_Permutation_Output;
						Final_Permutation_Select_Reg <= 1'b0;
						state <= 4'd11;
					end
					else begin
						state <= 4'd10;
					end
				end
				
				4'd11:begin
					state <= 4'd11;
				end
				
				default: state <= 4'd0;
			endcase
		end
	end

endmodule