`timescale 1ns / 1ps

module time_set_register(
			 output [17:0] settime_out,
			 output [2:0]  cnt_out,
			 input [3:0]   BCD, 
			 input 	       enable,
			 input 	       time_set_enable,
			 input 	       butt 	      
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
   reg [17:0] 			      settime_out_reg;
   reg [2:0] 			      cnt;
   

   always @(posedge butt) begin
      
      
      
      if ((cnt>=0) & (cnt<6))
	cnt <= cnt+3'd1;
      else cnt <= 0;
   end
   

   
   always @(cnt) begin
      case (cnt)
	3'd1 : dig1 <= BCD;
	3'd2 : dig2 <= BCD;
	3'd3 : dig3 <= BCD;
	3'd4 : dig4 <= BCD;
	3'd5 : dig5 <= BCD;
	3'd6 : dig6 <= BCD; 
      endcase // case (cnt)
   end // always @ (cnt)
   

       

   
      BCD_binary BCDB1(hours, dig1, dig2);
      BCD_binary BCDB2(minutes, dig3, dig4);
      BCD_binary BCDB3(seconds, dig5, dig6);      


   assign settime_out = settime_out_reg;
   assign cnt_out = cnt;
   
      always @(*) begin
	 if (enable) settime_out_reg <=  {hours, minutes, seconds};
	 else settime_out_reg = 18'bzzzzzzzzzzzzzzzzzz;
      end
   
      
endmodule
