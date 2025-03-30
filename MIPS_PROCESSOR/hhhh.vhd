----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:53 05/08/2024 
-- Design Name: 
-- Module Name:    next_instruction - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity next_instruction is
    Port ( current_pc  : in  STD_LOGIC_VECTOR (31 downto 0);
           next_pc  : out  STD_LOGIC_VECTOR (31 downto 0));
end next_instruction;

architecture Behavioral of next_instruction is

begin
--next_pc <= current_pc or "100" ;
next_pc <= std_logic_vector(unsigned(current_pc) + 4);

end Behavioral;