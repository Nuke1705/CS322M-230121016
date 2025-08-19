module seq_detect_mealy(
    input wire clk,
    input wire rst,
    input wire din,
    output wire y);

    reg [1:0] state_present, state_next;
    reg store; // to store output for one cycle

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

    always @(posedge clk) begin
    if (rst) begin
        store <= 1'b0;
    end else begin
        store <= 1'b0;

        if ((state_present == three)&&din) store <= 1'b1;
    end
end
    assign y = store;

endmodule
