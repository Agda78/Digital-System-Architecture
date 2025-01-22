----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 08:37:07 PM
-- Design Name: 
-- Module Name: Converter - Behavioral
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

entity Converter is
  Port (
    input : in std_logic_vector(7 downto 0);
    out_1 : out std_logic_vector(15 downto 0)
);    
end Converter;

architecture Behavioral of Converter is

begin
    out_1(0) <= input(0);
    out_1(1) <= input(0);
    out_1(2) <= input(1);
    out_1(3) <= input(1);
    out_1(4) <= input(2);
    out_1(5) <= input(2);
    out_1(6) <= input(3);
    out_1(7) <= input(3);
    out_1(8) <= input(4);
    out_1(9) <= input(4);
    out_1(10) <= input(5);
    out_1(11) <= input(5);
    out_1(12) <= input(6);
    out_1(13) <= input(6);
    out_1(14) <= input(7);
    out_1(15) <= input(7);
end Behavioral;
