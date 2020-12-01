`timescale 1ns / 1ps

module time_set_register_testbench;
   wire [17:0] settime_out;
   wire [2:0]  cnt;
   reg [3:0]   BCD=4'd0;
   reg 	       enable=0;
   reg 	       time_set_enable=0;


   time_set_register TSR1(settime_out, cnt, BCD, enable, time_set_enable);


   initial begin
      #500 time_set_enable = 1; BCD = 4'd1; enable = 1;
      #500 BCD = 4'd7;
      #500 BCD = 4'd5;
      #500 BCD = 4'd3;
      #500 BCD = 4'd2;
      #500 BCD = 4'd0;
      #500;
      
      #500 BCD = 4'd4;
      #500 BCD = 4'd7;
      #500 BCD = 4'd5;
      #500 BCD = 4'd3;
      #500 BCD = 4'd1;
      #500 BCD = 4'd6;
      #500 BCD = 4'd3;
      
      
      
      
      
   end
   
endmodule
