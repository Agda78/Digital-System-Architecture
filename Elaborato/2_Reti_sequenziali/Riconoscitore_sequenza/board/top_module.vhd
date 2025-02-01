library ieee;
use ieee.std_logic_1164.all;

entity top_module is
    port (
        clk      : in  std_logic;
        bt_in    : in  std_logic;
        bt_mode  : in  std_logic;
        sig      : out std_logic;
        sw_in    : in  std_logic;
        sw_mode  : in  std_logic;
        led_y    : out std_logic
    );
end top_module;

architecture behavioral of top_module is
    signal bt_in_clean, bt_mode_clean : std_logic;
    signal clk_div : std_logic;
    signal pulse : std_logic;
    signal input_taken : std_logic;
    signal s1_reg, s2_reg : STD_LOGIC;  -- Registri per stabilizzare gli input
    
    component clock_divider
        port (
            clk_in  : in  std_logic;
            clk_out : out std_logic
        );
    end component;

    component debouncer
        port (
            clk    : in  std_logic;
            button : in  std_logic;
            clean  : out std_logic
        );
    end component;

    component riconoscitore_sequenza
        port (
            input : in std_logic;
            mode  : in std_logic;
            a     : in std_logic;
            y     : out std_logic
        );
    end component;

    component pulse_generator
        port (
            clk    : in  std_logic;
            trigger : in  std_logic;
            pulse  : out std_logic
        );
    end component;

begin
    process(bt_in_clean, bt_mode_clean)
    begin
        if rising_edge(bt_in_clean) then
            s1_reg <= sw_in;
        end if;
        if rising_edge(bt_mode_clean) then
            s2_reg <= sw_mode;
        end if;
    end process;
    
    clock_inst : clock_divider
        port map (
            clk_in  => clk,
            clk_out => clk_div
        );

    debouncer1 : debouncer
        port map (
            clk    => clk,
            button => bt_in,
            clean  => bt_in_clean
        );
    
    debouncer2 : debouncer
        port map (
            clk    => clk,
            button => bt_mode,
            clean  => bt_mode_clean
        );
    
    pulse_gen : pulse_generator
        port map (
            clk    => clk,
            trigger => bt_in_clean or bt_mode_clean,
            pulse  => pulse
        );

    riconoscitore_inst : riconoscitore_sequenza
        port map (
            input => s1_reg,
            mode  => s2_reg,
            a     => pulse,
            y     => input_taken
        );

    sig <= input_taken;
    led_y <= input_taken;

end behavioral;
