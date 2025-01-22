----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 06:39:41 PM
-- Design Name: 
-- Module Name: tb_mux_4_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_mux_4_1 is
--  Port ( );
end tb_mux_4_1;

architecture Behavioral of tb_mux_4_1 is

component mux_4_1 Port(
    a : in std_logic_vector(3 downto 0);
    s : in std_logic_vector(1 downto 0);
    y : out std_logic
);
end component;

signal a : std_logic_vector(3 downto 0);
signal s : std_logic_vector(1 downto 0);
signal y : std_logic;


begin
test : mux_4_1 port map(
    a => a,
    s => s,
    y => y
);

process
begin
    a <= "0000";
    s <= "00";
    wait for 10ns;
    
    a <= "0001";
    wait for 10ns;
    
    s <= "01";
    
    wait for 10ns;
    
    a <= "0010";
    
    wait for 10ns;
    
    s <= "10";
    wait for 10ns;
    
    a <= "0100";
    wait for 10ns;
    
    s <= "11";
    wait for 10ns;
    
    a <= "1000";
    wait;
    
end process;

end Behavioral;
