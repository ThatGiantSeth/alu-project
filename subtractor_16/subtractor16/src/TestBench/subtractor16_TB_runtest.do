SetActiveLib -work
comp -include "$dsn\src\halfadder.vhd" 
comp -include "$dsn\src\fulladder.vhd" 
comp -include "$dsn\src\subtractor16.vhd" 
comp -include "$dsn\src\TestBench\subtractor16_TB.vhd" 
asim +access +r TESTBENCH_FOR_subtractor16 
wave 
wave -noreg A
wave -noreg B
wave -noreg Diff
wave -noreg Cout
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\subtractor16_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_subtractor16 
