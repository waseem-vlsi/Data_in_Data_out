
module Data_in_Data_out_tb();
reg [7:0]data_in;
reg write,clk,rst;
reg [2:0]address;
wire  [7:0]data_out;
Data_in_Data_out dut (.data_in(data_in), .write(write), .clk(clk), .rst(rst), .address(address), .data_out(data_out));

initial 
begin 
clk = 1'b0;
forever #5 
clk = ~clk;
end 

initial 
begin 
write = 1'b0; rst = 1'b1;
#10 write = 1'b1; rst = 1'b0; address = 3'b011; data_in = 8'd45;  
#10 write = 1'b1; rst = 1'b0; address = 3'b101; data_in = 8'd09;  
#10 write = 1'b1; rst = 1'b0; address = 3'b100; data_in = 8'd50;  
#10 write = 1'b1; rst = 1'b0; address = 3'b111; data_in = 8'd5;  
#10 $finish;
 
end 
endmodule
