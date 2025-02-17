----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2025 07:56:11 PM
-- Design Name: 
-- Module Name: M_device - Behavioral
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

entity M_device is
  Port (
    ins : in std_logic_vector(7 downto 0);
    outs : out std_logic_vector(3 downto 0)
  );
end M_device;

architecture Behavioral of M_device is

begin
    outs(0) <= ins(0) xor ins(1);
    outs(1) <= ins(2) xor ins(3);
    outs(2) <= ins(4) xor ins(5);
    outs(3) <= ins(6) xor ins(7);
end Behavioral;
