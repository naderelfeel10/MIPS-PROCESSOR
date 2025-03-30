----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:11:56 04/23/2024 
-- Design Name: 
-- Module Name:    mux546 - Behavioral 
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

entity mux1 is
--generic (n:integer:=32);
    Port ( 
	       
	        in0 : in  STD_LOGIC_VECTOR (31 downto 0);
           in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           in2 : in  STD_LOGIC_VECTOR (31 downto 0);
           in3 : in  STD_LOGIC_VECTOR (31 downto 0);
           in4 : in  STD_LOGIC_VECTOR (31 downto 0);
           in5 : in  STD_LOGIC_VECTOR (31 downto 0);
           in6 : in  STD_LOGIC_VECTOR (31 downto 0);
           in7 : in  STD_LOGIC_VECTOR (31 downto 0);
           in8 : in  STD_LOGIC_VECTOR (31 downto 0);
           in9 : in  STD_LOGIC_VECTOR (31 downto 0);
           in10 : in  STD_LOGIC_VECTOR (31 downto 0);
           in11 : in  STD_LOGIC_VECTOR (31 downto 0);
           in12 : in  STD_LOGIC_VECTOR (31 downto 0);
           in13 : in  STD_LOGIC_VECTOR (31 downto 0);
           in14 : in  STD_LOGIC_VECTOR (31 downto 0);
           in15 : in  STD_LOGIC_VECTOR (31 downto 0);
           in16 : in  STD_LOGIC_VECTOR (31 downto 0);
           in17 : in  STD_LOGIC_VECTOR (31 downto 0);
           in18 : in  STD_LOGIC_VECTOR (31 downto 0);
           in19 : in  STD_LOGIC_VECTOR (31 downto 0);
           in20 : in  STD_LOGIC_VECTOR (31 downto 0);
           in21 : in  STD_LOGIC_VECTOR (31 downto 0);
           in22 : in  STD_LOGIC_VECTOR (31 downto 0);
           in23 : in  STD_LOGIC_VECTOR (31 downto 0);
           in24 : in  STD_LOGIC_VECTOR (31 downto 0);
           in25 : in  STD_LOGIC_VECTOR (31 downto 0);
           in26 : in  STD_LOGIC_VECTOR (31 downto 0);
           in27 : in  STD_LOGIC_VECTOR (31 downto 0);
           in28 : in  STD_LOGIC_VECTOR (31 downto 0);
           in29 : in  STD_LOGIC_VECTOR (31 downto 0);
           in30 : in  STD_LOGIC_VECTOR (31 downto 0);
           in31 : in  STD_LOGIC_VECTOR (31 downto 0);    
            sel : in  STD_LOGIC_VECTOR (4 downto 0);
           outs : out  STD_LOGIC_VECTOR (31 downto 0));	
          
end mux1;

architecture Behavioral of mux1 is

begin
outs <= 
     in0 when (sel="00000") else 
     in1 when (sel="00001") else
	  in2 when (sel="00010") else
	  in3 when (sel="00011") else
	  in4 when (sel="00100") else
	  in5 when (sel="00101") else
	  in6 when (sel="00110") else
	  in7 when (sel="00111") else
	  in8 when (sel="01000") else
	  in9 when (sel="01001") else
     in10 when (sel="01010") else
	  in11 when (sel="01011") else
	  in12 when (sel="01100") else
	  in13 when (sel="01101") else
	  in14 when (sel="01110") else
	  in15 when (sel="01111") else
	  in16 when (sel="10000") else
	  in17 when (sel="10001") else
	  in18 when (sel="10010") else
	  in19 when (sel="10011") else
	  in20 when (sel="10100") else
	  in21 when (sel="10101") else
	  in22 when (sel="10110") else
	  in23 when (sel="10111") else
	  in24 when (sel="11000") else
	  in25 when (sel="11001") else
	  in26 when (sel="11010") else
	  in27 when (sel="11011") else
	  in28 when (sel="11100") else
	  in29 when (sel="11101") else
	  in30 when (sel="11110") else
	  in31 when (sel="11111") ;
	    

end Behavioral;