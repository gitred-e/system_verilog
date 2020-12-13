`include "count_basepacket.sv"
`include "count_driver.sv"
`include "count_bfm.sv"
`include "count_monitor.sv"
`include "count_scoreboard.sv"

program count_testbench(count_intf.count_tb intf);
	Basepacket pkt1,pkt2;
	Driver drv;
	Bfm bfm;
	Monitor mon;
	Scoreboard sb;
	mailbox drv2bfm,bfm2sb,mon2sb;

	initial begin
		pkt1=new();
		pkt2=new();
		drv2bfm=new();
		bfm2sb=new();
		mon2sb=new();
		drv=new(pkt1,drv2bfm,intf);
		bfm=new(pkt1,drv2bfm,bfm2sb);
		mon=new(pkt2,mon2sb,intf);
		sb=new(pkt1,pkt2,bfm2sb,mon2sb);
	end

	initial begin
		repeat(20)
		fork
			drv.run_drv_1();
			drv.run_drv_0();
			bfm.run_bfm();
			mon.run_mon();
			sb.run_sb();
		join
	end
endprogram