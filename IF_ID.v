`timescale 1ns/1ns
module IF_ID( rst, clk, pc_incr_i, inst_i , pc_incr_o, inst_o );

input	rst, clk ;	
input   [31:0]  pc_incr_i, inst_i; //PC傳進來的值 & Instruction Memory 傳進來的值
output  [31:0]  pc_incr_o, inst_o; //PC傳出去的值 & Instruction Memory 傳出去的值

reg     [31:0]  pc_incr_o, inst_o; 
reg	[1:0]	num = 2'd0 ;
reg [1:0]	num1 = 2'd0 ;
reg [5:0]   num2 = 6'd0 ;

always @(posedge clk) begin

	if(rst) begin
		pc_incr_o <= 32'd0;
		inst_o <= 32'd0;
	end
	
	else begin
		if ( inst_i[31:26] == 6'd4 || inst_i[31:26] == 6'd5 ) begin        // beq
			if ( num == 2'd1 || num == 2'd2 ) begin
				pc_incr_o <= pc_incr_i; // | pc_incr_o <= pc_incr_i;
				inst_o <= 32'd0 ;
				num <= num + 1 ;
				if ( num == 2'd3 ) 
					num = 2'd0 ;
			end

			else if ( num == 2'd0 ) begin
				num <= num + 1 ;
				pc_incr_o <= pc_incr_i;
				inst_o <= inst_i;
			end
		end
		
		else if ( inst_i[31:26] == 6'd0 && inst_i[5:0] == 6'd25 ) begin        // mul
			if ( num2 == 6'd0 ) begin
				num2 <= num2 + 1 ;
				pc_incr_o <= pc_incr_i;
				inst_o <= inst_i;
			end
			else 
			begin
				pc_incr_o <= pc_incr_i; // | pc_incr_o <= pc_incr_i;
				inst_o <= 32'd0 ;
				num2 <= num2 + 1 ;
				if ( num2 == 6'd34 ) 
					num2 = 6'd0 ;
			end
		end
		
		else if ( inst_i[31:26] == 6'd2 ) begin // jump
			if ( num1 == 2'd1 ) begin
				pc_incr_o <= pc_incr_i; // | pc_incr_o <= pc_incr_i;
				inst_o <= 32'd0 ;
				num1 <= num1 + 1 ;
				if ( num1 == 2'd2 ) 
					num1 = 2'd0 ;
			end

			else if ( num1 == 2'd0 ) begin
				num1 <= num1 + 1 ;
				pc_incr_o <= pc_incr_i;
				inst_o <= inst_i;
			end
		end
			
		else begin
			pc_incr_o <= pc_incr_i;
			inst_o <= inst_i;
		end
	end
end

endmodule