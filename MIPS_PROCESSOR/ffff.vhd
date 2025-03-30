library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2to1_5bits is
    port (
        S : in  std_logic;                   -- Select input
        D0, D1 : in  std_logic_vector(4 downto 0);  -- Data inputs
        Y : out std_logic_vector(4 downto 0)      -- Output
    );
end MUX_2to1_5bits;

architecture Behavioral of MUX_2to1_5bits is
begin
    process(S, D0, D1)
    begin
        if S = '0' then
            Y <= D0;
        else
            Y <= D1;
        end if;
    end process;
end architecture Behavioral;