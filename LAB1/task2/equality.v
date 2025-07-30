module equality(input [3:0]A, input [3:0]B, output Y);

assign Y = (A == B) ? 1 : 0;

endmodule