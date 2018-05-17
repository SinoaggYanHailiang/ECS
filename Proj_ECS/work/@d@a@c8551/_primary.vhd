library verilog;
use verilog.vl_types.all;
entity DAC8551 is
    generic(
        Data_0          : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Data_1          : in     vl_logic_vector(15 downto 0);
        SYNC            : out    vl_logic;
        DIN             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Data_0 : constant is 1;
end DAC8551;
