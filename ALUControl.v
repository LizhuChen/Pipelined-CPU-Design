`timescale 1ns/1ns
module ALUControl(clk ,Signal, SignaltoMUX );
input clk ;

input [5:0] Signal ;  

output [5:0] SignaltoMUX ;


reg [5:0] temp ;
reg [6:0] counter ;


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


always@( Signal )
begin
  if ( Signal == MULTU )
  begin
    counter <= 0 ; // 如果訊號改變成乘法 就把counter歸0
  end
  
  temp <= Signal ;
end

always@( posedge clk )
begin

  if ( Signal == MULTU )
  begin
    counter <= counter + 1 ;
    if ( counter == 32 )
    begin
      temp <= 6'b111111 ; 
      counter <= 0 ;
    end
  end

end


//數32個clk然後開啟HiLo暫存器給乘法器放值進去


assign SignaltoMUX = temp ;


endmodule