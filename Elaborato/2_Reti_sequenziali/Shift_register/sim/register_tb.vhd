library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_tb is
end register_tb;

architecture Behavioral of register_tb is

component registro_behavioral
    generic(
        N : positive
    );
    port (
        input  : in std_logic;
        clock  : in std_logic;
        output : out std_logic_vector(N-1 downto 0)
    );
end component;

signal clock_s    : std_logic := '0';
signal test_input : std_logic := '0';
signal output_s   : std_logic_vector(3 downto 0);  -- Corretto tipo

begin

test : registro_behavioral 
    generic map (N => 4)  -- Assegniamo un valore a N
    port map(
        input  => test_input,
        clock  => clock_s,
        output => output_s
    );

process
begin
    for i in 0 to 100 loop
        clock_s <= not clock_s;
        if i mod 11 = 0 then  -- Cambia `test_input` ogni 11 cicli di clock
            test_input <= not test_input;
        end if;
        wait for 10 ns;
    end loop;
    wait; -- Fermare il processo dopo 100 cicli
end process;

end Behavioral;
