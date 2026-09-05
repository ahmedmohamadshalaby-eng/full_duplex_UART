`timescale 1ns/1ps
module p_checker_TB;

logic [7:0]i_des;
 logic fsm;
 logic i_rx_par_bit;
 logic i_par_odd;
 logic i_clk;
 logic i_rst_n;
 logic fsm_fedback;

p_checker DUT(.i_des(i_des),.fsm(fsm),.i_rx_par_bit(i_rx_par_bit),.i_par_odd(i_par_odd),.i_clk(i_clk),.i_rst_n(i_rst_n),.fsm_fedback(fsm_fedback));

always #5 i_clk=~i_clk;
initial 
begin 
i_clk=1'b0;
i_rst_n=1'b0;
i_des=8'd0;
fsm=1'b0;
i_par_odd=1'b0;
i_rx_par_bit=1'b0;
#10;

i_rst_n=1'b1;
#10;

fsm=1'b0;
i_par_odd=1'b0;
i_rx_par_bit=1'b1;
i_des=8'd3;
#10;


fsm=1'b1;
#10;

i_par_odd=1'b0;
i_rx_par_bit=1'b0;
i_des=8'b01010101;
#10;


i_par_odd=1'b0;
i_rx_par_bit=1'b1;
i_des=8'b01000101;
#10;

i_par_odd=1'b1;
i_rx_par_bit=1'b0;
i_des=8'b01000101;
#10;


i_par_odd=1'b1;
i_rx_par_bit=1'b1;
i_des=8'b01010101;
#10;

i_par_odd=1'b0;
i_rx_par_bit=1'b1;
i_des=8'b01010101;
#10;

i_par_odd=1'b1;
i_rx_par_bit=1'b0;
i_des=8'b01010101;
#10;


i_par_odd=1'b1;
i_rx_par_bit=1'b1;
i_des=8'b01000101;
#10;

i_par_odd=1'b0;
i_rx_par_bit=1'b0;
i_des=8'b01000101;
#10;

i_par_odd=1'b0;
i_rx_par_bit=1'b0;
i_des=8'b01010101;
i_rst_n=1'b0;
#10;

$stop;
end 
endmodule