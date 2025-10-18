library IEEE;
use IEEE.std_logic_1164.all;

entity subtractor16 is
	Port(
	A	:	in std_logic_vector(15 downto 0);
	B	:	in std_logic_vector(15 downto 0);
	Diff:	out std_logic_vector(15 downto 0);
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

signal Binv		:	std_logic_vector(15 downto 0);
signal carry	:	std_logic_vector(16 downto 0);
begin  			
	--invert B
	Binv <= not B;	
	--for twos complement
	carry(0) <= '1';
	
	FA0:	fulladder port map(A => A(0), B => Binv(0), Cin => carry(0), Sum => Diff(0), Cout => carry(1));
	FA1:	fulladder port map(A => A(1), B => Binv(1), Cin => carry(1), Sum => Diff(1), Cout => carry(2));
	FA2:	fulladder port map(A => A(2), B => Binv(2), Cin => carry(2), Sum => Diff(2), Cout => carry(3));
	FA3:	fulladder port map(A => A(3), B => Binv(3), Cin => carry(3), Sum => Diff(3), Cout => carry(4));
	FA4:	fulladder port map(A => A(4), B => Binv(4), Cin => carry(4), Sum => Diff(4), Cout => carry(5));
	FA5:	fulladder port map(A => A(5), B => Binv(5), Cin => carry(5), Sum => Diff(5), Cout => carry(6));
	FA6:	fulladder port map(A => A(6), B => Binv(6), Cin => carry(6), Sum => Diff(6), Cout => carry(7));
	FA7:	fulladder port map(A => A(7), B => Binv(7), Cin => carry(7), Sum => Diff(7), Cout => carry(8));
	FA8:	fulladder port map(A => A(8), B => Binv(8), Cin => carry(8), Sum => Diff(8), Cout => carry(9));
	FA9:	fulladder port map(A => A(9), B => Binv(9), Cin => carry(9), Sum => Diff(9), Cout => carry(10));
	FA10:	fulladder port map(A => A(10), B => Binv(10), Cin => carry(10), Sum => Diff(10), Cout => carry(11));
	FA11:	fulladder port map(A => A(11), B => Binv(11), Cin => carry(11), Sum => Diff(11), Cout => carry(12));
	FA12:	fulladder port map(A => A(12), B => Binv(12), Cin => carry(12), Sum => Diff(12), Cout => carry(13));
	FA13:	fulladder port map(A => A(13), B => Binv(13), Cin => carry(13), Sum => Diff(13), Cout => carry(14));	
	FA14:	fulladder port map(A => A(14), B => Binv(14), Cin => carry(14), Sum => Diff(14), Cout => carry(15));
	FA15:	fulladder port map(A => A(15), B => Binv(15), Cin => carry(15), Sum => Diff(15), Cout => carry(16));   
	
	Cout <= carry(16);
	
end structural;