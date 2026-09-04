`timescale 1ns/1ps
module Serializer_TB;

logic [7:0]i_data;
logic serial_En;
logic mux;
logic serial_done;
logic i_clk;
logic i_rst_n;

serializer sel(.i_data(i_data),.serial_En(serial_En),.mux(mux),.serial_done(serial_done),.i_clk(i_clk),.i_rst_n(i_rst_n));

always #5 i_clk=~i_clk;
initial 
begin 
 i_clk=1'b0;
 i_rst_n=1'b0;
 i_data=8'b00000000;
 serial_En=1'b0;
 #10
 i_rst_n=1'b1;
 #10;

 i_data=8'b00101000;
 serial_En=1'b0;
 #10;

 i_data=8'b00001111;
 serial_En=1'b1;
 #80;

 i_data=8'b00001111;
 serial_En=1'b0;
 #10;

 i_data=8'b00001111;
 serial_En=1'b1;
 i_rst_n=1'b0;
 #10;

$stop;
end 
endmodule

