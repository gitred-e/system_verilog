interface dec_intf();
	logic [3:0]i;
	logic en;
	logic [15:0]y;

	modport dec_dut(input i,en,output y);
	modport dec_tb(input y,output i,en);
endinterface : dec_intf