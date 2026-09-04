`timescale 1ns/1ps
module MUX_TB;
logic S0;
logic S1;
logic o_tx;
logic serial;
logic parity;
logic [1:0]sel;

MUX hull(.S0(1'b0),.S1(1'b1),.o_tx(o_tx),.serial(serial),.parity(parity),.sel(sel));
initial 
begin 
 sel=2'b11;
 serial=1'b0;
 parity=1'b0;
 #10;

 sel=2'b00;
 serial=1'b1;
 parity=1'b1;
 #10;

 sel=2'b00;
 serial=1'b0;
 parity=1'b0;
 #10;

 sel=2'b01;
 serial=1'b1;
 parity=1'b0;
 #10;

 sel=2'b01;
 serial=1'b0;
 parity=1'b1;
 #10;


 sel=2'b10;
 serial=1'b1;
 parity=1'b0;
 #10;


 sel=2'b10;
 serial=1'b0;
 parity=1'b1;
 #10


 sel=2'b11;
 serial=1'b1;
 parity=1'b1;
 #10;


 sel=2'b11;
 serial=1'b0;
 parity=1'b1;
 #10;


 sel=2'b11;
 serial=1'b0;
 parity=1'b0;
 #10;


 sel=2'b11;
 serial=1'b1;
 parity=1'b0;
 #10;


$stop;
end 
endmodule 
