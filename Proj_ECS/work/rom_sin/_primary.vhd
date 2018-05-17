library verilog;
use verilog.vl_types.all;
entity rom_sin is
    port(
        clka            : in     vl_logic;
        rsta            : in     vl_logic;
        addra           : in     vl_logic_vector(14 downto 0);
        douta           : out    vl_logic_vector(13 downto 0)
    );
end rom_sin;
