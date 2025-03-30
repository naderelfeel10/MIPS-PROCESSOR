library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor_tb is
end Processor_tb;

architecture Behavioral of Processor_tb is
    signal CLK : STD_LOGIC := '0';
    signal RST : STD_LOGIC := '0';
    signal Writedata, dataadr : STD_LOGIC_VECTOR(31 downto 0);
    signal memwrite : STD_LOGIC;
begin

    -- Instantiate the Processor unit
    UUT : entity work.Processor
        port map (
            CLK => CLK,
            RST => RST,
            Writedata => Writedata,
            dataadr => dataadr,
            memwrite => memwrite
        );

    -- Clock process
    CLK_process: process
    begin
        CLK <= '0';
        wait for 5 ns;
        CLK <= '1';
        wait for 5 ns;
    end process;

    -- Reset process
    RST_process: process
    begin
        RST <= '1';
        wait for 10 ns;
        RST <= '0';
        wait;
    end process;

    -- Stimulus process
    Stimulus: process
    begin
        -- Insert your test stimuli here
        
        -- Example: wait for reset to finish
        wait for 20 ns;
        
        -- Example: simulate some memory write operation
        memwrite <= '1';
        wait for 10 ns;
        memwrite <= '0';
        wait for 20 ns;
        
        -- Example: simulate some data and address values
        dataadr <= (others => '1');
        Writedata <= (others => '0');
        wait for 50 ns;
        
        -- Add more stimuli as needed
        
        wait;
    end process;

end Behavioral;
