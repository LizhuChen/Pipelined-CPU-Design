`timescale 1ns/1ns
module EX_MEM( rst, funct_i, clk, MemtoReg_i, RegWrite_i, MemRead_i, MemWrite_i, branch_i, bne_i, IDAdder_in, RD2_i, rt_rd_i, ALU_i, ALUZero_in, Jump_i, jumpaddr_i,
			MemtoReg_o, RegWrite_o, MemRead_o, MemWrite_o, branch_o, bne_o, IDAdder_out, RD2_o, rt_rd_o, ALU_o, ALUZero_out, isNE, Jump_o, jumpaddr_o) ;

	input	rst, clk ;	
	input	 		MemtoReg_i, RegWrite_i, MemRead_i, MemWrite_i, branch_i, bne_i, ALUZero_in, Jump_i; // input控制訊號 
	
	input[31:0]		IDAdder_in, RD2_i, ALU_i, jumpaddr_i ; 
	input[4:0]		rt_rd_i ;
	input   [5:0]	funct_i;


	output			MemtoReg_o, RegWrite_o, MemRead_o, MemWrite_o, branch_o, bne_o, ALUZero_out, isNE, Jump_o; // output控制訊號 
	output[31:0]	IDAdder_out, RD2_o,ALU_o, jumpaddr_o ; 
	output[4:0]		rt_rd_o ;


    reg	 		MemtoReg_o, RegWrite_o, MemRead_o, MemWrite_o, branch_o, bne_o, ALUZero_out, isNE, Jump_o; 
	reg[31:0]	IDAdder_out, RD2_o,ALU_o, jumpaddr_o ; 
	reg[4:0]	rt_rd_o ;

	always @( posedge clk ) begin
	
		if (rst) begin
			MemtoReg_o <= 1'd0 ;	
			RegWrite_o <= 1'd0 ;	
			MemRead_o <= 1'd0 ;	
			MemWrite_o <= 1'd0 ;
			branch_o <= 1'd0 ;
			bne_o <= 1'd0 ; 
			IDAdder_out <= 32'd0 ;
			ALUZero_out <= 1'd0 ;
			isNE <= 1'd0 ; 
			ALU_o <= 32'd0 ;
			RD2_o <= 32'd0 ;
			rt_rd_o <= 5'd0 ;
			Jump_o <= 1'd0 ;
			jumpaddr_o <= 32'd0 ;
		end

		else begin 
		
			if ( funct_i == 6'd2 ) begin
				MemtoReg_o <= 1'd0 ;	
				RegWrite_o <= 1'd0 ;	
				MemRead_o <= 1'd0 ;	
				MemWrite_o <= 1'd0 ;
				branch_o <= 1'd0 ;
				bne_o <= 1'd0 ; 
				IDAdder_out <= 32'd0 ;
				ALUZero_out <= 1'd0 ;
				isNE <= 1'd0 ; 
				ALU_o <= 32'd0 ;
				RD2_o <= 32'd0 ;
				rt_rd_o <= 5'd0 ;
				Jump_o <= 1'd0 ;
				jumpaddr_o <= 32'd0 ;
			end
			else begin
				if ( ALU_i != 32'dx ) begin
					if ( ALU_i < 0 ) 	
						isNE <= 1'd1 ; 
					else 				
						isNE <= 1'd0 ;
				end
				else 
					isNE <= 1'd0 ;

				MemtoReg_o <= MemtoReg_i ;	
				RegWrite_o <= RegWrite_i ;	
				MemRead_o <= MemRead_i ;	
				MemWrite_o <= MemWrite_i ;	
				branch_o <= branch_i ;
				bne_o <= bne_i ; 
				IDAdder_out <= IDAdder_in ;
				ALUZero_out <= ALUZero_in ;
				ALU_o <= ALU_i ;
				RD2_o <= RD2_i ;
				rt_rd_o <= rt_rd_i ;				
				Jump_o <= Jump_i ;
				jumpaddr_o <= jumpaddr_i ;
				
			end


		end

	end

endmodule