----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2025 05:55:43 PM
-- Design Name: 
-- Module Name: clock_manager_tb - Behavioral
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

entity clock_manager_tb is
--  Port ( );
end clock_manager_tb;

architecture Behavioral of clock_manager_tb is

component clock_manager
  generic(
    F_in : positive := 100_000_000;
    F_out : positive := 1
  );
  Port (
    clk : in std_logic;
    rst : in std_logic;
    clk_out : out std_logic
  );
end component;

signal clock : std_logic;
signal clock_out : std_logic;
signal reset : std_logic;

constant F_in_s : positive := 100_000_000;
constant F_out_s : positive := 1;

begin
dut : clock_manager 
generic map(
    F_in => F_in_s,
    F_out => F_out_s
)
port map(
    clk => clock,
    rst => reset,
    clk_out => clock_out
);

process
begin
    while true
    loop
        clock <= '1';
        wait for 5ns;
        clock <= '0';
        wait for 5ns;
    end loop;
end process;

end Behavioral;
