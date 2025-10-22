library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
library adder16;
use adder16.adder16;

library subtractor16;
use subtractor16.subtractor16;

library multiplier16;
use multiplier16.multiplier16; 

library multiplexer16;
use multiplexer16.multiplexer16;

entity alu is
	Port (
	A, B 	: in signed(15 downto 0);
	Op		: in std_logic_vector(2 downto 0);
	Result	: out signed(15 downto 0)
	);
end alu;

architecture structural of alu is 	

signal sum, diff, prod, Binv	: signed(15 downto 0);	
signal cout, over				: std_logic; --over is a temp variable (need to figure out overflow)
signal passA, passB		: signed(15 downto 0);

component adder16 is
	Port(
	A	:	in signed(15 downto 0);
	B	:	in signed(15 downto 0);
	Cin	:	in std_logic;
	Sum:	out signed(15 downto 0);
	Cout:	out std_logic
	);
end component;

component multiplier16 is
	Port(
	A	:	in std_logic_vector(15 downto 0);
	B	:	in std_logic_vector(15 downto 0);
	Product:out std_logic_vector(31 downto 0);
	Ovf	: out std_logic
	);
end component;

component multiplexer16 is
	Port(
	S : in std_logic_vector(2 downto 0);
    in0, in1, in2, in3, in4 : in signed(15 downto 0);
    R : out signed(15 downto 0)
	);
end component;

component notgate is
  Port ( a : in std_logic;
         r : out std_logic );
end component;

begin 
	invertB : for i in 0 to 15 generate
		bnot : notgate port map (a => B(i), r => Binv(i));
	end generate;
	
	create_adder: adder16 port map (A => A, B => B, Cin => '0', Sum => sum, Cout => cout);
	create_subtractor: adder16 port map (A => A, B => Binv, Cin => '1', Sum => sum, Cout => cout);
	create_multiplier: multiplier16 port map (A => A, B => B, Product(15 downto 0) => prod, Ovf => over);
	passA <= A;
	passB <= B;
	
	
end structural;
