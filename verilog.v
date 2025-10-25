
module Mux_8X1(
input [7:0]I0,I1,I2,I3,I4,I5,I6,I7,
input [2:0]sel,
output reg [7:0]data_out);
always@(*)
begin 
case(sel)
3'b000: data_out = I0;
3'b001: data_out = I1;
3'b010: data_out = I2;
3'b011: data_out = I3;
3'b100: data_out = I4;
3'b101: data_out = I5;
3'b110: data_out = I6;
3'b111: data_out = I7;
endcase 
end 
endmodule



module D_MUX_1X8(
input data,
input [2:0]sel,
output reg Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
always@(*)
begin 
case(sel)
3'b000: Y0 = data;
3'b001: Y1 = data;
3'b010: Y2 = data;
3'b011: Y3 = data;
3'b100: Y4 = data;
3'b101: Y5 = data;
3'b110: Y6 = data;
3'b111: Y7 = data;
endcase 
end 
endmodule



module D_ff_with_reset_and_enable(
input [7:0]D,
input rst,enable,clk,
output reg [7:0]Q);
always@(posedge clk)
begin 
if(rst)
Q <= 1'b0;
else if(enable)
Q <= D;
else 
Q <= 1'b0;
end
endmodule

// MAIN MODULE 
module Data_in_Data_out(
input [7:0]data_in,
input write,clk,rst,
input [2:0]address, 
output [7:0]data_out);
wire [7:0]w1,w2,w3,w4,w5,w6,w7,w8;
wire Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
D_MUX_1X8 a0(.data(write), .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .Y4(Y4), .Y5(Y5), .Y6(Y6), .Y7(Y7), .sel(address));
D_ff_with_reset_and_enable a1(.D(data_in), .rst(rst), .enable(Y0), .clk(clk), .Q(w1));
D_ff_with_reset_and_enable a2(.D(data_in), .rst(rst), .enable(Y1), .clk(clk), .Q(w2));
D_ff_with_reset_and_enable a3(.D(data_in), .rst(rst), .enable(Y2), .clk(clk), .Q(w3));
D_ff_with_reset_and_enable a4(.D(data_in), .rst(rst), .enable(Y3), .clk(clk), .Q(w4));
D_ff_with_reset_and_enable a5(.D(data_in), .rst(rst), .enable(Y4), .clk(clk), .Q(w5));
D_ff_with_reset_and_enable a6(.D(data_in), .rst(rst), .enable(Y5), .clk(clk), .Q(w6));
D_ff_with_reset_and_enable a7(.D(data_in), .rst(rst), .enable(Y6), .clk(clk), .Q(w7));
D_ff_with_reset_and_enable a8(.D(data_in), .rst(rst), .enable(Y7), .clk(clk), .Q(w8));
Mux_8X1 a9(.I0(w1), .I1(w2), .I2(w3), .I3(w4), .I4(w5), .I5(w6), .I6(w7), .I7(w8), .data_out(data_out), .sel(address));

endmodule


