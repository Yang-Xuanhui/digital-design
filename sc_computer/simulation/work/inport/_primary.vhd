library verilog;
use verilog.vl_types.all;
entity inport is
    port(
        sw4             : in     vl_logic;
        sw3             : in     vl_logic;
        sw2             : in     vl_logic;
        sw1             : in     vl_logic;
        sw0             : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end inport;
