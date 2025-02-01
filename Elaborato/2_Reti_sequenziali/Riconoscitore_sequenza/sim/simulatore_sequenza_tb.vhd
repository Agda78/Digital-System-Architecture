library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_riconoscitore_sequenza is
end tb_riconoscitore_sequenza;

architecture behavior of tb_riconoscitore_sequenza is

  -- Dichiarazione dei segnali per il testbench
  signal A : std_logic := '0';        -- Clock
  signal mode : std_logic := '0';      -- Modalità (reset e selezione stato)
  signal input : std_logic := '0';     -- Ingresso
  signal y : std_logic;                -- Uscita

  -- Component declaration for the unit under test (UUT)
  component riconoscitore_sequenza
    Port (
      A : in std_logic;
      mode : in std_logic;
      input : in std_logic;
      y : out std_logic
    );
  end component;

begin

  -- Instanziare l'UUT
  uut: riconoscitore_sequenza
    Port map (
      A => A,
      mode => mode,
      input => input,
      y => y
    );

  -- Clock generation process
  clk_process : process
  begin
    -- Generazione del clock (periodo di 10 ns)
    A <= '0';
    wait for 5 ns;
    A <= '1';
    wait for 5 ns;
  end process;

  -- Stimuli process
  stim_proc: process
  begin
    -- Test 1: Presentazione sequenza 101 in modo consecutivo (gruppo)
    mode <= '0';   -- Impostato in modalità 0 (reset)
    
    input <= '1';  -- Inizio sequenza 101
    wait for 10 ns;
    
    input <= '0';  -- Secondo bit della sequenza 101
    wait for 10 ns;
    
    input <= '1';  -- Terzo bit della sequenza 101
    wait for 10 ns;
    
    -- Pausa di 20 ns tra sequenze
    input <= '0';
    wait for 20 ns;
    
    -- Test 2: Sequenza 101 al centro di una lunga sequenza
    mode <= '1';   -- Impostato in modalità 1
    input <= '0';  -- Inizio sequenza lunga
    wait for 10 ns;
    
    input <= '0';  -- Ingresso 0
    wait for 10 ns;
    
    input <= '1';  -- Ingresso 1, inizio della sequenza 101
    wait for 10 ns;
    
    input <= '0';  -- Secondo bit della sequenza 101
    wait for 10 ns;
    
    input <= '1';  -- Terzo bit della sequenza 101
    wait for 10 ns;
    
    input <= '0';  -- Pausa di fine sequenza
    wait for 10 ns;
    
    input <= '0';  -- Fine della sequenza lunga
    wait for 20 ns;
    
    -- Test 3: Ripetizione sequenza 101 in modalità 0
    mode <= '0';   -- Modalità 0
    input <= '1';  -- Inizio sequenza 101
    wait for 10 ns;
    
    input <= '0';  -- Secondo bit della sequenza 101
    wait for 10 ns;
    
    input <= '1';  -- Terzo bit della sequenza 101
    wait for 10 ns;
    
    -- Pausa di 20 ns tra sequenze
    input <= '0';
    wait for 20 ns;
    
    -- Test 4: Sequenza 101 al centro di una lunga sequenza in modalità 1
    mode <= '1';   -- Modalità 1
    input <= '0';  -- Inizio sequenza lunga
    wait for 10 ns;
    
    input <= '0';  -- Ingresso 0
    wait for 10 ns;
    
    input <= '1';  -- Inizio sequenza 101
    wait for 10 ns;
    
    input <= '0';  -- Secondo bit della sequenza 101
    wait for 10 ns;
    
    input <= '1';  -- Terzo bit della sequenza 101
    wait for 10 ns;
    
    input <= '0';  -- Pausa di fine sequenza
    wait for 10 ns;
    
    input <= '0';  -- Fine della sequenza lunga
    wait for 20 ns;

    -- Termina la simulazione
    wait;
  end process;

end behavior;
