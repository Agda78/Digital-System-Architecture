----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/26/2025 01:13:39 PM
-- Design Name: 
-- Module Name: riconoscitore_sequenza - Behavioral
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

entity riconoscitore_sequenza is
  Port (
    input : in std_logic;
    mode : in std_logic;
    A : in std_logic;
    y : out std_logic
  );
end riconoscitore_sequenza;

architecture Behavioral of riconoscitore_sequenza is

type stato is (q0, q1, q2, q3, q4, q5, p0, p1, p2, p3, idle);
signal stato_corrente : stato := idle;

signal modalita : std_logic := '0';
begin
process(A, mode)
begin
    if modalita /= mode
    then
        if mode = '0' then
            stato_corrente <= q0;
            modalita <= mode;
        else
            stato_corrente <= p0;
            modalita <= mode;
        end if;
    elsif (A'event and A = '1')
    then
        case stato_corrente is
            -- Caso in cui M = 0
            when q0 =>
               if input = '0' then
                stato_corrente <= q4;
                y <= '0';
               elsif input = '1' then
                stato_corrente <= q1;
                y <= '0';
               end if;
            when q1 =>
                if input = '0' then
                    stato_corrente <= q2;
                    y <= '0';
                elsif input = '1' then
                    stato_corrente <= q5;
                    y <= '0';
                end if;
            when q2 =>
                if input = '0' then
                    stato_corrente <= q0;
                    y <= '0';
                elsif input = '1' then
                    stato_corrente <= q0;
                    y <= '1';
                end if;
            when q4 => 
                stato_corrente <= q5;
                y <= '0';
            when q5 =>
                stato_corrente <= q0;
                y <= '0';
            
            -- Caso M = 1 (Parzialmente sovrapposte)
            when p0 =>
                if input = '0' then
                    stato_corrente <= p0;
                    y <= '0';
                elsif input = '1' then
                    stato_corrente <= p1;
                    y <= '0';
                end if;
            when p1 => 
                if input = '0' then
                    stato_corrente <= p2;
                    y <= '0';
                elsif input = '1' then
                    stato_corrente <= p1;
                    y <= '0';
                end if;
             when p2 =>
                if input = '0' then
                    stato_corrente <= p0;
                    y <= '0';
                elsif input = '1' then
                    stato_corrente <= p3;
                    y <= '1';
                end if;
             when p3 =>
                if input = '0' then
                    stato_corrente <= p0;
                    y <= '0';
                elsif input = '1' then
                    stato_corrente <= p1;
                    y <= '0';
                end if;
                
                -- Caso in cui ci troviamo nella situazione di IDLE
                when others =>
                    if mode = '0' then
                        stato_corrente <= q0;
                    elsif mode = '1' then
                        stato_corrente <= p0;
                    end if;
         end case;
    end if;

end process;

end Behavioral;
