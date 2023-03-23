`timescale 1ns/1ns
module TotalALU( clk, dataA, dataB, Signal, control, Output, reset, zero );
input reset ;
input clk ;

input[2:0] control ; 
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ; 
output [31:0] Output ;
output zero ;


wire Cout ;


parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
parameter SLL = 6'b000000;
parameter MULTU = 6'b011001;
parameter MFHI = 6'b010000;
parameter MFLO = 6'b010010;
parameter BEQ = 6'b000011;



wire [5:0]  SignaltoMUX ;
wire [31:0] ALUOut, HiOut, LoOut, ShifterOut ;
wire [31:0] dataOut ;
wire [63:0] MulAns ;


ALUControl ALUControl( .clk(clk), .Signal(Signal), .SignaltoMUX(SignaltoMUX) );
ALU alu( .dataA(dataA), .dataB(dataB), .control(control), .sum(ALUOut), .Cout(Cout) );
multiplier multiplier( .clk(clk), .Signal(Signal), .multiplicand(dataA), .multiplier(dataB), .dataout(MulAns), .reset(reset) ) ;
shifter shifter( .datain(dataA), .shiftnum(dataB), .dataout(ShifterOut) ) ;
HiLo HiLo( .clk(clk), .MulAns(MulAns), .HiOut(HiOut), .LoOut(LoOut), .reset(reset) );
MUX MUX( .ALUOut(ALUOut), .HiOut(HiOut), .LoOut(LoOut), .Shifter(ShifterOut), .Cout(Cout), .Signal(SignaltoMUX), .dataOut(dataOut), .zero(zero) );


assign Output = dataOut ;


endmodule