module comparator(input a, input b, output x, output y, output z);

assign x = (a > b) ? 1 : 0;
assign y = (a == b) ? 1 : 0;
assign z = (a < b) ? 1 : 0;

endmodule