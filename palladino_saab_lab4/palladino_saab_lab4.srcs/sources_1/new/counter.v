module counter(
    output reg [5:0] time_out,
    input [5:0]      time_in,
    input wire 	     clk_100MHz,
    input [2:0]      load,
    input [2:0]      enable      
   );

   reg [5:0] 	     hour=0;
   reg [5:0] 	     minute=0;
   reg [5:0] 	     second=0;
   
   wire 	     clk_1Hz;

   clk_divider CD1(clk_1Hz, clk_100MHz);
   
   always @(posedge clk_1Hz) begin
      second <= second+1;
      if (second == 6'd59) begin
	 second <= 6'd0;
	 minute <= minute+1;
      end
      if (minute == 6'd59) begin
	 minute <= 6'd0;
	 hour <= hour+1;
      end
      if (hour == 6'd23) begin
	 hour <= 6'd0;
      end
   end // always @ (posedge clk_1Hz)

   always @(posedge clk_100MHz) begin
      case (load)
	3'b100: hour <= time_in;
	3'b010: minute <= time_in;
	3'b001: second <= time_in;
      endcase // case (load)

      case (enable)
	3'b100: time_out <= hour;
	3'b010: time_out <= minute;
	3'b001: time_out <= second;
      endcase // case (enable)
   end // always @ (posedge clk_100MHz)
   
endmodule
