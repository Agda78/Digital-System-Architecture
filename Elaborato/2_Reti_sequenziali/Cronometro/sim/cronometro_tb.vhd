library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Cronometro_tb is
end Cronometro_tb;

architecture Behavioral of Cronometro_tb is

    -- Dichiarazione del componente da testare
    component Cronometro
        Port (
            start : in std_logic;
            set : in std_logic;
            reset : in std_logic;
            clk : in std_logic;
            ore_set : in std_logic_vector(4 downto 0);
            min_set : in std_logic_vector(5 downto 0);
            sec_set : in std_logic_vector(5 downto 0);
            ore : out std_logic_vector(4 downto 0);
            min : out std_logic_vector(5 downto 0);
            sec : out std_logic_vector(5 downto 0)
        );
    end component;

    -- Segnali
    signal clk : std_logic := '0';
    signal start : std_logic := '0';
    signal set : std_logic := '0';
    signal reset : std_logic := '0';
    signal ore_set : std_logic_vector(4 downto 0) := (others => '0');
    signal min_set : std_logic_vector(5 downto 0) := (others => '0');
    signal sec_set : std_logic_vector(5 downto 0) := (others => '0');
    signal ore : std_logic_vector(4 downto 0);
    signal min : std_logic_vector(5 downto 0);
    signal sec : std_logic_vector(5 downto 0);

    -- Clock generation process (10 ns periodo => 100 MHz)
    constant clk_period : time := 10 ns;
    
begin

    -- Istanziazione del cronometro
    uut : Cronometro 
    port map (
        start => start,
        set => set,
        reset => reset,
        clk => clk,
        ore_set => ore_set,
        min_set => min_set,
        sec_set => sec_set,
        ore => ore,
        min => min,
        sec => sec
    );

    -- Processo per generare il clock
    clk_process : process
    begin
        while now < 2 ms loop  -- Simuliamo per 2 millisecondi
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Processo di test
    stim_proc: process
    begin
        -- Reset iniziale
        reset <= '1';
        wait for 50 ns;
        reset <= '0';

        -- Impostiamo il cronometro su 23:59:58
        set <= '1';
        ore_set <= "10111";  -- 23 in binario (5 bit)
        min_set <= "111011"; -- 59 in binario (6 bit)
        sec_set <= "111010"; -- 58 in binario (6 bit)
        wait for 50 ns;
        set <= '0';

        -- Aspettiamo due secondi per vedere il passaggio a 00:00:00
        wait for 2 ms;

        -- Reset dopo aver testato il ciclo completo
        reset <= '1';
        wait for 50 ns;
        reset <= '0';

        -- Simulazione completata
        wait;
    end process;

end Behavioral;
