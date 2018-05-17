library verilog;
use verilog.vl_types.all;
entity Proj_ECS is
    port(
        clk_in          : in     vl_logic;
        rst_btn         : in     vl_logic;
        uart_rx         : in     vl_logic;
        OTR_AD9244      : in     vl_logic;
        OTR_AD9244_1    : in     vl_logic;
        uart_tx         : out    vl_logic;
        clk_DAC8551     : out    vl_logic;
        SYNC_DAC8551    : out    vl_logic;
        D_DAC8551       : out    vl_logic;
        clk_DAC8551_Bias: out    vl_logic;
        SYNC_DAC8551_Bias: out    vl_logic;
        D_DAC8551_Bias  : out    vl_logic;
        clk_DAC904      : out    vl_logic;
        clk_W_AD9244    : out    vl_logic;
        clk_W_AD9244_1  : out    vl_logic;
        Data_I_AD9244   : in     vl_logic_vector(13 downto 0);
        Data_I_AD9244_1 : in     vl_logic_vector(13 downto 0);
        DIO_OUT1        : out    vl_logic_vector(7 downto 0);
        DIO_OUT2        : out    vl_logic_vector(7 downto 0);
        DIO_OUT3        : out    vl_logic_vector(7 downto 0);
        Data_Out_DAC904 : out    vl_logic_vector(13 downto 0)
    );
end Proj_ECS;
