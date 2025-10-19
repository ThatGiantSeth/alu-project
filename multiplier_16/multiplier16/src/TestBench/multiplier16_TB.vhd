library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity multiplier16_tb is
end multiplier16_tb;

architecture TB_ARCHITECTURE of multiplier16_tb is
	-- Component declaration of the tested unit
	component multiplier16
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		Product : out STD_LOGIC_VECTOR(31 downto 0);
		Ovf : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Product : STD_LOGIC_VECTOR(31 downto 0);
	signal Ovf : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : multiplier16
		port map (
			A => A,
			B => B,
			Product => Product,
			Ovf => Ovf
		);

	-- Add your stimulus here ...
		stim_proc: process
begin	
    A <= ("1111111111101011"); 
    B <= ("0000000000001000"); 
    wait for 10 ns;	 
	
	
   wait;
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_multiplier16 of multiplier16_tb is
	for TB_ARCHITECTURE
		for UUT : multiplier16
			use entity work.multiplier16(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_multiplier16;

