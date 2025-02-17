library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Contatore_60 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        set : in std_logic;
        value_in : in std_logic_vector(5 downto 0);
        max : out std_logic;
        value : out std_logic_vector(5 downto 0)
    );
end Contatore_60;

architecture Behavioral of Contatore_60 is
constant N_p : positive := 6; -- Deve essere 6 per contare fino a 60

signal cont_value : std_logic_vector(N_p-1 downto 0);
signal reset : std_logic;
signal arrived : std_logic;
signal value_s : std_logic_vector(5 downto 0);

component Contatore_mod_2 is
    Generic(
        N : positive := 6  -- Cambiato da 5 a 6
    );
    Port (
        clk : in std_logic;
        rst : in std_logic;
        set : in std_logic;
        value_in : in std_logic_vector(N-1 downto 0);
        max : out std_logic;
        value : out std_logic_vector(N-1 downto 0)
    );
end component;

begin

cont : Contatore_mod_2 
generic map(
    N => N_p
)
port map(
    clk => clk,
    rst => reset,
    set => set,
    value_in => value_in,
    max => arrived,
    value => value_s
);

-- Controllo se il valore ha raggiunto 60 e attivo il reset
process(clk)
begin
    if rising_edge(clk) then
        if value_s = "111100" then  -- 60 in binario
            reset <= '1';
            max <= '1';  -- Indica che il massimo è stato raggiunto
        else
            reset <= rst;  -- Mantiene il reset generale
            max <= '0';
        end if;
    end if;
end process;
value <= value_s;
end Behavioral;
