module vending_mealy(
input wire clk,
input wire rst, // sync active-high
input wire [1:0] coin, // 01=5, 10=10, 00=idle
output wire dispense,// 1-cycle pulse
output wire chg5 // 1-cycle pulse when returning 5
);

reg [2:0] state_present, state_next;
reg x, y; // temporary reg type to hold dispense and change value for one cycle, x for dispense and y for change

parameter init = 3'b000;
parameter five = 3'b001;
parameter ten = 3'b010;
parameter fifteen = 3'b011;

always @(posedge clk) begin
    if(rst) state_present <= init;
    else state_present <= state_next;
end

always @(*) begin
    case(state_present)
        init: begin
            if(coin == 2'b01) state_next = five;
            else if (coin == 2'b10) state_next = ten;
            else state_next = state_present;
        end
        five: begin
            if(coin == 2'b01) state_next = ten;
            else if (coin == 2'b10) state_next = fifteen;
            else state_next = state_present;
        end
        ten: begin
            if(coin == 2'b01) state_next = fifteen;
            else if (coin == 2'b10) state_next = init;
            else state_next = state_present;
        end
        fifteen: begin
            if(coin == 2'b01) state_next = init;
            else if (coin == 2'b10) state_next = init;
            else state_next = state_present;
        end
        default: state_next = state_present;
    endcase
end

always @(posedge clk) begin
    if (rst) begin
        x <= 1'b0;
        y     <= 1'b0;
    end else begin
        x <= 1'b0;
        y    <= 1'b0;

        if ((state_present == ten     && coin == 2'b10) || 
            (state_present == fifteen && (coin == 2'b01 || coin == 2'b10)))
            x <= 1'b1;

        if (state_present == fifteen && coin == 2'b10)
            y <= 1'b1;
    end
end

assign dispense = x;
assign chg5 = y;


endmodule