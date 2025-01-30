----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2025 10:57:02 AM
-- Design Name: 
-- Module Name: dmux_1_4 - Behavioral
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

entity dmux_1_4 is
  Port (
    input : in std_logic;
    ind : in std_logic_vector(1 downto 0);
    output : out std_logic_vector(3 downto 0) 
  );
end dmux_1_4;

architecture Behavioral of dmux_1_4 is

begin
-- Per utilizzare il case ho bisogno di un process
-- dato che sto descrivendo una macchina combinatoria
-- inserisco tutti gli input nella sensitivity list
process(input,ind)
begin
-- Tramite il case descrivo il funzionamento della macchina
case ind is
    when "00" => output(0) <= input;
    when "01" => output(1) <= input;
    when "10" => output(2) <= input;
    when "11" => output(3) <= input;
end case;
end process;

end Behavioral;
