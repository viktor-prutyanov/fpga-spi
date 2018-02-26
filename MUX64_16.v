module MUX64_16(
	input [15:0]A,
	input [15:0]B,
	input [15:0]C,
	input [15:0]D,
	input [1:0]SW,
	output [15:0]DO
);

assign DO = (SW == 2'b00) ? A :
			(SW == 2'b01) ? B :
			(SW == 2'b10) ? C :
			(SW == 2'b11) ? D : 16'b0;

endmodule
