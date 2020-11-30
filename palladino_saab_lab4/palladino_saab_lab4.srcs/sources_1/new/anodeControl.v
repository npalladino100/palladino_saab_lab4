`timescale 1ns / 1ps


module anodeControl(
    output reg [7:0] anode = 0,
    input [2:0]      refreshCounter,
    input [2:0]      digit_sel
    );
   
    always@(refreshCounter)
    begin
        if (refreshCounter == 3'b000)// & (digit_sel == 3'b001 | digit_sel == 2'b000))
	  anode = 8'b01111111;
        else if (refreshCounter == 3'b001)// & (digit_sel == 3'b010 | digit_sel == 2'b000))
	  anode = 8'b10111111;
        else if (refreshCounter == 3'b010)// & (digit_sel == 3'b011 | digit_sel == 2'b000))
	  anode = 8'b11011111;
        else if (refreshCounter == 3'b011)// & (digit_sel == 3'b100 | digit_sel == 2'b000))
	  anode = 8'b11101111;
	else if (refreshCounter == 3'b100)// & (digit_sel == 3'b101 | digit_sel == 2'b000))
	  anode = 8'b11110111;
	else if (refreshCounter == 3'b101)// & (digit_sel == 3'b110 | digit_sel == 2'b000))
	  anode = 8'b11111011;
	else if (refreshCounter == 3'b110) anode = 8'b11111101;
	else if (refreshCounter == 3'b111) anode = 8'b11111110;
	    end // always@ (refreshCounter)	    
endmodule
