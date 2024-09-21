library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;




entity sram_tb is
port();
end sram_tb;


architecture behavioral of sram_tb is 

component sram is 
port(
	i_we : in std_logic;
	i_en : in std_logic;
	i_oe : in std_logic;
	i_addres : in unsigned(7 downto 0);
	io_data : inout std_logic_vector(7 downto 0)
);
end component sram;

signal r_we  : std_logic := '1';
signal r_en  : std_logic := '1';
signal r_oe  : std_logic := '1';

signal r_address : unsigned(7 downto 0) := (others = >'0');
signal r_io_data : std_logic_vector(7 downto 0);


begin

uut : sram 
	port map(
 		i_we => r_we,
		i_en => r_en,
		i_oe => r_oe,
		i_addres => r_addres,
		io_data => r_data
	);


end behavioral;

