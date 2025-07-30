`timescale 1ns / 1ns
module tb;

reg [3:0] A, B;
wire Y;

equality dut(.A(A), .B(B), .Y(Y));

initial begin
    $dumpfile("equality.vcd");
    $dumpvars(0, tb);

    A = 4'd0; B = 4'd0; 
    #10;  
    A = 4'd12; B = 4'd12; 
    #10;  
    A = 4'd11; B = 4'd9; 
    #10;  
    A = 4'd13; B = 4'd10; 
    #10;
    A = 4'd11; B = 4'd11;
    #10;
    A = 4'd4; B = 4'd5;
    #10;
    A = 4'd9; B = 4'd15;
    #10;
    A = 4'd5; B = 4'd5;
    #10;

    $finish;

end

endmodule