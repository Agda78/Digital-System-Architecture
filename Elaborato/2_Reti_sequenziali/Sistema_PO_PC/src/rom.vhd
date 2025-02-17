----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2025 07:08:03 PM
-- Design Name: 
-- Module Name: rom - Behavioral
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

entity rom is
  Port (
    clk : in std_logic;
    ind : in std_logic_vector(3 downto 0);
    read : in std_logic;
    data : out std_logic_vector(7 downto 0)
  );
end rom;

architecture Behavioral of rom is

-- Definizione e scrittura del contenuto della rom
type rom_i is array(15 downto 0) of std_logic_vector(7 downto 0);
signal rom_imp : rom_i := (
    "00000000", 
    "11111111", 
    "10101010", 
    "01010101", 
    "00001111", 
    "11110000", 
    "10000001", 
    "01111110", 
    "00111100", 
    "11000011", 
    "00010000", 
    "00000001", 
    "10000000", 
    "01100010", 
    "10100101", 
    "11011011"  
);

signal output : std_logic_vector(7 downto 0);

begin
    with ind select
    output <= rom_imp(0) when "0000",
              rom_imp(1) when "0001",
              rom_imp(2) when "0010",
              rom_imp(3) when "0011",
              rom_imp(4) when "0100",
              rom_imp(5) when "0101",
              rom_imp(6) when "0110",
              rom_imp(7) when "0111",
              rom_imp(8) when "1000",
              rom_imp(9) when "1001",
              rom_imp(10) when "1010",
              rom_imp(11) when "1011",
              rom_imp(12) when "1100",
              rom_imp(13) when "1101",
              rom_imp(14) when "1110",
              rom_imp(15) when "1111",
              "00000000" when others;

process(clk)
begin
    if rising_edge(clk) then
        if read = '1' then
            data <= output;
        end if;
    end if;
end process;

end Behavioral;
