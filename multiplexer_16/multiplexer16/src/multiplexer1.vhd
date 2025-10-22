library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 
library gatelib;
use gatelib.all;

entity multiplexer1 is
	Port(
	c0,c1,c2,c3,c4	:	in std_logic;
	S	:	in std_logic_vector(2 downto 0);
	R	:	out std_logic
	);
end multiplexer1;  

architecture structural of multiplexer1 is	 
	component andgate
	Port ( a, b : in std_logic; r : out std_logic );
	end component;
	
	component and3gate
	Port ( a, b, c : in std_logic; r : out std_logic );
	end component;
	
	component or5gate
	Port ( a, b, c, d, e : in std_logic; r : out std_logic );
	end component;
	
	component notgate
	Port ( a : in std_logic; r : out std_logic );
	end component;
	
	signal nsel0, nsel1, nsel2 : std_logic;
	signal sel0, sel1, sel2, sel3, sel4 : std_logic;
	signal out0, out1, out2, out3, out4 : std_logic;
	signal o1, o2, o3, o4 : std_logic;

begin
	notS0: notgate port map (a => S(0), r => nsel0);
	notS1: notgate port map (a => S(1), r => nsel1);
	notS2: notgate port map (a => S(2), r => nsel2);
	
	andS0: and3gate port map (a => nsel2, b => nsel1, c => nsel0, r => sel0); --S:000
	andS1: and3gate port map (a => nsel2, b => nsel1, c => S(0), r => sel1);  --S:001
	andS2: and3gate port map (a => nsel2, b => S(1), c => nsel0, r => sel2);  --S:010
	andS3: and3gate port map (a => nsel2, b => S(1), c => S(0), r => sel3);	  --S:011
	andS4: and3gate port map (a => S(2), b => nsel1, c => nsel0, r => sel4);  --S:100  
	
	
	outS0: andgate port map (a => c0, b => sel0, r => out0); --select 0 with input 0
	outS1: andgate port map (a => c1, b => sel1, r => out1); --select 1 with input 1
	outS2: andgate port map (a => c2, b => sel2, r => out2); --select 2 with input 2
	outS3: andgate port map (a => c3, b => sel3, r => out3); --select 3 with input 3
	outS4: andgate port map (a => c4, b => sel4, r => out4); --select 4 with input 4
	
	bigOr: or5gate port map (a => out0, b => out1, c => out2, d => out3, e => out4, r => r);

end structural;