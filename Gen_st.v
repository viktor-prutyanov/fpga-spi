module Gen_st #(parameter T = 100000)(
	input clk,
	output st
);

reg [23:0]cnt = 0;

assign st = (cnt == T);

always @(posedge clk)
	cnt <= st ? 0 : cnt + 1;

endmodule
