library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;

entity subtractor16 is
	Port(
	A	:	in signed(15 downto 0);
	B	:	in signed(15 downto 0);
	Diff:	out signed(15 downto 0);
	Cout:	out std_logic
	);
end subtractor16;

architecture structural of subtractor16 is
component fulladder is
	Port(
	A	:	in std_logic;
	B	:	in std_logic;
	Cin	:	in std_logic;
	Sum :	out std_logic;
	Cout:	out std_logic
	);
end component; 

component notgate
	Port ( a : in std_logic; r : out std_logic );
end component;

signal Binv		:	signed(15 downto 0);
signal carry	:	std_logic_vector(16 downto 0);
begin  			
	--invert B	 
	create_notB: for i in 0 to 15 generate
		notB: notgate port map (a => B(i), r => Binv(i));	 
	end generate;
	--for twos complement
	carry(0) <= '1';

	
	create_FAs : for i in 0 to 15 generate
		FA:	fulladder port map(A => A(i), B => Binv(i), Cin => carry(i), Sum => Diff(i), Cout => carry(i+1));
	end generate;
	
	Cout <= carry(16);
	
end structural;