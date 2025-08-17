module traffic_light(
input wire clk,
input wire rst, // sync active-high
input wire tick, // 1-cycle per-second pulse
output wire ns_g, ns_y, ns_r,
output wire ew_g, ew_y, ew_r
);

reg [2:0] state_present, state_next;

wire out;
reg road = 1'b0;

parameter init = 3'b000;
parameter one = 3'b001;
parameter two = 3'b010;
parameter three = 3'b011;
parameter four = 3'b100;
parameter five = 3'b101;
parameter six = 3'b110;

always @(posedge clk) begin
    if(rst) state_present <= init;
    else state_present <= state_next;
end

always @(*) begin
    case(state_present)
        init: begin
            if(tick) state_next = one;
            else state_next = state_present;
        end
        one: begin
            if(tick) state_next = two;
            else state_next = state_present;
        end
        two: begin
            if(tick) state_next = three;
            else state_next = state_present;
        end
        three: begin
            if(tick) state_next = four;
            else state_next = state_present;
        end
        four: begin
            if(tick) state_next = five;
            else state_next = state_present;
        end
        five: begin 
            if(tick) state_next = six;
            else state_next = state_present;
        end
        six: begin 
            if(tick) state_next = init;
            else state_next = state_present;
        end
        default: state_next = state_present;
    endcase
end

assign out = (state_present == six);

always @(posedge clk) begin
    if(rst) road <= 1'b0; 
    else if(tick && (state_present == six)) road <= ~road;
end

assign ns_r = (road == 1'b1);
assign ew_r = (road == 1'b0);
assign ns_g = (road == 1'b0)&&((state_present == init)  ||
                    (state_present == one)  ||
                    (state_present == two)  ||
                    (state_present == three)||
                    (state_present == four));
assign ns_y = (road == 1'b0)&&((state_present == five)||(state_present == six));
assign ew_g = (road == 1'b1)&&((state_present == init)  ||
                    (state_present == one)  ||
                    (state_present == two)  ||
                    (state_present == three)||
                    (state_present == four));
assign ew_y = (road == 1'b1)&&((state_present == five)||(state_present == six));
endmodule