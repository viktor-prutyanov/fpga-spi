module cnt_tact #(parameter Nt = 4)(
	input R,
	input clk,
	output out
);

reg [7:0]cb_tact = 0;
assign out = (cb_tact == Nt-1);

always @(posedge clk) begin
	if (R)
		cb_tact <= 0;
	else
		cb_tact <= cb_tact + 1;
end

endmodule
