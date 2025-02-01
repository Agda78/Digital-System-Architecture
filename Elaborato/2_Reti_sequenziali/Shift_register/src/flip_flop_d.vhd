----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2025 10:34:44 PM
-- Design Name: 
-- Module Name: flip_flop_d - Behavioral
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

entity flip_flop_d is
  Port (
    D : in std_logic;
    clk : in std_logic;
    y : out std_logic := '0'
  );
end flip_flop_d;

architecture Behavioral of flip_flop_d is

begin

process(clk)
begin
    if rising_edge(clk) then
        y <= D;
    end if;
end process;

end Behavioral;
