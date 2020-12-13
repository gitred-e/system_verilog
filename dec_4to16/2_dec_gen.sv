`ifndef _gen_
`define _gen_

`include "dec_bp.sv"

class Generator;
	Basepacket pkt;
	mailbox gen2drv;

	function new(Basepacket pkt,mailbox gen2drv);
		this.pkt=pkt;
		this.gen2drv=gen2drv;
	endfunction : new

	task run_gen_0();
		pkt.en=0;
		pkt.randomize();
		gen2drv.put(pkt);
		//$display("Putting into Driver: pkt=%x",pkt);
	endtask : run_gen_0

	task run_gen_1();
		pkt.en=1;
		pkt.randomize();
		gen2drv.put(pkt);
		//$display("Putting into Driver: pkt=%x",pkt);
	endtask : run_gen_1

	task run_gen_11();
		pkt.en=1;
		pkt.i='dx;
		gen2drv.put(pkt);
	endtask : run_gen_11
endclass : Generator

`endif