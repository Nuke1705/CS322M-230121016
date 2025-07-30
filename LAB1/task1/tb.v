`timescale 1ns / 1ns
module tb;

reg A, B;
wire X, Y, Z;

comparator dut(.a(A), .b(B), .x(X), .y(Y), .z(Z));

initial begin
    $dumpfile("comparator.vcd");
    $dumpvars(0, tb);

    A = 0; B = 0; #10;  
    A = 0; B = 1; #10;  
    A = 1; B = 0; #10;  
    A = 1; B = 1; #10;

    $finish;

end

endmodule