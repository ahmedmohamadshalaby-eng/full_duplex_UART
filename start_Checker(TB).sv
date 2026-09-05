`timescale 1ns/1ps
module start_Checker_TB;

 logic i_rx;
 logic fsm;
 logic fsm_fedback;

 start_Checker DUT(.i_rx(i_rx),.fsm(fsm),.fsm_fedback(fsm_fedback));

initial 
begin

fsm=1'b0;
i_rx=1'b1;
#10;

fsm=1'b0;
i_rx=1'b0;
#10;


fsm=1'b1;
i_rx=1'b0;
#10;

fsm=1'b0;
i_rx=1'b0;
#10;

fsm=1'b1;
i_rx=1'b1;
#10;



$stop;
end
endmodule