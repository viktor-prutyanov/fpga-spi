module Gen1ms #(parameter Fclk = 48000000)(
	input clk,
	output wire ce1ms
);

parameter F1kHz = 1000;
reg [15:0]cb_ms = 0;

assign ce1ms = (cb_ms == 1);

always @(posedge clk) begin
	cb_ms <= ce1ms ? (Fclk / F1kHz) : (cb_ms - 1);
end

endmodule
