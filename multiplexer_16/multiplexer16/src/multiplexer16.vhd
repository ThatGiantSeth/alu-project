library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplexer16 is
	Port(
	S : in std_logic_vector(2 downto 0);
    in0, in1, in2, in3, in4 : in signed(15 downto 0);
    R : out signed(15 downto 0)
	);
end multiplexer16;	 

architecture Structural of multiplexer16 is
  component multiplexer1
    Port (
      S : in std_logic_vector(2 downto 0);
      c0, c1, c2, c3, c4 : in std_logic;
      R : out std_logic
    );
  end component;

begin
  gen_mux: for i in 0 to 15 generate
    mux: multiplexer1
      port map (
        S => S,
        c0 => in0(i),
        c1 => in1(i),
        c2 => in2(i),
        c3 => in3(i),
        c4 => in4(i),
        R => R(i)
      );
  end generate;
end Structural;