SetActiveLib -work
comp -include "$dsn\src\multiplexer16.vhd" 
comp -include "$dsn\src\TestBench\multiplexer16_TB.vhd" 
asim +access +r TESTBENCH_FOR_multiplexer16 
wave 
wave -noreg S
wave -noreg in0
wave -noreg in1
wave -noreg in2
wave -noreg in3
wave -noreg in4
wave -noreg R
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\multiplexer16_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_multiplexer16 
