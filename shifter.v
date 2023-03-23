`timescale 1ns/1ns
module shifter ( input[31:0]datain, input[31:0] shiftnum, output[31:0] dataout ) ;

wire[4:0] shift_num ;

wire[31:0] temp1 ;
wire[31:0] temp2 ;
wire[31:0] temp3 ;
wire[31:0] temp4 ;

assign shift_num = shiftnum[4:0] ;

// ---------------------------------sorry------------------------------------

mux2to1 a0 (datain[0], 1'b0, shift_num[0], temp1[0]); 
mux2to1 a1 (datain[1], datain[0], shift_num[0], temp1[1]); 
mux2to1 a2 (datain[2], datain[1], shift_num[0], temp1[2]); 
mux2to1 a3 (datain[3], datain[2], shift_num[0], temp1[3]); 
mux2to1 a4 (datain[4], datain[3], shift_num[0], temp1[4]); 
mux2to1 a5 (datain[5], datain[4], shift_num[0], temp1[5]); 
mux2to1 a6 (datain[6], datain[5], shift_num[0], temp1[6]); 
mux2to1 a7 (datain[7], datain[6], shift_num[0], temp1[7]); 
mux2to1 a8 (datain[8], datain[7], shift_num[0], temp1[8]);
mux2to1 a9 (datain[9], datain[8], shift_num[0], temp1[9]);
mux2to1 a10 (datain[10], datain[9], shift_num[0], temp1[10]);
mux2to1 a11 (datain[11], datain[10], shift_num[0], temp1[11]);
mux2to1 a12 (datain[12], datain[11], shift_num[0], temp1[12]);
mux2to1 a13 (datain[13], datain[12], shift_num[0], temp1[13]);
mux2to1 a14 (datain[14], datain[13], shift_num[0], temp1[14]);
mux2to1 a15 (datain[15], datain[14], shift_num[0], temp1[15]);
mux2to1 a16 (datain[16], datain[15], shift_num[0], temp1[16]);
mux2to1 a17 (datain[17], datain[16], shift_num[0], temp1[17]);
mux2to1 a18 (datain[18], datain[17], shift_num[0], temp1[18]);
mux2to1 a19 (datain[19], datain[18], shift_num[0], temp1[19]);
mux2to1 a20 (datain[20], datain[19], shift_num[0], temp1[20]);
mux2to1 a21 (datain[21], datain[20], shift_num[0], temp1[21]);
mux2to1 a22 (datain[22], datain[21], shift_num[0], temp1[22]);
mux2to1 a23 (datain[23], datain[22], shift_num[0], temp1[23]);
mux2to1 a24 (datain[24], datain[23], shift_num[0], temp1[24]);
mux2to1 a25 (datain[25], datain[24], shift_num[0], temp1[25]);
mux2to1 a26 (datain[26], datain[25], shift_num[0], temp1[26]);
mux2to1 a27 (datain[27], datain[26], shift_num[0], temp1[27]);
mux2to1 a28 (datain[28], datain[27], shift_num[0], temp1[28]);
mux2to1 a29 (datain[29], datain[28], shift_num[0], temp1[29]);
mux2to1 a30 (datain[30], datain[29], shift_num[0], temp1[30]);
mux2to1 a31 (datain[31], datain[30], shift_num[0], temp1[31]);

// ---------------------------------sorry------------------------------------

mux2to1 b0 (temp1[0], 1'b0, shift_num[1], temp2[0]); 
mux2to1 b1 (temp1[1], 1'b0, shift_num[1], temp2[1]); 
mux2to1 b2 (temp1[2], temp1[0], shift_num[1], temp2[2]); 
mux2to1 b3 (temp1[3], temp1[1], shift_num[1], temp2[3]); 
mux2to1 b4 (temp1[4], temp1[2], shift_num[1], temp2[4]); 
mux2to1 b5 (temp1[5], temp1[3], shift_num[1], temp2[5]); 
mux2to1 b6 (temp1[6], temp1[4], shift_num[1], temp2[6]); 
mux2to1 b7 (temp1[7], temp1[5], shift_num[1], temp2[7]);
mux2to1 b8 (temp1[8], temp1[6], shift_num[1], temp2[8]);
mux2to1 b9 (temp1[9], temp1[7], shift_num[1], temp2[9]);
mux2to1 b10 (temp1[10], temp1[8], shift_num[1], temp2[10]);
mux2to1 b11 (temp1[11], temp1[9], shift_num[1], temp2[11]);
mux2to1 b12 (temp1[12], temp1[10], shift_num[1], temp2[12]);
mux2to1 b13 (temp1[13], temp1[11], shift_num[1], temp2[13]);
mux2to1 b14 (temp1[14], temp1[12], shift_num[1], temp2[14]);
mux2to1 b15 (temp1[15], temp1[13], shift_num[1], temp2[15]);
mux2to1 b16 (temp1[16], temp1[14], shift_num[1], temp2[16]);
mux2to1 b17 (temp1[17], temp1[15], shift_num[1], temp2[17]);
mux2to1 b18 (temp1[18], temp1[16], shift_num[1], temp2[18]);
mux2to1 b19 (temp1[19], temp1[17], shift_num[1], temp2[19]);
mux2to1 b20 (temp1[20], temp1[18], shift_num[1], temp2[20]);
mux2to1 b21 (temp1[21], temp1[19], shift_num[1], temp2[21]);
mux2to1 b22 (temp1[22], temp1[20], shift_num[1], temp2[22]);
mux2to1 b23 (temp1[23], temp1[21], shift_num[1], temp2[23]);
mux2to1 b24 (temp1[24], temp1[22], shift_num[1], temp2[24]);
mux2to1 b25 (temp1[25], temp1[23], shift_num[1], temp2[25]);
mux2to1 b26 (temp1[26], temp1[24], shift_num[1], temp2[26]);
mux2to1 b27 (temp1[27], temp1[25], shift_num[1], temp2[27]);
mux2to1 b28 (temp1[28], temp1[26], shift_num[1], temp2[28]);
mux2to1 b29 (temp1[29], temp1[27], shift_num[1], temp2[29]);
mux2to1 b30 (temp1[30], temp1[28], shift_num[1], temp2[30]);
mux2to1 b31 (temp1[31], temp1[29], shift_num[1], temp2[31]);

// ---------------------------------sorry------------------------------------

mux2to1 c0 ( temp2[0], 1'b0, shift_num[2], temp3[0]); 
mux2to1 c1 ( temp2[1], 1'b0, shift_num[2], temp3[1]); 
mux2to1 c2 ( temp2[2], 1'b0, shift_num[2], temp3[2]); 
mux2to1 c3 ( temp2[3], 1'b0, shift_num[2], temp3[3]); 
mux2to1 c4 (temp2[4], temp2[0], shift_num[2], temp3[4]); 
mux2to1 c5 (temp2[5], temp2[1], shift_num[2], temp3[5]); 
mux2to1 c6 (temp2[6], temp2[2], shift_num[2], temp3[6]); 
mux2to1 c7 (temp2[7], temp2[3], shift_num[2], temp3[7]);
mux2to1 c8 (temp2[8], temp2[4], shift_num[2], temp3[8]);
mux2to1 c9 (temp2[9], temp2[5], shift_num[2], temp3[9]);
mux2to1 c10 (temp2[10], temp2[6], shift_num[2], temp3[10]);
mux2to1 c11 (temp2[11], temp2[7], shift_num[2], temp3[11]);
mux2to1 c12 (temp2[12], temp2[8], shift_num[2], temp3[12]);
mux2to1 c13 (temp2[13], temp2[9], shift_num[2], temp3[13]);
mux2to1 c14 (temp2[14], temp2[10], shift_num[2], temp3[14]);
mux2to1 c15 (temp2[15], temp2[11], shift_num[2], temp3[15]);
mux2to1 c16 (temp2[16], temp2[12], shift_num[2], temp3[16]);
mux2to1 c17 (temp2[17], temp2[13], shift_num[2], temp3[17]);
mux2to1 c18 (temp2[18], temp2[14], shift_num[2], temp3[18]);
mux2to1 c19 (temp2[19], temp2[15], shift_num[2], temp3[19]);
mux2to1 c20 (temp2[20], temp2[16], shift_num[2], temp3[20]);
mux2to1 c21 (temp2[21], temp2[17], shift_num[2], temp3[21]);
mux2to1 c22 (temp2[22], temp2[18], shift_num[2], temp3[22]);
mux2to1 c23 (temp2[23], temp2[19], shift_num[2], temp3[23]);
mux2to1 c24 (temp2[24], temp2[20], shift_num[2], temp3[24]);
mux2to1 c25 (temp2[25], temp2[21], shift_num[2], temp3[25]);
mux2to1 c26 (temp2[26], temp2[22], shift_num[2], temp3[26]);
mux2to1 c27 (temp2[27], temp2[23], shift_num[2], temp3[27]);
mux2to1 c28 (temp2[28], temp2[24], shift_num[2], temp3[28]);
mux2to1 c29 (temp2[29], temp2[25], shift_num[2], temp3[29]);
mux2to1 c30 (temp2[30], temp2[26], shift_num[2], temp3[30]);
mux2to1 c31 (temp2[31], temp2[27], shift_num[2], temp3[31]);

// ---------------------------------sorry------------------------------------

mux2to1 d0 (temp3[0], 1'b0, shift_num[3], temp4[0]); 
mux2to1 d1 (temp3[1], 1'b0, shift_num[3], temp4[1]); 
mux2to1 d2 (temp3[2], 1'b0, shift_num[3], temp4[2]); 
mux2to1 d3 (temp3[3], 1'b0, shift_num[3], temp4[3]); 
mux2to1 d4 (temp3[4], 1'b0, shift_num[3], temp4[4]); 
mux2to1 d5 (temp3[5], 1'b0, shift_num[3], temp4[5]); 
mux2to1 d6 (temp3[6], 1'b0, shift_num[3], temp4[6]); 
mux2to1 d7 (temp3[7], 1'b0, shift_num[3], temp4[7]);
mux2to1 d8 (temp3[8], temp3[0], shift_num[3], temp4[8]);
mux2to1 d9 (temp3[9], temp3[1], shift_num[3], temp4[9]);
mux2to1 d10 (temp3[10], temp3[2], shift_num[3], temp4[10]);
mux2to1 d11 (temp3[11], temp3[3], shift_num[3], temp4[11]);
mux2to1 d12 (temp3[12], temp3[4], shift_num[3], temp4[12]);
mux2to1 d13 (temp3[13], temp3[5], shift_num[3], temp4[13]);
mux2to1 d14 (temp3[14], temp3[6], shift_num[3], temp4[14]);
mux2to1 d15 (temp3[15], temp3[7], shift_num[3], temp4[15]);
mux2to1 d16 (temp3[16], temp3[8], shift_num[3], temp4[16]);
mux2to1 d17 (temp3[17], temp3[9], shift_num[3], temp4[17]);
mux2to1 d18 (temp3[18], temp3[10], shift_num[3], temp4[18]);
mux2to1 d19 (temp3[19], temp3[11], shift_num[3], temp4[19]);
mux2to1 d20 (temp3[20], temp3[12], shift_num[3], temp4[20]);
mux2to1 d21 (temp3[21], temp3[13], shift_num[3], temp4[21]);
mux2to1 d22 (temp3[22], temp3[14], shift_num[3], temp4[22]);
mux2to1 d23 (temp3[23], temp3[15], shift_num[3], temp4[23]);
mux2to1 d24 (temp3[24], temp3[16], shift_num[3], temp4[24]);
mux2to1 d25 (temp3[25], temp3[17], shift_num[3], temp4[25]);
mux2to1 d26 (temp3[26], temp3[18], shift_num[3], temp4[26]);
mux2to1 d27 (temp3[27], temp3[19], shift_num[3], temp4[27]);
mux2to1 d28 (temp3[28], temp3[20], shift_num[3], temp4[28]);
mux2to1 d29 (temp3[29], temp3[21], shift_num[3], temp4[29]);
mux2to1 d30 (temp3[30], temp3[22], shift_num[3], temp4[30]);
mux2to1 d31 (temp3[31], temp3[23], shift_num[3], temp4[31]);

// ---------------------------------sorry------------------------------------

mux2to1 e0 (temp4[0], 1'b0, shift_num[4], dataout[0]); 
mux2to1 e1 (temp4[1], 1'b0, shift_num[4], dataout[1]); 
mux2to1 e2 (temp4[2], 1'b0, shift_num[4], dataout[2]); 
mux2to1 e3 (temp4[3], 1'b0, shift_num[4], dataout[3]); 
mux2to1 e4 (temp4[4], 1'b0, shift_num[4], dataout[4]); 
mux2to1 e5 (temp4[5], 1'b0, shift_num[4], dataout[5]); 
mux2to1 e6 (temp4[6], 1'b0, shift_num[4], dataout[6]); 
mux2to1 e7 (temp4[7], 1'b0, shift_num[4], dataout[7]);
mux2to1 e8 (temp4[8], 1'b0, shift_num[4], dataout[8]);
mux2to1 e9 (temp4[9], 1'b0, shift_num[4], dataout[9]);
mux2to1 e10 (temp4[10], 1'b0, shift_num[4], dataout[10]);
mux2to1 e11 (temp4[11], 1'b0, shift_num[4], dataout[11]);
mux2to1 e12 (temp4[12], 1'b0, shift_num[4], dataout[12]);
mux2to1 e13 (temp4[13], 1'b0, shift_num[4], dataout[13]);
mux2to1 e14 (temp4[14], 1'b0, shift_num[4], dataout[14]);
mux2to1 e15 (temp4[15], 1'b0, shift_num[4], dataout[15]);
mux2to1 e16 (temp4[16], temp4[0], shift_num[4], dataout[16]);
mux2to1 e17 (temp4[17], temp4[1], shift_num[4], dataout[17]);
mux2to1 e18 (temp4[18], temp4[2], shift_num[4], dataout[18]);
mux2to1 e19 (temp4[19], temp4[3], shift_num[4], dataout[19]);
mux2to1 e20 (temp4[20], temp4[4], shift_num[4], dataout[20]);
mux2to1 e21 (temp4[21], temp4[5], shift_num[4], dataout[21]);
mux2to1 e22 (temp4[22], temp4[6], shift_num[4], dataout[22]);
mux2to1 e23 (temp4[23], temp4[7], shift_num[4], dataout[23]);
mux2to1 e24 (temp4[24], temp4[8], shift_num[4], dataout[24]);
mux2to1 e25 (temp4[25], temp4[9], shift_num[4], dataout[25]);
mux2to1 e26 (temp4[26], temp4[10], shift_num[4], dataout[26]);
mux2to1 e27 (temp4[27], temp4[11], shift_num[4], dataout[27]);
mux2to1 e28 (temp4[28], temp4[12], shift_num[4], dataout[28]);
mux2to1 e29 (temp4[29], temp4[13], shift_num[4], dataout[29]);
mux2to1 e30 (temp4[30], temp4[14], shift_num[4], dataout[30]);
mux2to1 e31 (temp4[31], temp4[15], shift_num[4], dataout[31]);

endmodule


