library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity R_F2 is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end R_F2;

architecture Behavioral of R_F2 is

component decoder is
   
    Port (
        write_sel1 : in  std_logic_vector(4  downto 0);
        output : out std_logic_vector(31 downto 0)
    );
end component;

component REG22 is 

   port(
      Q : out std_logic_vector(31 downto 0);    
      clk :in std_logic;  
      async_reset: in std_logic;  
		write_ena: in std_logic;
      D :in  std_logic_vector (31 downto 0)   
   );
end component;


component mux1 is
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
end component;

signal dec_sig : std_logic_vector(31 downto 0);
signal reg_sig : std_logic_vector(31 downto 0);
signal async_reset1 : std_logic;
Signal reg0out : std_logic_vector (31 downto 0);
Signal reg1out : std_logic_vector (31 downto 0);
Signal reg2out : std_logic_vector (31 downto 0);
Signal reg3out : std_logic_vector (31 downto 0);
Signal reg4out : std_logic_vector (31 downto 0);
Signal reg5out : std_logic_vector (31 downto 0);
Signal reg6out : std_logic_vector (31 downto 0);
Signal reg7out : std_logic_vector (31 downto 0);
Signal reg8out : std_logic_vector (31 downto 0);
Signal reg9out : std_logic_vector (31 downto 0);
Signal reg10out : std_logic_vector (31 downto 0);
Signal reg11out : std_logic_vector (31 downto 0);
Signal reg12out : std_logic_vector (31 downto 0);
Signal reg13out : std_logic_vector (31 downto 0);
Signal reg14out : std_logic_vector (31 downto 0);
Signal reg15out : std_logic_vector (31 downto 0);
Signal reg16out : std_logic_vector (31 downto 0);
Signal reg17out : std_logic_vector (31 downto 0);
Signal reg18out : std_logic_vector (31 downto 0);
Signal reg19out : std_logic_vector (31 downto 0);
Signal reg20out : std_logic_vector (31 downto 0);
Signal reg21out : std_logic_vector (31 downto 0);
Signal reg22out : std_logic_vector (31 downto 0);
Signal reg23out : std_logic_vector (31 downto 0);
Signal reg24out : std_logic_vector (31 downto 0);
Signal reg25out : std_logic_vector (31 downto 0);
Signal reg26out : std_logic_vector (31 downto 0);
Signal reg27out : std_logic_vector (31 downto 0);
Signal reg28out : std_logic_vector (31 downto 0);
Signal reg29out : std_logic_vector (31 downto 0);
Signal reg30out : std_logic_vector (31 downto 0);
Signal reg31out : std_logic_vector (31 downto 0);

signal clk1: std_logic ;

