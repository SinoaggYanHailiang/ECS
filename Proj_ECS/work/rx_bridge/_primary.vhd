library verilog;
use verilog.vl_types.all;
entity rx_bridge is
    generic(
        WIDLE           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        WRXAA           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        WRXD1           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        WRXD2           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        WRXD3           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        WRXD4           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        WRXD5           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        rxen            : in     vl_logic;
        rxdb            : in     vl_logic_vector(7 downto 0);
        RX_rdy          : out    vl_logic;
        Data1           : out    vl_logic_vector(7 downto 0);
        Data2           : out    vl_logic_vector(7 downto 0);
        Data3           : out    vl_logic_vector(7 downto 0);
        Data4           : out    vl_logic_vector(7 downto 0);
        Data5           : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDLE : constant is 1;
    attribute mti_svvh_generic_type of WRXAA : constant is 1;
    attribute mti_svvh_generic_type of WRXD1 : constant is 1;
    attribute mti_svvh_generic_type of WRXD2 : constant is 1;
    attribute mti_svvh_generic_type of WRXD3 : constant is 1;
    attribute mti_svvh_generic_type of WRXD4 : constant is 1;
    attribute mti_svvh_generic_type of WRXD5 : constant is 1;
end rx_bridge;
