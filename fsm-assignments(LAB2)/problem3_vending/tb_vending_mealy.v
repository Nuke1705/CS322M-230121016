`timescale 1ms/1ms

module tb_vending_mealy;
reg clk, rst;
reg [1:0] coin;
wire dispense, chg5;

vending_mealy dut(.clk(clk), .rst(rst), .coin(coin),
.dispense(dispense), .chg5(chg5));

initial begin
    clk = 0;
end
always #5 clk = ~clk;

initial begin
    $dumpfile("vending.vcd");
    $dumpvars(0, tb_vending_mealy);
    
    rst = 1;
    coin = 2'b00;
    #12;
    rst = 0;
    
    @(negedge clk); coin = 2'b01;
    @(negedge clk); coin = 2'b01;
    @(negedge clk); coin = 2'b10;

    @(negedge clk); coin = 2'b00;

    @(negedge clk); coin = 2'b01;
    @(negedge clk); coin = 2'b10;
    @(negedge clk); coin = 2'b10;

    @(negedge clk); coin = 2'b00;

    @(negedge clk); coin = 2'b10;
    @(negedge clk); coin = 2'b01;
    @(negedge clk); coin = 2'b01;

    #100;

    $finish;

end


endmodule
