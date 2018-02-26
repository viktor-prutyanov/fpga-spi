module DISPLAY(
	input clk,
	output wire [3:0]AN,
	input [15:0]dat,
	output wire [6:0]SEG
);

wire [3:0]Dig;
wire [1:0]Adr_dig;

Gen4an Gen4an (
	.clk(clk),
	.q(Adr_dig),
	.ce(ce1ms),
	.an(AN)
);

MUX16_4 MUX16_4 (
	.dat(dat),
	.dout(Dig),
	.adr(Adr_dig)
);

D7seg D7seg (
	.dig(Dig),
	.seg(SEG)
);

Gen1ms Gen1ms (
	.clk(clk),
	.ce1ms(ce1ms)
);

endmodule
