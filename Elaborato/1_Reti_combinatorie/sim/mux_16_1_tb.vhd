----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 07:11:27 PM
-- Design Name: 
-- Module Name: mux_16_1_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_16_1_tb is
--  Port ( );
end mux_16_1_tb;

architecture Behavioral of mux_16_1_tb is
-- definisco il componente da andare a testare
component mux_16_1 port (
        ins : in std_logic_vector(15 downto 0);
        path : in std_logic_vector(3 downto 0);
        y_out : out std_logic
        );
end component;

-- Vado a dichiarare i vari signal con cui "collegare" le "variabili" di simulazione
signal p_in : std_logic_vector(15 downto 0):="0000000000000000";
signal s_in : std_logic_vector(3 downto 0):= "0000";
signal y : std_logic:= '0';

begin

-- Dichiarazione del componente da testare e "collegamento" delle variabili di test
test : mux_16_1 port map(
    ins => p_in,
    path => s_in,
    y_out => y
);

process begin
    s_in <= "0000";
    p_in <= "0000000000000001"; -- Solo il bit 0 è alto
    wait for 10 ns;
    for  i in 0 to 15
    loop
        p_in(i) <= '1';
        wait for 10ns;
        s_in <= std_logic_vector(unsigned(s_in)+1);
    end loop;

    -- Attesa indefinita permette di tenere attivo il process
    wait;
end process;
end Behavioral;
