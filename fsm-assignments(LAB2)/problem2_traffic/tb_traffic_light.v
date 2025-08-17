`timescale 1ms/1ms

module tb_traffic_light;
reg clk, rst, tick;
wire ns_g, ns_y, ns_r, ew_g, ew_y, ew_r;

traffic_light dut(
.clk(clk), .rst(rst), .tick(tick),
.ns_g(ns_g), .ns_y(ns_y), .ns_r(ns_r),
.ew_g(ew_g), .ew_y(ew_y), .ew_r(ew_r)
);

initial begin
    clk = 0;
end
always #5 clk = ~clk;

initial begin
    tick = 0;
end
always begin
    #1_000 tick = 1;
    #10 tick = 0;
end


initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, tb_traffic_light);
    
    rst = 1;
    #12;
    rst = 0;
    
    #20_000;
    $finish;

end

endmodule