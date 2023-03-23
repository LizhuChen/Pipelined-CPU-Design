`timescale 1ns/1ns
module mux2to1( input dataA, input dataB, input sel, output dataOut );

wire selb ;
wire output1 ;
wire output2 ;
wire out ;

and (output1, dataA, ~sel);
and (output2, dataB, sel);
or (out, output1, output2);

assign dataOut = out ;


endmodule
