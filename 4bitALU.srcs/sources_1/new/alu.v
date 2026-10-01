`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2026 06:22:06 PM
// Design Name: 
// Module Name: alu
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


module alu(input [3:0]A,input [3:0]B,input SUB,input S1,input S0,output reg[3:0] out,output cout,output reg[3:0] flag);

    wire [3:0] arith_out;
    wire [3:0] and_out;
    wire [3:0] or_out;
    wire [3:0] xor_out;
    // Arithmetic (ADD/SUB)
    adder_subtractor u1(
      .A(A),
      .B(B),
      .sub(SUB),
      .result(arith_out),
      .cout(cout)
  );

  // AND
   and_block u2 (
      .A(A),
      .B(B),
      .result(and_out)
  );

  // OR
  or_block u3 (
      .A(A),
      .B(B),
      .result(or_out)
  );

  // XOR
  xor_block u4 (
      .A(A),
      .B(B),
      .result(xor_out)
  );
  
  // Selection logic (MUX behavior)
      always @(*) begin
          case ({S1, S0})
              2'b00: out = arith_out; // ADD/SUB
              2'b01: out = and_out;   // AND
              2'b10: out = or_out;    // OR
              2'b11: out = xor_out;   // XOR
              default: out = 4'b0000;
          endcase
if (out == 4'b0000) // zero flag
          flag[0] = 1;
      else
          flag[0] = 0;
if (SUB == 0) // carry flag
              flag[1] = cout;     // carry
          else
              flag[1] = ~cout;    // borrow
if (SUB == 0) // i=overflow flag
                      flag[2] = (A[3] & B[3] & ~out[3]) | (~A[3] & ~B[3] & out[3]);
                  else
                      flag[2] = (A[3] & ~B[3] & ~out[3]) | (~A[3] & B[3] & out[3]); //overflow flag
flag[3]=out[3];  // sign flag            
          
          
       end   

endmodule
