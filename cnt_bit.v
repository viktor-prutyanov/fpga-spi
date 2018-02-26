module cnt_bit #(parameter m = 8)(
	input R,
	input ce,
	input clk,
	output out
);

reg [7:0]cb_bit = 8'b0;
assign out = (cb_bit == m-1) & ce;

always @(posedge clk) begin
	if (R)
		cb_bit <= 8'b0;
	else
		cb_bit <= ce ? cb_bit + 8'b1 : cb_bit;
end

endmodule
