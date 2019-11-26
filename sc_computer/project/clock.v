module clock(clock_in,clock_out,mem_clock_out);

	input clock_in;
	output clock_out, mem_clock_out;
	
	reg clock_out;// mem_clock_out;
	reg [31:0] counter_50M;
	
	assign mem_clock_out = clock_in;
	initial
	begin
		counter_50M <=0;
		clock_out <=0;
		//mem_clock_out <=0;
	end
	
	always @ (posedge clock_in)
	begin
//		counter_50M = counter_50M +1;
//		if(counter_50M == 25000000)
//		begin
//			mem_clock_out = ~mem_clock_out;
//		end
//		if(counter_50M == 50000000)
//		begin
//			counter_50M = 0;
//			clock_out = ~clock_out;
//		end
		clock_out = ~clock_out;
	end
endmodule