begin
  
  --clk1 <='1' when (boolean(dec_sig(0)) and write_ena='1' and (clk' event and clk='0') = '1'); 
  
dec : decoder 
port map (
          write_sel1 => write_sel,
			 output     => dec_sig
          );

reg0 : REG22 port map (Q => reg0out,clk => clk ,write_ena => dec_sig(0),async_reset => '0', D =>write_data);          
reg1 : REG22 port map (Q => reg1out,clk => clk ,write_ena => dec_sig(1),async_reset => '0', D =>write_data);          
reg2 : REG22 port map (Q => reg2out,clk => clk ,write_ena => dec_sig(2),async_reset => '0', D =>write_data);          
reg3 : REG22 port map (Q => reg3out,clk => clk ,write_ena => dec_sig(3),async_reset => '0', D =>write_data);          
reg4 : REG22 port map (Q => reg4out,clk => clk ,write_ena => dec_sig(4),async_reset => '0', D =>write_data);          
reg5 : REG22 port map (Q => reg5out,clk => clk ,write_ena => dec_sig(5),async_reset => '0', D =>write_data);          
reg6 : REG22 port map (Q => reg6out,clk => clk ,write_ena => dec_sig(6),async_reset => '0', D =>write_data);          
reg7 : REG22 port map (Q => reg7out,clk => clk ,write_ena => dec_sig(7),async_reset => '0', D =>write_data);          
reg8 : REG22 port map (Q => reg8out,clk => clk ,write_ena => dec_sig(8),async_reset => '0', D =>write_data);          
reg9 : REG22 port map (Q => reg9out,clk => clk ,write_ena => dec_sig(9),async_reset => '0', D =>write_data);          
reg10 : REG22 port map (Q => reg10out,clk => clk ,write_ena => dec_sig(10),async_reset => '0', D =>write_data);          
reg11 : REG22 port map (Q => reg11out,clk => clk ,write_ena => dec_sig(11),async_reset => '0', D =>write_data);          
reg12 : REG22 port map (Q => reg12out,clk => clk ,write_ena => dec_sig(12),async_reset => '0', D =>write_data);          
reg13 : REG22 port map (Q => reg13out,clk => clk ,write_ena => dec_sig(13),async_reset => '0', D =>write_data);          
reg14 : REG22 port map (Q => reg14out,clk => clk ,write_ena => dec_sig(14),async_reset => '0', D =>write_data);          
reg15 : REG22 port map (Q => reg15out,clk => clk ,write_ena => dec_sig(15),async_reset => '0', D =>write_data);          
reg16 : REG22 port map (Q => reg16out,clk => clk ,write_ena => dec_sig(16),async_reset => '0', D =>write_data);          
reg17 : REG22 port map (Q => reg17out,clk => clk ,write_ena => dec_sig(17),async_reset => '0', D =>write_data);          
reg18 : REG22 port map (Q => reg18out,clk => clk ,write_ena => dec_sig(18),async_reset => '0', D =>write_data);          
reg19 : REG22 port map (Q => reg19out,clk => clk ,write_ena => dec_sig(19),async_reset => '0', D =>write_data);          
reg20 : REG22 port map (Q => reg20out,clk => clk ,write_ena => dec_sig(20),async_reset => '0', D =>write_data); 
         
reg21 : REG22 port map (Q => reg21out,clk => clk ,write_ena => dec_sig(21),async_reset => '0', D =>write_data); 
         
reg222 : REG22 port map (Q => reg22out,clk => clk ,write_ena => dec_sig(22),async_reset => '0', D =>write_data);          
reg23 : REG22 port map (Q => reg23out,clk => clk ,write_ena => dec_sig(23),async_reset => '0', D =>write_data);          
reg24 : REG22 port map (Q => reg24out,clk => clk ,write_ena => dec_sig(24),async_reset => '0', D =>write_data);          
reg25 : REG22 port map (Q => reg25out,clk => clk ,write_ena => dec_sig(25),async_reset => '0', D =>write_data);          
reg26 : REG22 port map (Q => reg26out,clk => clk ,write_ena => dec_sig(26),async_reset => '0', D =>write_data);          
reg27 : REG22 port map (Q => reg27out,clk => clk ,write_ena => dec_sig(27),async_reset => '0', D =>write_data);          
reg28 : REG22 port map (Q => reg28out,clk => clk ,write_ena => dec_sig(28),async_reset => '0', D =>write_data);          
reg29 : REG22 port map (Q => reg29out,clk => clk ,write_ena => dec_sig(29),async_reset => '0', D =>write_data);          
reg30 : REG22 port map (Q => reg30out,clk => clk ,write_ena => dec_sig(30),async_reset => '0', D =>write_data);          
reg31 : REG22 port map (Q => reg31out,clk => clk ,write_ena => dec_sig(31),async_reset => '0', D =>write_data);          
         




mux11: mux1 port map ( 
in0 =>reg0out,
in1 =>reg1out,
in2=>reg2out,
in3=>reg3out,
in4=>reg4out,
in5=>reg5out,
in6=>reg6out,
in7=>reg7out,
in8=>reg8out,
in9=>reg9out,
in10=>reg10out,
in11=>reg11out,
in12=>reg12out,
in13=>reg13out,
in14=>reg14out,
in15=>reg15out,
in16=>reg16out,
in17=>reg17out,
in18=>reg18out,
in19=>reg19out,
in20=>reg20out,
in21=>reg21out,
in22=>reg22out,
in23=>reg23out,
in24=>reg24out,
in25=>reg25out,
in26=>reg26out,
in27=>reg27out,
in28=>reg28out,
in29=>reg29out,
in30=>reg30out,
in31=>reg31out,
sel=>read_sel1,
outs=>data1
);


mux2: mux1 port map ( 
in0=>reg0out,
in1=>reg1out,
in2=>reg2out,
in3=>reg3out,
in4=>reg4out,
in5=>reg5out,
in6=>reg6out,
in7=>reg7out,
in8=>reg8out,
in9=>reg9out,
in10=>reg10out,
in11=>reg11out,
in12=>reg12out,
in13=>reg13out,
in14=>reg14out,
in15=>reg15out,
in16=>reg16out,
in17=>reg17out,
in18=>reg18out,
in19=>reg19out,
in20=>reg20out,
in21=>reg21out,
in22=>reg22out,
in23=>reg23out,
in24=>reg24out,
in25=>reg25out,
in26=>reg26out,
in27=>reg27out,
in28=>reg28out,
in29=>reg29out,
in30=>reg30out,
in31=>reg31out,
sel=>read_sel2,
outs=>data2
);



end Behavioral;