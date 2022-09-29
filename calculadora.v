module calculadora(A, B, Y, clk, b_lig, b_soma, b_sub, b_multi, sinal, EN);
	input [6:0] A, B;
	input b_lig, b_soma, b_sub, b_multi, clk;
	output reg [13:0] Y;
	reg [2:0] estado, prox_estado;
	output reg sinal, EN;
	parameter desligado = 0, ligado = 1, soma = 2, sub = 3, multi = 4;
	initial estado = desligado;
	initial prox_estado = desligado;
	initial EN = 0;
	initial sinal = 0;
	
	always@(posedge clk) begin
		if(estado != prox_estado) estado <= prox_estado;

		case(estado)
			desligado: begin
				if(!b_lig) prox_estado <= ligado;
			end
			ligado: begin
				if(!b_lig) prox_estado <= desligado;
				if(!b_soma) prox_estado <= soma;
				if(!b_sub) prox_estado <= sub;
				if(!b_multi) prox_estado <= multi;
			end
			soma: begin
				if(!b_lig) prox_estado <= desligado;
				if(!b_sub) prox_estado <= sub;
				if(!b_multi) prox_estado <= multi;
			end
			sub: begin
				if(!b_lig) prox_estado <= desligado;
				if(!b_soma) prox_estado <= soma;
				if(!b_multi) prox_estado <= multi;
			end
			multi: begin
				if(!b_lig) prox_estado <= desligado;
				if(!b_soma) prox_estado <= soma;
				if(!b_sub) prox_estado <= sub;
			end
		endcase
	end
	
	always@(A || B || b_soma || b_sub || b_multi || b_lig) begin
		case(estado)
			desligado: begin
				EN = 1'd0;
			end
			ligado: begin
				EN = 1'd1;
				Y = 1'd0;
				sinal = 1'd0;
			end
			soma: begin
				Y = A + B;
				sinal = 1'd0;
			end
			sub: begin
				Y = A - B;
				if(B > A) sinal = 1'd1;
				else sinal = 1'd0;
			end
			multi: begin
				Y = A * B;
				sinal = 1'd0;
			end
		endcase
	end

endmodule