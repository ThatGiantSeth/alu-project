library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity fulladder_tb is
end fulladder_tb;

architecture TB_ARCHITECTURE of fulladder_tb is
	-- Component declaration of the tested unit
	component fulladder
	port(
		a : in STD_LOGIC;
		b : in STD_LOGIC;
		cin : in STD_LOGIC;
		sum : out STD_LOGIC;
		cout : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC;
	signal b : STD_LOGIC;
	signal cin : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal sum : STD_LOGIC;
	signal cout : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : fulladder
		port map (
			a => a,
			b => b,
			cin => cin,
			sum => sum,
			cout => cout
		);

	-- Add your stimulus here ...	
	process
	begin 
		a <= '0';
		b <= '0';
		cin <= '0';
		wait for 40ns;	 
		a <= '0';
		b <= '0';
		cin <= '1';
		wait for 40ns;
		a <= '0';
		b <= '1';
		cin <= '0';
		wait for 40ns;
		a <= '0';
		b <= '1';
		cin <= '1';
		wait for 40ns;	 
		a <= '1';
		b <= '0';
		cin <= '0';
		wait for 40ns;
		a <= '1';
		b <= '0';
		cin <= '1';
		wait for 40ns; 
		a <= '1';
		b <= '1';
		cin <= '0';
		wait for 40ns; 
		a <= '1';
		b <= '1';
		cin <= '1';
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fulladder of fulladder_tb is
	for TB_ARCHITECTURE
		for UUT : fulladder
			use entity work.fulladder(structural);
		end for;
	end for;
end TESTBENCH_FOR_fulladder;

