module D7seg (
	input [3:0]dig,
	output wire [6:0]seg
);

assign seg = (dig == 4'h0) ? 7'b1111110 :
			 (dig == 4'h1) ? 7'b0110000 :
			 (dig == 4'h2) ? 7'b1101101 :
			 (dig == 4'h3) ? 7'b1111001 :
			 (dig == 4'h4) ? 7'b0110011 :
			 (dig == 4'h5) ? 7'b1011011 :
			 (dig == 4'h6) ? 7'b1011111 :
			 (dig == 4'h7) ? 7'b1110000 :
			 (dig == 4'h8) ? 7'b1111111 :
			 (dig == 4'h9) ? 7'b1111011 :
			 (dig == 4'hA) ? 7'b1110111 :
			 (dig == 4'hB) ? 7'b0011111 :
			 (dig == 4'hC) ? 7'b1001110 :
			 (dig == 4'hD) ? 7'b0111101 :
			 (dig == 4'hE) ? 7'b1101111 :
			 (dig == 4'hF) ? 7'b1000111 : 7'b1111111;

endmodule
