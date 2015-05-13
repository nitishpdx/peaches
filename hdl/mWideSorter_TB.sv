`timescale 1ns/1ps

module mWideSorter_TB();
  parameter N=4;    // individual input width
  parameter M=5;    // number of inputs
  logic [N-1:0] X[M-1:0];
  logic [N-1:0] Y[M-1:0];
  bit           clk;
  bit           rst;

  initial clk = 1; 
  always #10 clk = ~clk;

  
  mWideSorter #(
    .N      (N),
    .M      (M)
  ) sort    (  
    .Clk    (clk),
    .Reset  (rst),
    .X      (X),
    .Y      (Y)
  );
  
  initial begin
    rst = 1'b1;
    #10  rst = ~rst;
    $display("\n");
    $display("time\trst\tX\t\t\Y");
    $display("============================================");
    $monitor("%2d\t%0d\t%p\t%p", $time, rst, X, Y);
    //$display("%2d\t%0d\t%p\t%p", $time, rst, X, Y);
   @(negedge clk) X = '{15,1,7,3,0};
    //$display("%2d\t%0d\t%p\t%p", $time, rst, X, Y);
    @(negedge clk) X = '{M{0}};
/*
    //$display("%2d\t%0d\t%p\t%p", $time, rst, X, Y);
    #10  X = '{8,7,7,5,1};
    //$display("%2d\t%0d\t%p\t%p", $time, rst, X, Y);
    #10  X = '{4,1,2,3,8};
    //$display("%2d\t%0d\t%p\t%p", $time, rst, X, Y);
    #10  X = '{1,8,3,2,8};
    //$display("%2d\t%0d\t%p\t%p", $time, rst, X, Y);
    #10  X = '{0,0,1,1,8};
    //$display("%2d\t%0d\t%p\t%p", $time, rst, X, Y);
    #10  X = '{8,8,8,8,8};
    //$display("%2d\t%0d\t%p\t%p", $time, rst, X, Y);
*/
    #1000
    $display("============================================");
    $display("\n\n");
    $stop;
  end
endmodule
