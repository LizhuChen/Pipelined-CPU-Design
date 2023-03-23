`timescale 1ns/1ns
module MUX( ALUOut, HiOut, LoOut, Shifter, Cout, Signal, dataOut, zero );
input [31:0] ALUOut ;
input [31:0] HiOut ;
input [31:0] LoOut ;
input [31:0] Shifter ;
input Cout ;
input [5:0] Signal ; 
output [31:0] dataOut ;
output zero ;

wire [31:0] temp ;
wire[31:0] tempSlt ;

parameter AND = 6'b100100; 
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
parameter SLL = 6'b000000;
parameter MULTU = 6'b011001;
parameter MFHI = 6'b010000;
parameter MFLO = 6'b010010;
parameter BEQ = 6'b000100;
parameter BNE = 6'b000101;

assign tempSlt[31:1] = 31'b0 ;
assign tempSlt[0] = ~Cout ;

assign temp = ( Signal == AND ) ? ALUOut :
              ( Signal == OR ) ? ALUOut :
              ( Signal == ADD ) ? ALUOut :
              ( Signal == SUB ) ? ALUOut :
			  ( Signal == BEQ ) ? ALUOut : 
			  ( Signal == BNE ) ? ALUOut : 
              ( Signal == SLT ) ? tempSlt :
              ( Signal == MFHI ) ? HiOut :
              ( Signal == MFLO ) ? LoOut :
              ( Signal == SLL ) ? Shifter : 
              32'b0 ;
assign zero = ( temp == 32'd0 ) ? 1'd1 : 1'd0 ;

assign dataOut = temp ;              



endmodule