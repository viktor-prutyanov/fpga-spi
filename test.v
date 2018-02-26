`timescale 10ns / 1ps

module test;

reg clk = 1'b0;

always begin
	#1 clk = ~clk;
end

wire [3:0]en;
wire [6:0]ds;

top top (
	.CLK(clk),
	.DS_EN1(en[0]), .DS_EN2(en[1]), .DS_EN3(en[2]), .DS_EN4(en[3]),
	.DS_A(ds[0]), .DS_B(ds[1]), .DS_C(ds[2]), .DS_D(ds[3]), .DS_E(ds[4]), .DS_F(ds[5]), .DS_G(ds[6])
);

initial
	#1000000 $finish;

initial begin
	$dumpfile("out.vcd");
	$dumpvars(0, test);
end

endmodule
