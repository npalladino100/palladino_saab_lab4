`timescale 1ns / 1ps


module anodeControl(
    output reg [7:0] anode = 0,
    input [2:0] refreshCounter
    );
    
    always@(refreshCounter)
    begin
        case(refreshCounter)
            3'b000:
                anode = 8'b01111111;
            3'b001:
                anode = 8'b10111111;
            3'b010:
                anode = 8'b11011111;
            3'b011:
                anode = 8'b11101111;
	    3'b100:
	        anode = 8'b11110111;
	    3'b101:
	        anode = 8'b11111011;
	    3'b110:
	        anode = 8'b11111101;
	    3'b111:
	        anode = 8'b11111110;
        endcase
    end
endmodule
