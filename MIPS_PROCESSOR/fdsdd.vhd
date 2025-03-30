library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control is
    Port ( OpCode : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDest : out  STD_LOGIC;
           Jump : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           AluOp : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWrite : out  STD_LOGIC;
           AluSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
end control;

architecture Behavioral of control is

begin
process (OpCode)
begin

RegWrite <='0';

Case OpCode is 

when "000000"=> --RType
RegDest<='1';
Jump<='0';
Branch<='0';
MemRead<='0';
MemToReg<='0';
AluOp<="10";
MemWrite<='0';
AluSrc<='0';
RegWrite<='1';

when "100011"=> -- LW
RegDest<='0';
Jump<='0';
Branch<='0';
MemRead<='1';
MemToReg<='1';
AluOp<="00";
MemWrite<='0';
AluSrc<='1';
RegWrite<='1';

when "101011"=> -- SW
RegDest<='X';
Jump<='0';
Branch<='0';
MemRead<='0';
MemToReg<='X';
AluOp<="00";
MemWrite<='1';
AluSrc<='1';
RegWrite<='0';

when "000100"=> -- Branch
RegDest<='X';
Jump<='0';
Branch<='1';
MemRead<='0';
MemToReg<='X';
AluOp<="01";
MemWrite<='0';
AluSrc<='0';
RegWrite<='0';

when "000010"=> -- J
RegDest<='X';
Jump<='1';
Branch<='0';
MemRead<='0';
MemToReg<='X';
AluOp<="00";
MemWrite<='0';
AluSrc<='0';
RegWrite<='0';

when others => null; -- J
RegDest<='0';
Jump<='0';
Branch<='0';
MemRead<='0';
MemToReg<='0';
AluOp<="00";
MemWrite<='0';
AluSrc<='0';
RegWrite<='0';

end case;
end process;
end Behavioral;