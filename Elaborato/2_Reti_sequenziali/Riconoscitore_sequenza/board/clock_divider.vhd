library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clock_divider is
    port (
        clk_in  : in  std_logic;
        clk_out : out std_logic
    );
end clock_divider;

architecture behavioral of clock_divider is
    signal counter : integer := 0;
    signal clk_reg : std_logic := '0';
begin
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if counter = 49999999 then  -- conta fino a 50 milioni
                clk_reg <= not clk_reg; -- toggle del clock
                counter <= 0;           -- reset contatore
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_reg;

end behavioral;