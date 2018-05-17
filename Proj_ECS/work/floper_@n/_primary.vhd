library verilog;
use verilog.vl_types.all;
entity floper_N is
    generic(
        WIDTH           : integer := 16;
        Delay_a11       : integer := 8
    );
    port(
        clk             : in     vl_logic;
        en              : in     vl_logic;
        rst             : in     vl_logic;
        d               : in     vl_logic_vector;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of Delay_a11 : constant is 1;
end floper_N;
