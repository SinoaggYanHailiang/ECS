library verilog;
use verilog.vl_types.all;
entity GenWave is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        AC_Wave         : in     vl_logic;
        Out_Mode        : in     vl_logic;
        freq            : in     vl_logic_vector(11 downto 0);
        DutyCyc         : in     vl_logic_vector(13 downto 0);
        Sin_out         : out    vl_logic_vector(13 downto 0);
        Stw_out         : out    vl_logic_vector(13 downto 0);
        Tri_out         : out    vl_logic_vector(13 downto 0);
        Squ_out         : out    vl_logic_vector(13 downto 0)
    );
end GenWave;
