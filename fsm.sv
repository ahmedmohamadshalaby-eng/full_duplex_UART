module FSM(
input logic i_valid,
input logic i_par_en,
input logic serial_done,
input logic i_clk,
input logic i_rst_n,
output logic o_busy,
output logic ser_en,
output logic [1:0]sel,
output logic par_en
);
logic [2:0]current ;
logic [2:0]next ;
typedef enum logic[2:0]{
s0,
s1,
s2,
s3,
s4
}state;


always_ff@(posedge i_clk or negedge i_rst_n )
begin 
if(!i_rst_n)
begin 
 current<=s0;
end
else
 begin 
  current<=next;
end
end 


always_comb
begin
 case(current)
 s0:
 if(i_valid==1'b1)
 begin
  next=s1;
 end
 else 
 begin 
  next=s0; 
  end
 s1:
  next=s2;
 s2:
 if(serial_done&&i_par_en)
 begin 
  next=s3;
 end
 else if(serial_done&&i_par_en==1'b0) 
 begin 
  next=s4;
 end
 else 
 begin 
  next=s2;
 end
 s3:
  next=s4;
 s4:
  next=s0;
 default:
  next=s0;
 endcase
end 


always_comb 
begin 
 case(current)
 s0:
 begin 
  o_busy=1'b0;
  ser_en=1'b0;
  par_en=1'b0;
  sel=2'b11;
 end
 s1:
 begin 
  sel=2'b00;
  ser_en=1'b1;
  o_busy=1'b1;
  par_en=1'b1; end
 s2:
 begin 
  sel=2'b01;
  par_en=1'b0;
  o_busy=1'b1;
  ser_en=1'b1; 
 end
 s3: 
 begin 
  sel=2'b10;
  o_busy=1'b1; 
  ser_en=1'b0;
  par_en=1'b0;
 end 
 s4: 
 begin 
  sel=2'b11;
  o_busy=1'b1;
  ser_en=1'b0;
  par_en=1'b0; 
 end
 default: 
 begin 
  sel=2'b11;
  ser_en=1'b0;
  par_en=1'b0;
  o_busy=1'b0; 
 end 
 endcase 
end

endmodule 
