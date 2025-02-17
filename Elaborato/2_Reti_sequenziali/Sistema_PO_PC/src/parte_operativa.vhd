----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2025 05:55:13 PM
-- Design Name: 
-- Module Name: parte_operativa - Behavioral
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

entity parte_operativa is
  Port (
    clk : in std_logic;
    read_s : in std_logic;
    read_m : in std_logic;
    write_m : in std_logic;
    ind : in std_logic_vector(3 downto 0);
    data : out std_logic_vector(3 downto 0)
  );
end parte_operativa;

architecture Behavioral of parte_operativa is

component S_devince port(
    clk : in std_logic;
    read : in std_logic;
    
    indirizzo : in std_logic_vector(3 downto 0);
    uscita : out std_logic_vector(3 downto 0)
);
end component;

component Memoria_MEM port (
    clk : in std_logic;
    read : in std_logic;
    write : in std_logic;
    ind : in std_logic_vector(3 downto 0); -- Ciò implica il dover fare una memoria di al massimo 16 locazioni
    
    -- Dati in input
    data_in : in std_logic_vector(3 downto 0);
    
    -- Dati in output
    data : out std_logic_vector(3 downto 0)
);
end component;

signal connection : std_logic_vector(3 downto 0);

begin

rom : S_devince port map(
    clk => clk,
    read => read_s,
    indirizzo => ind,
    uscita => connection
);

mem : Memoria_MEM port map(
    clk => clk,
    read => read_m,
    write => write_m,
    ind => ind, 
    data_in => connection,
    data => data
);

end Behavioral;
