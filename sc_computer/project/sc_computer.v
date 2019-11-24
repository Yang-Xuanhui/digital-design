/////////////////////////////////////////////////////////////
//                                                         //
// School of Software of SJTU                              //
//                                                         //
/////////////////////////////////////////////////////////////

module sc_computer (resetn,clock,mem_clk,pc,inst,aluout,memout,imem_clk,dmem_clk,
							op0,op1,op2,ip0,ip1,mem_dataout,io_read_data);
   
   input resetn,clock,mem_clk;
	input [31:0] ip0,ip1;
	
   output [31:0] pc,inst,aluout,memout;
	output [31:0] op0,op1,op2;
	output [31:0] mem_dataout,io_read_data;
   output        imem_clk,dmem_clk;
   wire   [31:0] data;
   wire          wmem; // all these "wire"s are used to connect or interface the cpu,dmem,imem and so on.
   
   sc_cpu cpu (clock,resetn,inst,memout,pc,wmem,aluout,data);          // CPU module.
   sc_instmem  imem (pc,inst,clock,mem_clk,imem_clk);                  // instruction memory.
   //sc_datamem  dmem (aluout,data,memout,wmem,clock,mem_clk,dmem_clk ); // data memory.
	sc_datamem dmem(aluout,data,memout,wmem,clock,mem_clk,dmem_clk,resetn,op0,op1,op2,ip0,ip1,mem_dataout,io_read_data);
	
endmodule



