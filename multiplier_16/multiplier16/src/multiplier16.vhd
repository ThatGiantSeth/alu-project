library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplier16 is
	Port(
	A	:	in std_logic_vector(15 downto 0);
	B	:	in std_logic_vector(15 downto 0);
	Product:out std_logic_vector(31 downto 0)
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
		
		begin 
			temp_result := (others => '0');
			mcand := (others => '0');
			mcand(15 downto 0) := signed(A);
			mlt := signed(B);
			
			for i in 0 to 15 loop
				if mlt(i) = '1' then
					temp_result := temp_result + (mcand sll i);
				end if;
			end loop;
			
			result <= temp_result;
		end process;
		
		Product <= std_logic_vector(result);
	end behavioral;

