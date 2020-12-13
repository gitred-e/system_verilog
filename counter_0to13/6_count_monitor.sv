`ifndef _mon_
`define _mon_

`include "count_basepacket.sv"

class Monitor;
	Basepacket pkt;
	mailbox mon2sb;
	virtual count_intf intf;

	function new(Basepacket pkt, mailbox mon2sb, virtual count_intf intf);
		this.pkt=pkt;
		this.mon2sb=mon2sb;
		this.intf=intf;
	endfunction : new

	task run_mon();
		begin
			@(intf.cb)
			pkt.q=intf.q;
			mon2sb.put(pkt);
		end
	endtask : run_mon
endclass : Monitor

`endif