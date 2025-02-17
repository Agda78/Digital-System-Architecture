library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_top_module is
end tb_top_module;

architecture Behavioral of tb_top_module is
    -- Dichiarazione del componente da testare
    component top_module
        Port (
            clk   : in std_logic;
            start : in std_logic;
            rst   : in std_logic;
            data  : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Segnali di test
    signal clk_tb   : std_logic := '0';
    signal start_tb : std_logic := '0';
    signal rst_tb   : std_logic := '0';
    signal data_tb  : std_logic_vector(3 downto 0);

    -- Parametro per la frequenza del clock
    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instanziazione del DUT (Device Under Test)
    UUT: top_module
        port map (
            clk   => clk_tb,
            start => start_tb,
            rst   => rst_tb,
            data  => data_tb
        );

    -- Generazione del clock
    clk_process: process
    begin
        while true loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimoli di test
    stim_process: process
    begin
        -- Inizializzazione
        rst_tb <= '1';
        start_tb <= '0';
        wait for CLK_PERIOD;

        -- Rilascio del reset
        rst_tb <= '0';
        wait for CLK_PERIOD;

        -- Avvio del sistema
        start_tb <= '1';
        wait for CLK_PERIOD;
        start_tb <= '0';
        wait for 5 * CLK_PERIOD;

        -- Riavvio con un nuovo reset
        --rst_tb <= '1';
        --wait for CLK_PERIOD;
        --rst_tb <= '0';
        --wait for 5 * CLK_PERIOD;

        -- Fine simulazione
        wait;
    end process;

end Behavioral;
