library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memoria_MEM_tb is
end Memoria_MEM_tb;

architecture Behavioral of Memoria_MEM_tb is
    -- Component declaration
    component Memoria_MEM
        port (
            clk : in std_logic;
            read : in std_logic;
            write : in std_logic;
            ind : in std_logic_vector(4 downto 0);
            data_in : in std_logic_vector(3 downto 0);
            data : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Test signals
    signal clk_tb : std_logic := '0';
    signal read_tb : std_logic := '0';
    signal write_tb : std_logic := '0';
    signal ind_tb : std_logic_vector(4 downto 0) := (others => '0');
    signal data_in_tb : std_logic_vector(3 downto 0) := (others => '0');
    signal data_tb : std_logic_vector(3 downto 0);

    -- Clock process
    constant clk_period : time := 10 ns;
    
    begin
    
    -- Instantiate the unit under test (UUT)
    uut: Memoria_MEM
        port map (
            clk => clk_tb,
            read => read_tb,
            write => write_tb,
            ind => ind_tb,
            data_in => data_in_tb,
            data => data_tb
        );
    
    -- Clock generation
    clk_process : process
    begin
        while now < 200 ns loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;
    
    -- Test sequence
    stim_proc: process
    begin
        -- Write value 1010 at address 00001
        write_tb <= '1';
        read_tb <= '0';
        ind_tb <= "00001";
        data_in_tb <= "1010";
        wait for clk_period;
        
        -- Disable write
        write_tb <= '0';
        wait for clk_period;
        
        -- Read from address 00001
        read_tb <= '1';
        wait for clk_period;
        
        -- Disable read
        read_tb <= '0';
        wait for clk_period;
        
        -- Write value 1100 at address 00010
        write_tb <= '1';
        read_tb <= '0';
        ind_tb <= "00010";
        data_in_tb <= "1100";
        wait for clk_period;
        
        -- Disable write
        write_tb <= '0';
        wait for clk_period;
        
        -- Read from address 00010
        read_tb <= '1';
        wait for clk_period;
        
        -- Stop simulation
        wait;
    end process;
    
end Behavioral;