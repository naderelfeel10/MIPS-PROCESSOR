library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity jumbInst is
    Port (
        input_28 : in STD_LOGIC_VECTOR (27 downto 0);
        input_4 : in STD_LOGIC_VECTOR (3 downto 0);
        output_32 : out STD_LOGIC_VECTOR (31 downto 0)
    );
end entity jumbInst;

architecture Behavioral of jumbInst is
begin
    output_32 <= input_28 & input_4; -- Concatenate the 28-bit input with the 4-bit input
end architecture Behavioral;