# Traffic light controller using FSM

FSM is designed by factoring it into two separate FSMs, one for controlling the lights and one for controling the direction. The FSM has the structure: NS_G (5 ticks) → NS_Y (2ticks) → EW_G (5 ticks) → EW_Y (2 ticks) → repeat.
Here ticks represent a 1Hz pulse which was implemented by turning on/ setting the tick value to high after 1 second and turning it off after one clock cycle, thus giving us a short pulse as required.
This is implemented using,
initial begin
    tick = 0;
end
always begin
    #1_000 tick = 1;
    #10 tick = 0;
end
in the testbench file

#Viewing the waveform
(The design has been simulated for 20 seconds with a 100Hz clock)
to view the waveform run the test.vcd file using the following command from the file directory in the terminal, "gtkwave test.vcd"
