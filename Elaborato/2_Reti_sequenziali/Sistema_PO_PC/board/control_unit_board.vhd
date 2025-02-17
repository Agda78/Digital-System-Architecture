----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2025 06:40:15 PM
-- Design Name: 
-- Module Name: control_unit - Behavioral
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

entity control_unit_board is
  Port (
    -- Input Value
    clk : in std_logic;
    start : in std_logic;
    rst : in std_logic;
    
    -- Counter inputs
    max_reached : in std_logic;
    
    -- Ingressi per implementazione board
    read : in std_logic;
    
    -- Counter control
    enable : out std_logic;
    reset : out std_logic;
    
    -- PO controls
    read_s : out std_logic;
    read_m : out std_logic;
    write_m : out std_logic
  
  );
end control_unit_board;

architecture Behavioral of control_unit_board is

type stato is (idle, q1, q2, q3);
signal stato_corrente : stato := idle;

begin

process(clk, rst)
begin
if rst = '1' then
    stato_corrente <= idle;
    reset <= '1';
end if;
if rising_edge(clk) then
    case stato_corrente is
        when idle =>
            enable <= '0';
            reset <= '0';
            read_s <= '0';
            read_m <= '0';
            write_m <= '0';
            if start = '1' then
                stato_corrente <= q1;
            end if;
        when q1 =>
            enable <= '0';
            read_m <= '0';
            read_s <= '1';
            stato_corrente <= q2;    
        when q2 =>
            write_m <= '1';
            read_s <= '0';
            stato_corrente <= q3;
        when q3 =>
            write_m <= '0';
            if read = '1' then
                read_m <= '1';
                if max_reached = '1' then
                    stato_corrente <= idle;
                    reset <= '1';
                else
                    stato_corrente <= q1;
                    enable <= '1';
                end if;
            end if;
    end case;
end if;    
end process;

end Behavioral;
