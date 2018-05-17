library verilog;
use verilog.vl_types.all;
entity Gen_clk is
    port(
        clk_in_50m      : in     vl_logic;
        rst             : in     vl_logic;
        cnt_DAC904      : in     vl_logic_vector(39 downto 0);
        cnt_AD9244_W    : in     vl_logic_vector(39 downto 0);
        clk_DAC8551     : out    vl_logic;
        clk_DAC8551_Bias: out    vl_logic;
        clk_FFT         : out    vl_logic;
        clk_25m         : out    vl_logic;
        clk_50m         : out    vl_logic;
        clk_DAC904      : out    vl_logic;
        clk_R_Serial    : out    vl_logic;
        clk_W_AD9244    : out    vl_logic
    );
end Gen_clk;
