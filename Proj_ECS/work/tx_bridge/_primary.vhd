library verilog;
use verilog.vl_types.all;
entity tx_bridge is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        EnTxData        : in     vl_logic;
        Data1           : in     vl_logic_vector(7 downto 0);
        Data2           : in     vl_logic_vector(7 downto 0);
        Data3           : in     vl_logic_vector(7 downto 0);
        Data4           : in     vl_logic_vector(7 downto 0);
        txen            : out    vl_logic;
        txdb            : out    vl_logic_vector(7 downto 0)
    );
end tx_bridge;
