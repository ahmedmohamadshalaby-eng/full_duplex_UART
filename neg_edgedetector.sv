module edgedetector(
input logic i_rx,
input logic fsm,
output logic fsm_fedback,
input logic i_clk,
input logic i_rst_n
);
logic prev;
always_ff@(posedge i_clk or negedge i_rst_n)
begin
 if(!i_rst_n)
 begin
  prev<=1'b1;
 end
 else 
 begin 
  if(fsm==1'b1)
  begin
   prev<=i_rx;
  end
  else 
  begin
   prev<=1'b1;
  end
 end
end

assign fsm_fedback=(prev==1'b1)&&(i_rx==1'b0)&&(fsm==1'b1);

endmodule
