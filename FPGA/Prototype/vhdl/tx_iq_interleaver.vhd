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
-- tx_iq_interleaver.vhd
-- </title>
--
-- <description>
-- </description>
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY tx_iq_interleaver IS
    PORT (
        iq_out  : OUT std_logic_vector(9 DOWNTO 0);
        i_in    : IN  std_logic_vector(9 DOWNTO 0);
        q_in    : IN  std_logic_vector(9 DOWNTO 0);
        clk4    : IN  std_logic                         -- sample clock x 4
    );
END tx_iq_interleaver;

ARCHITECTURE behavior OF tx_iq_interleaver IS
    SIGNAL counter_value: unsigned(1 DOWNTO 0);
BEGIN
    PROCESS (clk4) IS
    BEGIN
        IF (clk4'EVENT AND clk4 = '1') THEN
            IF (counter_value = 1) THEN
                iq_out <= i_in;     -- Output I 1/4 cycle after sample clock rising edge
                counter_value <= counter_value + 1;
            ELSIF (counter_value = 3) THEN
                iq_out <= q_in;     -- Output Q 1/4 cycle before sample clock rising edge
                counter_value <= counter_value + 1;
            ELSE
                counter_value <= counter_value + 1;
            END IF;
        END IF;
    END PROCESS;
END behavior;
