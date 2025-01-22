----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 10:51:29 PM
-- Design Name: 
-- Module Name: mux_16_tb - Behavioral
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
    ch : in std_logic_vector(3 downto 0);
    Y : out std_logic  
   );
end mux_16_board_simulation;

architecture Behavioral of mux_16_board_simulation is

component mux_16_1 port (
        ins : in std_logic_vector(15 downto 0);
        path : in std_logic_vector(3 downto 0);
        y_out : out std_logic
);
end component;


begin

mux : mux_16_1 port map(
    ins => X,
    path => ch,
    y_out => Y
);

end Behavioral;