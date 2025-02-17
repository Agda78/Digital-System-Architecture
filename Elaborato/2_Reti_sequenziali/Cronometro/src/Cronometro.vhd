----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2025 07:58:04 PM
-- Design Name: 
-- Module Name: Cronometro - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Cronometro is
 Port (
    start : in std_logic;
    set : in std_logic;
    reset : in std_logic;
    clk : in std_logic;
    clk_sec_o : out std_logic;
    ore_set : in std_logic_vector(4 downto 0);
    min_set : in std_logic_vector(5 downto 0);
    sec_set : in std_logic_vector(5 downto 0);
    start_o : out std_logic;
    ore : out std_logic_vector(4 downto 0);
    min : out std_logic_vector(5 downto 0);
    sec : out std_logic_vector(5 downto 0)
 );
end Cronometro;

architecture Behavioral of Cronometro is

component Contatore_60
    Port (
        clk : in std_logic;
        rst : in std_logic;
        set : in std_logic;
        value_in : in std_logic_vector(5 downto 0);
        max : out std_logic;
        value : out std_logic_vector(5 downto 0)
    );
end component;

component Contatore_24
    Port (
        clk : in std_logic;
        rst : in std_logic;
        set : in std_logic;
        value_in : in std_logic_vector(4 downto 0);
        max : out std_logic;
        value : out std_logic_vector(4 downto 0)
    );
end component;

component clock_manager
  generic(
    F_in : positive := 100000000;
    F_out : positive := 1
  );
  Port (
    clk : in std_logic;
    rst : in std_logic;
    clk_out : out std_logic
  );
end component;

signal clock_sec_internal : std_logic;  -- Clock base
signal clock_sec : std_logic;           -- Clock abilitato dallo start
signal sec_min : std_logic;
signal min_h : std_logic;
signal prova : std_logic;

signal reset_mem : std_logic := '0';
signal set_mem : std_logic := '0';
signal reset_contatori : std_logic;

begin
clk_sec_o <= clock_sec;
start_o <= start;

-- Generazione del clock di 1 Hz
osc : clock_manager port map(
    clk => clk,
    rst => reset, -- Usa il reset diretto solo per il clock manager
    clk_out => clock_sec_internal
);

-- Controllo dello start: il clock dei secondi viene bloccato quando start è '0'
clock_sec <= clock_sec_internal when start = '1' else '0';

-- Segnale di reset per i contatori
reset_contatori <= reset or (prova and not set);

-- Contatore secondi
sec_count : Contatore_60 port map(
    clk => clock_sec,
    rst => reset_contatori,
    set => set,
    value_in => sec_set,
    max => sec_min,
    value => sec
);

-- Contatore minuti
min_count :  Contatore_60 port map(
    clk => sec_min,
    rst => reset_contatori,
    set => set,
    value_in => min_set,
    max => min_h,
    value => min
);

-- Contatore ore (fino a 23)
h_count : Contatore_24 port map(
    clk => min_h,
    rst => reset_contatori,
    set => set,
    value_in => ore_set,
    max => prova,  -- Verifica che questo segnale si attivi correttamente a 23 ore
    value => ore
);

end Behavioral;

