library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pulse_generator is
    port (
        clk     : in  std_logic;
        trigger : in  std_logic;
        pulse   : out std_logic
    );
end pulse_generator;

architecture behavioral of pulse_generator is
    signal pulse_reg : std_logic := '0';
    signal prev_trigger : std_logic := '0';

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if trigger = '1' and prev_trigger = '0' then
                pulse_reg <= '1';
            else
                pulse_reg <= '0';
            end if;
            prev_trigger <= trigger;
        end if;
    end process;

    pulse <= pulse_reg;

end behavioral;