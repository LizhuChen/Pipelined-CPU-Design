`timescale 1ns/1ns
module mux4to1( input dataA, input dataB, input dataC, input dataD, input [1:0]control, output dataOut );

wire Jmux1 ; // 存入 看f[0]之值並判斷是否為or 或是 and 完後的值
wire Jmux2 ; // 存入 看f[0]之值並判斷是否為less 或是 add/sub 完後的值
wire out;

mux2to1 mux1( .dataA(dataA), .dataB(dataB), .sel(control[0]), .dataOut(Jmux1) ) ; // 先看f[0],若為1 mux_1則為or, 若為0 mux_1則為 and(f[0]為0則代表可能為0 or 2) 
mux2to1 mux2( .dataA(dataC), .dataB(dataD), .sel(control[0]), .dataOut(Jmux2) ) ; // 先看f[0],若為1 mux_1則為less, 若為0 mux_1則為 add or sub(f[0]為1則代表可能為1 or 3)
mux2to1 mux3( .dataA(Jmux1), .dataB(Jmux2), .sel(control[1]), .dataOut(out) ) ; // 再看f[1], out 為最後選擇的輸出
assign dataOut = out;

endmodule
