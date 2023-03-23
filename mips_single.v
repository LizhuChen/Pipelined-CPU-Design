`timescale 1ns/1ns
module mips_single(clk,rst);
	input clk, rst;

	// instruction bus
	wire[31:0] instr; //接pipelined RD 結果
	wire[31:0] instrtmp; //接Instruction Memory RD結果
	// break out important fields from instruction
	

	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;
	wire [31:0]  IDEX_imm_extend;		
	
	// datapath signals
	wire cout ;  // carryout
	
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, 
                alu_b, alu_out, b_tgt, pc_next,
                pc, pc_incr, dmem_rdata, jump_addr, branch_addr;

	// control signals
    wire RegWrite, Branch, Bne, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump ; 
    wire [1:0] ALUOp;
    wire [2:0] Operation;

	//reg	 [31:0]instr ; 

    assign opcode = instr[31:26];
    assign rs = instr[25:21];
    assign rt = instr[20:16];
    assign rd = instr[15:11];
    assign shamt = instr[10:6];
    assign funct = instr[5:0];
    assign immed = instr[15:0];
    assign jumpoffset = instr[25:0];
	
	//initial begin
		//PCSrc = 1'd0 ;
	//end
	
	// branch offset shifter
    assign b_offset = IDEX_imm_extend << 2;
	
	// jump offset shifter & concatenation
    assign jump_addr = { pc_incr[31:28], jumpoffset <<2 }; // 判斷是否要branch

	// module instantiations
	reg  en_reg ; 
	
	always @ ( * ) begin
		if ( instrtmp[31:26] == 6'd4 || instrtmp[31:26] == 6'd5 )  // beq bne opcode=>5
		begin  
			en_reg = 1'd0 ;
			#40 
			en_reg = 1'd1 ;
		end
		
		else if ( instrtmp[31:26] == 6'd0 && instrtmp[5:0] == 6'd25 )  // mul
		begin  
			en_reg = 1'd0 ;
			#340 
			en_reg = 1'd1 ;
		end		
		
		else if ( instrtmp[31:26] == 6'd2 )  // j
		begin  
			en_reg = 1'd0 ;
			#40 
			en_reg = 1'd1 ;
		end

		else 
			en_reg = 1'd1 ;
	end
	

	
    /******************* IF_ID *******************/

    wire    [31:0]  IFID_pc_add_4;          // IFID pc to Add_Branch, IDEX 

    IF_ID IF_ID (
		.rst		(rst),
        .clk        (clk),                  // clk
        .pc_incr_i (pc_incr),              // pc_incr input
        .inst_i     (instrtmp),                // instr
        .pc_incr_o (IFID_pc_add_4),        // 沿用 IFID_pc_add_4
        .inst_o     (instr)             // 沿用 IFID_inst
    ); 

    /******************* ID_EX *******************/

	wire    [31:0]  IDEX_Adder ,IDEX_RD1,IDEX_RD2, IDEX_jump_addr;
	wire    [4:0]   IDEX_rt, IDEX_rd ;
	wire	[5:0]	IDEX_funct;
	wire    IDEX_RegDst, IDEX_ALUSrc, IDEX_MemtoReg, IDEX_RegWrite, IDEX_MemRead, IDEX_MemWrite, IDEX_Branch, IDEX_bne, IDEX_Jump;
	wire	[1:0]	 IDEX_ALUOp ;
	
    ID_EX ID_EX (
		.rst		(rst),
        .clk        (clk),                   
        .RegDst_i        (RegDst),      
        .ALUSrc_i        (ALUSrc),       
		.MemtoReg_i		 (MemtoReg),
		.RegWrite_i      (RegWrite),
		.MemRead_i       (MemRead),
		.MemWrite_i      (MemWrite),
		.branch_i        (Branch),
		.bne_i			 (Bne) , 
		.ALUOp_i         (ALUOp),	
		.Jump_i			 (Jump),

        .pc_add_4_i (IFID_pc_add_4),        // 沿用 IFID_pc_add_4
        .RD1_i      (rfile_rd1),               // RD1出來是rfile_rd1
        .RD2_i      (rfile_rd2),               // RD1出來是rfile_rd2
        .Extend_i   (extend_immed),            // extend_immed
        .rt_i       (rt),                   // 沿用 IFID_inst
        .rd_i       (rd),                   // 沿用 IFID_inst
		.funct_i	(funct),				//傳進FUNCTION
		.jumpaddr_i (jump_addr),
		
        .RegDst_o        (IDEX_RegDst),         
        .ALUSrc_o        (IDEX_ALUSrc),       
		.MemtoReg_o		 (IDEX_MemtoReg),
		.RegWrite_o      (IDEX_RegWrite),
		.MemRead_o       (IDEX_MemRead),
		.MemWrite_o      (IDEX_MemWrite),
		.branch_o        (IDEX_Branch),
		.bne_o			 (IDEX_bne), 
		.ALUOp_o         (IDEX_ALUOp),
		.Jump_o			 (IDEX_Jump),		
		
        .RD1_o      (IDEX_RD1),            
        .RD2_o      (IDEX_RD2),            
        .Extend_o   (IDEX_imm_extend),      
		.pc_add_4_o (IDEX_Adder),             // 要和左移2接到ADD
        .rt_o       (IDEX_rt),                   // 沿用 IFID_inst
        .rd_o       (IDEX_rd),                   // 沿用 IFID_inst	
		.funct_o    (IDEX_funct),                //傳出FUNCTION
		.jumpaddr_o (IDEX_jump_addr)                //傳出FUNCTION
		
    );

    /******************* EX_MEM ******************/

    wire    [31:0]  EXMEM_ADD;
    wire    	    EXMEM_Zero, EXMEM_isNe ; 	
    wire    [31:0]  EXMEM_ALU_output,EXMEM_RD2, EXMEM_jump_addr;       // ALU output to Data_Memory, MUX 6, MUX 7 
    wire    [4:0]   EXMEM_rtrdmux;          // RD address to MEMWB, Forward Unit 
	wire    EXMEM_MemtoReg, EXMEM_RegWrite, EXMEM_MemRead, EXMEM_MemWrite, EXMEM_branch, EXMEM_Jump, EXMEM_bne; 
    EX_MEM EX_MEM (
		.rst		  (rst),
        .clk          (clk),

		.MemtoReg_i   (IDEX_MemtoReg),
		.RegWrite_i   (IDEX_RegWrite),
		.MemRead_i    (IDEX_MemRead),
		.MemWrite_i   (IDEX_MemWrite),
		.branch_i     (IDEX_Branch),
		.bne_i		  (IDEX_bne), 
		.Jump_i		  (IDEX_Jump),
		.funct_i	  (IDEX_funct),

        .IDAdder_in   (b_tgt),
        .ALUZero_in   (Zero),
        .ALU_i        (alu_out),
		.RD2_i        (IDEX_RD2),
		.rt_rd_i      (rfile_wn),
		.jumpaddr_i   (IDEX_jump_addr),
		
		.MemtoReg_o   (EXMEM_MemtoReg),
		.RegWrite_o   (EXMEM_RegWrite),
		.MemRead_o    (EXMEM_MemRead),
		.MemWrite_o   (EXMEM_MemWrite),
		.branch_o     (EXMEM_branch),
		.bne_o		  (EXMEM_bne), 
		.Jump_o		  (EXMEM_Jump),

        .IDAdder_out  (EXMEM_ADD),
        .ALUZero_out  (EXMEM_Zero),
		.isNE		  (EXMEM_isNe), 
		.ALU_o        (EXMEM_ALU_output),
		.RD2_o        (EXMEM_RD2),
		.rt_rd_o      (EXMEM_rtrdmux),
		.jumpaddr_o   (EXMEM_jump_addr)
    );

    /****************** MEM_WB *******************/
	

    wire    [31:0]   MEMWB_RD_addr;          
	wire    [31:0]   MEMWB_ALU; 
	wire    [4:0]    MEMWB_rtrdmux;
	wire    		 MEMWB_MemtoReg, MEMWB_RegWrite ;
	wire 			 PCSrc_beq,  PCSrc_bne ; 
	
	
    MEM_WB MEM_WB (
		.rst			 (rst),
        .clk             (clk),                      // clk

		.MemtoReg_i      (EXMEM_MemtoReg),
		.RegWrite_i      (EXMEM_RegWrite),

        .dmem_rdata_i    (dmem_rdata),                    // dmem_rdata
        .ALUoutput_i     (EXMEM_ALU_output),         // 沿用 EXMEM_ALU_output
        .reg_dst_i       (EXMEM_rtrdmux),            // 沿用 EXMEM_RD_addr
		
		.MemtoReg_o      (MEMWB_MemtoReg),
		.RegWrite_o      (MEMWB_RegWrite),

        .dmem_rdata_o    (MEMWB_RD_addr),             // dmem_rdata
        .ALUoutput_o     (MEMWB_ALU),                 // alu_out
        .reg_dst_o       (MEMWB_rtrdmux)             // 沿用 MEMWB_RD_addr
    );
	
	
	reg32 PC( .clk(clk), .rst(rst), .en_reg(en_reg), .d_in(pc_next), .d_out(pc) ); // 
	// sign-extender
    sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) );
    add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) );                           // PC + 4
    add32 BRADD( .a(IDEX_Adder), .b(b_offset), .result(b_tgt) );                    // PC+常數左移兩位
    TotalALU totalALU( .clk(clk), .reset(rst), .control(Operation), .Signal(IDEX_funct) , .dataA(IDEX_RD1), .dataB(alu_b), .Output(alu_out), .zero(Zero)); //差ctl
    and BR_AND(PCSrc_beq, EXMEM_branch, EXMEM_Zero); 
	and BNE_AND(PCSrc_bne, EXMEM_bne, EXMEM_isNe) ; 
	xor ( PCSrc, PCSrc_beq, PCSrc_bne ) ; 

    mux2 #(5) RFMUX( .sel(IDEX_RegDst), .a(IDEX_rt), .b(IDEX_rd), .y(rfile_wn) );      //mux rt和rd確認輸入信號
    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(EXMEM_ADD), .y(branch_addr) ); //PC MUX結果傳回PC
    mux2 #(32) JMUX( .sel(EXMEM_Jump), .a(branch_addr), .b(EXMEM_jump_addr), .y(pc_next) );   // 判斷是否跳躍指令 branch_addr jump_addr//////////////
    mux2 #(32) ALUMUX( .sel(IDEX_ALUSrc), .a(IDEX_RD2), .b(IDEX_imm_extend), .y(alu_b) );    //選擇RD2或立即值
    mux2 #(32) WRMUX( .sel(MEMWB_MemtoReg), .a(MEMWB_ALU), .b(MEMWB_RD_addr), .y(rfile_wd) ); //選擇RD 或 ALU結果

    control_single CTL(.instr(instr), .opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), 
                       .Bne(Bne), .Jump(Jump), .ALUOp(ALUOp));
    alu_ctl ALUCTL( .ALUOp(IDEX_ALUOp), .Funct(IDEX_funct), .ALUOperation(Operation) ); 
    reg_file RegFile( .clk(clk), .RegWrite(MEMWB_RegWrite), .RN1(rs), .RN2(rt), .WN(MEMWB_rtrdmux), 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );                       //差RegWrite輸入
    memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instrtmp) );
    memory DatMem( .clk(clk), .MemRead(EXMEM_MemRead), .MemWrite(EXMEM_MemWrite), .wd(EXMEM_RD2), 
				   .addr(EXMEM_ALU_output), .rd(dmem_rdata) );	                                //差輸入訊號
    
			   
endmodule
