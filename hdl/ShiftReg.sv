`timescale 1ns/1ps
module ShiftReg #(
  parameter N=4,      // width
  parameter M=4       // depth
)(
  input  bit           Clk, Clr,
  input  logic [N-1:0] SI,
  output logic [N-1:0] SO
);

  logic [M-1:0][N-1:0] temp;
   
  always @(posedge Clk) begin
    if (Clr) 
      temp = '0;
    else begin
      temp <<= N;
      temp[0] = SI;
    end
  end
  assign SO = temp[M-1];

endmodule
