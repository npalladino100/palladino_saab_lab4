module counter(
    output reg [17:0] time_out,
    input [17:0]      time_in,
    input wire 	      clk_100MHz,
    input 	      load,
    input 	      enable      
   );

   reg [5:0] 	     hour=1;
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
      if (minute == 6'd60) begin
	 minute <= 6'd0;
	 hour <= hour+1;
      end
      if (hour == 6'd25) begin
	 hour <= 6'd1;
      end


      if (load == 1) begin
        hour <= time_in[17:12];
	minute <= time_in[11:6];
	second <= time_in[5:0];
      end

      if (enable == 1) time_out <= {hour, minute, second};
      
   end // always @ (posedge clk_1Hz)

   
endmodule
