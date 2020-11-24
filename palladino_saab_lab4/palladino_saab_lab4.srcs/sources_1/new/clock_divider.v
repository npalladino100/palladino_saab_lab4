module clk_divider(
output reg divided_clk = 0,
input wire clk //100MHz
    );
   localparam div_value = 1000000;   //1Hz
    
integer counter_value = 0;

//create counter
always@ (posedge clk)
begin
    if (counter_value == div_value)
        counter_value <=0;
    else
        counter_value <= counter_value+1;
end

//divide the clock
always@ (posedge clk)
begin
    if(counter_value == div_value)
        divided_clk <= !divided_clk;    //flip signal
    else
        divided_clk <= divided_clk; //store value
    end
endmodule
