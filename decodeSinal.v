module decodeSinal(display, sinal, EN);
	input sinal, EN;
	output reg [0:6] display;
	
	always@(sinal || EN) begin
		if(!EN) display <= 7'b1111111;
		else begin
			case(sinal)
				0: display <= 7'b1111111;
				1: display <= 7'b1111110;
			endcase
		end
	end
endmodule