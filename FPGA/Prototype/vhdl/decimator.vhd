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
-- interpolator.vhd
-- </title>
--
-- <description>
-- </description>
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY decimator IS
    PORT (
        i_in:   IN  std_logic_vector(9 DOWNTO 0);
        q_in:   IN  std_logic_vector(9 DOWNTO 0);
        i_out:  OUT signed(15 DOWNTO 0);
        q_out:  OUT signed(15 DOWNTO 0);
        clk4:   IN  std_logic
    );
END decimator;

ARCHITECTURE behavior OF decimator IS

BEGIN

END behavior;
