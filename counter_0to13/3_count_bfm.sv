`ifndef _bfm_
`define _bfm_

`include "count_basepacket.sv"

class Bfm;
	Basepacket pkt;
	mailbox drv2bfm,bfm2sb;

	function new(Basepacket pkt, mailbox drv2bfm,bfm2sb);
		this.pkt=pkt;
		this.drv2bfm=drv2bfm;
		this.bfm2sb=bfm2sb;
	endfunction : new

	task run_bfm();
		begin
			drv2bfm.get(pkt);
			begin
				if(pkt.rst || (pkt.q=='d13))
					pkt.q='d0;
				else
					pkt.q=pkt.q+1;
			end
			bfm2sb.put(pkt);
		end
	endtask : run_bfm
endclass : Bfm

`endif