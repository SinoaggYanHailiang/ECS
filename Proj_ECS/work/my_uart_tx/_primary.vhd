library verilog;
use verilog.vl_types.all;
entity my_uart_tx is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clk_bps         : in     vl_logic;
        rx_data         : in     vl_logic_vector(7 downto 0);
        rx_int          : in     vl_logic;
        uart_tx         : out    vl_logic;
        bps_start       : out    vl_logic
    );
end my_uart_tx;
