`timescale 1ns/1ps
module thermComp_TB();
  parameter WIDTH=4;
  reg   [3:0]   a, b;
  wire  [3:0]   min, max;
  reg           clk;
  reg           rst;
  
  initial begin
    clk = 0; 
    rst = 0;
  end
  
  always
    #1 clk = !clk;
  
  nBitThermMinMax MinMax(
    .clk  (clk),
    .rst  (rst),
    .a    (a),
    .b    (b),
    .min  (min),
    .max  (max));
  
  initial begin
    a=0; b=0;
    rst = 1'b1;
    #5  rst = ~rst;
    $display("\n");
    $display("time\trst\ta\tb\tmin\tmax");
    $display("============================================");
    $monitor("%2d\t%0b\t%b\t%b\t%b\t%b", $time, rst, a, b, min, max);
    #5  a = 4'b1111; b= 4'b0111; 
    #5  a = 4'b0001; b= 4'b0000;
    #5  a = 4'b0000; b= 4'b0011;
    #5  a = 4'b0011; b= 4'b1111;
    #5  a = 4'b0111; b= 4'b0011;
    #5  a = 4'b1000; b= 4'b0001;
    #5  a = 4'b1111; b= 4'b0111;
    $display("============================================");
    $display("\n\n");
    $finish;
  end
endmodule