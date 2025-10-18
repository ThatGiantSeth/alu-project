library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity adder16_tb is
end adder16_tb;

architecture TB_ARCHITECTURE of adder16_tb is
	-- Component declaration of the tested unit
	component adder16
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		Cin : in STD_LOGIC;
		Sum : out STD_LOGIC_VECTOR(15 downto 0);
		Cout : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	signal Cin : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Sum : STD_LOGIC_VECTOR(15 downto 0);
	signal Cout : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : adder16
		port map (
			A => A,
			B => B,
			Cin => Cin,
			Sum => Sum,
			Cout => Cout
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_adder16 of adder16_tb is
	for TB_ARCHITECTURE
		for UUT : adder16
			use entity work.adder16(stuctural);
		end for;
	end for;
end TESTBENCH_FOR_adder16;

