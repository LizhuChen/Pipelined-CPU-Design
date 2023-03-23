`timescale 1ns/1ns
module MEM_WB( rst, clk, MemtoReg_i, RegWrite_i, dmem_rdata_i, ALUoutput_i, reg_dst_i, 
                MemtoReg_o, RegWrite_o, dmem_rdata_o, ALUoutput_o, reg_dst_o );

	input	rst, clk ;	

	input	MemtoReg_i, RegWrite_i ; // input控制訊號 
    input   [31:0]  dmem_rdata_i, ALUoutput_i;
    input   [4:0]   reg_dst_i;


    output  MemtoReg_o, RegWrite_o ; // input控制訊號 
    output  [31:0]  dmem_rdata_o, ALUoutput_o;
    output  [4:0]   reg_dst_o;


    reg          MemtoReg_o, RegWrite_o ; 
    reg  [31:0]  dmem_rdata_o, ALUoutput_o ;
    reg  [4:0]   reg_dst_o;

    always @(posedge clk) begin

		if (rst) begin
		MemtoReg_o <= 1'd0 ;
        RegWrite_o <= 1'd0 ; 
        dmem_rdata_o <= 32'd0;
        ALUoutput_o <= 32'd0;
        reg_dst_o <= 5'd0;
		end
		else begin
        MemtoReg_o <= MemtoReg_i ;
        RegWrite_o <= RegWrite_i ; 
        dmem_rdata_o <= dmem_rdata_i;
        ALUoutput_o <= ALUoutput_i;
        reg_dst_o <= reg_dst_i;
		end
    end

endmodule