module count_design(count_intf.count_dut intf);
	always @(posedge intf.clk) begin
		if(intf.rst || (intf.q=='d13))
			intf.q<='0;
		else
			intf.q<=intf.q+1;
	end
endmodule : count_design