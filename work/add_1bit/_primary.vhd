library verilog;
use verilog.vl_types.all;
entity add_1bit is
    port(
        \out\           : out    vl_logic;
        cOut            : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic;
        cIn             : in     vl_logic
    );
end add_1bit;
