module dec_top;
	dec_intf intf();
	dec_design dec_dt(intf);
	dec_testbench dec_tt(intf);
endmodule : dec_top