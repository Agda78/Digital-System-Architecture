library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contatore_mod_2_tb is
end contatore_mod_2_tb;

architecture Behavioral of contatore_mod_2_tb is
    constant N_t : integer := 5;

    component  Contatore_24
        Port (
            clk : in std_logic;
            rst : in std_logic;
            set : in std_logic;
            value_in : in std_logic_vector(4 downto 0);
            max : out std_logic;
            value : out std_logic_vector(4 downto 0)
        );
    end component;

    signal clock   : std_logic := '0';
    signal reset   : std_logic := '0';
    signal set     : std_logic := '0';
    signal value_in: std_logic_vector(N_t - 1 downto 0) := (others => '0');
    signal max     : std_logic;
    signal output  : std_logic_vector(N_t - 1 downto 0);

begin
    -- Istanziazione del contatore
    uut:  Contatore_24
        port map (
            clk => clock,
            rst => reset,
            set => set,
            value_in => value_in,
            max => max,
            value => output
        );

    -- Processo per la generazione del clock
    process
    begin
        while true loop
            clock <= '1';
            wait for 10 ns;
            clock <= '0';
            wait for 10 ns;
        end loop;
    end process;

    -- Processo di stimolo
    process
    begin
        -- Reset iniziale
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;
        
        -- Test incremento
        wait for 700 ns;
        
        -- Test set a un valore specifico
        set <= '1';
        value_in <= "11011";
        wait for 20 ns;
        set <= '0';
        
        -- Attendere e osservare il conteggio
        wait for 200 ns;
        
        -- Reset e nuovo test
        --reset <= '1';
        --wait for 20 ns;
        --reset <= '0';
        
        wait;
    end process;
end Behavioral;
