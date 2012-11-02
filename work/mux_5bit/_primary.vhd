library verilog;
use verilog.vl_types.all;
entity mux_5bit is
    port(
        muxOut          : out    vl_logic;
        in0             : in     vl_logic;
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        in3             : in     vl_logic;
        in4             : in     vl_logic;
        s               : in     vl_logic_vector(2 downto 0)
    );
end mux_5bit;
