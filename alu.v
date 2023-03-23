`timescale 1ns/1ns

module ALU( input [31:0]dataA, input [31:0]dataB, input [2:0]control, output [31:0]sum, output Cout );

wire [30:0]tempCout ;
wire Cin=1'b0;
wire Cinsel ;
wire Tless ;
wire [31:0]tempsum ;
assign Tless = 1'b0 ;


mux2to1 mux87(Cin,~Cin,control[2],Cinsel);
ALU1bit ALUbit1( .dataA(dataA[0]), .dataB(dataB[0]), .carryin(Cinsel),      .control(control[2:0]),.less(~Cout), .dataOut(tempsum[0]), .carryOut(tempCout[0]));
ALU1bit ALUbit2( .dataA(dataA[1]), .dataB(dataB[1]), .carryin(tempCout[0]), .control(control[2:0]),.less(Tless), .dataOut(tempsum[1]), .carryOut(tempCout[1]));
ALU1bit ALUbit3( .dataA(dataA[2]), .dataB(dataB[2]), .carryin(tempCout[1]), .control(control[2:0]),.less(Tless), .dataOut(tempsum[2]), .carryOut(tempCout[2]));
ALU1bit ALUbit4( .dataA(dataA[3]), .dataB(dataB[3]), .carryin(tempCout[2]), .control(control[2:0]),.less(Tless), .dataOut(tempsum[3]), .carryOut(tempCout[3]));
ALU1bit ALUbit5( .dataA(dataA[4]), .dataB(dataB[4]), .carryin(tempCout[3]), .control(control[2:0]),.less(Tless), .dataOut(tempsum[4]), .carryOut(tempCout[4]));
ALU1bit ALUbit6( .dataA(dataA[5]), .dataB(dataB[5]), .carryin(tempCout[4]), .control(control[2:0]),.less(Tless), .dataOut(tempsum[5]), .carryOut(tempCout[5]));
ALU1bit ALUbit7( .dataA(dataA[6]), .dataB(dataB[6]), .carryin(tempCout[5]), .control(control[2:0]),.less(Tless), .dataOut(tempsum[6]), .carryOut(tempCout[6]));
ALU1bit ALUbit8( .dataA(dataA[7]), .dataB(dataB[7]), .carryin(tempCout[6]), .control(control[2:0]),.less(Tless), .dataOut(tempsum[7]), .carryOut(tempCout[7]));
ALU1bit ALUbit9( .dataA(dataA[8]), .dataB(dataB[8]), .carryin(tempCout[7]), .control(control[2:0]),.less(Tless), .dataOut(tempsum[8]), .carryOut(tempCout[8]));
ALU1bit ALUbit10(.dataA(dataA[9]), .dataB(dataB[9]), .carryin(tempCout[8]), .control(control[2:0]),.less(Tless), .dataOut(tempsum[9]), .carryOut(tempCout[9]));
ALU1bit ALUbit11(.dataA(dataA[10]),.dataB(dataB[10]),.carryin(tempCout[9]), .control(control[2:0]),.less(Tless), .dataOut(tempsum[10]),.carryOut(tempCout[10]));
ALU1bit ALUbit12(.dataA(dataA[11]),.dataB(dataB[11]),.carryin(tempCout[10]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[11]),.carryOut(tempCout[11]));
ALU1bit ALUbit13(.dataA(dataA[12]),.dataB(dataB[12]),.carryin(tempCout[11]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[12]),.carryOut(tempCout[12]));
ALU1bit ALUbit14(.dataA(dataA[13]),.dataB(dataB[13]),.carryin(tempCout[12]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[13]),.carryOut(tempCout[13]));
ALU1bit ALUbit15(.dataA(dataA[14]),.dataB(dataB[14]),.carryin(tempCout[13]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[14]),.carryOut(tempCout[14]));
ALU1bit ALUbit16(.dataA(dataA[15]),.dataB(dataB[15]),.carryin(tempCout[14]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[15]),.carryOut(tempCout[15]));
ALU1bit ALUbit17(.dataA(dataA[16]),.dataB(dataB[16]),.carryin(tempCout[15]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[16]),.carryOut(tempCout[16]));
ALU1bit ALUbit18(.dataA(dataA[17]),.dataB(dataB[17]),.carryin(tempCout[16]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[17]),.carryOut(tempCout[17]));
ALU1bit ALUbit19(.dataA(dataA[18]),.dataB(dataB[18]),.carryin(tempCout[17]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[18]),.carryOut(tempCout[18]));
ALU1bit ALUbit20(.dataA(dataA[19]),.dataB(dataB[19]),.carryin(tempCout[18]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[19]),.carryOut(tempCout[19]));
ALU1bit ALUbit21(.dataA(dataA[20]),.dataB(dataB[20]),.carryin(tempCout[19]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[20]),.carryOut(tempCout[20]));
ALU1bit ALUbit22(.dataA(dataA[21]),.dataB(dataB[21]),.carryin(tempCout[20]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[21]),.carryOut(tempCout[21]));
ALU1bit ALUbit23(.dataA(dataA[22]),.dataB(dataB[22]),.carryin(tempCout[21]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[22]),.carryOut(tempCout[22]));
ALU1bit ALUbit24(.dataA(dataA[23]),.dataB(dataB[23]),.carryin(tempCout[22]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[23]),.carryOut(tempCout[23]));
ALU1bit ALUbit25(.dataA(dataA[24]),.dataB(dataB[24]),.carryin(tempCout[23]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[24]),.carryOut(tempCout[24]));
ALU1bit ALUbit26(.dataA(dataA[25]),.dataB(dataB[25]),.carryin(tempCout[24]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[25]),.carryOut(tempCout[25]));
ALU1bit ALUbit27(.dataA(dataA[26]),.dataB(dataB[26]),.carryin(tempCout[25]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[26]),.carryOut(tempCout[26]));
ALU1bit ALUbit28(.dataA(dataA[27]),.dataB(dataB[27]),.carryin(tempCout[26]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[27]),.carryOut(tempCout[27]));
ALU1bit ALUbit29(.dataA(dataA[28]),.dataB(dataB[28]),.carryin(tempCout[27]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[28]),.carryOut(tempCout[28]));
ALU1bit ALUbit30(.dataA(dataA[29]),.dataB(dataB[29]),.carryin(tempCout[28]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[29]),.carryOut(tempCout[29]));
ALU1bit ALUbit31(.dataA(dataA[30]),.dataB(dataB[30]),.carryin(tempCout[29]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[30]),.carryOut(tempCout[30]));
ALU1bit ALUbit32(.dataA(dataA[31]),.dataB(dataB[31]),.carryin(tempCout[30]),.control(control[2:0]),.less(Tless), .dataOut(tempsum[31]),.carryOut(Cout));

assign sum = tempsum ;

endmodule