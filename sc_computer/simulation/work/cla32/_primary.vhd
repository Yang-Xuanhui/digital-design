library verilog;
use verilog.vl_types.all;
entity cla32 is
    port(
        pc              : in     vl_logic_vector(31 downto 0);
        x1              : in     vl_logic_vector(31 downto 0);
        p4              : out    vl_logic_vector(31 downto 0)
    );
end cla32;
