library verilog;
use verilog.vl_types.all;
entity uart is
    port(
        clk_25m         : in     vl_logic;
        rst             : in     vl_logic;
        uart_rx         : in     vl_logic;
        uart_tx         : out    vl_logic;
        DataTX_1        : in     vl_logic_vector(7 downto 0);
        DataTX_2        : in     vl_logic_vector(7 downto 0);
        DataTX_3        : in     vl_logic_vector(7 downto 0);
        DataTX_4        : in     vl_logic_vector(7 downto 0);
        EnTxData        : in     vl_logic;
        RX_rdy          : out    vl_logic;
        DataRX_1        : out    vl_logic_vector(7 downto 0);
        DataRX_2        : out    vl_logic_vector(7 downto 0);
        DataRX_3        : out    vl_logic_vector(7 downto 0);
        DataRX_4        : out    vl_logic_vector(7 downto 0);
        DataRX_5        : out    vl_logic_vector(7 downto 0)
    );
end uart;
