library verilog;
use verilog.vl_types.all;
entity dec_4x16 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        d               : in     vl_logic;
        en              : in     vl_logic;
        o               : out    vl_logic_vector(15 downto 0)
    );
end dec_4x16;
