module tb_seq_detect_mealy;
reg clk, rst, din;
wire y;

seq_detect_mealy dut(.clk(clk), .rst(rst), .din(din), .y(y));

initial begin
    clk = 0;
end
always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_seq_detect_mealy);

    rst = 1;
    din = 0;

    #12;
    
    rst = 0;
    @(negedge clk); din = 1;
    @(negedge clk); din = 1;
    @(negedge clk); din = 0;
    @(negedge clk); din = 1;
    @(negedge clk); din = 1;
    @(negedge clk); din = 0;
    @(negedge clk); din = 1;
    @(negedge clk); din = 0;
    @(negedge clk); din = 1;
    @(negedge clk); din = 1;
    @(negedge clk); din = 0;
    @(negedge clk); din = 1;
    @(negedge clk); din = 1;
    @(negedge clk); din = 0;
    @(negedge clk); din = 1;
    @(negedge clk); din = 0;

    #20;
    $finish;

end
endmodule