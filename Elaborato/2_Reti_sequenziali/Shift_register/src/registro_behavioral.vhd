library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_behavioral is
  generic(
    N : positive := 8
  );
  port (
    input : in std_logic;
    clock : in std_logic;
    output : out std_logic_vector(N-1 downto 0)
  );
end registro_behavioral;

architecture Behavioral of registro_behavioral is
signal registro : std_logic_vector(N-1 downto 0) := (others => '0');  -- Inizializzato a 0

begin
process(clock)
begin
    if rising_edge(clock) then
        registro(N-1 downto 1) <= registro(N-2 downto 0); -- Shift a destra
        registro(0) <= input; -- Nuovo valore in input va in LSB
    end if;
end process;

output <= registro; -- Assegna l'output al registro interno

end Behavioral;
