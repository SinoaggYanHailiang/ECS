library verilog;
use verilog.vl_types.all;
entity RAM_ADC is
    port(
        clk_W           : in     vl_logic;
        clk_R_Serial    : in     vl_logic;
        clk_R_FFT       : in     vl_logic;
        Data_I          : in     vl_logic_vector(13 downto 0);
        Addr_W          : in     vl_logic_vector(7 downto 0);
        Addr_R_Serial   : in     vl_logic_vector(7 downto 0);
        Addr_R_FFT      : in     vl_logic_vector(7 downto 0);
        ReadEn_Serial   : in     vl_logic;
        ReadEn_FFT      : in     vl_logic;
        WriteEn         : in     vl_logic;
        Data_O_Serial   : out    vl_logic_vector(13 downto 0);
        Data_O_FFT      : out    vl_logic_vector(13 downto 0)
    );
end RAM_ADC;
