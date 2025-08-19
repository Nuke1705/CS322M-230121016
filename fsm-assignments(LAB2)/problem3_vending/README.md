# Vending Machine controller using FSM (Mealy)
The FSM accepts coins of values only 5 and 10 an dispenses when the total value entered (one after the other) is greater than 20 and returns change (chg5) when the total is 25.
A mealy type FSM has been used as the output of the fsm depends on the input given as well as the current state. For example, if the current state represents a total of 15, if the new coin is of value 5, the total is now 20 and dispense output is high but change out put is low, but if the input is 10, now the total is 25 and both dispense and change output will be high.

## Inputs tested
The inputs tested is "5,5,10", "5,10,10" , "10,5,5" each input separated by the idle term "00".
There the input given is "010110_00_011010_00_100101".

## Viewing the waveform
To view the wave form run the vending.vcd file on the terminal using the command "gtkwave vending.vcd".
