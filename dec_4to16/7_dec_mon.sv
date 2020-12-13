`ifndef _mon_
`define _mon_

`include "dec_bp.sv"

class Monitor;
	Basepacket pkt;
	mailbox mon2sb;
	virtual dec_intf intf;

	function new(Basepacket pkt,mailbox mon2sb,virtual dec_intf intf);
		this.pkt=pkt;
		this.mon2sb=mon2sb;
		this.intf=intf;
	endfunction : new

	task run_mon();
		//$display("Monitor: pkt=%x",pkt);
		pkt.y=intf.y;
		//$display("Monitor: pkt=%x",pkt);
		pkt.en=intf.en;
		pkt.i=intf.i;
		//$display("Monitor: pkt=%x",pkt);
		mon2sb.put(pkt);
		//$display("Monitor: pkt=%x",pkt);
	endtask : run_mon
endclass : Monitor


`endif