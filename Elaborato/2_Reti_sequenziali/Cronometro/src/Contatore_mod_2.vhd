----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2025 05:00:21 PM
-- Design Name: 
-- Module Name: Contatore_mod_2 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Contatore_mod_2 is
    Generic(
        N : positive := 6
    );
    Port (
        clk : in std_logic;
        rst : in std_logic;
        set : in std_logic;
        value_in : in std_logic_vector(N-1 downto 0);
        max : out std_logic;
        value : out std_logic_vector(N-1 downto 0)
    );
end Contatore_mod_2;

architecture Behavioral of Contatore_mod_2 is
constant max_value : std_logic_vector(N-1 downto 0) := (others =>'1');
signal registro : std_logic_vector(N-1 downto 0) := (others => '0');

begin

process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            registro <= (others => '0');
            max <= '0';
        else
            if set = '1' then
                registro <= value_in;
            else
                if registro = max_value then
                    max <= '1';
                    registro <= (others => '0');
                else
                    registro <= std_logic_vector(unsigned(registro) + 1);
                    max <= '0';
                end if;
            end if;
        end if;
    
    end if;
end process;

value <= registro;

end Behavioral;
