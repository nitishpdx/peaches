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
          .min  (RowWire[row][col+1]),
          .max  (ColWire[row+1][col])
        );
        
        // input delays
        if (col===0) begin
          if (row===0) begin
              ShiftReg #(
                .M(1),    // one cycle delay
                .N(N)
              ) InDelayX0 (
                .Clk(Clk),
                .Clr(ShifterClr),
                .SI(X[0]),
                .SO(ColWire[0][0])
              );
              ShiftReg #(
                .M(1),    // one cycle delay
                .N(N)
              ) InDelayX1 (
                .Clk(Clk),
                .Clr(ShifterClr),
                .SI(X[1]),
                .SO(RowWire[0][0])
              );
          end
          else begin
            ShiftReg #(
               .M(row+1),
               .N(N)
             ) InDelay (
               .Clk(Clk),
               .Clr(ShifterClr),
               .SI(X[row+1]),
               .SO(RowWire[row][col])
             );
          end //row===0
        end //col===0
		  
        // output delays
        if (row===M-2) begin
          if (col===M-2) begin
            ShiftReg #(
              .M(1),
              .N(N)
            ) OutDelayYMin (
              .Clk(Clk),
              .Clr(ShifterClr),
              .SI(RowWire[M-2][M-1]),
              .SO(Y[M-1])
            );
            ShiftReg #(
              .M(1),
              .N(N)
            ) OutDelayYAlmostMin (
              .Clk(Clk),
              .Clr(ShifterClr),
              .SI(ColWire[M-1][M-2]),
              .SO(Y[M-2])
            );

          end
          else begin
            ShiftReg #(
              .M(row+1),
              .N(N)
            ) OutDelay (
              .Clk(Clk),
              .Clr(ShifterClr),
              .SI(ColWire[row+1][col]),
              .SO(Y[col])
            );
          end //col===M-2
        end //row===M-2

      end //for col
    end //for row
    
    // corner delays
    for (j=0; j<M-2; j++) begin
      ShiftReg #(
        .M(1),  // delay one cycle
        .N(N)
      ) CornerDelay (
        .Clk(Clk),
        .Clr(ShifterClr),
        .SI(RowWire[j][j+1]),
        .SO(ColWire[j+1][j+1])
      );
    end
    
	endgenerate

endmodule