----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2025 08:08:29 PM
-- Design Name: 
-- Module Name: s_device_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity s_device_tb is
--  Port ( );
end s_device_tb;

architecture Behavioral of s_device_tb is

component S_device port(
    indirizzo : in std_logic_vector(3 downto 0);
    uscita : out std_logic_vector(3 downto 0)
);
end component;

signal ind : std_logic_vector(3 downto 0) := "0000";
signal y : std_logic_vector(3 downto 0);

begin

test : S_device port map(
    indirizzo => ind,
    uscita => y
);

process
begin
    for i in 0 to 3
    loop
        wait for 10ns;
        ind <= std_logic_vector(unsigned(ind) + 1);
    end loop;
wait;    
end process;

end Behavioral;
