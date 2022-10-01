module decodeF(X, display1, display2, display3, display4, EN);
	input [13:0] X;
	output reg [0:6] display1, display2, display3, display4;
	input EN;
	parameter zero = 7'b0000001, um = 7'b1001111, dois = 7'b0010010, tres = 7'b0000110, quatro = 7'b1001100, cinco = 7'b0100100;
	parameter seis = 7'b0100000, sete = 7'b0001111, oito = 7'b0000000, nove = 7'b0000100;
	
	always@(X) begin
		if(EN == 0) begin
			display1 <= 7'b1111111;
			display2 <= 7'b1111111;
			display3 <= 7'b1111111;
			display4 <= 7'b1111111;
		end
		else begin
            if(X > 14'd9999) begin
                display1 <= nove;
                display2 <= nove;
                display3 <= nove;
                display4 <= nove;
            end
            else begin
				// Digito menos significativo

                if(X % 10 == 0) display1 <= zero;
                if(X % 10 == 1) display1 <= um;
                if(X % 10 == 2) display1 <= dois;
                if(X % 10 == 3) display1 <= tres;
                if(X % 10 == 4) display1 <= quatro;
                if(X % 10 == 5) display1 <= cinco;
                if(X % 10 == 6) display1 <= seis;
                if(X % 10 == 7) display1 <= sete;
                if(X % 10 == 8) display1 <= oito;
                if(X % 10 == 9) display1 <= nove;

				// Digito 2

				if((X / 10) % 10 == 0) display2 <= zero; // 373
				if((X / 10) % 10 == 1) display2 <= um;
				if((X / 10) % 10 == 2) display2 <= dois;
				if((X / 10) % 10 == 3) display2 <= tres;
				if((X / 10) % 10 == 4) display2 <= quatro;
				if((X / 10) % 10 == 5) display2 <= cinco;
				if((X / 10) % 10 == 6) display2 <= seis;
				if((X / 10) % 10 == 7) display2 <= sete;
				if((X / 10) % 10 == 8) display2 <= oito;
				if((X / 10) % 10 == 9) display2 <= nove;
        
                //Digito 3
                if((X / 100) % 10 == 0) display3 <= zero;
                if((X / 100) % 10 == 1) display3 <= um;
                if((X / 100) % 10 == 2) display3 <= dois;
                if((X / 100) % 10 == 3) display3 <= tres;
                if((X / 100) % 10 == 4) display3 <= quatro;
                if((X / 100) % 10 == 5) display3 <= cinco;
                if((X / 100) % 10 == 6) display3 <= seis;
                if((X / 100) % 10 == 7) display3 <= sete;
                if((X / 100) % 10 == 8) display3 <= oito;
                if((X / 100) % 10 == 9) display3 <= nove;
                
				//Digto mais significativo:
				if(X / 1000 == 0) display4 <= zero;
				if(X / 1000 == 1) display4 <= um;
				if(X / 1000 == 2) display4 <= dois;
				if(X / 1000 == 3) display4 <= tres;
				if(X / 1000 == 4) display4 <= quatro;	
				if(X / 1000 == 5) display4 <= cinco;
				if(X / 1000 == 6) display4 <= seis;
				if(X / 1000 == 7) display4 <= sete;
				if(X / 1000 == 8) display4 <= oito;
				if(X / 1000 == 9) display4 <= nove;
            end					
		end
	end
endmodule