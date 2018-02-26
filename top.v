module top(
	input CLK,

	output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
	output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G
);

wire st;
wire load;
wire sclk;
wire mosi;
wire miso;

Gen_st #(.T(100000)) gst(
	.clk(CLK),
	.st(st)
);
wire [15:0]sr_mrx;

wire [8:0]mrx_dat;
wire [8:0]mtx_dat = 9'b1_0111_1010;
spi_master #(.m(9), .Nt(100)) sm(
	.clk(CLK),
	.st(st),
	.LOAD(load),
	.SCLK(sclk),
	.DI(mtx_dat),
	.DO(mrx_dat),
	.MOSI(mosi),
	.MISO(miso)
);


wire [8:0]srx_dat;
wire [8:0]stx_dat = 9'b1_1101_1011;
spi_slave #(.m(9)) ss(
	.SCLK(sclk),
	.LOAD(load),
	.DO(srx_dat),
	.DI(stx_dat),
	.MOSI(mosi),
	.MISO(miso)
);

wire [15:0]displ_dat;
wire [1:0]sw = cnt[25] ? 2'b01 : 2'b11;
MUX64_16 MUX64_16(
	.A({7'b0, mtx_dat}),
	.B({7'b0, mrx_dat}),
	.C({7'b0, stx_dat}),
	.D({7'b0, srx_dat}),
	.SW(sw),
	.DO(displ_dat)
);

reg [25:0]cnt = 0;
always @(posedge CLK)
	cnt <= cnt + 1;

DISPLAY DISPLAY(
	.clk(CLK),
	.AN({DS_EN1, DS_EN2, DS_EN3, DS_EN4}),
	.SEG({DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G}),
	.dat(displ_dat)
);

endmodule
