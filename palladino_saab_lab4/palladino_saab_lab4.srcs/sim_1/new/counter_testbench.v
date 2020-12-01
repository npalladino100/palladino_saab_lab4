`timescale 1ns/1ps

module counter_testbench;
   wire [17:0] time_out;
   reg [17:0]  time_in;
   reg 	      clk_100MHz = 0;
   reg 	      load;
   

   counter C1(time_out, time_in, clk_100MHz, load);


   always #5 clk_100MHz = ~clk_100MHz;   //flip signal every 10ns (100MHz)

   initial begin
      #100 load = 1; time_in = 18'd5;
      #100 time_in = 18'd45;
      #100 time_in = 18'd13;
      #10000;
      
   end
   
endmodule
