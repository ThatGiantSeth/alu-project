library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity halfadder_tb is
end halfadder_tb;

architecture TB_ARCHITECTURE of halfadder_tb is
	-- Component declaration of the tested unit
	component halfadder
	port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		R : out STD_LOGIC;
		Carry : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC;
	signal B : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal R : STD_LOGIC;
	signal Carry : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : halfadder
		port map (
			A => A,
			B => B,
			R => R,
			Carry => Carry
		);

	-- Add your stimulus here ...
	--Each of the possible testcases for the halfadder
	process
	begin	  
		A <= '0';
		B <= '0';
		wait for 20ns;	
		A <= '0';
		B <= '1';
		wait for 20ns;
		A <= '1';
		B <= '0';
		wait for 20ns;
		A <= '1';
		B <= '1';
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_halfadder of halfadder_tb is
	for TB_ARCHITECTURE
		for UUT : halfadder
			use entity work.halfadder(structural);
		end for;
	end for;
end TESTBENCH_FOR_halfadder;

