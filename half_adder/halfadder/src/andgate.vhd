library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity andgate is
	Port(
	a	:	in std_logic;
	b	:	in std_logic;
	z	: 	out std_logic
	);
end andgate;

architecture behavioral of andgate is
begin
	z <= a and b;
end behavioral;