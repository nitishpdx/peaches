`timescale 1ns/1ps
module M ();
  bit         Clk=0, Clr;
  logic [3:0] X, Y;
 
 
  nBitmWideShiftReg #(.M(2))
  shift (
    .Clk(Clk),
    .Clr(Clr),
    .SI(X),
    .SO(Y));
 
  always
    #5 Clk = ~Clk; 
  
  initial begin
    $display("\n");
    $display("time\tX(SI)\ttemp\tY(SO)");
    $display("==========================");
    $monitor("%2d\t%p\t%p\t%p",$time, X,shift.temp, Y);
      #10 X=15;
      #10 X=14;
      #10 X=8;
      #10 Clr=1;
      #10 Clr=2;
      #10 X=1;
      #10 X=2;
      #10 X=3;
      #100
    $finish;
    
  end
endmodule