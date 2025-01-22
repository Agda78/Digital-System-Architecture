----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 08:24:07 PM
-- Design Name: 
-- Module Name: mux_16_board_simulation - Behavioral
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

entity mux_16_board_simulation is
  Port (
    X : in std_logic_vector(15 downto 0);
    Y : out std_logic_vector(3 downto 0)   
   );
end mux_16_board_simulation;

architecture Behavioral of mux_16_board_simulation is

component mux_16_1 port (
        ins : in std_logic_vector(15 downto 0);
        path : in std_logic_vector(3 downto 0);
        y_out : out std_logic
);
end component;

component converter port(
    input : in std_logic_vector(7 downto 0);
    out_1 : out std_logic_vector(15 downto 0)
);
end component;

signal con_mux : std_logic_vector(15 downto 0);
signal y_out_sig : std_logic;

begin
y <= "0000";
Y(0) <= y_out_sig;

con : converter port map(
    input => X(7 downto 0),
    out_1 => con_mux
);

mux : mux_16_1 port map(
    ins => con_mux,
    path => X(15 downto 12),
    y_out => y_out_sig
);



end Behavioral;
