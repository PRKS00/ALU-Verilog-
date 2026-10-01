`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2026 06:41:20 PM
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_tb();
//declaration of all inputs and output variables
reg [3:0]A;
reg [3:0]B;
reg S1;
reg S0;
reg sub;
wire [3:0] result;
wire cout;
wire [3:0] flag;

alu dut(A,B,sub,S1,S0,result,cout,flag);
// initialization of inputs
initial
begin
A=4'b0000;
B=4'b0000;
S1=0;
S0=0;
sub=0;
end

//assignments of input
initial
begin
S1=0;
S0=0;
A=8;
B=8;
#5;
S1=0;
S0=0;
A=5;
B=8;
sub=1;
#5;
S1=0;
S0=1;
A=5;
B=8;
#5;
S1=1;
S0=0;
A=5;
B=8;
#5;
S1=1;
S0=1;
A=5;
B=8;

end
endmodule
