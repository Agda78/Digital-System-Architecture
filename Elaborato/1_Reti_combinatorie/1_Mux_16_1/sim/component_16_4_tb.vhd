----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2025 11:57:10 AM
-- Design Name: 
-- Module Name: component_16_4_tb - Behavioral
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

entity component_16_4_tb is
--  Port ( );
end component_16_4_tb;

architecture Behavioral of component_16_4_tb is

component component_16_4 port (
    gen_in : in std_logic_vector(15 downto 0);
    ind_mux : in std_logic_vector(3 downto 0);
    ind_dmux : in std_logic_vector(1 downto 0);
    output_gen : out std_logic_vector(3 downto 0)
  );
end component;

signal p_in : std_logic_vector(15 downto 0):="0000000000000000";
signal s_in : std_logic_vector(3 downto 0):= "0000";
signal s_dmux : std_logic_vector(1 downto 0) := "00";
signal y : std_logic_vector(3 downto 0):= "0000";

begin

test : component_16_4 port map(
    gen_in => p_in,
    ind_mux => s_in,
    ind_dmux => s_dmux,
    output_gen => y
);

process
begin
    s_in <= "0000";
    p_in <= "0000000000000001"; -- Solo il bit 0 e' alto
    wait for 10 ns;
        
    -- Ciclo che permette di provare tutti i casi di test interessanti
    -- se l'uscita sara' sempre alta, il test e' da considerarsi soddisfacente
    for  i in 0 to 15
    loop
      -- Sollecitazioni degli ingressi del mux
      p_in(i) <= '1';
      wait for 10ns;
      s_in <= std_logic_vector(unsigned(s_in)+1);
      
      -- Gestione delle sollecitazioni del demux
      if s_dmux /= "1111"
      then
        s_dmux <= std_logic_vector(unsigned(s_dmux) + 1);
      else
        s_dmux <= "0000";
      end if;
     end loop;

     -- Attesa indefinita permette di tenere attivo il process
     wait;
end process;

end Behavioral;
