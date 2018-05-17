library verilog;
use verilog.vl_types.all;
entity DDS_Core is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Sel_WaveFunc    : in     vl_logic_vector(2 downto 0);
        DutyCyc         : in     vl_logic_vector(13 downto 0);
        Out_Mode        : in     vl_logic;
        freq            : in     vl_logic_vector(11 downto 0);
        Data_Out        : out    vl_logic_vector(13 downto 0)
    );
end DDS_Core;
