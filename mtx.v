module mtx #(parameter m = 9)(
	input [m-1:0]DI,
	input ce,
	input L,
	input clk,
	output MOSI
);

reg [m-1:0]sr_MTX = 0;
assign MOSI = sr_MTX[m-1];

always @(posedge clk) begin
	if (L)
		sr_MTX <= DI;
	else
		sr_MTX <= ce ? sr_MTX << 1 : sr_MTX;
end

endmodule
