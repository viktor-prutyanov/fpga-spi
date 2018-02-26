module fsr(
	input R,
	input clk,
	input S,
	output reg Q = 1'b0
);

always @(posedge clk) begin
	if (S)
		Q <= 1'b1;
	else
		Q <= R ? 1'b0 : Q;
end

endmodule
