`timescale 1ns/1ns
module ID_EX( rst, clk, funct_i, RegDst_i, ALUSrc_i, MemtoReg_i, RegWrite_i, MemRead_i, MemWrite_i ,branch_i, bne_i, ALUOp_i, pc_add_4_i, RD1_i, RD2_i, Extend_i, rt_i, rd_i, Jump_i, jumpaddr_i,
			funct_o, RegDst_o, ALUSrc_o, MemtoReg_o, RegWrite_o, MemRead_o, MemWrite_o, bne_o, branch_o, ALUOp_o, pc_add_4_o, RD1_o, RD2_o, rt_o, rd_o, Extend_o, Jump_o, jumpaddr_o);

	input	rst, clk ;	

	input			RegDst_i, ALUSrc_i, MemtoReg_i, RegWrite_i, MemRead_i, MemWrite_i, branch_i, bne_i, Jump_i; // input控制訊號 
	input	[1:0]	ALUOp_i ;	// input控制訊號 
	input   [31:0]  RD1_i, RD2_i; 
	input   [4:0]   rt_i, rd_i;
	input   [5:0]	funct_i;		
	input   [31:0]  Extend_i, pc_add_4_i, jumpaddr_i;
	
	

	output			 RegDst_o, ALUSrc_o, MemtoReg_o, RegWrite_o, MemRead_o, MemWrite_o, branch_o, bne_o, Jump_o;	// output控制訊號 
	output	 [1:0]	 ALUOp_o ;	// output控制訊號 
	output   [31:0]  RD1_o, RD2_o;
	output   [4:0]   rt_o, rd_o;
	output   [5:0]	 funct_o;	
	output   [31:0]  Extend_o, pc_add_4_o, jumpaddr_o;
	


	reg				 RegDst_o, ALUSrc_o, MemtoReg_o, RegWrite_o, MemRead_o, MemWrite_o, branch_o, bne_o, Jump_o;	// output控制訊號 
	reg		[1:0]	 ALUOp_o ;	// output控制訊號 
	reg     [31:0]   RD1_o, RD2_o; 
	reg     [4:0]    rt_o, rd_o; 
	reg     [5:0]	 funct_o;
	reg		[31:0]   Extend_o,pc_add_4_o, jumpaddr_o;

	always @(posedge clk) begin
		if (rst) begin
			pc_add_4_o <= 32'd0	;
			RD1_o <= 32'd0 ;
			RD2_o <= 32'd0 ;
			rt_o <= 5'd0 ;
			rd_o <=	5'd0 ;
			funct_o <= 6'd0 ;
			Extend_o <= 32'd0 ;
			jumpaddr_o <= 32'd0 ;

			RegDst_o <= 1'd0 ;	
			ALUSrc_o <= 1'd0 ;		
			MemtoReg_o <= 1'd0 ;	
			RegWrite_o <= 1'd0 ;	
			MemRead_o <= 1'd0 ;		
			MemWrite_o <= 1'd0 ;	
			branch_o <= 1'd0 ;
			bne_o <= 1'b0 ; 
			ALUOp_o <= 2'd0 ;	
			Jump_o <= 1'd0 ;
				
		end
		
		else begin
		
			if ( funct_i == 6'd2 ) begin
			
				pc_add_4_o <= 32'd0	;
				RD1_o <= 32'd0 ;
				RD2_o <= 32'd0 ;
				rt_o <= 5'd0 ;
				rd_o <=	5'd0 ;
				funct_o <= 6'd0 ;
				Extend_o <= 32'd0 ;
				jumpaddr_o <= 32'd0 ;
			
				RegDst_o <= 1'd0 ;	
				ALUSrc_o <= 1'd0 ;		
				MemtoReg_o <= 1'd0 ;	
				RegWrite_o <= 1'd0 ;	
				MemRead_o <= 1'd0 ;		
				MemWrite_o <= 1'd0 ;	
				branch_o <= 1'd0 ;
				bne_o <= 1'b0 ; 
				ALUOp_o <= 2'd0 ;
				Jump_o <= 1'd0 ;
			end
			else begin
				pc_add_4_o <= pc_add_4_i ;
				RD1_o <= RD1_i ;
				RD2_o <= RD2_i ;
				rt_o <= rt_i ;
				rd_o <=	rd_i ;
				funct_o <= funct_i ;
				Extend_o <= Extend_i ;
				jumpaddr_o <= jumpaddr_i ;

				RegDst_o <= RegDst_i ;		
				ALUSrc_o <= ALUSrc_i ;		
				MemtoReg_o <= MemtoReg_i ;	
				RegWrite_o <= RegWrite_i ;	
				MemRead_o <= MemRead_i ;	
				MemWrite_o <= MemWrite_i ;	
				branch_o <= branch_i ;
				bne_o <= bne_i ; 
				ALUOp_o <= ALUOp_i ;
				Jump_o <= Jump_i ;
			end
		end
	end

endmodule