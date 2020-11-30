`timescale 1ns / 1ps

module time_set_register(
			 output reg [17:0] settime_out,
			 output reg [2:0]  cnt,
			 input [3:0]   BCD, 
			 input 	       enable,
			 input 	       time_set_enable 	      
    );

   wire [5:0] 			      hours;
   wire [5:0] 			      minutes;
   wire [5:0] 			      seconds;   
   reg [3:0] 			      dig1;
   reg [3:0] 			      dig2;
   reg [3:0] 			      dig3;
   reg [3:0] 			      dig4;
   reg [3:0] 			      dig5;
   reg [3:0] 			      dig6;

   always @(BCD, time_set_enable) begin
	 if (BCD != 4'b10) cnt = cnt+1;
	 if (cnt==7 | time_set_enable==0) cnt = 0;

      
      case (cnt)
	3'd1 : dig1 <= BCD;
	3'd2 : dig2 <= BCD;
	3'd3 : dig3 <= BCD;
	3'd4 : dig4 <= BCD;
	3'd5 : dig5 <= BCD;
	3'd6 : dig6 <= BCD;
      endcase // case (cnt)
   end // always @ (posedge BCD)
       

      BCD_binary BCDB1(hours, dig2, dig1);
      BCD_binary BCDB2(minutes, dig4, dig3);
      BCD_binary BCDB3(seconds, dig6, dig5);      

      
      always @(enable) begin
	 if (enable) settime_out =  {hours, minutes, seconds};
	 else settime_out = 18'bzzzzzzzzzzzzzzzzzz;
      end
   
      
endmodule
