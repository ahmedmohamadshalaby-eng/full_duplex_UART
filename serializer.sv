module serializer(
input logic [7:0]i_data,
input logic serial_En,
output logic mux,
output logic serial_done,
input logic i_clk,
input logic i_rst_n
);
logic [7:0] load ;
logic [2:0] counter;
always_ff@(posedge i_clk or negedge i_rst_n)
begin
 if(!i_rst_n)
 begin 
  mux<=1'b0;
  serial_done<=1'b0;
  counter<=3'b000;
  load<=8'd0;
 end
 else 
 begin 
  if(serial_En==1'b1)
  begin
   mux<=load[0];
   load<={1'b0,load[7:1]};
   serial_done<=1'b0;
   
    if(counter==3'd7)
    begin 
     serial_done<=1'b1;
     counter<=3'b000;
    end
    else 
    begin 
     counter<=counter+1'b1;
    end  
  end
  else 
  begin 
   mux<=1'b0;
   serial_done<=1'b0;
   counter<=3'b000; 
   load<=i_data;
  end 
 end 
end

 endmodule
