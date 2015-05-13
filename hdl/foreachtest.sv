 `timescale 1ns/1ps
module M();

int x[3:0];
int y[3:0] = {5,6,7,8};
initial begin
  x[0]=0;
  x[1]=1;
  x[2]=2;
  x[3]=3;
  foreach(x[i])
    $display("x=%p, i=%p", x[i], i);
  $display("");
  foreach(y[i])
    $display("y=%p, i=%p", y[i], i);
end
endmodule