----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2025 06:25:38 PM
-- Design Name: 
-- Module Name: parte_controllo - Behavioral
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

entity parte_controllo is
  Port (
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
end parte_controllo;

architecture Behavioral of parte_controllo is

component control_unit port (
    -- Input Value
    clk : in std_logic;
    start : in std_logic;
    rst : in std_logic;
    
    -- Counter inputs
    max_reached : in std_logic;
    
    -- Counter control
    enable : out std_logic;
    reset : out std_logic;
    
    -- PO controls
    read_s : out std_logic;
    read_m : out std_logic;
    write_m : out std_logic
  
);
end component;

component Contatore 
    generic (
        N : integer := 3 -- counter dim (bit number)
    );
    Port (
     CLK : in std_logic;
     enable : in std_logic;
     load : in std_logic;
     load_val : in std_logic_vector(N-1 downto 0);
     RST: in std_logic;
     max_reached : out std_logic;
     count : out std_logic_vector(N-1 downto 0) := (others => '0')
    );
end component;

signal max_count : std_logic;
signal count_en : std_logic;
signal rst_count : std_logic;


begin

CU : control_unit port map(
    clk => clk,
    start => start,
    rst => rst,
    
    max_reached => max_count,
    
    enable =>  count_en,
    reset => rst_count,
    
    -- PO controls
    read_s => read_s,
    read_m => read_m,
    write_m => write_m
);

Counter : Contatore 
generic map(
    N => 4
)
port map(
     CLK => clk,
     enable => count_en,
     load => '0',
     load_val => "0000",
     RST => rst_count,
     max_reached => max_count,
     count => ind
);

end Behavioral;
