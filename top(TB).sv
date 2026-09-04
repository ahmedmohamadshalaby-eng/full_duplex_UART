`timescale 1ns/1ps
module top_TB;
 logic [7:0] i_data;
    logic i_clk;
     logic i_rst_n;
     logic i_valid;
     logic i_par_en;
     logic i_par_odd;
     logic  o_busy;
      logic o_tx;
top B_box(.i_clk(i_clk),.i_rst_n(i_rst_n),.i_valid(i_valid),.i_par_en(i_par_en),.i_par_odd(i_par_odd),.o_busy(o_busy),.o_tx(o_tx),.i_data(i_data));
always #5 i_clk=~i_clk;
initial 
begin 
i_clk=1'b0;
i_rst_n=1'b0;
i_valid=1'b0;
i_par_en=1'b0;
i_par_odd=1'b0;
i_data=8'b00000000;
#10
i_rst_n=1'b1;
#10;

i_valid=1'b1;
i_data=8'b00101010;
i_par_en=1'b0;
i_par_odd=1'b0;
i_rst_n=1'b0;
#10;

i_rst_n=1'b1;
#10;



i_valid=1'b1;
#10;

i_data=8'b00101010;
i_par_en=1'b0;
i_par_odd=1'b0;
i_valid=1'b0;
#10;


i_valid=1'b0;
i_data=8'b00101010;
i_par_en=1'b0;
i_par_odd=1'b0;
#10;


i_valid=1'b1;
#10;

i_valid=1'b0;
i_data=8'b00101010;
i_par_en=1'b1;
i_par_odd=1'b0;
#110;

i_valid=1'b0;
i_data=8'b00101010;
i_par_en=1'b1;
i_par_odd=1'b1;
#110;


i_valid=1'b0;
i_data=8'b00101010;
i_par_en=1'b0;
i_par_odd=1'b0;
i_rst_n=1'b0;
#10;

i_valid=1'b1;
i_data=8'b00101010;
i_par_en=1'b1;
i_par_odd=1'b0;
#10;


$stop;
end 
endmodule 
