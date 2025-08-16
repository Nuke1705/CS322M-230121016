module seq_detect_mealy(
    input wire clk,
    input wire rst,
    input wire din,
    output wire y);

    reg [1:0] state_present, state_next;

    parameter init = 2'b00;
    parameter one = 2'b01;
    parameter two = 2'b10;
    parameter three = 2'b11;

    always @(posedge clk)
    begin
        if(rst) state_present <= init;
        else state_present <= state_next;
    end
    always @(*)
    begin
        case(state_present)
            init: begin
                if(din) state_next = one;
                else state_next = init;
            end
            one: begin
                if(din) state_next = two;
                else state_next = init;
            end
            two: begin
                if(din) state_next = two;
                else state_next = three;
            end
            three: begin
                if(din) state_next = one;
                else state_next = init;
            end
            default: state_next = init;
        endcase
    end
    assign y = (state_present == three)&&din;
endmodule