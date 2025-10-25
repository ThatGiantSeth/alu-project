library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity subtractor16_tb is
end subtractor16_tb;

architecture TB_ARCHITECTURE of subtractor16_tb is
	-- Component declaration of the tested unit
	component subtractor16
	port(
		A : in SIGNED(15 downto 0);
		B : in SIGNED(15 downto 0);
		Diff : out SIGNED(15 downto 0);
		Cout : out STD_LOGIC;
		Overflow : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : SIGNED(15 downto 0);
	signal B : SIGNED(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Diff : SIGNED(15 downto 0);
	signal Cout : STD_LOGIC;
	signal Overflow : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : subtractor16
		port map (
			A => A,
			B => B,
			Diff => Diff,
			Cout => Cout,
			Overflow => Overflow
		);

	-- Add your stimulus here ...
	stim_proc: process
begin  
--subtracting 16 and 8	
		--A <= "0000000000010000"; 
    	--B <= "0000000000001000";
		--wait for 10 ns; 
--subtracting 8 and 16 to test for signed subtraction	
		--A <= "0000000000001000"; 
    	--B <= "0000000000010000";
		--wait for 10 ns;
--subtracting -1 and -2
		--A <= "1111111111111111"; 
    	--B <= "1111111111111110";
		--wait for 10 ns;
--subtracting 32,000 and -10,000 to test for overflow condition
    	A <= "0111110100000000"; 
    	B <= "1101101110000000"; 
    	wait for 10 ns;	 
		
    wait;

end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_subtractor16 of subtractor16_tb is
	for TB_ARCHITECTURE
		for UUT : subtractor16
			use entity work.subtractor16(structural);
		end for;
	end for;
end TESTBENCH_FOR_subtractor16;

