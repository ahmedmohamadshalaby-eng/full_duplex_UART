module deserializer(
input logic i_clk,
input logic i_rst_n,
input  logic i_rx,
input logic en,
output logic [7:0]o_data,
output logic done
);
logic [2:0] count;
always_ff@(posedge i_clk or negedge i_rst_n)
begin 
 if(!i_rst_n)
 begin
  o_data<=8'b0;
  count<=3'd0;
  done<=1'b0;
 end
 else  
 begin
  if(en)
  begin 
   o_data<={i_rx,o_data[7:1]};
   if(count==3'd7)
   begin
    done<=1'b1;
    count<=3'd0;
   end
   else 
   begin
    done<=1'b0;
    count<=count+1'b1;
   end
  end
  else 
  begin
   done<=1'b0;
   count<=3'd0;
  end
 end 
end

endmodule
