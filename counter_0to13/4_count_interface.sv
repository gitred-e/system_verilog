interface count_intf(input clk);
	logic rst;
	logic [3:0]q;

	clocking cb@(posedge clk);
		default input #1ns output #1ns;
		output rst;
		input q;
	endclocking

	modport count_dut(input rst,clk, output q);
	modport count_tb(clocking cb);
endinterface : count_intf