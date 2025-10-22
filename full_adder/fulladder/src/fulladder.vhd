library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library halfadder;
use halfadder.halfadder;

entity fulladder is
	Port(
	a : in std_logic;
	b : in std_logic; 
	cin : in std_logic;
	sum : out std_logic;
	cout : out std_logic);
end fulladder;	 

architecture structural	of fulladder is	  

component halfadder is
	Port(
	A, B : in std_logic;
	R, Carry : out std_logic);
end component;		 

signal sum1, carry1, carry2 : std_logic;

begin
	u1 : halfadder port map (a,b,sum1,carry1);
	u2 : halfadder port map (sum1,cin,sum,carry2);
	cout <= carry1 OR carry2;
end structural;