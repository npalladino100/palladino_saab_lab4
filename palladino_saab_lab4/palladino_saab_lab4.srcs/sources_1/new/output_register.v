`timescale 1ns / 1ps

module output_register(
output [6:0] LED_OUT,
output [7:0] ANODE_OUT,
input [17:0] D,
input clk_100MHz,
input load
);

reg[17:0] L;

always @(posedge clk_100MHz) begin
	if (load == 1) //Loading value into L (L is an intermediate value)
	  L=D;
end

wire [3:0] hr_Hundreds; wire [3:0] hr_Tens; wire [3:0] hr_Ones;
wire [3:0] min_Hundreds; wire [3:0] min_Tens; wire [3:0] min_Ones;
wire [3:0] sec_Hundreds; wire [3:0] sec_Tens; wire [3:0] sec_Ones;
wire [6:0] hr_segments1; wire [6:0] hr_segments2; wire [6:0] hr_segments3;  
wire [6:0] min_segments1; wire [6:0] min_segments2; wire [6:0] min_segments3;
wire [6:0] sec_segments1; wire [6:0] sec_segments2; wire [6:0] sec_segments3;
   
   binaryBCD BB1(hr_Hundreds, hr_Tens, hr_Ones, {1'b0, L[17:12]});
   binaryBCD BB2(min_Hundreds, min_Tens, min_Ones, {1'b0, L[11:6]});
   binaryBCD BB3(sec_Hundreds, sec_Tens, sec_Ones, {1'b0, L[5:0]});
   
   BCDDisplay BDH1(hr_segments1, hr_Hundreds);
   BCDDisplay BDH2(hr_segments2, hr_Tens);
   BCDDisplay BDH3(hr_segments3, hr_Ones);

   BCDDisplay BDM1(min_segments1, min_Hundreds);
   BCDDisplay BDM2(min_segments2, min_Tens);
   BCDDisplay BDM3(min_segments3, min_Ones);

   BCDDisplay BDS1(sec_segments1, sec_Hundreds);
   BCDDisplay BDS2(sec_segments2, sec_Tens);
   BCDDisplay BDS3(sec_segments3, sec_Ones);

wire clk_10KHz;
wire [2:0] refresh_counter;
clk_divider_10KHz CD1(clk_10KHz, clk_100MHz);
refreshCounter RF(refresh_counter, clk_10KHz);
anodeControl AC(ANODE_OUT, refresh_counter);
cathodeControl CC(LED_OUT, hr_segments2, hr_segments3, min_segments2, min_segments3, sec_segments2, sec_segments3, refresh_counter);

endmodule
