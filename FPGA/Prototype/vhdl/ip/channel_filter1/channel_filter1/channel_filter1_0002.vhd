library IEEE;
use IEEE.std_logic_1164.all;

entity channel_filter1_0002 is
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    coeff_in_clk : in STD_LOGIC;
    coeff_in_areset : in STD_LOGIC;
    coeff_in_data : in STD_LOGIC_VECTOR(15 downto 0);
    coeff_in_address : in STD_LOGIC_VECTOR(11 downto 0);
    coeff_in_we : in STD_LOGIC_VECTOR(0 downto 0);
    coeff_in_read : in STD_LOGIC;
    coeff_out_data : out STD_LOGIC_VECTOR(15 downto 0);
    coeff_out_valid : out STD_LOGIC_VECTOR(0 downto 0);
    ast_sink_data : in STD_LOGIC_VECTOR((0 + 16) * 1 - 1 downto 0);
    ast_sink_valid : in STD_LOGIC;
    ast_sink_sop : in STD_LOGIC;
    ast_sink_eop : in STD_LOGIC;
    ast_sink_error : in STD_LOGIC_VECTOR(1 downto 0);
    ast_source_data : out STD_LOGIC_VECTOR(38 * 1 - 1 downto 0);
    ast_source_valid : out STD_LOGIC;
    ast_source_sop : out STD_LOGIC;
    ast_source_eop : out STD_LOGIC;
    ast_source_channel : out STD_LOGIC_VECTOR(1 - 1 downto 0);
    ast_source_error : out STD_LOGIC_VECTOR(1 downto 0)
  );
end channel_filter1_0002;

architecture syn of channel_filter1_0002 is
  component channel_filter1_0002_ast
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    bus_clk : in std_logic;
    h_areset :  in std_logic;
    busIn_d          : in std_logic_vector(15 downto 0);
    busIn_a          : in std_logic_vector(11 downto 0);
    busIn_w          : in std_logic_vector(0 downto 0);
    busOut_r         : out std_logic_vector(15 downto 0);
    busOut_v         : out std_logic_vector(0 downto 0);
    ast_sink_data : in STD_LOGIC_VECTOR((0 + 16) * 1 - 1 downto 0);
    ast_sink_valid : in STD_LOGIC;
    ast_sink_ready : out STD_LOGIC;
    ast_sink_sop : in STD_LOGIC;
    ast_sink_eop : in STD_LOGIC;
    ast_sink_error : in STD_LOGIC_VECTOR(1 downto 0);
    ast_source_data : out STD_LOGIC_VECTOR(38 * 1 - 1 downto 0);
    ast_source_ready : in STD_LOGIC;
    ast_source_valid : out STD_LOGIC;
    ast_source_sop : out STD_LOGIC;
    ast_source_eop : out STD_LOGIC;
    ast_source_channel : out STD_LOGIC_VECTOR(1 - 1 downto 0);
    ast_source_error : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;

begin
  channel_filter1_0002_ast_inst : channel_filter1_0002_ast
  port map (
    clk => clk,
    reset_n => reset_n,
    bus_clk => coeff_in_clk,
    h_areset => coeff_in_areset,
    busIn_d   => coeff_in_data,
    busIn_a   => coeff_in_address,
    busIn_w   => coeff_in_we,
    busOut_r  => coeff_out_data,
    busOut_v  => coeff_out_valid,
    ast_sink_data => ast_sink_data,
    ast_source_data => ast_source_data,
    ast_sink_valid => ast_sink_valid,
    ast_sink_ready => open,
    ast_source_ready => '1',
    ast_source_valid => ast_source_valid,
    ast_sink_sop => ast_sink_sop,
    ast_sink_eop => ast_sink_eop,
    ast_sink_error => ast_sink_error,
    ast_source_sop => ast_source_sop,
    ast_source_eop => ast_source_eop,
    ast_source_channel => ast_source_channel,
    ast_source_error => ast_source_error
  );
end syn;
