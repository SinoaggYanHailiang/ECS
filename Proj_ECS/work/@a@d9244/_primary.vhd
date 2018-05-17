library verilog;
use verilog.vl_types.all;
entity AD9244 is
    port(
        clk_W           : in     vl_logic;
        clk_R           : in     vl_logic;
        clk_FFT         : in     vl_logic;
        rst             : in     vl_logic;
        ReadEn          : in     vl_logic;
        WriteEn         : in     vl_logic;
        start_FFT       : in     vl_logic;
        Data_I          : in     vl_logic_vector(13 downto 0);
        OTR             : in     vl_logic;
        Data_O_Serial   : out    vl_logic_vector(13 downto 0);
        AddrR_O         : out    vl_logic_vector(7 downto 0);
        ADCR_Length     : in     vl_logic_vector(15 downto 0);
        ADCM_Length     : in     vl_logic_vector(7 downto 0);
        R_Restart_ADC   : in     vl_logic;
        rdy_W           : out    vl_logic;
        rdy_R           : out    vl_logic;
        Sample_256      : out    vl_logic;
        Mean_ADC        : out    vl_logic_vector(13 downto 0);
        FFT_xn_re       : out    vl_logic_vector(13 downto 0);
        flag_OverFlow   : out    vl_logic_vector(1 downto 0)
    );
end AD9244;
