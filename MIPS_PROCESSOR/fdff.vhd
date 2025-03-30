library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
--use IEEE.UNSIGNED.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           zflag : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal result : STD_LOGIC_VECTOR(31 downto 0);
begin
  process(data1,data2,aluop)
   begin
	case aluop is
     when "0000" =>  -- and
	    result <= data1 and data2;
	  
	  when "0001" =>  -- or 
	  	 result <= data1 or data2;

     when "0010" =>  -- add 
	  
	    result <= std_logic_vector( unsigned(data1)  +   unsigned(data2) );
	   
     when "0110" =>  -- sub  
	    result <= std_logic_vector( unsigned(data1)  -  unsigned(data2)  );

     when "0111" =>  -- SLT
	  
      if(data1 < data2)then
		
       result <= X"00000001" ;
		  else
		  
		 result <= X"00000000";
		 
		 end if;

		 
     when "1100" =>  -- Nor  
	  	 result <= data1 nor data2;
	  when others =>  null;-- others
           result <= x"00000000";	  

  end case;
  end process;
  
  dataout <= result;
  zflag <='1' when result <= X"00000000"else  
          '0';

end Behavioral;