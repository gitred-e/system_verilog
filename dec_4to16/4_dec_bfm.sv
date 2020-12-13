`ifndef _bfm_
`define _bfm_

`include "dec_bp.sv"

class Bfm;
	Basepacket pkt;
	mailbox drv2bfm,bfm2sb;

	function new(Basepacket pkt,mailbox drv2bfm,bfm2sb);
		this.pkt=pkt;
		this.drv2bfm=drv2bfm;
		this.bfm2sb=bfm2sb;
	endfunction : new

	task run_bfm();
		drv2bfm.get(pkt);
		//$display("Getting from Driver: pkt=%x",pkt);
		if(pkt.en) begin
			case(pkt.i)
				'd0:begin
					pkt.y[0]='b1;
					pkt.y[15:1]='b0;
				end
				'd1:begin
					pkt.y[1]='b1;
					pkt.y[0]='b0;
					pkt.y[15:2]='b0;
				end
				'd2:begin
					pkt.y[2]='b1;
					pkt.y[1:0]='b0;
					pkt.y[15:3]='b0;
				end
				'd3:begin
					pkt.y[3]='b1;
					pkt.y[2:0]='b0;
					pkt.y[15:4]='b0;
				end
				'd4:begin
					pkt.y[4]='b1;
					pkt.y[3:0]='b0;
					pkt.y[15:5]='b0;
				end
				'd5:begin
					pkt.y[5]='b1;
					pkt.y[4:0]='b0;
					pkt.y[15:6]='b0;
				end
				'd6:begin
					pkt.y[6]='b1;
					pkt.y[5:0]='b0;
					pkt.y[15:7]='b0;
				end
				'd7:begin
					pkt.y[7]='b1;
					pkt.y[6:0]='b0;
					pkt.y[15:8]='b0;
				end
				'd8:begin
					pkt.y[8]='b1;
					pkt.y[7:0]='b0;
					pkt.y[15:9]='b0;
				end
				'd9:begin
					pkt.y[9]='b1;
					pkt.y[8:0]='b0;
					pkt.y[15:10]='b0;
				end
				'd10:begin
					pkt.y[10]='b1;
					pkt.y[9:0]='b0;
					pkt.y[15:11]='b0;
				end
				'd11:begin
					pkt.y[11]='b1;
					pkt.y[10:0]='b0;
					pkt.y[15:12]='b0;
				end
				'd12:begin
					pkt.y[12]='b1;
					pkt.y[11:0]='b0;
					pkt.y[15:13]='b0;
				end
				'd13:begin
					pkt.y[13]='b1;
					pkt.y[12:0]='b0;
					pkt.y[15:14]='b0;
				end
				'd14:begin
					pkt.y[14]='b1;
					pkt.y[13:0]='b0;
					pkt.y[15]='b0;
				end
				'd15:begin
					pkt.y[15]='b1;
					pkt.y[14:0]='b0;
				end
				default:pkt.y='bx;
			endcase // pkt.i
		end
		else
			pkt.y='b0;
		bfm2sb.put(pkt);
		//$display("Putting into Scoreboard: pkt=%x",pkt);
	endtask : run_bfm
endclass : Bfm

`endif