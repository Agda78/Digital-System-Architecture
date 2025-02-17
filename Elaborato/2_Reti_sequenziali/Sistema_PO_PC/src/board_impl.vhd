----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2025 12:17:06 AM
-- Design Name: 
-- Module Name: board_impl - Behavioral
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

entity board_impl is
  Port (
    -- Clock del sistema
    clk : in std_logic;
    
    -- Ingresso bottoni
    read_bt : in std_logic;
    rst_bt : in std_logic;
    
    -- Led per visualizzare il risultato
    out_led : out std_logic_vector(3 downto 0)
  );
end board_impl;

architecture Behavioral of board_impl is

component top_module_board port(
    clk : in std_logic;
    start : in std_logic;
    rst : in std_logic;
    
    read : in std_logic;
    
    data : out std_logic_vector(3 downto 0) := (others => '0')
);
end component;

component ButtonDebouncer is
    generic (                       
        CLK_period: integer := 10;  -- periodo del clock (della board) in nanosecondi
        btn_noise_time: integer := 10000000 -- durata stimata dell'oscillazione del bottone in nanosecondi
                                            -- il valore di default � 10 millisecondi
    );
    Port ( 
           RST : in std_logic;
           CLK : in std_logic;
           BTN : in std_logic;
           CLEARED_BTN : out std_logic
          );
end component;

signal rst_clean :  std_logic := '0';
signal read_clean : std_logic := '0';

begin

rst_debouncer : ButtonDebouncer port map(
   RST => '0',
   CLK => clk,
   BTN => rst_bt,
   CLEARED_BTN => rst_clean
);

read_debouncer : ButtonDebouncer port map(
    RST => '0',
    CLK => clk,
    BTN => read_bt,
    CLEARED_BTN => read_clean
);

system : top_module_board port map(
    clk => clk,
    start => read_clean,
    rst => rst_clean,
    
    read => read_clean,
    
    data => out_led
);

end Behavioral;
