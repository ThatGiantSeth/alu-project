library IEEE;
use IEEE.STD_LOGIC_1164.All; 
library gatelib;
use gatelib.xorgate;
use gatelib.andgate;

entity halfadder is
	Port(
	A	:	in STD_logic;
	B	:	in STD_logic;
	R	:	out STD_logic;
	Carry	:	out STD_logic
	);
end halfadder;

architecture structural of halfadder is	  

component xorgate is
	Port(
	a, b : in std_logic;
	r : out std_logic);
end component; 

component andgate is
	Port(
	a, b : in std_logic;
	r : out std_logic);
end component; 	

begin
	u1 : xorgate port map (A => a, B => b, r => R);
	u2 : andgate port map (A => a, B => b, r => Carry);
end structural;
