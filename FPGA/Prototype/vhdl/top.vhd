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
-- top.vhd
-- </title>
--
-- <description>
-- MAX19713 Interface FPGA for Fritz SDR (FSDR) application v1.0
-- </description>
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY top IS
    PORT ( 
        afe_rx_iq       : IN  std_logic_vector(9 DOWNTO 0);     -- AFE Rx IQ Samples
        afe_tx_iq       : OUT std_logic_vector(9 DOWNTO 0);     -- AFE Tx IQ Samples
        afe_cclk        : OUT std_logic;                        -- AFE Converter Clock
        afe_ncs         : OUT std_logic;                        -- AFE SPI Chip Select
        afe_dout        : OUT std_logic;                        -- AFE SPI Data Out
        afe_sclk        : OUT std_logic;                        -- AFE SPI Clock
        afe_aux_din     : IN  std_logic;                        -- Data in from AFE Aux ADC
        ext_clkin       : IN  std_logic;                        -- External Clock In
        sys_pll_locked  : OUT std_logic;                        -- PLL Locked?
        mcu_rx_iq       : OUT std_logic_vector(31 DOWNTO 0);    -- Rx IQ Samples to MCU/DSP
        mcu_tx_iq       : IN  std_logic_vector(31 DOWNTO 0);    -- Tx IQ Samples from MCU/DSP
        mcu_ncs         : IN  std_logic;                        -- Chip Select from MCU SPI
        mcu_dout        : IN  std_logic;                        -- Data from MCU SPI
        mcu_sclk        : IN  std_logic;                        -- Serial Clock from MCU SPI
        mcu_aux_din     : OUT std_logic                         -- ADC Data to MCU
    );                      
END top; 

ARCHITECTURE structure OF top IS

-- Note: Some of these components are not necessarythey are 
--       only placeholders while entities are being 
--       developed

    -- RX IQ De-Interleaver
    COMPONENT rx_iq_deinterleaver IS
        PORT (
            iq_in   : IN  std_logic_vector(9 DOWNTO 0);
            i_out   : OUT std_logic_vector(9 DOWNTO 0);
            q_out   : OUT std_logic_vector(9 DOWNTO 0);
            clk4    : IN  std_logic                         -- clock that is 4x faster than the sample clock
        );
    END COMPONENT;

    -- TX IQ Interleaver
    COMPONENT tx_iq_interleaver IS
        PORT (
            iq_out  : OUT std_logic_vector(9 DOWNTO 0);
            i_in    : IN  std_logic_vector(9 DOWNTO 0);
            q_in    : IN  std_logic_vector(9 DOWNTO 0);
            clk4    : IN  std_logic                         -- sample clock x4
        );
    END COMPONENT;
    
    -- Clock Generator
    COMPONENT clk_gen IS
        PORT (
            clk_in      : IN  std_logic;    -- Reference clock in
            cclk        : OUT std_logic;    -- Converter clock output
            cclk2x      : OUT std_logic;    -- 2x Converter clock output
            cclk4x      : OUT std_logic;    -- 4x Converter clock output
            pll_locked  : OUT std_logic     -- PLL Locked?
        );
    END COMPONENT;
    
    COMPONENT decimator IS
        PORT (
            i_in:   IN  std_logic_vector(9 DOWNTO 0);
            q_in:   IN  std_logic_vector(9 DOWNTO 0);
            i_out:  OUT signed(15 DOWNTO 0);
            q_out:  OUT signed(15 DOWNTO 0);
            clk4:   IN std_logic
        );
    END COMPONENT;
   
--    COMPONENT interpolator IS
--        PORT (
--            -- TODO
--        );
--    END COMPONENT;    
    
    -- Internal signals
    SIGNAL sys_cclk   : std_logic;  -- Converter sample clock (max 45 MHz)
    SIGNAL sys_cclk2x : std_logic;  -- Converter sample clock * 2
    SIGNAL sys_cclk4x : std_logic;  -- Converter sample clock * 4
    SIGNAL sys_bb_rx_i : std_logic_vector(9 DOWNTO 0); -- Baseband rx I samples
    SIGNAL sys_bb_rx_q : std_logic_vector(9 DOWNTO 0); -- Baseband rx Q samples
    SIGNAL sys_bb_tx_i : std_logic_vector(9 DOWNTO 0); -- Baseband tx I samples
    SIGNAL sys_bb_tx_q : std_logic_vector(9 DOWNTO 0); -- Baseband tx Q samples
    SIGNAL sys_decm_rx_i : signed(15 DOWNTO 0);    -- Decimator output, rx I samples
    SIGNAL sys_decm_rx_q : signed(15 DOWNTO 0);    -- Decimator output, rx Q samples
    SIGNAL sys_intr_tx_i : signed(15 DOWNTO 0);    -- Interpolator input, tx I samples
    SIGNAL sys_intr_tx_q : signed(15 DOWNTO 0);    -- Interpolator input, tx Q samples
       
    --TODO:
    -- I/Q Signals from fixed/floating point block to interpolator block
    -- I/Q Signals from decimator block -> AGC Scalar block -> FIR channel filter -> Peak detector/AGC -> Fixed/Float block
    
BEGIN
    -- Map SPI bus to/from MCU/AFE through FPGA
    afe_ncs     <= mcu_ncs;
    afe_dout    <= mcu_dout;
    afe_sclk    <= mcu_sclk;
    mcu_aux_din <= afe_aux_din;
    
    -- Clock output mapping
    afe_cclk    <= sys_cclk;
    
    -- Rx IQ Deinterleaver Mapping
    rx_di1: rx_iq_deinterleaver
        PORT MAP (
            iq_in => afe_rx_iq,
            i_out => sys_bb_rx_i,
            q_out => sys_bb_rx_q,
            clk4 => sys_cclk4x
        );
        
    -- Tx IQ Interleaver Mapping
    tx_i1: tx_iq_interleaver
        PORT MAP (
            iq_out  => afe_tx_iq,
            i_in    => (OTHERS => '0'),
            q_in    => (OTHERS => '0'),
            clk4    => sys_cclk4x
        );
        
    -- Clock Generator Mapping
    clk_gen1: clk_gen 
        PORT MAP (
            clk_in => ext_clkin,
            cclk => sys_cclk,
            cclk2x => sys_cclk2x,
            cclk4x => sys_cclk4x,
            pll_locked => sys_pll_locked
        );

     decimator1: decimator
        PORT MAP (
            i_in => sys_bb_rx_i,
            q_in => sys_bb_rx_q,
            i_out => sys_decm_rx_i,
            q_out => sys_decm_rx_q,
            clk4 => sys_cclk4x
        );
--
--     interpolator1: interpolator
--        PORT MAP (
--            --TODO
--        );        
        
END structure;
