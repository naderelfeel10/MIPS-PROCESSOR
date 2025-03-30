library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor is
    Port ( 
        CLK : in STD_LOGIC; 
        RST : in STD_LOGIC; 
        Writedata, Dataadr : out STD_LOGIC_VECTOR(31 downto 0); 
        memwrite : out STD_LOGIC
    );
end Processor;

architecture Behavioral of Processor is
    component ALU is
        Port ( 
            data1 : in  STD_LOGIC_VECTOR (31 downto 0);
            data2 : in  STD_LOGIC_VECTOR (31 downto 0);
            aluop : in  STD_LOGIC_VECTOR (3 downto 0);
            dataout : out  STD_LOGIC_VECTOR (31 downto 0);
            zflag : out  STD_LOGIC
        );
    end component;

    component R_F2 is
        Port (  
            read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
            read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
            write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
            write_ena : in  STD_LOGIC;
            clk : in  STD_LOGIC;
            write_data : in  STD_LOGIC_VECTOR (31 downto 0);
            data1 : out  STD_LOGIC_VECTOR (31 downto 0);
            data2 : out  STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;

    component control is
        Port ( 
            OpCode : in  STD_LOGIC_VECTOR (5 downto 0);
            RegDest : out  STD_LOGIC;
            Jump : out  STD_LOGIC;
            Branch : out  STD_LOGIC;
            MemRead : out  STD_LOGIC;
            MemToReg : out  STD_LOGIC;
            AluOp : out  STD_LOGIC_VECTOR (1 downto 0);
            MemWrite : out  STD_LOGIC;
            AluSrc : out  STD_LOGIC;
            RegWrite : out  STD_LOGIC
        );
    end component;

    component dmem is -- data memory
        port (
            clk, we : in STD_LOGIC;
            a, wd : in STD_LOGIC_VECTOR (31 downto 0);
            rd : out STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;

    component imem is -- instruction memory
        port (
            a : in STD_LOGIC_VECTOR(31 downto 0);
            rd : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    component next_instruction is
        Port (
            current_pc : in  STD_LOGIC_VECTOR (31 downto 0);
            next_pc : out  STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;

    component program_counter is
        Port (
            clk : in  STD_LOGIC;
            data_in : in  STD_LOGIC_VECTOR (31 downto 0);
            data_out : out  STD_LOGIC_VECTOR (31 downto 0);
            rst : in  STD_LOGIC
        );
    end component;

    component shifter is
        Port (
            a : in  STD_LOGIC_VECTOR (31 downto 0);
            y : out  STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;

    component signext is
        Port (
            a : in  STD_LOGIC_VECTOR (15 downto 0);
            o : out  STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;

    component Adder_32bit is
        port (
            pc_in : in  std_logic_vector(31 downto 0);
            label_in : in  std_logic_vector(31 downto 0);
            Sum : out std_logic_vector(31 downto 0)
        );
    end component ;

    component MUX_2to1 is
        port (
            S : in  std_logic;                   
            D0, D1 : in  std_logic_vector(31 downto 0);  
            Y : out std_logic_vector(31 downto 0)      
        );
    end component;

    component MUX_2to1_5bits is
        port (
            S : in  std_logic;                   
            D0, D1 : in  std_logic_vector(4 downto 0);  
            Y : out std_logic_vector(4 downto 0)      
        );
    end component;

    component ALU_CTRL is
        Port ( 
            main_ctrl : in  STD_LOGIC_VECTOR (1 downto 0);
            func : in  STD_LOGIC_VECTOR (5 downto 0);
            Alu_out : out  STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    component shifter_26bit is
        Port (
            a : in  STD_LOGIC_VECTOR (25 downto 0);
            y : out  STD_LOGIC_VECTOR (27 downto 0)
        );
    end component;

    component jumbInst is
        Port (
            input_28 : in STD_LOGIC_VECTOR (27 downto 0);
            input_4 : in STD_LOGIC_VECTOR (3 downto 0);
            output_32 : out STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;

--signal  pc_in: STD_LOGIC_VECTOR (31 downto 0);
signal  pc_out: STD_LOGIC_VECTOR (31 downto 0);
signal  inst_signal: STD_LOGIC_VECTOR (31 downto 0) ;
signal  data1_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  data2_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  mux1_out: STD_LOGIC_VECTOR (4 downto 0);
signal  sign_ext_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  mux2_out_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  mux3_out_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  mux4_out_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  mux5_out_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  dmem_out_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  next_pc_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  sh26_signal: STD_LOGIC_VECTOR (27 downto 0);
signal  jumb_out_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  sh31_out_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  adder_out_signal: STD_LOGIC_VECTOR (31 downto 0);
signal  alu_zflag_signal: STD_LOGIC;

-- ctrl signals

signal RegDest_signal : STD_LOGIC;
signal Jump_signal : STD_LOGIC;
signal Branch_signal : STD_LOGIC;
signal MemRead_signal : STD_LOGIC;
signal MemToReg_signal : STD_LOGIC;
signal AluOp_signal : STD_LOGIC_VECTOR (1 downto 0);
signal MemWrite_signal : STD_LOGIC;
signal AluSrc_signal : STD_LOGIC;
signal RegWrite_signal : STD_LOGIC;

--alu signals
signal  alu_dataout_signal: STD_LOGIC_VECTOR (31 downto 0);

 -- alu ctrl signals 
signal  alu_ctrl_out_signal: STD_LOGIC_VECTOR (3 downto 0);
signal sig : std_logic :=(alu_zflag_signal and Branch_signal);
begin

    p_Counter : program_counter
    port map (
        clk => CLK,
        data_in => mux5_out_signal,
        data_out => pc_out,
        rst => RST
    );

    inst_mem : imem 
    port map (
        a => pc_out,
        rd => inst_signal
    );
 
    ctrl : control 
    port map ( 
        OpCode => inst_signal(31 downto 26),
        RegDest => RegDest_signal,
        Jump => Jump_signal, 
        Branch => Branch_signal ,
        MemRead => MemRead_signal ,
        MemToReg => MemToReg_signal ,
        AluOp => AluOp_signal,
        MemWrite => MemWrite_signal ,
        AluSrc => AluSrc_signal ,
        RegWrite => RegWrite_signal
    );

    mux1 : MUX_2to1_5bits
    port map (
        S  => RegDest_signal, 
        D0 => inst_signal(20 downto 16),
        D1 => inst_signal(15 downto 11),  
        Y  => mux1_out
    );
    
    register_file : R_F2 
    port map ( 
        read_sel1 => inst_signal(25 downto 21),
        read_sel2 => inst_signal(20 downto 16),
        write_sel => mux1_out,
        write_ena => RegWrite_signal,
        clk => CLK,
        write_data => mux3_out_signal,
        data1 => data1_signal,
        data2 => data2_signal
    );

    ALU_CTRL_inst : ALU_CTRL
    port map (
        main_ctrl => AluOp_signal, 
        func => inst_signal(5 downto 0), 
        Alu_out => alu_ctrl_out_signal 
    );
	 
    sign_ext : signext
    Port map ( 
        a => inst_signal(15 downto 0),
        o => sign_ext_signal
    );
    
    mux2 : MUX_2to1
    port map (
        S  => AluSrc_signal, 
        D0 => data2_signal,
        D1 => sign_ext_signal,  
        Y  => mux2_out_signal
    );

    ALU_Instance : ALU
    port map (
        data1 => data1_signal,        
        data2 => mux2_out_signal,    
        aluop => alu_ctrl_out_signal,
        dataout => alu_dataout_signal, 
        zflag => alu_zflag_signal
    );

    dmem_instance : dmem
    port map (
        clk => CLK,
        we => MemWrite_signal,
        a => alu_dataout_signal,
        wd => data2_signal,
        rd => dmem_out_signal
    );

    mux3 : MUX_2to1
    port map (
        S  => MemToReg_signal,
        D0 => alu_dataout_signal,
        D1 => dmem_out_signal,  
        Y  => mux3_out_signal
    );
	 
    nxt_ins : next_instruction
    Port map( 
        current_pc  => pc_out,
        next_pc  => next_pc_signal
    );
			  
    sh26 : shifter_26bit 
    Port map( 
        a => inst_signal(25 downto 0),
        y => sh26_signal
    );
		
    jumb  : jumbInst 
    Port map(
        input_28 => sh26_signal,
        input_4 => inst_signal(31 downto 28),
        output_32 => jumb_out_signal
    );
	
    sh31  : shifter
    Port map( 
        a => sign_ext_signal,
        y => sh31_out_signal
    );

    adder : Adder_32bit 
    port map (
        pc_in => next_pc_signal,
        label_in => sh31_out_signal,
        Sum => adder_out_signal 
    );

    mux4 : MUX_2to1
    port map (
        S  => sig,
        D0 => next_pc_signal,
        D1 => adder_out_signal,  
        Y  => mux4_out_signal
    );

    mux5 : MUX_2to1
    port map (
        S  => Jump_signal,
        D0 => mux4_out_signal,
        D1 => jumb_out_signal,  
        Y  => mux5_out_signal
    );
	 
    Writedata <= alu_dataout_signal;
    Dataadr <= dmem_out_signal; 
    memwrite <= memwrite_signal;

end Behavioral;
