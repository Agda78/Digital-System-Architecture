 library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.NUMERIC_STD.ALL;
 
 entity Contatore is
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
 end Contatore;
 architecture Behavioral of Contatore is
     constant max_value : std_logic_vector(N-1 downto 0) := (others => '1');
     signal counter_value : std_logic_vector(N-1 downto 0) := (others => '0');
 begin
     count_ps: process (clk, RST)
     begin
         if RST = '1' then
                counter_value <= (others => '0'); -- reset counter
                max_reached <= '0';
         elsif rising_edge(clk) then       
             if load = '1' then
                counter_value <= load_val;
             elsif enable = '1' then
                 if counter_value = max_value then
                    max_reached <= '1';
                 else
                    -- increase counter
                    max_reached <= '0';
                    counter_value <= std_logic_vector(unsigned(counter_value) + 1);
                 end if;
             end if;
         end if;
     end process;
 count <= counter_value;
 end Behavioral;