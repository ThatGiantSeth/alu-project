library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity adder16_tb is
end adder16_tb;

architecture TB_ARCHITECTURE of adder16_tb is
	-- Component declaration of the tested unit
	component adder16
	port(
		A : in SIGNED(15 downto 0);
		B : in SIGNED(15 downto 0);
		Cin : in STD_LOGIC;
		Sum : out SIGNED(15 downto 0);
		Cout : out STD_LOGIC;
		Overflow : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : SIGNED(15 downto 0);
	signal B : SIGNED(15 downto 0);
	signal Cin : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Sum : SIGNED(15 downto 0);
	signal Cout : STD_LOGIC;
	signal Overflow : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : adder16
		port map (
			A => A,
			B => B,
			Cin => Cin,
			Sum => Sum,
			Cout => Cout,
			Overflow => Overflow
		);

	-- Add your stimulus here ...
			stim_proc: process
begin	
	--A <= to_signed(0,16);
	--B <= to_signed(0,16);
    A <= ("0100000000010101"); 
    B <= ("0111111111010100"); 
    Cin <= '0';
    wait for 10 ns;	 
	
	
   wait;
end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_adder16 of adder16_tb is
	for TB_ARCHITECTURE
		for UUT : adder16
			use entity work.adder16(structural);
		end for;
	end for;
end TESTBENCH_FOR_adder16;

