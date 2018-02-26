module ftr(
	input T,
	input R,
	input clk,
	output reg Q = 1'b0
);

always @(posedge clk) begin
	if (R)
		Q <= 1'b0;
	else
		Q <= T ? !Q : Q;
end

endmodule
