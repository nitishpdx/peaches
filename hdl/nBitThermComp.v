module (parameter WIDTH(4))(
  input                   clk, reset,
  input       [WIDTH-1:0] a,
  input       [WIDTH-1:0] b,
  output  reg [WIDTH-1:0] min,
  output  reg [WIDTH-1:0] max);
  
  
  assign rstN = !rst;
  
  always @(posedge clk) begin
    if (rstN) begin
      min <= {(WIDTH){1'b0}};
      max <= {(WIDTH){1'b0}};
    end
    else begin
      min <= a & b;
      max <= a | b;
  end
  
  endmodule