library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity debouncer is
    port (
        clk    : in  std_logic;
        button : in  std_logic;
        clean  : out std_logic
    );
end debouncer;

architecture behavioral of debouncer is
    signal counter : integer := 0;
    signal stable  : std_logic := '0';
    constant debounce_time : integer := 500000;  -- debounce di 5 ms (con clock da 100 MHz)
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if button = stable then
                counter <= 0;
            else
                counter <= counter + 1;
                if counter >= debounce_time then
                    stable <= button;
                    counter <= 0;
                end if;
            end if;
        end if;
    end process;
    
    clean <= stable;
end behavioral;
