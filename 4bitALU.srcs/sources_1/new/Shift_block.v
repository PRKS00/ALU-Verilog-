`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2026 07:54:57 PM
// Design Name: 
// Module Name: Shift_block
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


module Shift_block(
    input [3:0] A,
    input shift,
    output reg [3:0] result
);

always @(*) begin
    if (shift == 0) begin
        // LEFT shift
        result[3] = A[2];
        result[2] = A[1];
        result[1] = A[0];
        result[0] = 1'b0;
    end
    else begin
        // RIGHT shift
        result[0] = A[1];
        result[1] = A[2];
        result[2] = A[3];
        result[3] = 1'b0;
    end
end

endmodule