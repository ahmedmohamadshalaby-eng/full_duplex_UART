`timescale 1ns/1ps
module neg_edgedetector_TB;
logic i_rx;
logic fsm;
logic fsm_fedback;
logic i_clk;
logic i_rst_n;

neg_edgedetector DUT(.i_rx(i_rx),.fsm(fsm),.fsm_fedback(fsm_fedback),.i_clk(i_clk),.i_rst_n(i_rst_n));

always #5 i_clk=~i_clk;
initial 
begin
i_clk=1'b0;
i_rst_n=1'b0;
fsm=1'b0;
i_rx=1'b0;
#10;

i_rst_n=1'b1;
#10;

fsm=1'b0;
i_rx=1'b1;
#10;


fsm=1'b1;
i_rx=1'b1;
#10
i_rx=1'b1;
#10;
i_rx=1'b0;
#10;
i_rx=1'b1;
#10;
i_rx=1'b0;
#10;
i_rx=1'b1;
#10;
i_rx=1'b0;
#10;
i_rx=1'b1;
#10;

fsm=1'b1;
i_rx=1'b0;
#30;
i_rst_n=1'b0;
#10;

i_rst_n=1'b1;
#10;

fsm=1'b1;
i_rx=1'b0;
#80;


$stop;
end 
endmodule

