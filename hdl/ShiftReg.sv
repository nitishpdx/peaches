`timescale 1ns/1ps
module ShiftReg #(
  parameter N=4,      // width
  parameter M=4       // depth
)(
  input  bit           Clk, Clr,
  input  logic [N-1:0] SI,
  output logic [N-1:0] SO
);

  logic [N-1:0] temp [M-1:0];
   
  always @(posedge Clk) begin
    if (Clr)
      foreach (temp[i])
        temp[i] = {N-1{1'b0}};
    else if (M===1)
      temp[0] = SI;
    else
      temp = {temp[M-2:0],SI};
   end
  assign SO = temp[M-1];
endmodule
 
