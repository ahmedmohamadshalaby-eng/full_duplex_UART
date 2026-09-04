`timescale 1ns/1ps
module Parity_TB;

 logic P_En;
 logic i_par_odd;
 logic [7:0]i_data;
 logic Par_out;
 logic i_clk;
 logic i_rst_n;

Parity instant(.P_En(P_En),.i_par_odd(i_par_odd),.i_data(i_data),.Par_out(Par_out),.i_clk(i_clk),.i_rst_n(i_rst_n));
always #5 i_clk=~i_clk;
initial 
begin

 i_clk=1'b0;
 i_rst_n=1'b0;
 P_En=1'b0;
 i_par_odd=1'b0;
 i_data=8'b00000000;
 #10
 i_rst_n=1'b1;
 #10;
 
 i_data=8'b00101010;
 i_par_odd=1'b0;
 P_En=1'b1;
 #10;


 i_data=8'b01010101;
 i_par_odd=1'b0;
 P_En=1'b1;
 #10;


 i_data=8'b00101000;
 i_par_odd=1'b1;
 P_En=1'b1;
 #10;


 i_data=8'b01011000;
i_par_odd=1'b1;
 P_En=1'b1;
 #10;


 P_En=1'b0;
i_par_odd=1'b1;
 i_data=8'b00001111;
 #10;

P_En=1'b0;
i_par_odd=1'b1;
 i_data=8'b00011111;
 i_rst_n=1'b0;
 #10;

$stop;
end 
endmodule 
