library IEEE;
use IEEE.std_logic_1164.all;

entity Adder16 is
	Port(
	A	:	in std_logic_vector(15 downto 0);
	B	:	in std_logic_vector(15 downto 0);
	Cin	:	in std_logic;
	Sum	:	out std_logic_vector(15 downto 0);
	Cout:	out std_logic
	);
end Adder16;

architecture stuctural of Adder16 is
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
	
	FA0:	fulladder port map(A => A(0), B => B(0), Cin => carry(0), Sum => Sum(0), Cout => carry(1));
	FA1:	fulladder port map(A => A(1), B => B(1), Cin => carry(1), Sum => Sum(1), Cout => carry(2));
	FA2:	fulladder port map(A => A(2), B => B(2), Cin => carry(2), Sum => Sum(2), Cout => carry(3));
	FA3:	fulladder port map(A => A(3), B => B(3), Cin => carry(3), Sum => Sum(3), Cout => carry(4));
	FA4:	fulladder port map(A => A(4), B => B(4), Cin => carry(4), Sum => Sum(4), Cout => carry(5));
	FA5:	fulladder port map(A => A(5), B => B(5), Cin => carry(5), Sum => Sum(5), Cout => carry(6));
	FA6:	fulladder port map(A => A(6), B => B(6), Cin => carry(6), Sum => Sum(6), Cout => carry(7));
	FA7:	fulladder port map(A => A(7), B => B(7), Cin => carry(7), Sum => Sum(7), Cout => carry(8));
	FA8:	fulladder port map(A => A(8), B => B(8), Cin => carry(8), Sum => Sum(8), Cout => carry(9));
	FA9:	fulladder port map(A => A(9), B => B(9), Cin => carry(9), Sum => Sum(9), Cout => carry(10));
	FA10:	fulladder port map(A => A(10), B => B(10), Cin => carry(10), Sum => Sum(10), Cout => carry(11));
	FA11:	fulladder port map(A => A(11), B => B(11), Cin => carry(11), Sum => Sum(11), Cout => carry(12));
	FA12:	fulladder port map(A => A(12), B => B(12), Cin => carry(12), Sum => Sum(12), Cout => carry(13));
	FA13:	fulladder port map(A => A(13), B => B(13), Cin => carry(13), Sum => Sum(13), Cout => carry(14));	
	FA14:	fulladder port map(A => A(14), B => B(14), Cin => carry(14), Sum => Sum(14), Cout => carry(15));
	FA15:	fulladder port map(A => A(15), B => B(15), Cin => carry(15), Sum => Sum(15), Cout => carry(16));   
	
	Cout <= carry(16);
	
end stuctural;