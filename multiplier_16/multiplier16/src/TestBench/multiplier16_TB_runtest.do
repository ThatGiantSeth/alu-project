SetActiveLib -work
comp -include "$dsn\src\multiplier16.vhd" 
comp -include "$dsn\src\TestBench\multiplier16_TB.vhd" 
asim +access +r TESTBENCH_FOR_multiplier16 
wave 
wave -noreg A
wave -noreg B
wave -noreg Product
wave -noreg Ovf
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\multiplier16_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_multiplier16 
