`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2026 05:56:02 PM
// Design Name: 
// Module Name: adder_subtractor
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


module adder_subtractor(input [3:0] A,input [3:0] B,input sub,output[3:0]result,output cout);
wire[3:0] B_mod;
wire[4:0] sum;

assign B_mod=B^{4{sub}};

assign sum=A+B_mod+sub;

assign result=sum[3:0];
assign cout=sum[4];
endmodule
