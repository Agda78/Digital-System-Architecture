----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2025 04:42:51 PM
-- Design Name: 
-- Module Name: Memoria_MEM - Behavioral
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

entity Memoria_MEM is
port (
    -- Segnali di controllo
    clk : in std_logic;
    read : in std_logic;
    write : in std_logic;
    ind : in std_logic_vector(3 downto 0); -- Ciò implica il dover fare una memoria di al massimo 16 locazioni
    rst : in std_logic;
    -- Dati in input
    data_in : in std_logic_vector(3 downto 0);
    
    -- Dati in output
    data : out std_logic_vector(3 downto 0)
  );
end Memoria_MEM;

architecture Behavioral of Memoria_MEM is

type Mem is array (15 downto 0) of std_logic_vector(3 downto 0);
signal memoria : Mem := (others=>"0000");

begin

process(clk,rst)
begin
    if rst = '1' then
        data <= (others => '0');
    elsif rising_edge(clk) then
        if read = '1' then
            data <= memoria(to_integer(unsigned(ind)));
        end if;
        if write = '1' then
            memoria(to_integer(unsigned(ind))) <= data_in;
        end if;
    end if;
end process;

end Behavioral;
