module spi_master #(parameter m = 9, Nt = 100)(
	input clk,
	input st,
	input [m-1:0]DI,
	input MISO,
	output LOAD,
	output SCLK,
	output MOSI,
	output reg [m-1:0]DO = 0,
	output wire [m-1:0]sr_MRX_sig
);

assign sr_MRX_sig = sr_MRX;

wire load;
wire start = st & load;
wire ce_tact = SCLK & ftr_t;
wire ftr_t;
wire cnt_tact_reset = ftr_t | start;

assign LOAD = load;

mtx #(.m(m)) mtx(
	.DI(DI),
	.MOSI(MOSI),
	.L(load),
	.ce(ce_tact),
	.clk(clk)
);

fsr fsr(
	.R(st),
	.clk(clk),
	.S(fsr_set),
	.Q(load)
);

cnt_bit #(.m(m)) cnt_bit(
	.R(start),
	.ce(ce_tact),
	.clk(clk),
	.out(fsr_set)
);

cnt_tact #(.Nt(Nt)) cnt_tact(
	.R(cnt_tact_reset),
	.clk(clk),
	.out(ftr_t)
);

ftr ftr(
	.T(ftr_t),
	.clk(clk),
	.R(load),
	.Q(SCLK)
);

reg [m-1:0]sr_MRX = 0;

always @(posedge SCLK) begin
	if (LOAD)
		sr_MRX <= sr_MRX;
	else begin
		sr_MRX[m-1:1] <= sr_MRX[m-2:0];
		sr_MRX[0] <= MISO;
	end
end

always @(posedge LOAD)
	DO <= sr_MRX;

endmodule
