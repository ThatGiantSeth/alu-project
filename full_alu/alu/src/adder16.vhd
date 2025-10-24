library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Adder16 is
	Port(
	A	:	in signed(15 downto 0);
	B	:	in signed(15 downto 0);
	Cin	:	in std_logic;
	Sum	:	out signed(15 downto 0);
	Cout:	out std_logic;
	Overflow:	out std_logic
	);
end Adder16;

architecture structural of Adder16 is

signal carry	:	std_logic_vector(16 downto 0);
signal sum_int	:	signed(15 downto 0);
begin
	carry(0) <= Cin;
	
	create_FAs : for i in 0 to 15 generate
		FA: entity work.fulladder port map(A => A(i), B => B(i), Cin => carry(i), Sum => sum_int(i), Cout => carry(i+1));
	end generate;
	
	Sum <= sum_int;
	Cout <= carry(16);
	   
Overflow <= '1' when (A(15) = '0' and B(15) = '0' and sum_int(15) = '1') or (A(15) = '1' and B(15) = '1' and sum_int(15) = '0')
                else '0';

end structural;