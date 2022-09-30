module main(A, B, clk, b0, b1, b2, b3, dis0, dis1, dis2, dis3, dis4, dis5, dis6);
	input [6:0] A, B;
	input clk, b0, b1, b2, b3;
	output [0:6] dis0, dis1, dis2, dis3, dis4, dis5, dis6;
	wire [6:0] Y;
	wire sinal, EN;
	
	calculadora(.A(A), .B(B), .Y(Y), .clk(clk), .b_lig(b0), .b_soma(b1), .b_sub(b2), .b_multi(b3), .sinal(sinal), .EN(EN));
	decode(.display1(dis6), .display2(dis5), .X(A), .EN(EN));
	decode(.display1(dis4), .display2(dis3), .X(B), .EN(EN));
	decodeSinal(.display(dis2), .sinal(sinal), .EN(EN));
	decode(.display1(dis1), .display2(dis0), .X(Y), .EN(EN));

endmodule