module MUX(
input logic S0,
input logic S1,
output logic o_tx,
input logic serial,
input logic parity,
input logic [1:0]sel
);
always_comb 
begin
 if(sel==2'b00)
 begin
    o_tx=S0;
 end
 else if(sel==2'b11)
 begin
  o_tx=S1;
 end
 else if(sel==2'b01)
 begin
  o_tx=serial;end
 else if(sel==2'b10)
 begin
  o_tx=parity; 
 end
 else
 begin 
  o_tx=1'b1;
 end 
end

endmodule
