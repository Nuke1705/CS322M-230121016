# Sequence detector FSM (Mealy machine) 
The fsm detects the sequence '1101' with overlap in a given input datastream

module inputs:
clk - clock
din - input data
rst - reset
y - output pulse

## Input sequences tested (Input sequence is given via din by clock cycle)

Sequence 1: '1101'
Output: output(y) pulse at index '3'

Sequence 2: '110110100'
Output: output(y) pulse at indices '3' and '6'

## Viewing the waveform
To view the output waveforms, run the .vcd file using gtk wave via the terminal using the command: gtkwave <file_name>.vcd
