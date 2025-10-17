library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity HalfAdder is
	Port(
	A	:	in STD_logic;
	B	:	in STD_logic;
	R	:	out STD_logic;
	Carry	:	out STD_logic
	);
end HalfAdder;

architecture Adder of HalfAdder is
begin
	R <= A xor B;
	Carry <= A and B;
end Adder;
