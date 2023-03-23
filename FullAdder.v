`timescale 1ns/1ns
module FullAdder( input a,input b, input cin , output S, output cout);
 
wire  p,r,s,t;

	xor (p,a,b);
	xor (S,p,cin);
	
	or (t,a,b);
	and(r,t,cin);
	and(s,a,b);
	or(cout,r,s);
 
endmodule