module S_Box_S5(
	S_Box_S5_Input,
	S_Box_S5_Select,
	S_Box_S5_Output,
	//
	S_Box_S5_Finish_Flag,
	clk
);

	//input
	input [6:1] S_Box_S5_Input;
	input S_Box_S5_Select;
	input clk;
	//output
	output [4:1] S_Box_S5_Output;
	//internal register
	reg [4:1] S_Box_S5;
	
	//
	output S_Box_S5_Finish_Flag;
	reg S_Box_S5_Finish;
	assign S_Box_S5_Finish_Flag = S_Box_S5_Finish;
	wire [6:1] Offset;
	assign Offset = {S_Box_S5_Input[6], S_Box_S5_Input[1], S_Box_S5_Input[5:2]};
	assign S_Box_S5_Output = S_Box_S5;
	
	always@(posedge clk)begin
		if(S_Box_S5_Select) begin
			case(Offset)
				6'b000000:  S_Box_S5 <= 4'd2;             
				6'b000001:  S_Box_S5 <= 4'd12;             
				6'b000010:  S_Box_S5 <= 4'd4;            
				6'b000011:  S_Box_S5 <= 4'd1;             
				6'b000100:  S_Box_S5 <= 4'd7;             
				6'b000101:  S_Box_S5 <= 4'd10;             
				6'b000110:  S_Box_S5 <= 4'd11;             
				6'b000111:  S_Box_S5 <= 4'd6;             
				6'b001000:  S_Box_S5 <= 4'd8;             
				6'b001001:  S_Box_S5 <= 4'd5;             
				6'b001010:  S_Box_S5 <= 4'd3;             
				6'b001011:  S_Box_S5 <= 4'd15;             
				6'b001100:  S_Box_S5 <= 4'd13;             
				6'b001101:  S_Box_S5 <= 4'd0;             
				6'b001110:  S_Box_S5 <= 4'd14;             
				6'b001111:  S_Box_S5 <= 4'd9;             
				6'b010000:  S_Box_S5 <= 4'd14;             
				6'b010001:  S_Box_S5 <= 4'd11;             
				6'b010010:  S_Box_S5 <= 4'd2;             
				6'b010011:  S_Box_S5 <= 4'd12;             
				6'b010100:  S_Box_S5 <= 4'd4;             
				6'b010101:  S_Box_S5 <= 4'd7;             
				6'b010110:  S_Box_S5 <= 4'd13;             
				6'b010111:  S_Box_S5 <= 4'd1;             
				6'b011000:  S_Box_S5 <= 4'd5;             
				6'b011001:  S_Box_S5 <= 4'd0;             
				6'b011010:  S_Box_S5 <= 4'd15;             
				6'b011011:  S_Box_S5 <= 4'd10;             
				6'b011100:  S_Box_S5 <= 4'd3;             
				6'b011101:  S_Box_S5 <= 4'd9;             
				6'b011110:  S_Box_S5 <= 4'd8;             
				6'b011111:  S_Box_S5 <= 4'd6;             
				6'b100000:  S_Box_S5 <= 4'd4;             
				6'b100001:  S_Box_S5 <= 4'd2;             
				6'b100010:  S_Box_S5 <= 4'd1;             
				6'b100011:  S_Box_S5 <= 4'd11;             
				6'b100100:  S_Box_S5 <= 4'd10;             
				6'b100101:  S_Box_S5 <= 4'd13;             
				6'b100110:  S_Box_S5 <= 4'd7;             
				6'b100111:  S_Box_S5 <= 4'd8;             
				6'b101000:  S_Box_S5 <= 4'd15;             
				6'b101001:  S_Box_S5 <= 4'd9;             
				6'b101010:  S_Box_S5 <= 4'd12;             
				6'b101011:  S_Box_S5 <= 4'd5;             
				6'b101100:  S_Box_S5 <= 4'd6;             
				6'b101101:  S_Box_S5 <= 4'd3;             
				6'b101110:  S_Box_S5 <= 4'd0;             
				6'b101111:  S_Box_S5 <= 4'd14;             
				6'b110000:  S_Box_S5 <= 4'd11;             
				6'b110001:  S_Box_S5 <= 4'd8;             
				6'b110010:  S_Box_S5 <= 4'd12;             
				6'b110011:  S_Box_S5 <= 4'd7;             
				6'b110100:  S_Box_S5 <= 4'd1;             
				6'b110101:  S_Box_S5 <= 4'd14;            
				6'b110110:  S_Box_S5 <= 4'd2;             
				6'b110111:  S_Box_S5 <= 4'd13;            
				6'b111000:  S_Box_S5 <= 4'd6;        
				6'b111001:  S_Box_S5 <= 4'd15;        
				6'b111010:  S_Box_S5 <= 4'd0;       
				6'b111011:  S_Box_S5 <= 4'd9;       
				6'b111100:  S_Box_S5 <= 4'd10;       
				6'b111101:  S_Box_S5 <= 4'd4;       
				6'b111110:  S_Box_S5 <= 4'd5;      
				6'b111111:  S_Box_S5 <= 4'd3;      
				default:    S_Box_S5 <= 4'dx;
			endcase
			//
			S_Box_S5_Finish <= 1'b1;
		end
		else begin
			S_Box_S5 <= 4'dx;
			//
			S_Box_S5_Finish <= 1'b0;
		end
	end
	
endmodule