module p_checker(
input logic [7:0]i_des,
input logic fsm,
input logic i_rx_par_bit,
input logic i_par_odd,
input logic i_clk,
input logic i_rst_n,
output logic fsm_fedback
);
logic result;
always_ff@(posedge i_clk or negedge i_rst_n )
begin
 if(!i_rst_n)
 begin
  result=1'b0;
  fsm_fedback<=1'b0;
 end
 else 
 begin
  if(fsm==1'b1)
  begin
   result=^i_des;
   if(i_par_odd==1'b0)
   begin
    if(i_rx_par_bit==result)
    begin
     fsm_fedback<=1'b0;
    end
    else 
    begin
     fsm_fedback<=1'b1;
    end
   end
   else
   begin
    if(i_rx_par_bit==~result)
    begin
     fsm_fedback<=1'b0;
    end
    else 
    begin
     fsm_fedback<=1'b1;
    end
   end
  end
  else 
  begin
   fsm_fedback<=1'b0;
  end
 end
end

endmodule
   