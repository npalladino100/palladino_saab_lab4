`timescale 1ns / 1ps


module cathodeControl(
 output reg [6:0] ONE_DIGIT = 0,
 input [6:0] 	  hr_segments2,
 input [6:0] 	  hr_segments3,
 input [6:0] 	  min_segments2,
 input [6:0] 	  min_segments3,
 input [6:0] 	  sec_segments2,
 input [6:0] 	  sec_segments3,
 input [2:0] 	  refreshCounter,
 input [1:0] 	  APM
    );

   reg [6:0] 	  APM_segments;
   

   always @(APM) begin
     case(APM)
       2'b10 : APM_segments = 7'b000_1000; // AM
       2'b01 : APM_segments = 7'b000_1100; // PM
       default : APM_segments = 7'b111_1111;
     endcase // case (APM)
   end
   
    always @(refreshCounter, APM_segments, APM)
      
      begin
        case(refreshCounter)
            3'd0:
                ONE_DIGIT = hr_segments2;
            3'd1:
                ONE_DIGIT = hr_segments3;
            3'd2:
                ONE_DIGIT = min_segments2;
	    3'd3:
                ONE_DIGIT = min_segments3;
	    3'd4:
                ONE_DIGIT = sec_segments2;
	    3'd5:
                ONE_DIGIT = sec_segments3;
	    3'd6:
	        ONE_DIGIT = 7'b1111111;
	    3'd7: 
	        ONE_DIGIT = APM_segments;
        endcase
    end
    
    
endmodule
