`timescale 1ns/1ps

module mWideSorter #(
  parameter N=4,    // individual input width
  parameter M=4     // number if inputs
)(  
  input   bit           Clk, Reset,
  input   logic [N-1:0] X[M-1:0],
  output  logic [N-1:0] Y[M-1:0]
);

  int i;            // loop counter
  bit ShifterClr=0; // clear bit for [In|Out]Delay shift registers

  // Cell hookup wires
  // [col][bit-width][row]
  logic [M-1:0][N-1:0] RowWire [M-2:0];
  logic [M-2:0][N-1:0] ColWire [M-1:0];
  
  //// Input/Output delay pipelines
  //// [max delay cycles][input width][# of inputs]
  //logic [M-1:0][N-1:0] InDelay[M-1:0];
  //logic [M-1:0][N-1:0] OutDelay[M-1:0];
  
 //// Inputs
 //always @(posedge Clk) begin
 //  // input -> delay
 //  InDelay[0][M-2] <= X[0];
 //  foreach (RowWire[i,])
 //    InDelay[i+1][M-2-i] <= X[i+1];
 //  
 //  // shift delay
 //  foreach (InDelay[i])            
 //    InDelay[i] <= InDelay[i] << N;
 //end


  // instantiate and wire up the cells and 
  // appropriate input/output delays
  genvar row, col, j;
  generate
    // instantiate the cells
    for (row=0; row < (M-1); row++) begin
      for (col=0; col < (row+1); col++) begin
        nBitThermMinMax Cell (
          .clk  (Clk),
          .rst  (Reset),
          .a    (ColWire[row][col]),
          .b    (RowWire[row][col]),
          .max  (ColWire[row+1][col]),
          .min  (RowWire[row][col+1]));
          
          if (col===0) begin
            if (row===0) begin
              //repeat (2)  begin
                ShiftReg #(
                  .M(row+1),
                  .N(N)
                ) InDelayX0 (
                  .Clk(Clk),
                  .Clr(ShifterClr),
                  .SI(X[0]),
                  .SO(ColWire[0][0])
                );
                ShiftReg #(
                  .M(row+1),
                  .N(N)
                ) InDelayX1 (
                  .Clk(Clk),
                  .Clr(ShifterClr),
                  .SI(X[1]),
                  .SO(RowWire[0][0])
                );
              //  int second=1;
              //end //repeat
            end
            else begin
              ShiftReg #(
                  .M(row+1),
                  .N(N)
                ) InDelay (
                  .Clk(Clk),
                  .Clr(ShifterClr),
                  .SI(X[row+1]),
                  .SO(RowWire[row][0])
                );
            end //if row===0
          end //if col===0
      end //for col
    end //for row
    
  //  // in delay -> cell connections
  //  for (j=M-2; j==0; j--)
  //    assign RowWire[j][0] = InDelay[j+1][M-2];
  //  assign ColWire[0][0] = InDelay[0][M-2];
  //  
  //  // cell -> out delay connections
  //  for (j=M-2;j==0;j--)
  //    assign OutDelay[M-2][j] = ColWire[M-1][j];
  //  assign OutDelay[M-1][M-2] = RowWire[M-2][M-1];
    
	endgenerate

  
  //// row transition (corner) delays
  //always @(posedge Clk) begin
  //  for (int i=1; i<M-1; i++) begin
  //    ColWire[i][i] <= RowWire[i-1][i];
  //  end
  //end
    
    
  //// Output delays
  //always @(posedge Clk) begin
  //  // delay -> outputs
  //  foreach (Y[i])
  //    Y[i] <= OutDelay[i][3]; 
  //    
  //  // shift delay
  //  foreach (OutDelay[i])
  //    OutDelay[i] <= OutDelay[i] << N;
  //  
  //end
  
   
endmodule