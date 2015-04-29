`timescale 1ns/1ps

module mWideSorter_TB();
  parameter N=4;    // individual input width
  parameter M=4;    // number if inputs
  logic [N-1:0] X[M-1:0];
  logic [N-1:0] Y[M-1:0];
  bit           clk;
  bit           rst;
  
  initial begin
    clk = 0; 
    rst = 0;
  end
  
  always
    #1 clk = !clk;
  
  mWideSorter #(
    .N      (4),
    .M      (4)
  ) sort    (  
    .Clk    (clk),
    .Reset  (rst),
    .X      (X),
    .Y      (Y)
  );
  
  initial begin
    //X=0; Y=0;
    rst = 1'b1;
    #5  rst = ~rst;
    $display("\n");
    $display("time\trst\ta\tb\tmin\tmax");
    $display("============================================");
    $monitor("%2d\t%0b\t%p\t%p", $time, rst, X, Y);
         X[0]=8;X[1]=6;X[2]=1;X[3]=2;
    #10  X[0]=1;X[1]=2;X[2]=3;X[3]=4;
    #10  X[0]=8;X[1]=7;X[2]=7;X[3]=5;
    #10  X[0]=4;X[1]=4;X[2]=8;X[3]=0;
    #10  X[0]=1;X[1]=8;X[2]=3;X[3]=2;
    #10  X[0]=0;X[1]=0;X[2]=1;X[3]=1;
    #10  X='{8,8,8,8};//[0]=8;X[1]=8;X[2]=8;X[3]=8;
    #100
    $display("============================================");
    $display("\n\n");
    $finish;
  end
endmodule