----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2025 05:46:20 PM
-- Design Name: 
-- Module Name: clock_manager - Behavioral
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

entity clock_manager is
  generic(
    F_in : positive := 100_000_000;
    F_out : positive := 1
  );
  Port (
    clk : in std_logic;
    rst : in std_logic;
    clk_out : out std_logic
  );
end clock_manager;

architecture Behavioral of clock_manager is

constant times : positive := (F_in/F_out/2) - 1;
signal counter : integer := 0;
signal clock_out : std_logic := '1';

begin

process(clk)
begin
if rising_edge(clk) then
    if rst = '0' then
        counter <= 0;
        clock_out <= '0';
    else
        if counter = times then
            clock_out <= not(clock_out);
            counter <= 0;
        else
            counter <= counter + 1;
        end if;
    end if;
    
end if;
end process;

clk_out <= clock_out;
end Behavioral;
