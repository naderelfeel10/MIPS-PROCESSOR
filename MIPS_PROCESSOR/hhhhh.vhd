
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
   
    Port (
        write_sel1 : in  std_logic_vector(4  downto 0);
        output : out std_logic_vector(31  downto 0)
    );
end decoder;

architecture Behavioral of decoder is

begin
    process(write_sel1)
    begin
	 
        case write_sel1 is
            when "00000" =>
                output <= "00000000000000000000000000000001";
            when "00001" =>
                output <= "00000000000000000000000000000010";
            when "00010" =>
                output <= "00000000000000000000000000000100";
            when "00011" =>
                output <= "00000000000000000000000000001000";
            when "00100" =>
                output <= "00000000000000000000000000010000";
            when "00101" =>
                output <= "00000000000000000000000000100000";
            when "00110" =>
                output <= "00000000000000000000000001000000";
            when "00111" =>
                output <= "00000000000000000000000010000000";
            when "01000" =>
                output <= "00000000000000000000000100000000";
            when "01001" =>
                output <= "00000000000000000000001000000000";
            when "01010" =>
                output <= "00000000000000000000010000000000";
            when "01011" =>
                output <= "00000000000000000000100000000000";
            when "01100" =>
                output <= "00000000000000000001000000000000";
            when "01101" =>
                output <= "00000000000000000010000000000000";
            when "01110" =>
                output <= "00000000000000000100000000000000";
            when "01111" =>
                output <= "00000000000000001000000000000000";
            when "10000" =>
                output <= "00000000000000010000000000000000";
            when "10001" =>
                output <= "00000000000000100000000000000000";
            when "10010" =>
                output <= "00000000000001000000000000000000";
            when "10011" =>
                output <= "00000000000010000000000000000000";
            when "10100" =>
                output <= "00000000000100000000000000000000";
            when "10101" =>
                output <= "00000000001000000000000000000000";
            when "10110" =>
                output <= "00000000010000000000000000000000";
            when "10111" =>
                output <= "00000000100000000000000000000000";
            when "11000" =>
                output <= "00000001000000000000000000000000";
            when "11001" =>
                output <= "00000010000000000000000000000000";
            when "11010" =>
                output <= "00000100000000000000000000000000";
            when "11011" =>
                output <= "00001000000000000000000000000000";
            when "11100" =>
                output <= "00010000000000000000000000000000";
            when "11101" =>
                output <= "00100000000000000000000000000000";
            when "11110" =>
                output <= "01000000000000000000000000000000";
				when "11111" =>
                output <= "10000000000000000000000000000000";
           when others =>
             output <= (others => '0');
					 
        end case;
    end process;
end Behavioral;