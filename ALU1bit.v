`timescale 1ns/1ns
module ALU1bit( input dataA, input dataB, input carryin, input [2:0]control, input less, output dataOut, output carryOut );

wire  Tand ; // and
wire  Tor ; // or
wire  Tadder ; // add
wire  Tslt ; // slt
wire  temp ; // 暫存0
wire  Tless  ; // less
wire  selB  ; // +B or -b
assign temp = 1'b0 ;
wire out;

buf( Tless, less) ;
mux2to1 mux1( .dataA(dataB), .dataB(~dataB), .sel(control[2]), .dataOut(selB) ) ; // selB若為sub則為~dataB(B補數)
and ( Tand, dataA, selB ) ;
or ( Tor, dataA, selB);
FullAdder al( .a(dataA), .b(selB), .cin(carryin), .S(Tadder), .cout(carryOut) ) ; // add or sub
mux2to1 mux2(  .dataA(temp), .dataB(Tless), .sel(control[2]), .dataOut(Tslt) ); // control[2]=> Binvert決定是否為減法, 若為負則slt = less , 正則slt = 0
mux4to1 mux3( .dataA(Tand), .dataB(Tor), .dataC(Tadder), .dataD(Tslt), .control(control[1:0]), .dataOut(out) ); // 4:1 Mux for the output side of ALU , control[1:0]決定要選擇哪個operation
assign dataOut = out;

endmodule