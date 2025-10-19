library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity halfadder is
	Port(
	a	:	in STD_logic;
	b	:	in STD_logic;
	sum	:	out STD_logic;
	carry	:	out STD_logic
	);
end halfadder;

architecture structural of halfadder is
begin
	sum <= a xor b;
	carry <= a and b;
end structural;