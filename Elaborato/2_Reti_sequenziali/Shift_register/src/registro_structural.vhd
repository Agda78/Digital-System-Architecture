----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2025 10:55:44 PM
-- Design Name: 
-- Module Name: registro_structural - Behavioral
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

entity registro_structural is
  generic(
    N : positive := 8
  );
  port (
    input : in std_logic;
    clock : in std_logic;
    output : out std_logic_vector(N-1 downto 0)
  );
end registro_structural;

architecture structural of registro_structural is

component flip_flop_d port (
    D : in std_logic;
    clk : in std_logic;
    y : out std_logic
  );
end component;

signal connection : std_logic_vector(N-1 downto 0);

begin

primo : flip_flop_d port map(
    d => input,
    clk => clock,
    y => connection(0)
);

G1: for i in 1 to N-1
generate
    reg : flip_flop_d port map(
        D => connection(i - 1),
        clk => clock,
        y => connection(i)
    );
end generate;

output <= connection;

end structural;
