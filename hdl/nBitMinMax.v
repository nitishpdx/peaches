`timescale 1ns/1ps

module nBitMinMax #(parameter WIDTH=4)(
  input             clk, rst,
  input       [3:0] a,
  input       [3:0] b,
  output  reg [3:0] min,
  output  reg [3:0] max);
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      min <= 4'b0;
      max <= 4'b0;
    end
    else begin
      min <= (a & b);
      max <= (a | b);
    end
  end
  
 endmodule