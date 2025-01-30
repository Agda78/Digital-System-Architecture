----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2025 11:49:07 AM
-- Design Name: 
-- Module Name: component_16_4 - Behavioral
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

entity component_16_4 is
  Port (
    gen_in : in std_logic_vector(15 downto 0);
    ind_mux : in std_logic_vector(3 downto 0);
    ind_dmux : in std_logic_vector(1 downto 0);
    output_gen : out std_logic_vector(3 downto 0)
  );
end component_16_4;

architecture Behavioral of component_16_4 is

component mux_16_1 port(
    ins : in std_logic_vector(15 downto 0);
    path : in std_logic_vector(3 downto 0);
    y_out : out std_logic
);
end component;

component dmux_1_4
  Port (
    input : in std_logic;
    ind : in std_logic_vector(1 downto 0);
    output : out std_logic_vector(3 downto 0) 
  );
end component;

signal connection : std_logic;

begin
mux : mux_16_1 port map(
    ins => gen_in,
    path => ind_mux,
    y_out => connection
);

dmux : dmux_1_4 port map(
    input => connection,
    ind => ind_dmux,
    output => output_gen
);

end Behavioral;
