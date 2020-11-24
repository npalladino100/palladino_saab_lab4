`timescale 1ns/1ps

module counter_testbench;
   wire [5:0] time_out;
   reg [5:0]  time_in;
   reg 	      clk_100MHz = 0;
   reg [2:0]  load;
   reg [2:0]  enable;

   counter C1(time_out, time_in, clk_100MHz, load, enable);


   always #5 clk_100MHz = ~clk_100MHz;   //flip signal every 10ns (100MHz)

   initial begin
      #100 load = 3'b100; time_in = 6'd5;
      #100 load = 3'b010; time_in = 6'd45;
      #100 load = 3'b001; time_in = 6'd13;
      #100 load = 3'b000;
      #10000;
      
   end
   
endmodule
