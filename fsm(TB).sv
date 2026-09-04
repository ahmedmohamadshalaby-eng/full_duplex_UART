`timescale 1ns/1ps
module FSM_TB;

logic i_valid;
logic i_par_en;
logic serial_done;
logic i_clk;
logic i_rst_n;
logic  o_busy;
logic ser_en;
logic  [1:0]sel;
logic par_en;

FSM yan(.i_valid(i_valid),.i_par_en(i_par_en),.serial_done(serial_done),.i_clk(i_clk),.i_rst_n(i_rst_n),.o_busy(o_busy),.ser_en(ser_en),.sel(sel),.par_en(par_en));

always #5 i_clk=~i_clk;
initial
begin 
 i_clk=1'b0;
 i_rst_n=1'b0;
 i_valid=1'b0;
 i_par_en=1'b0;
 serial_done=1'b0;
 #10;
 i_rst_n=1'b1;
 #10;

 i_valid=1'b0;
 i_par_en=1'b0;
 serial_done=1'b0;
 #10;

 i_valid=1'b1;
 i_par_en=1'b0;
 serial_done=1'b0;
 #10;

 i_valid=1'b0;
 i_par_en=1'b1;
 serial_done=1'b0;
 #10;

 i_valid=1'b0;
 i_par_en=1'b0;
 serial_done=1'b1;
 #10;

 i_valid=1'b1;
 i_par_en=1'b1;
 serial_done=1'b1;
 #10;

 i_valid=1'b0;
 i_par_en=1'b1;
 serial_done=1'b1;
 #10;

 i_valid=1'b0;
 i_par_en=1'b1;
 i_rst_n=1'b0;
 serial_done=1'b1;
 #10;

 i_valid=1'b0;
 i_par_en=1'b0;
 serial_done=1'b1;
 i_rst_n=1'b0;
 #10;

$stop;
end 
endmodule
