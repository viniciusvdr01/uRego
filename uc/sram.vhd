library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--- Mem truth table
--- _     _    _ 
--- EN    OE   WE  |   Mode             |   i/o data
--- 1     x    x   |   not selected     |   High z
--- 0     1    1   |   output disabled  |   High z
--- 0     0    1   |   read             |   Output
--- 0     1    0   |   write            |   Input  

-- Write operation will occur on falling edge of WE when OE is 1 and En is 0.

entity sram is 
port(
	i_we          : in std_logic;   -- Write Enable 
	i_en          : in std_logic;   -- Enable 
 	i_oe          : in std_logic;   -- Output Enable
	i_address     : in unsigned(7 downto 0);
        io_data       : inout std_logic_vector(7 downto 0)
);
end sram;

architecture behavioral of sram is 

type sram_t is array(0 to 255) of unsigned(7 downto 0);

-- Initialize memory array with 0xFF in all positions.
signal mem_array : sram_t := (others => (others =>'1'));

begin

	io_data <= (others => 'Z') when (i_en = '1') or (i_we and i_oe) = '1' 
	           else std_logic_vector(mem_array(to_integer(i_address)));

      write:process(i_we,i_en)
	begin
		if falling_edge(i_we) and i_en = '0' then
			mem_array(to_integer(i_address)) <= unsigned(io_data);
		end if;
	end process write;
	
end behavioral;
