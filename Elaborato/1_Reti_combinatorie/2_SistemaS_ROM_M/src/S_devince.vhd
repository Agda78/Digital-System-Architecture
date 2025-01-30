----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2025 07:58:35 PM
-- Design Name: 
-- Module Name: S_devince - Behavioral
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

entity S_devince is
  Port (
    indirizzo : in std_logic_vector(3 downto 0);
    uscita : out std_logic_vector(3 downto 0)
  );
end S_devince;


architecture Behavioral of S_devince is

component rom port(
    ind : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(7 downto 0)
);
end component;

component M_device port(
    ins : in std_logic_vector(7 downto 0);
    outs : out std_logic_vector(3 downto 0)
);
end component;

-- Definizione del "bus" di collegamento
signal coll : std_logic_vector(7 downto 0);

begin

-- Dichiarazione e "cablaggio" del sistema
rom_i : rom port map(
    ind => indirizzo,
    output => coll
);

M_i : M_device port map(
    ins => coll,
    outs => uscita
);

end Behavioral;
