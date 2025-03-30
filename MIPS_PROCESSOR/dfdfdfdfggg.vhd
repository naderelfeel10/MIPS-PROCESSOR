----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:46:27 05/09/2024 
-- Design Name: 
-- Module Name:    ALU_CTRL - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_CTRL is
    Port ( main_ctrl : in  STD_LOGIC_VECTOR (1 downto 0);
           func : in  STD_LOGIC_VECTOR (5 downto 0);
           Alu_out : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_CTRL;

architecture Behavioral of ALU_CTRL is
signal result : STD_LOGIC_VECTOR(2 downto 0);
begin

  process(main_ctrl,func)
   begin
    Alu_out(3) <= '0';
	 Alu_out(2) <= main_ctrl(0) or (main_ctrl(1) and func(1));
	 Alu_out(1) <= not main_ctrl(1) or not func(2);
	 Alu_out(1) <= (func(3) or func(0)) and main_ctrl(1); 

	end process;


end Behavioral;

