SetActiveLib -work
comp -include "$dsn\src\adder16.vhd" 
comp -include "$dsn\src\TestBench\adder16_TB.vhd" 
asim +access +r TESTBENCH_FOR_adder16 
wave 
wave -noreg A
wave -noreg B
wave -noreg Cin
wave -noreg Sum
wave -noreg Cout
wave -noreg Overflow
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\adder16_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_adder16 
