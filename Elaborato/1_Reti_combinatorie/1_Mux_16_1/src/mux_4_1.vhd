----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 06:28:09 PM
-- Design Name: 
-- Module Name: mux_4_1 - Behavioral
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

entity mux_4_1 is
    Port ( a : in std_logic_vector(3 downto 0);
           s_4 : in std_logic_vector(1 downto 0);
           y : out std_logic);
end mux_4_1;

architecture structural of mux_4_1 is
component mux_2_1 port(
    a_0 : in std_logic;
    a_1 : in std_logic;
    s : in std_logic;
    y_out : out std_logic 
);
end component;

-- Tali signal sono utilizzati come dei fili di collegamento interno
-- Tra i vari multiplexer 2:1 (collegare le uscite
-- agli ingressi dell'ultimo)
signal con_1 : std_logic;
signal con_2 : std_logic;

begin
-- Dichiarazione del primo multiplexer 2:1
mux_1 : mux_2_1 port map(
    a_0 => a(0),
    a_1 => a(1),
    s => s_4(0),
    y_out => con_1    
);

-- Dichiarazione del secondo multiplexer 2:1
mux_2 : mux_2_1 port map(
    a_0 => a(2),
    a_1 => a(3),
    s => s_4(0),
    y_out => con_2    
);

-- Dichiarazione del terzo multiplexer 2:1
mux_3 : mux_2_1 port map(
    a_0 => con_1,
    a_1 => con_2,
    s => s_4(1),
    y_out => y    
);

end structural;
