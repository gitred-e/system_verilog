`ifndef _sb_
`define _sb_

`include "dec_bp.sv"

class Scoreboard;
	Basepacket pkt1,pkt2;
	mailbox bfm2sb,mon2sb;

	function new(Basepacket pkt1,pkt2,mailbox bfm2sb,mon2sb);
		this.pkt1=pkt1;
		this.pkt2=pkt2;
		this.bfm2sb=bfm2sb;
		this.mon2sb=mon2sb;
	endfunction : new

	task run_sb();
		bfm2sb.get(pkt1);
		//$display("Getting from Bfm: pkt1=%x",pkt1);
		mon2sb.get(pkt2);
		//$display("Getting from Monitor: pkt2=%x",pkt2);

		if(pkt2.y===pkt1.y)
			$display("@_%0t, Matched: pkt2.y=%b,pkt1.y=%b",$time,pkt2.y,pkt1.y);
		else
			$display("@_%0t, Mismatch: pkt2.y=%b,pkt1.y=%b",$time,pkt2.y,pkt1.y);
	endtask : run_sb
endclass : Scoreboard

`endif