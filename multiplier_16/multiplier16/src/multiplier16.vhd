library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplier16 is
	Port(
	A	:	in std_logic_vector(15 downto 0);
	B	:	in std_logic_vector(15 downto 0);
	Product:out std_logic_vector(31 downto 0);
	Ovf	: out std_logic
	);
end multiplier16;

architecture behavioral of multiplier16 is
	signal multiplicand	:	signed(15 downto 0);
	signal multiplier	:	signed(15 downto 0);
	signal result		:	signed(31 downto 0); 	
	
	begin
		process(A,B)
		variable temp_result	:	signed(31 downto 0);
		variable mcand			:	signed(31 downto 0);
		variable mlt			:	signed(15 downto 0); 
		variable sign			: 	std_logic;	 
		variable sign_extend	:	signed(15 downto 0);
		
		begin 
			temp_result := (others => '0');
			mcand := resize(signed(A), 32);
			mlt := signed(B);
			sign := mcand(15) xor mlt(15);
			
			for i in 0 to 15 loop
				if mlt(i) = '1' then
					temp_result := temp_result + (mcand sll i);
				end if;
			end loop;  
			
			result <= temp_result;	
			
			sign_extend := (others => temp_result(15));	 
			if temp_result(31 downto 16) /= sign_extend then
				Ovf <= '1';
			else
				Ovf <= '0';
			end if;

		end process;
		
		Product <= std_logic_vector(result);
	end behavioral;

