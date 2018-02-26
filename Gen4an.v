module Gen4an (
	input clk,
	input ce,
	output wire [3:0]an,
	output reg [1:0]q = 0
);

assign an = (q == 0) ? 4'b1110 :
			(q == 1) ? 4'b1101 :
			(q == 2) ? 4'b1011 :
					   4'b0111 ;

always @ (posedge clk) if (ce) begin
	q <= q + 1;
end

endmodule
