library ieee;
use ieee.std_logic_1146.all;
use ieee.numeric_std.all;


entity uRego is 

end uRego;

architecture behavioral of uRego is 

signal 8b_bus : unsigned(7 downto 0) := (others => '0');


procedure ALU(
	accumulator  : in unsigned(7 downto 0);
	BReg	     : in unsigned(7 downto 0);
	signal 8b_bus     : out unsigned(7 downto 0) ) is
begin
	
end procedure ALU;
	


begin


end behavioral;







