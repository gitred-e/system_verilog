`include "count_interface.sv"
`include "count_design.sv"
`include "count_testbench.sv"

module count_top;
	bit clk;
	always #3 clk=!clk;
	count_intf intf(clk);
	count_design dut(intf);
	count_testbench tb(intf);
endmodule : count_top