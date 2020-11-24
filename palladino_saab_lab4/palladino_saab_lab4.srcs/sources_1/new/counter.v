module counter(
    output reg [5:0] time_out,
    input [5:0]      time_in,
    input wire 	     clk_100MHz,
    input wire 	     clk_1Hz,
    input [2:0]      load,
    input [2:0]      enable      
   );

   reg [5:0] 	     hour;
   reg [5:0] 	     minute;
   reg [5:0] 	     second;
   
   
   always @(posedge clk_1Hz) begin
      second <= second+1;
      if (second == 6'd60) begin
	 second <= 6'd0;
	 minute <= minute+1;
      end
      if (minute == 6'd60) begin
	 minute <= 6'd0;
	 hour <= hour+1;
      end
      if (hour == 6'd60) begin
	 hour <= 6'd0;
      end
   end // always @ (posedge clk_1Hz)

   always @(posedge clk_100MHz) begin
      case (load)
	100: hour <= time_in;
	010: minute <= time_in;
	001: second <= time_in;
      endcase // case (load)

      case (enable)
	100: time_out <= hour;
	010: time_out <= minute;
	001: time_out <= second;
      endcase // case (enable)
   end // always @ (posedge clk_100MHz)
   
endmodule
