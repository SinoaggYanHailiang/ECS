library verilog;
use verilog.vl_types.all;
entity pll_controller is
    port(
        CLK_IN1         : in     vl_logic;
        CLK_OUT1        : out    vl_logic;
        CLK_OUT2        : out    vl_logic;
        CLK_OUT3        : out    vl_logic;
        CLK_OUT4        : out    vl_logic;
        CLK_OUT5        : out    vl_logic
    );
end pll_controller;
