`timescale 1ns/1ps
module inpipe (
  input             clk,
  input       [3:0] X[3:0],
  output  reg [3:0] Y[3:0]
);
  //  [#members in each array][width of each member][#arrays] 
  reg [3:0][3:0] InDelay[3:0];
  
  always @(posedge clk) begin
    foreach (InDelay[i])
      InDelay[i] <= InDelay[i] << 4;
      
    foreach (X[i])
      InDelay[i][i] <= X[i];

    $display("@%4dns InDelay = %2p",$time, InDelay);
    

  end
endmodule

module M();
  bit clk=0;
  logic [3:0] X[3:0];
  logic [3:0] Y[3:0];
  
  inpipe inpipe (clk,X,Y);
  
  always
    #5 clk = ~clk;
  
  initial begin
        X = '{4,3,2,1};
    #10 X = '{8,7,6,5};
    #10 X = '{12,11,10,9};
    #10 X = '{15,15,13,4};
    #10 X = '{0,0,0,0};
    #100
    $finish;
  end
endmodule