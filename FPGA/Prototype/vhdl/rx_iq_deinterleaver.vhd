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
-- rx_iq_deinterleaver.vhd
-- </title>
--
-- <description>
-- </description>
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY rx_iq_deinterleaver IS
    PORT ( 
        iq_in   : IN  std_logic_vector(9 DOWNTO 0);
        i_out   : OUT std_logic_vector(9 DOWNTO 0);
        q_out   : OUT std_logic_vector(9 DOWNTO 0);
        clk4    : IN  std_logic                         -- clock that is 4x faster than the sample clock
    );                    
END rx_iq_deinterleaver;

ARCHITECTURE behavior OF rx_iq_deinterleaver IS
    SIGNAL counter_value: unsigned(1 DOWNTO 0) := (others => '0');
    SIGNAL i_temp: std_logic_vector(9 DOWNTO 0);
    SIGNAL q_temp: std_logic_vector(9 DOWNTO 0);
BEGIN
    PROCESS (clk4) IS
    BEGIN
        IF (clk4'event AND clk4 = '1') THEN
            IF (counter_value = 0) THEN
                i_out <= i_temp;
                q_out <= q_temp;
                counter_value <= counter_value + 1;
            ELSIF (counter_value = 1) THEN
                i_temp <= iq_in;
                counter_value <= counter_value + 1;
            ELSIF (counter_value = 3) THEN
                q_temp <= iq_in;
                counter_value <= (others => '0');
            ELSE 
                counter_value <= counter_value + 1;
            END IF;
        END IF;
    END PROCESS;
END behavior;
