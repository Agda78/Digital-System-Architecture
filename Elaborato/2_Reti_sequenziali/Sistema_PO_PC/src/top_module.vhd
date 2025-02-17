----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2025 07:13:01 PM
-- Design Name: 
-- Module Name: top_module - Behavioral
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

entity top_module is
  Port (
    clk : in std_logic;
    start : in std_logic;
    rst : in std_logic;
    
    data : out std_logic_vector(3 downto 0) := (others => '0')
  );
end top_module;

architecture Behavioral of top_module is

component parte_operativa port(
    clk : in std_logic;
    read_s : in std_logic;
    read_m : in std_logic;
    write_m : in std_logic;
    ind : in std_logic_vector(3 downto 0);
    data : out std_logic_vector(3 downto 0)
);
end component;

component parte_controllo port(
    -- Segnali di controllo esterni
    clk : in std_logic;
    start : in std_logic;
    rst : in std_logic;
    
    -- Indirizzo delle memorie da selezionare
    ind : out std_logic_vector(3 downto 0);
    
    -- Segnali di controllo operativo
    read_s : out std_logic;
    read_m : out std_logic;
    write_m : out std_logic
);
end component;

-- Clock della parte operativa
signal clk_op : std_logic;

-- Segnali di connessione tra parte operativa e di controllo
signal read_s_s : std_logic;
signal read_m_s : std_logic;
signal write_m_s : std_logic;
signal ind_s : std_logic_vector(3 downto 0);

begin
-- Fa in modo che la parte operativa si attivi sul fronte di discesa
-- nonostante i componenti siano progettati per il fronte di salita
clk_op <= not(clk);

PO : parte_operativa port map(
    clk => clk_op,
    read_s => read_s_s,
    read_m => read_m_s,
    write_m => write_m_s,
    ind => ind_s,
    data => data
);

PC : parte_controllo port map(
    clk => clk,
    start => start,
    rst => rst,
    
    ind => ind_s,
    
    read_s => read_s_s,
    read_m => read_m_s,
    write_m => write_m_s
);
end Behavioral;
