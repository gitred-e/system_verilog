`include "dec_bp.sv"
`include "dec_gen.sv"
`include "dec_drv.sv"
`include "dec_bfm.sv"
`include "dec_mon.sv"
`include "dec_sb.sv"

program dec_testbench(dec_intf.dec_tb intf);
	Basepacket pkt1,pkt2;
	Generator gen;
	Driver drv;
	Bfm bfm;
	Monitor mon;
	Scoreboard sb;
	mailbox gen2drv,drv2bfm,bfm2sb,mon2sb;

	initial begin
		pkt1=new();
		pkt2=new();
		gen2drv=new();
		drv2bfm=new();
		bfm2sb=new();
		mon2sb=new();
		gen=new(pkt1,gen2drv);
		drv=new(pkt1,gen2drv,drv2bfm,intf);
		bfm=new(pkt1,drv2bfm,bfm2sb);
		mon=new(pkt1,mon2sb,intf);
		sb=new(pkt1,pkt2,bfm2sb,mon2sb);
	end

	initial begin
		repeat(20) begin
			fork
				#6;
				gen.run_gen_1();
				drv.run_drv();
				bfm.run_bfm();
				mon.run_mon();
				sb.run_sb();
			join
		end
	end

	initial begin
		fork
			gen.run_gen_11();
			drv.run_drv();
			bfm.run_bfm();
			mon.run_mon();
			sb.run_sb();
		join
		#3;
		fork
			gen.run_gen_0();
			drv.run_drv();
			bfm.run_bfm();
			mon.run_mon();
			sb.run_sb();
		join
	end
endprogram