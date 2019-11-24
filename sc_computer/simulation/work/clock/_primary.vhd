library verilog;
use verilog.vl_types.all;
entity clock is
    port(
        clock_in        : in     vl_logic;
        clock_out       : out    vl_logic;
        mem_clock_out   : out    vl_logic
    );
end clock;
