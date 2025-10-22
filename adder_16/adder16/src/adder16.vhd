library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library fulladder;
use fulladder.fulladder;

entity Adder16 is
	Port(
	A	:	in signed(15 downto 0);
	B	:	in signed(15 downto 0);
	Cin	:	in std_logic;
	Sum	:	out signed(15 downto 0);
	Cout:	out std_logic
	);
end Adder16;

architecture structural of Adder16 is
component fulladder is
	Port(
	A	:	in std_logic;
	B	:	in std_logic;
	Cin	:	in std_logic;
	Sum :	out std_logic;
	Cout:	out std_logic
	);
end component;

signal carry	:	std_logic_vector(16 downto 0);
begin
	carry(0) <= Cin;
	
	create_FAs : for i in 0 to 15 generate
		FA: fulladder port map(A => A(i), B => B(i), Cin => carry(i), Sum => Sum(i), Cout => carry(i+1));
	end generate;
	
	Cout <= carry(16); 
	
end structural;