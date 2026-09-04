`timescale 1ns/1ps
module deserializer_TB;

 logic i_clk;
 logic i_rst_n;
 logic i_rx;
 logic en;
 logic [7:0]o_data;
 logic done;

 deserializer  gh(.i_clk(i_clk),.i_rst_n(i_rst_n),.i_rx(i_rx),.en(en),.o_data(o_data),.done(done));

 always #5 i_clk=~i_clk;
 initial
 begin
  i_clk=1'b0;
  i_rst_n=1'b0;
  i_rx=1'b1;
  en=1'b0;
  #10;

 i_rst_n=1'b1;
 #10;

 i_rx=1'b1;
 en=1'b0;
 #10;

 en=1'b1;
 i_rx=1'b1;
 #80;

 i_rst_n=1'b0;
 #10;

 i_rst_n=1'b1;
 #10;

  i_rx=1'b0;
  en=1'b1;
  #80;

  i_rst_n=1'b0;
  #10;
  i_rst_n=1'b1;
 #10;

  en=1'b1;
  i_rx=1'b0;
  #10;
  i_rx=1'b1;
  #10;
  i_rx=1'b0;
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
  en=1'b1;
  i_rst_n=1'b0;
  #10;

  $stop;
end 
endmodule
