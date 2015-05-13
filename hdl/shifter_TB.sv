`timescale 1ns/1ps
module M ();
  localparam  N=4;
  localparam  M=5;
  bit         Clk, Clr=0;
  logic [3:0] X, Y;

 
  ShiftReg #(N,M)
  shift (
    .Clk(Clk),
    .Clr(Clr),
    .SI(X),
    .SO(Y));
 
  always
    #1 Clk = ~Clk; 
  
  initial begin
    @(posedge Clk) Clr=1; @(posedge Clk) Clr=0;
    $display("\n");
    $display("time\tX(SI)\t         temp\t\tY(SO)");
    $display("===========================================");
    $monitor("%2d\t%p\t%2p\t  %p",$time, X,shift.temp, Y);
    @(negedge Clk) X=31;
    @(negedge Clk) X=1;
    @(negedge Clk) X=2;
    @(negedge Clk) X=3;
    @(negedge Clk) X=4;
    //@(negedge Clk) Clr=1; @(negedge Clk) Clr=0;
    //repeat (10) @(negedge Clk) X=$random;
    #100
    $finish;
    
  end
endmodule