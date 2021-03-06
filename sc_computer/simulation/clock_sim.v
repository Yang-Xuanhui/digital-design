
`timescale 10ns/10ns            
module clock_sim;

    reg clock_in;

	 

    wire clock_out;
    wire mem_clock_out;
	 
    clock clock_instance(clock_in,clock_out,mem_clock_out);
						
	 initial
        begin
            clock_in = 1;
            while (1)
                #2  clock_in = ~clock_in;
        end

	   
	

endmodule 