module Parity(
input logic P_En,
input logic i_par_odd,
input logic [7:0]i_data,
input logic i_clk,
input logic i_rst_n,
output logic Par_out
);
always_ff@(posedge i_clk or negedge i_rst_n) 
begin
 if(!i_rst_n)
 begin 
  Par_out<=1'b0;
 end
 else if(P_En==1'b1)
 begin
  if(i_par_odd==1'b0)
  begin
   Par_out<=^i_data;
 end 
  else 
  begin 
   Par_out<=~^i_data;
  end 
 end 
end 

endmodule 
