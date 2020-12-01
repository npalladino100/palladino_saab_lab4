`timescale 1ns / 1ps


module keypad_BCD(
 output [3:0] BCD,
 input [31:0] key,
 input 	      clk		  
    );

   reg [3:0]  BCD_reg;   

always @(negedge clk) begin
   case (key[7:0])
     8'd22 : BCD_reg <= 4'd1;
     8'd30 : BCD_reg <= 4'd2;
     8'd38 : BCD_reg <= 4'd3;
     8'd37 : BCD_reg <= 4'd4;
     8'd46 : BCD_reg <= 4'd5;
     8'd54 : BCD_reg <= 4'd6;
     8'd61 : BCD_reg <= 4'd7;
     8'd62 : BCD_reg <= 4'd8;
     8'd70 : BCD_reg <= 4'd9;
     8'd69 : BCD_reg <= 4'd0;
     //default : BCD_reg <= 4'd10;
   endcase // case (key)

end // always @ (key)

   assign BCD = BCD_reg;
   
   
endmodule
