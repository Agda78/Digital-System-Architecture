----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2025 11:19:11 AM
-- Design Name: 
-- Module Name: component_16_4_board - Behavioral
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

entity component_16_4_board is
  Port (
    ind_mux_b : in std_logic_vector(3 downto 0);
    ind_dmux_b : in std_logic_vector(1 downto 0);
    input_b : in std_logic_vector(7 downto 0);
    button : in std_logic_vector(1 downto 0);
    output_b : out std_logic_vector(3 downto 0)
    );
end component_16_4_board;

architecture structural of component_16_4_board is
component component_16_4 port (
    gen_in : in std_logic_vector(15 downto 0);
    ind_mux : in std_logic_vector(3 downto 0);
    ind_dmux : in std_logic_vector(1 downto 0);
    output_gen : out std_logic_vector(3 downto 0)
  );
end component;

-- signal che permette di "mantenete" lo stato che viene impostato
-- mano mano da 8 switch
signal inputs : std_logic_vector(15 downto 0);

begin

-- Componente da testare
-- E opportuni collegamenti
test : component_16_4 port map(
    gen_in => inputs,
    ind_mux => ind_mux_b,
    ind_dmux => ind_dmux_b,
    output_gen => output_b
);

-- Non ho considerato particolari controlli sui bottoni
-- Data la natura combinatoria della macchina
process (button)
begin
    if button(1) = '1' then
        inputs(15 downto 8) <= input_b;
    elsif button(0) = '1' then
        inputs(7 downto 0) <= input_b;
    end if;
end process;
    
end structural;
