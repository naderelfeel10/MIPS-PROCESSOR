library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_32bit is
    port (
        pc_in : in  std_logic_vector(31 downto 0);
        label_in : in  std_logic_vector(31 downto 0);
        Sum : out std_logic_vector(31 downto 0)
    );
end entity Adder_32bit;

architecture Behavioral of Adder_32bit is
begin
    process(pc_in, label_in)
        variable pc_internal, labl_internal, Sum_internal : signed(31 downto 0);
    begin
        pc_internal := signed(pc_in);
        labl_internal := signed(label_in);
        Sum_internal := pc_internal + labl_internal;
        Sum <= std_logic_vector(Sum_internal);
    end process;
end architecture Behavioral;