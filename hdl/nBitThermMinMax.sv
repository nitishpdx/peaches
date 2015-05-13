`timescale 1ns/1ps

module nBitThermMinMax #(
  parameter N=4
)(
  input   bit   clk, rst,
  input   bit   [N-1:0] a,
  input   bit   [N-1:0] b,
  output  logic [N-1:0] min,
  output  logic [N-1:0] max
);
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      min <= '0;
      max <= '0;
    end
    else begin
      min <= (a & b);
      max <= (a | b);
    end
  end
endmodule
