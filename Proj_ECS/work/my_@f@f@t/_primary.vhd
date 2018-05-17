library verilog;
use verilog.vl_types.all;
entity my_FFT is
    port(
        clk_R           : in     vl_logic;
        clk_FFT         : in     vl_logic;
        rst             : in     vl_logic;
        start_FFT       : in     vl_logic;
        En_FFT1         : in     vl_logic;
        FFT_xn_re       : in     vl_logic_vector(13 downto 0);
        AddrFFT_ADC     : in     vl_logic_vector(7 downto 0);
        dv_FFT          : out    vl_logic;
        ReadFFTEn_ADC1  : in     vl_logic;
        Data_send_FFT1  : out    vl_logic_vector(27 downto 0);
        ReadFFTEn_ADC2  : in     vl_logic;
        Data_send_FFT2  : out    vl_logic_vector(27 downto 0)
    );
end my_FFT;
