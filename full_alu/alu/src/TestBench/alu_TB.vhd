library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		A : in SIGNED(15 downto 0);
		B : in SIGNED(15 downto 0);
		Op : in STD_LOGIC_VECTOR(2 downto 0);
		Result : out SIGNED(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : SIGNED(15 downto 0);
	signal B : SIGNED(15 downto 0);
	signal Op : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Result : SIGNED(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			A => A,
			B => B,
			Op => Op,
			Result => Result
		);

	-- Add your stimulus here ...
		stim_proc: process
begin	
    A <= ("0000000000000111"); 
    B <= ("0000000000000100"); 
	Op <= "001";
	
	
   wait;
end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(structural);
		end for;
	end for;
end TESTBENCH_FOR_alu;

