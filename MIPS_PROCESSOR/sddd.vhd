library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
use ieee.numeric_std.all;
-- use IEEE.NUMERIC_STD_UNSIGNED.all;
entity testbench is
end;

architecture test of testbench is
component Processor
port(CLK, RST: in STD_LOGIC;
writedata, dataadr: out STD_LOGIC_VECTOR(31 downto 0);
memwrite: out STD_LOGIC);
end component;
signal writedata, dataadr: STD_LOGIC_VECTOR(31 downto 0);
signal CLK, RST, memwrite: STD_LOGIC;



begin
-- instantiate device to be tested
dut: Processor port map(CLK, RST, writedata, dataadr, memwrite);

-- Generate clock with 10 ns period
process begin
CLK <= '1';
wait for 5 ns;
CLK <= '0';
wait for 5 ns;
end process;




-- Generate reset for first two clock cycles
process begin
RST <= '1';
wait for 22 ns;
RST <= '0';
wait;
end process;

-- check that 7 gets written to address 84 at end of program
process(CLK) begin
if (CLK'event and CLK = '0' and memwrite = '1') then
if (CONV_INTEGER(dataadr) = 84 and CONV_INTEGER(writedata) = 7) then
report "NO ERRORS: Simulation succeeded" severity failure;
elsif (CONV_INTEGER(dataadr) = 84) then
report "Simulation failed" severity failure;
end if;
end if;

end process;
end;
