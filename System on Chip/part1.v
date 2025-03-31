module part1
(
	input CLOCK_50,
	input	[1:0] KEY,
	input	[9:0] SW,
	output [0:6] HEX0

);

system nios_system(
.clk_clk(CLOCK_50),
.switch_0_conduit_end_export(SW), 
.hex_0_conduit_end_hex(HEX0),
.reset_reset_n(KEY[0])
);

endmodule





