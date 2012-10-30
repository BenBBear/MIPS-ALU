library verilog;
use verilog.vl_types.all;
entity bitSlice_1bit is
    port(
        \Out\           : out    vl_logic;
        Cout            : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic;
        negB            : in     vl_logic;
        Cin             : in     vl_logic;
        Cntrl           : in     vl_logic_vector(2 downto 0)
    );
end bitSlice_1bit;
