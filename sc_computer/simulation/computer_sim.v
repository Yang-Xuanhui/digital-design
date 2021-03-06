
//=============================================
//
// 该 Verilog HDL 代码，是用于对设计模块进行仿真时，对输入信号的模拟输入值的设定。
// 否则，待仿真的对象模块，会因为缺少输入信号，而“不知所措”。
// 该文件可设定若干对目标设计功能进行各种情况下测试的输入用例，以判断自己的功能设计是否正确。
//
// 对于CPU设计来说，基本输入量只有：复位信号、时钟信号。
//
// 对于带I/O设计，则需要设定各输入信号值。
//
//
// =============================================


// `timescale 10ns/10ns            // 仿真时间单位/时间精度
`timescale 1ps/1ps            // 仿真时间单位/时间精度

//
// （1）仿真时间单位/时间精度：数字必须为1、10、100
// （2）仿真时间单位：模块仿真时间和延时的基准单位
// （3）仿真时间精度：模块仿真时间和延时的精确程度，必须小于或等于仿真单位时间
//
//      时间单位：s/秒、ms/毫秒、us/微秒、ns/纳秒、ps/皮秒、fs/飞秒（10负15次方）。


module computer_sim;

    reg           resetn_sim;
    reg           clock_50M_sim;
    reg           sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7,sw8,sw9;
	//reg           mem_clk_sim;
	//reg    [31:0] in_port0_sim;
	//reg    [31:0] in_port1_sim;

	wire clock_sim,mem_clock_sim;

    wire   [6:0]  hex0_sim,hex1_sim,hex2_sim,hex3_sim,hex4_sim,hex5_sim;
	wire          led0_sim,led1_sim,led2_sim,led3_sim;    
	       
    wire   [31:0]  in_port0_sim,in_port1_sim;
	 
	wire   [31:0]  pc_sim,inst_sim,aluout_sim,memout_sim;
    wire           imem_clk_sim,dmem_clk_sim;
    wire   [31:0]  out_port0_sim,out_port1_sim,out_port2_sim;
    wire   [31:0]  mem_dataout_sim;            // to check data_mem output
    wire   [31:0]  io_read_data_sim;
   
    wire           wmem_sim;   // connect the cpu and dmem. 
	 
    clock clock_instance(clock_50M_sim,clock_sim,mem_clock_sim);
    inport inport0(sw4,sw3,sw2,sw1,sw0,in_port0_sim);
    inport inport1(sw9,sw8,sw7,sw6,sw5,in_port1_sim);
    sc_computer    sc_computer_instance (resetn_sim,clock_sim,mem_clock_sim,pc_sim,inst_sim,aluout_sim,memout_sim,
	                                      imem_clk_sim,dmem_clk_sim,out_port0_sim,out_port1_sim,out_port2_sim,in_port0_sim,in_port1_sim,
													  mem_dataout_sim,io_read_data_sim);
    outport oouport0(out_port0_sim,hex5_sim,hex4_sim);
    outport oouport1(out_port1_sim,hex3_sim,hex2_sim);
    outport oouport2(out_port2_sim,hex1_sim,hex0_sim);
						
	 initial
        begin
            clock_50M_sim = 1;
            while (1)
                #2  clock_50M_sim = ~clock_50M_sim;
        end
		  
	 initial
        begin
            resetn_sim = 0;            // 低电平持续10个时间单位，后一直为1。
            while (1)
                #5 resetn_sim = 1;
        end
	 
	initial
	    begin
        // 00101
		    sw0 = 1;
            sw1 = 0;
            sw2 = 1;
            sw3 = 0;
            sw4 = 0;
        // 01000
            sw5 = 0;
            sw6 = 0;
            sw7 = 0;
            sw8 = 1;
            sw9 = 0;

		end
		
		always @ (posedge clock_sim)
		begin
		  sw0 = ~sw0;
		  sw1 = ~sw1;
		  sw2 = ~sw2;
		  sw3 = ~sw3;
		  sw4 = ~sw4;
		  sw5 = ~sw5;
		  sw6 = ~sw6;
		  sw7 = ~sw7;
		  sw8 = ~sw8;
		  sw9 = ~sw9;
		        
    end

endmodule 


