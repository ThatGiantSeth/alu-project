library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all; 

	-- Add your library and packages declaration here ...

entity multiplexer16_tb is
end multiplexer16_tb;

architecture TB_ARCHITECTURE of multiplexer16_tb is
	-- Component declaration of the tested unit
	component multiplexer16
	port(
		S : in STD_LOGIC_VECTOR(2 downto 0);
		in0 : in SIGNED(15 downto 0);
		in1 : in SIGNED(15 downto 0);
		in2 : in SIGNED(15 downto 0);
		in3 : in SIGNED(15 downto 0);
		in4 : in SIGNED(15 downto 0);
		R : out SIGNED(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal S : STD_LOGIC_VECTOR(2 downto 0);
	signal in0 : SIGNED(15 downto 0);
	signal in1 : SIGNED(15 downto 0);
	signal in2 : SIGNED(15 downto 0);
	signal in3 : SIGNED(15 downto 0);
	signal in4 : SIGNED(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal R : SIGNED(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : multiplexer16
		port map (
			S => S,
			in0 => in0,
			in1 => in1,
			in2 => in2,
			in3 => in3,
			in4 => in4,
			R => R
		);

	-- Add your stimulus here ...  
process
begin	
    in0 <= ("0000000000000000"); 
    in1 <= ("0000000000000001"); 
	in2 <= ("0000000000000010"); 	
	in3 <= ("0000000000000011"); 
	in4 <= ("0000000000000100"); 
	S <= "010";
    wait for 10 ns;	 
  	wait; 
end process;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_multiplexer16 of multiplexer16_tb is
	for TB_ARCHITECTURE
		for UUT : multiplexer16
			use entity work.multiplexer16(structural);
		end for;
	end for;
end TESTBENCH_FOR_multiplexer16;

