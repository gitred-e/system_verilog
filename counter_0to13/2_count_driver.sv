`ifndef _dr_
`define _dr_

`include "count_basepacket.sv"

class Driver;
	Basepacket pkt;
	mailbox drv2bfm;
	virtual count_intf intf;

	function new(Basepacket pkt, mailbox drv2bfm, virtual count_intf intf);
		this.pkt=pkt;
		this.drv2bfm=drv2bfm;
		this.intf=intf;
	endfunction : new

	task run_drv_1();
		begin
			pkt.rst=1;
			intf.rst=pkt.rst;
			intf.q=pkt.q;
			drv2bfm.put(pkt);
		end
	endtask : run_drv_1

	task run_drv_0();
		begin
			pkt.rst=0;
			intf.rst=pkt.rst;
			intf.q=pkt.q;
			drv2bfm.put(pkt);
		end
	endtask : run_drv_0
endclass : Driver

`endif