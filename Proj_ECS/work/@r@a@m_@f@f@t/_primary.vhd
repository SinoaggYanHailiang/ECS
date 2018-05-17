library verilog;
use verilog.vl_types.all;
entity RAM_FFT is
    port(
        clk_W           : in     vl_logic;
        clk_R           : in     vl_logic;
        WriteEn         : in     vl_logic;
        Addr_W          : in     vl_logic_vector(2 downto 0);
        Data_I_Re       : in     vl_logic_vector(22 downto 0);
        Data_I_Im       : in     vl_logic_vector(22 downto 0);
        ReadEn_Re       : in     vl_logic;
        ReadEn_Im       : in     vl_logic;
        Addr_R          : in     vl_logic_vector(2 downto 0);
        Data_O          : out    vl_logic_vector(22 downto 0)
    );
end RAM_FFT;
