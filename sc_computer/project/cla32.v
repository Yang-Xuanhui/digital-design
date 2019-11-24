module cla32 (pc,x1,p4);
   input [31:0] pc;
   input [31:0] x1;
   
   output [31:0] p4;
   
   assign p4 = pc + x1;   
   
endmodule 