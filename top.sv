module top(
    input logic [7:0]i_data,
    input logic i_clk,
     input logic i_rst_n,
     input logic i_valid,
     input logic i_par_en,
     input logic i_par_odd,
     output logic  o_busy,
     output logic o_tx
);
logic ser_en;
logic ser_done;
logic parity_en;
logic [1:0]selector;
logic paritymux;
logic sermux;


FSM control(.i_valid(i_valid),.i_clk(i_clk),
.i_rst_n(i_rst_n),.i_par_en(i_par_en),
.serial_done(ser_done),
.par_en(parity_en),.sel(selector),
.o_busy(o_busy),.ser_en(ser_en));

serializer piso(.serial_En(ser_en),.mux(sermux),.i_clk(i_clk),.i_rst_n(i_rst_n),
.serial_done(ser_done),.i_data(i_data));

Parity instan(.P_En(parity_en),
.i_par_odd(i_par_odd),.i_data(i_data),
.Par_out(paritymux),.i_clk(i_clk),.i_rst_n(i_rst_n));

MUX selection(.S0(1'b0),.S1(1'b1),
.o_tx(o_tx),.serial(sermux),
.parity(paritymux),.sel(selector));
endmodule 

