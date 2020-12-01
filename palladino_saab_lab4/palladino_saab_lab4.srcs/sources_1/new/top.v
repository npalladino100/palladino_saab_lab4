`timescale 1ns / 1ps

module top(
	   output [6:0] LED_OUT,
	   output [7:0] ANODE_OUT,
	   output [3:0] monit,
	   output [2:0] monit2,
	   output 	alarmLED,
	   input 	clk_100MHz,
	   input 	time_set_enable,
	   input 	counter_out,
	   input 	outreg_in,
	   input 	format,
	   input 	time_set_out,
	   input 	time_set_load,
	   input 	PS2_CLK,
	   input 	PS2_DATA,
	   input 	the_holy_button,
	   input 	alarm_in
	   );

   wire [17:0] 		the_holy_wire;
   wire [1:0] 		APM;
   wire [17:0] 		the_less_holy_wire;
   wire [2:0] 		reg_cnt;   
   wire [3:0] 		BCD;
   wire [31:0] 		keycode;
   wire 		butt;
   reg 			clk_50MHz=0;
    

always @(posedge(clk_100MHz))begin
    clk_50MHz<=~clk_50MHz;
end
   
   
   counter CNT1(the_less_holy_wire, alarmLED, the_holy_wire, clk_100MHz, time_set_load, alarm_in);
   output_register OR1(LED_OUT, ANODE_OUT, the_holy_wire, clk_100MHz, outreg_in, APM, reg_cnt);
   format_select FS1(the_holy_wire, APM, the_less_holy_wire, format, counter_out);   
   time_set_register TSR1(the_holy_wire, reg_cnt, BCD, time_set_out, time_set_enable, butt);
   PS2Receiver PS2(keycode, clk_50MHz, PS2_CLK, PS2_DATA);
   keypad_BCD KBCD1(BCD, keycode, clk_50MHz);
   debouncer2 DB2(butt, clk_100MHz, the_holy_button);
   
   assign monit = BCD;
   assign monit2 = reg_cnt;


   
endmodule
