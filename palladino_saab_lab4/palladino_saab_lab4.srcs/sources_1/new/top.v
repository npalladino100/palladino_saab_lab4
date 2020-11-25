`timescale 1ns / 1ps

module top(
	   output [6:0] LED_OUT,
	   output [7:0] ANODE_OUT,
	   input 	clk_100MHz,
	   input [17:0] time_set,
	   input 	time_set_enable,
	   input 	counter_out,
	   input        outreg_in	

	   );

   wire [17:0] 		the_holy_wire;

   counter CNT1(the_holy_wire, ~time_set, clk_100MHz, time_set_enable, counter_out);
   output_register OR1(LED_OUT, ANODE_OUT, the_holy_wire, clk_100MHz, outreg_in);

   
   
endmodule
