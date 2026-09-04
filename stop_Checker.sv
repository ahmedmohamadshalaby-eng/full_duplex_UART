module stop_Checker(
input logic i_rx,
input logic fsm,
output logic fsm_fedback
);
always_comb
begin
 if(fsm==1'b1)
 begin
  if(i_rx==1'b1)
  begin
   fsm_fedback=1'b1;
  end
  else 
  begin 
   fsm_fedback=1'b0;
  end
 end
 else
 begin
  fsm_fedback=1'b0;
 end
end

endmodule
