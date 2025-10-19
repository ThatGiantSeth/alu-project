library IEEE;
use IEEE.std_logic_1164.all;

entity multiplier16 is
	Port(
	A	:	in std_logic_vector(15 downto 0);
	B	:	in std_logic_vector(15 downto 0);
	Product:in std_logic_vector(31 downto 0)
	);
end multiplier16;

architecture structural of multiplier16 is
component fulladder
	Port(
	A	:	in std_logic;
	B	:	in std_logic;
	Cin	:	in std_logic;
	Sum	:	out std_logic;
	Cout:	out std_logic
	);
end component;

