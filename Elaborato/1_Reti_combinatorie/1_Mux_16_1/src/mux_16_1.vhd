----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 06:57:05 PM
-- Design Name: 
-- Module Name: mux_16_1 - Behavioral
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

entity mux_16_1 is
  Port (ins : in std_logic_vector(15 downto 0);
        path : in std_logic_vector(3 downto 0);
        y_out : out std_logic
        );
end mux_16_1;

architecture Behavioral of mux_16_1 is

component mux_4_1 port(
    a : in std_logic_vector(3 downto 0);
    s_4 : in std_logic_vector(1 downto 0);
    y : out std_logic
);
end component;

signal a_in : std_logic_vector(3 downto 0);

begin

-- Dichiarazione dei primi 4 mux (componenti il primo layer)
mux_1 : mux_4_1 port map(
    a => ins(3 downto 0),
    s_4 => path(1 downto 0),
    y => a_in(0)
);

mux_2 : mux_4_1 port map(
    a => ins(7 downto 4),
    s_4 => path(1 downto 0),
    y => a_in(1)
);

mux_3 : mux_4_1 port map(
    a => ins(11 downto 8),
    s_4 => path(1 downto 0),
    y => a_in(2)
);

mux_4 : mux_4_1 port map(
    a => ins(15 downto 12),
    s_4 => path(1 downto 0),
    y => a_in(3)
);

-- Dichiarazione e collegamento del mux finale
mux_5 : mux_4_1 port map(
    a => a_in,
    s_4 => path(3 downto 2),
    y => y_out
);
end Behavioral;
