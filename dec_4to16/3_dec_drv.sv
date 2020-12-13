`ifndef _drv_
`define _drv_

`include "dec_bp.sv"

class Driver;
	Basepacket pkt;
	mailbox gen2drv,drv2bfm;
	virtual dec_intf intf;

	function new(Basepacket pkt,mailbox gen2drv,drv2bfm,virtual dec_intf intf);
		this.pkt=pkt;
		this.gen2drv=gen2drv;
		this.drv2bfm=drv2bfm;
		this.intf=intf;
	endfunction : new

	task run_drv();
		gen2drv.get(pkt);
		//$display("Getting from Generator: pkt=%x",pkt);
		//$display("en=%0b,i=%0d",pkt.en,pkt.i);
		intf.en=pkt.en;
		intf.i=pkt.i;
		drv2bfm.put(pkt);
		//$display("Putting into Bfm: pkt=%x",pkt);
	endtask : run_drv
endclass : Driver

`endif