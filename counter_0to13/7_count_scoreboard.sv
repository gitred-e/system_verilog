`ifndef _sb_
`define _sb_

`include "count_basepacket.sv"

class Scoreboard;
	Basepacket pkt1,pkt2;
	mailbox bfm2sb,mon2sb;

	function new(Basepacket pkt1,pkt2, mailbox bfm2sb,mon2sb);
		this.pkt1=pkt1;
		this.pkt2=pkt2;
		this.bfm2sb=bfm2sb;
		this.mon2sb=mon2sb;
	endfunction : new

	task run_sb();
		begin
			#1;
			bfm2sb.get(pkt1);
			mon2sb.get(pkt2);
			#1;
			if(pkt2.q==pkt1.q)
				$display("Matched pkt2.q=%0d pkt1.q=%0d",pkt2.q,pkt1.q);
			else
				$display("Notmatched pkt2.q=%0d pkt1.q=%0d",pkt2.q,pkt1.q);
		end
	endtask : run_sb
endclass : Scoreboard

`endif