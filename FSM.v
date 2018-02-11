`include "counter.v"
 
 
 module FSM(
  //Output Ports
  in,clk,rst,in_valid,
  //Input Ports
  out_valid,out
);

//---------------------------------------------------------------------
//   I/O PORTS
//---------------------------------------------------------------------

input clk,rst,in_valid;
input [1:0] in;

output out_valid;
output [1:0] out;



//----------------------------------
// reg and wire declaration
//---------------------------------

reg			 out_valid;
reg [1:0] 	 out;



//---------------------------------
//   parameter declaration
//--------------------------------- 

reg [1:0]state;
wire [4:0]count;
reg check;
 
//----------------------------------
//
//         My design
//
//----------------------------------
counter count1(count,in_valid,clk,5'd20,rst);
always @(negedge clk)begin
if(rst)begin
out_valid<=0;
out<=0;
end
if(in_valid==1 && count==1)begin
state<=in;


end
else if(in_valid==1 && count>1 &&count<=20)begin
case(state)
2'b00:
begin
if(in==2'b00)begin
state<=2'b00;

end
else if(in==2'b01)begin
state<=2'b01;

end
else if(in==2'b11)begin
out_valid<=1;
out<=state;
check<=1;

end
end

2'b01:
begin
if(in==2'b00)begin
state<=2'b00;

end
else if(in==2'b01)begin
state<=2'b10;

end
else if(in==2'b11)begin
out_valid<=1;
out<=state;
check<=1;

end
end

2'b10:
begin
if(in==2'b00)begin
state<=2'b01;

end
else if(in==2'b01)begin
state<=2'b10;

end
else if(in==2'b11)begin
out_valid<=1;
out<=state;
check<=1;

end
end


endcase
end

if(check==1)begin
check<=0;
out_valid<=0;
end

end


 
endmodule