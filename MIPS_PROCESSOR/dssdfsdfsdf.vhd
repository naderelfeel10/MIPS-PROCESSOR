----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:40 04/24/2024 
-- Design Name: 
-- Module Name:    REG22 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created-- FPGA projects using VHDL/ VHDL 
-- fpga4student.com
-- VHDL code for D Flip FLop
-- VHDL code for Rising edge D flip flop with Synchronous Reset input 
Library IEEE;
USE IEEE.Std_logic_1164.all;

entity REG22 is 

   port(
      Q : out std_logic_vector(31 downto 0);    
      clk :in std_logic;  
      async_reset: in std_logic;  
		write_ena: in std_logic;
      D :in  std_logic_vector (31 downto 0)   
   );
end REG22;
architecture Behavioral of REG22 is  

signal wr : std_logic_vector(31 downto 0);

begin 

 	 Q <= wr when clk'event and clk='1';
	
    --Q <= (others => '0') when  async_reset = '1'  ;
	 
	 
	wr<= D when write_ena='1' and clk'event and clk='0' ;
				
end Behavioral ;