library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity alu is
	Port (
	Clk		: in std_logic;
	A, B 	: in signed(15 downto 0);
	Op		: in std_logic_vector(2 downto 0);
	Result	: out signed(15 downto 0)
	);
end alu;

architecture structural of alu is 	

signal sum, diff, prod16, Binv, res	: signed(15 downto 0);	
signal prod32				: signed(31 downto 0);
signal coutA, coutS, over				: std_logic; --over is a temp variable (need to figure out overflow)
signal passA, passB		: signed(15 downto 0);

begin 	   
	create_adder: entity work.adder16 port map (A => A, B => B, Cin => '0', Sum => sum, Cout => coutA);
	create_subtractor: entity work.subtractor16 port map (A => A, B => B, Diff => diff, Cout => coutS);
	create_multiplier: entity work.multiplier16 port map (A => A, B => B, Product => prod32, Ovf => over);  
	prod16 <= prod32(15 downto 0);
	passA <= A;
	passB <= B;
	
	create_mux: entity work.multiplexer16 port map (
	S => Op, 
	in0 => sum, 
	in1 => diff, 
	in2 => prod16, 
	in3 => passA, 
	in4 => passB, 
	R => res
	); 
	process(Clk)
	begin
		if rising_edge(Clk) then
			Result <= res; 
		end if;
	end process;

	
end structural;
