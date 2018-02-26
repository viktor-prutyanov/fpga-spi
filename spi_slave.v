module spi_slave #(parameter m = 9)(
	input SCLK,
	input MOSI,
	input LOAD,
	input [m-1:0]DI,
	output reg [m-1:0]DO = 0,
	output MISO
);

reg [m-1:0]sr_SRX = 0;
reg [m-1:0]sr_STX = 0;

assign MISO = sr_STX[m-1];

always @(posedge LOAD)
	DO <= sr_SRX;

always @(posedge SCLK) begin
	if (LOAD)
		sr_SRX <= sr_SRX;
	else begin
		sr_SRX[m-1:1] <= sr_SRX[m-2:0];
		sr_SRX[0] <= MOSI;
	end
end

always @(negedge SCLK or posedge LOAD) begin
	if (LOAD)
		sr_STX <= DI;
	else
		sr_STX <= sr_STX << 1;
end

endmodule
