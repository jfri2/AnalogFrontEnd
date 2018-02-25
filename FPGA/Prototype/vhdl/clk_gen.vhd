-------------------------------------------------------------------------------
-- <copyright_statement>
-- COPYRIGHT 2017 JOHN FRITZ. ALL RIGHTS RESERVED.
-- </copyright_statement>
--
-- <rights>
-- </rights>
--
-- <authors>
-- John Fritz
-- </authors>
--
-- <title>
-- clocks.vhd
-- </title>
--
-- <description>
-- 
-- </description>
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY clk_gen IS
    PORT (
        clk_in      : IN  std_logic;            -- 100 MHz Reference clock in
        cclk        : OUT std_logic := '0';     -- Sample clock output
        cclk2x      : OUT std_logic;            -- 2x Sample clock output
        cclk4x      : OUT std_logic;            -- 4x Sample clock output
        pll_locked  : OUT std_logic             -- PLL lock status
    );                 
END clk_gen;

ARCHITECTURE behavior OF clk_gen IS

    COMPONENT pll_ip IS
	PORT (
        inclk0		: IN std_logic;
        c0		    : OUT std_logic;
        locked		: OUT std_logic 
    );
    END COMPONENT;
    
    SIGNAL counter_value: unsigned(1 DOWNTO 0) := (others => '0');
    SIGNAL pll_clk_out: std_logic := '0';       -- pll clock output (no divider) = sample clock * 4
    SIGNAL pll_clk_out_div2: std_logic := '0';  -- pll clock output (divided by 2) = sample clock * 2
    SIGNAL pll_clk_out_div4: std_logic := '0';  -- pll clock output (divided by 4) = sample clock

BEGIN
    cclk <= pll_clk_out_div4;   -- Sample clock
    cclk2x <= pll_clk_out_div2; -- 2x Sample clock
    cclk4x <= pll_clk_out;      -- 4x Sample clock
    
    pll1: pll_ip
        PORT MAP (
            inclk0 => clk_in,
            c0 => pll_clk_out,  -- Output of PLL is 4x sample clock
            locked => pll_locked
        );

    PROCESS (pll_clk_out) IS
    BEGIN
        IF (pll_clk_out'EVENT AND pll_clk_out = '1') THEN
            pll_clk_out_div2 <= NOT pll_clk_out_div2;
            IF (counter_value = 0) THEN
                pll_clk_out_div4 <= NOT pll_clk_out_div4; -- Toggle Sample clock every 4 pll clocks
                counter_value <= counter_value + 1;
            ELSIF (counter_value = 2) THEN
                pll_clk_out_div4 <= NOT pll_clk_out_div4; -- Toggle Sample clock * 2 every 2 pll clocks
                counter_value <= counter_value + 1;
            ELSE 
                counter_value <= counter_value + 1;
            END IF;
        END IF;
    END PROCESS;
END behavior;
