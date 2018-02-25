----------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 13.0sp1
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2013 Altera Corporation.  All rights reserved.    
-- Your use of  Altera  Corporation's design tools,  logic functions and other 
-- software and tools,  and its AMPP  partner logic functions, and  any output 
-- files  any of the  foregoing  device programming or simulation files),  and 
-- any associated  documentation or information are expressly subject  to  the 
-- terms and conditions  of the Altera Program License Subscription Agreement, 
-- Altera  MegaCore  Function  License  Agreement, or other applicable license 
-- agreement,  including,  without limitation,  that your use  is for the sole 
-- purpose of  programming  logic  devices  manufactured by Altera and sold by 
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable 
-- agreement for further details.
----------------------------------------------------------------------------- 

-- VHDL created from channel_filter1_0002_rtl
-- VHDL created on Tue Jan 02 10:42:37 2018


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/SJ/nightly/13.0sp1/232/w32/p4/ip/aion/src/mip_common/hw_model.cpp:1303
entity channel_filter1_0002_rtl is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(15 downto 0);
        busIn_d : in std_logic_vector(15 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        busOut_r : out std_logic_vector(15 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(37 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        h_areset : in std_logic
        );
end;

architecture normal of channel_filter1_0002_rtl is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_xIn_0_14_q : std_logic_vector (15 downto 0);
    signal d_busIn_w_12_q : std_logic_vector (0 downto 0);
    signal d_busIn_d_11_q : std_logic_vector (15 downto 0);
    signal rblookup_q : std_logic_vector(4 downto 0);
    signal rblookup_h : std_logic_vector(0 downto 0);
    signal rblookup_e : std_logic_vector(0 downto 0);
    signal d_rblookup_h_12_q : std_logic_vector (0 downto 0);
    signal rblookup_valid_q : std_logic_vector (0 downto 0);
    signal rm_reset0 : std_logic;
    signal rm_ia : std_logic_vector (15 downto 0);
    signal rm_aa : std_logic_vector (4 downto 0);
    signal rm_ab : std_logic_vector (4 downto 0);
    signal rm_iq : std_logic_vector (15 downto 0);
    signal rm_q : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_11_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_14_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_inputframe_seq_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_inputframe_seq_eq : std_logic;
    signal u0_m0_wo0_run_count : std_logic_vector(1 downto 0);
    signal u0_m0_wo0_run_pre_ena_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_run_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_run_out : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_run_enable_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_run_ctrl : std_logic_vector(2 downto 0);
    signal u0_m0_wo0_memread_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_compute_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_14_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_19_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_20_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_21_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_ra9_count0_q : std_logic_vector(1 downto 0);
    signal u0_m0_wo0_wi0_ra9_count0_i : unsigned(0 downto 0);
    signal u0_m0_wo0_wi0_ra9_count1_q : std_logic_vector(1 downto 0);
    signal u0_m0_wo0_wi0_ra9_count1_i : unsigned(1 downto 0);
    signal u0_m0_wo0_wi0_ra9_count1_sc : signed(0 downto 0);
    signal u0_m0_wo0_wi0_ra9_count1_lutreg_q : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_ra9_add_0_0_a : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_ra9_add_0_0_b : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_ra9_add_0_0_o : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_ra9_add_0_0_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_ra19_count1_q : std_logic_vector(2 downto 0);
    signal u0_m0_wo0_wi0_ra19_count1_i : unsigned(2 downto 0);
    signal u0_m0_wo0_wi0_ra19_count1_sc : signed(0 downto 0);
    signal u0_m0_wo0_wi0_ra19_count1_lutreg_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_ra19_add_0_0_a : std_logic_vector(4 downto 0);
    signal u0_m0_wo0_wi0_ra19_add_0_0_b : std_logic_vector(4 downto 0);
    signal u0_m0_wo0_wi0_ra19_add_0_0_o : std_logic_vector (4 downto 0);
    signal u0_m0_wo0_wi0_ra19_add_0_0_q : std_logic_vector (4 downto 0);
    signal u0_m0_wo0_wi0_we19_seq_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_we19_seq_eq : std_logic;
    signal d_u0_m0_wo0_wi0_we19_seq_q_16_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_wa0_q : std_logic_vector(1 downto 0);
    signal u0_m0_wo0_wi0_wa0_i : unsigned(1 downto 0);
    signal u0_m0_wo0_wi0_wa9_q : std_logic_vector(1 downto 0);
    signal u0_m0_wo0_wi0_wa9_i : unsigned(1 downto 0);
    signal u0_m0_wo0_wi0_wa19_q : std_logic_vector(2 downto 0);
    signal u0_m0_wo0_wi0_wa19_i : unsigned(2 downto 0);
    signal d_u0_m0_wo0_wi0_wa19_q_16_q : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr0_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr0_aa : std_logic_vector (1 downto 0);
    signal u0_m0_wo0_wi0_delayr0_ab : std_logic_vector (1 downto 0);
    signal u0_m0_wo0_wi0_delayr0_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr0_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_delayr0_q_16_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_split1_b_16_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr1_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr1_ia : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr1_aa : std_logic_vector (1 downto 0);
    signal u0_m0_wo0_wi0_delayr1_ab : std_logic_vector (1 downto 0);
    signal u0_m0_wo0_wi0_delayr1_iq : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr1_q : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr5_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr5_ia : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr5_aa : std_logic_vector (1 downto 0);
    signal u0_m0_wo0_wi0_delayr5_ab : std_logic_vector (1 downto 0);
    signal u0_m0_wo0_wi0_delayr5_iq : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr5_q : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr9_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr9_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_aa : std_logic_vector (1 downto 0);
    signal u0_m0_wo0_wi0_delayr9_ab : std_logic_vector (1 downto 0);
    signal u0_m0_wo0_wi0_delayr9_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr11_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr11_ia : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr11_aa : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr11_ab : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr11_iq : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr11_q : std_logic_vector (63 downto 0);
    signal d_u0_m0_wo0_wi0_delRdAddr11_q_16_q : std_logic_vector (2 downto 0);
    signal d_u0_m0_wo0_wi0_split15_e_16_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr15_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr15_ia : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr15_aa : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr15_ab : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr15_iq : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr15_q : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr19_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr19_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr19_aa : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr19_ab : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr19_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr19_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_ca9_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_ca9_i : unsigned(0 downto 0);
    signal u0_m0_wo0_ca9_sc : signed(0 downto 0);
    signal d_u0_m0_wo0_ca9_q_15_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_dec0_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_dec0_e : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_cm0_reset0 : std_logic;
    signal u0_m0_wo0_cm0_reset1 : std_logic;
    signal u0_m0_wo0_cm0_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm0_aa : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm0_ab : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm0_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm0_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_dec1_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_dec1_e : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_cm1_reset0 : std_logic;
    signal u0_m0_wo0_cm1_reset1 : std_logic;
    signal u0_m0_wo0_cm1_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm1_aa : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm1_ab : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm1_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm1_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_dec2_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_dec2_e : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_cm2_reset0 : std_logic;
    signal u0_m0_wo0_cm2_reset1 : std_logic;
    signal u0_m0_wo0_cm2_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm2_aa : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm2_ab : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm2_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm2_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_dec3_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_dec3_e : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_cm3_reset0 : std_logic;
    signal u0_m0_wo0_cm3_reset1 : std_logic;
    signal u0_m0_wo0_cm3_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm3_aa : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm3_ab : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm3_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm3_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_dec4_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_dec4_e : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_cm4_reset0 : std_logic;
    signal u0_m0_wo0_cm4_reset1 : std_logic;
    signal u0_m0_wo0_cm4_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm4_aa : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm4_ab : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm4_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm4_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_dec5_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_dec5_e : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_cm5_reset0 : std_logic;
    signal u0_m0_wo0_cm5_reset1 : std_logic;
    signal u0_m0_wo0_cm5_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm5_aa : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm5_ab : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm5_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm5_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_dec6_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_dec6_e : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_cm6_reset0 : std_logic;
    signal u0_m0_wo0_cm6_reset1 : std_logic;
    signal u0_m0_wo0_cm6_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm6_aa : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm6_ab : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm6_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm6_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_dec7_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_dec7_e : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_cm7_reset0 : std_logic;
    signal u0_m0_wo0_cm7_reset1 : std_logic;
    signal u0_m0_wo0_cm7_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm7_aa : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm7_ab : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm7_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm7_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_dec8_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_dec8_e : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_cm8_reset0 : std_logic;
    signal u0_m0_wo0_cm8_reset1 : std_logic;
    signal u0_m0_wo0_cm8_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm8_aa : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm8_ab : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm8_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm8_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_dec9_e : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_cm9_reset0 : std_logic;
    signal u0_m0_wo0_cm9_reset1 : std_logic;
    signal u0_m0_wo0_cm9_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm9_aa : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm9_ab : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_cm9_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_cm9_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add2_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add2_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add2_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add2_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add3_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add3_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add3_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add3_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add4_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add4_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add4_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add4_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add5_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add5_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add5_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add5_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add6_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add6_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add6_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add6_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add7_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add7_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add7_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add7_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add8_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add8_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add8_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add8_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add9_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add9_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add9_i : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add9_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add9_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_a : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_s1 : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_9_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_a : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_s1 : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_a : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_s1 : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_7_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_a : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_s1 : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_a : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_s1 : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_5_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_a : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_s1 : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_a : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_s1 : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_3_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_a : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_s1 : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_a : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_s1 : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_a : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_s1 : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add0_3_a : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add0_3_b : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add0_3_o : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add0_3_q : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : std_logic_vector(34 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : std_logic_vector(34 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : std_logic_vector (34 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : std_logic_vector (34 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : std_logic_vector(34 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : std_logic_vector(34 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : std_logic_vector (34 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : std_logic_vector (34 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : std_logic_vector(35 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : std_logic_vector(35 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : std_logic_vector(36 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : std_logic_vector(36 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : std_logic_vector (36 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : std_logic_vector (36 downto 0);
    signal u0_m0_wo0_adelay_q : std_logic_vector (37 downto 0);
    signal u0_m0_wo0_aseq_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : std_logic_vector(37 downto 0);
    signal u0_m0_wo0_accum_b : std_logic_vector(37 downto 0);
    signal u0_m0_wo0_accum_i : std_logic_vector (37 downto 0);
    signal u0_m0_wo0_accum_o : std_logic_vector (37 downto 0);
    signal u0_m0_wo0_accum_q : std_logic_vector (37 downto 0);
    signal u0_m0_wo0_oseq_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal d_out0_m0_wo0_assign_sel_q_22_q : std_logic_vector (0 downto 0);
    signal outchan_q : std_logic_vector(1 downto 0);
    signal outchan_i : unsigned(0 downto 0);
    signal u0_m0_wo0_dec9_q_const_q : std_logic_vector (1 downto 0);
    signal rblookup_not_write_a : std_logic_vector(0 downto 0);
    signal rblookup_not_write_q : std_logic_vector(0 downto 0);
    signal rblookup_read_hit_a : std_logic_vector(0 downto 0);
    signal rblookup_read_hit_b : std_logic_vector(0 downto 0);
    signal rblookup_read_hit_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_inputframe_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_inputframe_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_inputframe_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_oseq_gated_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_oseq_gated_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_ra9_count1_lut_q : std_logic_vector(2 downto 0);
    signal u0_m0_wo0_wi0_ra9_resize_in : std_logic_vector (1 downto 0);
    signal u0_m0_wo0_wi0_ra9_resize_b : std_logic_vector (1 downto 0);
    signal u0_m0_wo0_wi0_ra19_count1_lut_q : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_ra19_resize_in : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_ra19_resize_b : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_split1_in : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_split1_b : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split1_c : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split1_d : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split1_e : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split5_in : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_split5_b : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split5_c : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split5_d : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split5_e : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split11_in : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_split11_b : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split11_c : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split11_d : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split11_e : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split15_in : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_split15_b : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split15_c : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split15_d : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split15_e : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_join1_q : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_join5_q : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_join11_q : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_join15_q : std_logic_vector (63 downto 0);
begin


	--GND(CONSTANT,0)@0

	--busIn(BUSIN,3)@10

	--d_busIn_d_11(DELAY,128)@10
    d_busIn_d_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => busIn_d, xout => d_busIn_d_11_q, clk => bus_clk, aclr => h_areset );

	--rblookup(LOOKUP,5)@10
    rblookup: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            rblookup_q <= "00000";
            rblookup_h <= "0";
            rblookup_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000000000" =>  rblookup_q <= "00000";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000000001" =>  rblookup_q <= "00001";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000000010" =>  rblookup_q <= "00010";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000000011" =>  rblookup_q <= "00011";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000000100" =>  rblookup_q <= "00100";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000000101" =>  rblookup_q <= "00101";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000000110" =>  rblookup_q <= "00110";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000000111" =>  rblookup_q <= "00111";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000001000" =>  rblookup_q <= "01000";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000001001" =>  rblookup_q <= "01001";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000001010" =>  rblookup_q <= "01010";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000001011" =>  rblookup_q <= "01011";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000001100" =>  rblookup_q <= "01100";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000001101" =>  rblookup_q <= "01101";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000001110" =>  rblookup_q <= "01110";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000001111" =>  rblookup_q <= "01111";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000010000" =>  rblookup_q <= "10000";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000010001" =>  rblookup_q <= "10001";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN "000000010010" =>  rblookup_q <= "10010";
                    rblookup_h <= "1";
                    rblookup_e <= busIn_w;
                WHEN OTHERS =>
                    rblookup_q <= (others => '-');
                    rblookup_h <= "0";
                    rblookup_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--rm(DUALMEM,8)@11
    rm_ia <= d_busIn_d_11_q;
    rm_aa <= rblookup_q;
    rm_ab <= rblookup_q;
    rm_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 5,
        numwords_a => 19,
        width_b => 16,
        widthad_b => 5,
        numwords_b => 19,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_rm.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => rblookup_e(0),
        aclr0 => rm_reset0,
        clock0 => bus_clk,
        address_b => rm_ab,
        -- data_b => (others => '0'),
        q_b => rm_iq,
        address_a => rm_aa,
        data_a => rm_ia
    );
    rm_reset0 <= h_areset;
        rm_q <= rm_iq(15 downto 0);

	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--d_busIn_w_12(DELAY,129)@10
    d_busIn_w_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => busIn_w, xout => d_busIn_w_12_q, clk => bus_clk, aclr => h_areset );

	--rblookup_not_write(LOGICAL,4)@12
    rblookup_not_write_a <= d_busIn_w_12_q;
    rblookup_not_write_q <= not rblookup_not_write_a;

	--d_rblookup_h_12(DELAY,130)@11
    d_rblookup_h_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => rblookup_h, xout => d_rblookup_h_12_q, clk => bus_clk, aclr => h_areset );

	--rblookup_read_hit(LOGICAL,6)@12
    rblookup_read_hit_a <= d_rblookup_h_12_q;
    rblookup_read_hit_b <= rblookup_not_write_q;
    rblookup_read_hit_q <= rblookup_read_hit_a and rblookup_read_hit_b;

	--rblookup_valid(REG,7)@12
    rblookup_valid: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            rblookup_valid_q <= "0";
        ELSIF rising_edge(bus_clk) THEN
            rblookup_valid_q <= rblookup_read_hit_q;
        END IF;
    END PROCESS;


	--busOut(BUSOUT,9)@13
    busOut_v <= rblookup_valid_q;
    busOut_r <= rm_q;


	--xIn(PORTIN,2)@10

	--d_in0_m0_wi0_wo0_assign_sel_q_11(DELAY,131)@10
    d_in0_m0_wi0_wo0_assign_sel_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_sel_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_inputframe_seq(SEQUENCE,12)@10
    u0_m0_wo0_inputframe_seq: PROCESS (clk, areset)
        variable u0_m0_wo0_inputframe_seq_c : signed (3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_inputframe_seq_c := "0000";
            u0_m0_wo0_inputframe_seq_q <= "0";
            u0_m0_wo0_inputframe_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                IF (u0_m0_wo0_inputframe_seq_c = "0000") THEN
                    u0_m0_wo0_inputframe_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_inputframe_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_inputframe_seq_eq = '1') THEN
                    u0_m0_wo0_inputframe_seq_c := u0_m0_wo0_inputframe_seq_c + 1;
                ELSE
                    u0_m0_wo0_inputframe_seq_c := u0_m0_wo0_inputframe_seq_c - 1;
                END IF;
                u0_m0_wo0_inputframe_seq_q <= std_logic_vector(u0_m0_wo0_inputframe_seq_c(3 DOWNTO 3));
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_inputframe(LOGICAL,13)@11
    u0_m0_wo0_inputframe_a <= u0_m0_wo0_inputframe_seq_q;
    u0_m0_wo0_inputframe_b <= d_in0_m0_wi0_wo0_assign_sel_q_11_q;
    u0_m0_wo0_inputframe_q <= u0_m0_wo0_inputframe_a and u0_m0_wo0_inputframe_b;

	--u0_m0_wo0_run(ENABLEGENERATOR,14)@11
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & u0_m0_wo0_inputframe_q & u0_m0_wo0_run_enable_q;
    u0_m0_wo0_run: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : signed(2 downto 0);
        variable u0_m0_wo0_run_inc : signed(1 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(2,3);
            u0_m0_wo0_run_enable_q <= "0";
            u0_m0_wo0_run_count <= "00";
            u0_m0_wo0_run_inc := (OTHERS => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(2) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-3);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enable_q <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(2 DOWNTO 2));
            ELSE
                u0_m0_wo0_run_enable_q <= "0";
            END IF;
            CASE u0_m0_wo0_run_ctrl is
                WHEN "000" | "001" =>
                    u0_m0_wo0_run_inc := "00";
                WHEN "010" | "011" =>
                    u0_m0_wo0_run_inc := "11";
                WHEN "100" =>
                    u0_m0_wo0_run_inc := "00";
                WHEN "101" =>
                    u0_m0_wo0_run_inc := "01";
                WHEN "110" =>
                    u0_m0_wo0_run_inc := "11";
                WHEN "111" =>
                    u0_m0_wo0_run_inc := "00";
                WHEN OTHERS =>
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_pre_ena_q <= u0_m0_wo0_run_count(1 downto 1);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_pre_ena_q AND VCC_q;

	--u0_m0_wo0_memread(DELAY,15)@13
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

	--u0_m0_wo0_compute(DELAY,16)@13
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

	--d_u0_m0_wo0_compute_q_14(DELAY,133)@13
    d_u0_m0_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_14_q, clk => clk, aclr => areset );

	--d_u0_m0_wo0_compute_q_19(DELAY,134)@14
    d_u0_m0_wo0_compute_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_14_q, xout => d_u0_m0_wo0_compute_q_19_q, clk => clk, aclr => areset );

	--d_u0_m0_wo0_compute_q_20(DELAY,135)@19
    d_u0_m0_wo0_compute_q_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_19_q, xout => d_u0_m0_wo0_compute_q_20_q, clk => clk, aclr => areset );

	--u0_m0_wo0_aseq(SEQUENCE,117)@20
    u0_m0_wo0_aseq: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : signed (4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "00000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "11111") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 3;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= std_logic_vector(u0_m0_wo0_aseq_c(4 DOWNTO 4));
            END IF;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_compute_q_21(DELAY,136)@20
    d_u0_m0_wo0_compute_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_20_q, xout => d_u0_m0_wo0_compute_q_21_q, clk => clk, aclr => areset );

	--u0_m0_wo0_adelay(DELAY,116)@21
    u0_m0_wo0_adelay : dspba_delay
    GENERIC MAP ( width => 38, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_accum_q, xout => u0_m0_wo0_adelay_q, ena => d_u0_m0_wo0_compute_q_21_q(0), clk => clk, aclr => areset );

	--d_xIn_0_14(DELAY,127)@10
    d_xIn_0_14 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4 )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_14_q, clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_wa0(COUNTER,30)@14
    -- every=1, low=0, high=3, step=1, init=2
    u0_m0_wo0_wi0_wa0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_wa0_i <= TO_UNSIGNED(2,2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_14_q = "1") THEN
                    u0_m0_wo0_wi0_wa0_i <= u0_m0_wo0_wi0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_wa0_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_wa0_i,2));


	--d_in0_m0_wi0_wo0_assign_sel_q_14(DELAY,132)@11
    d_in0_m0_wi0_wo0_assign_sel_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_sel_q_11_q, xout => d_in0_m0_wi0_wo0_assign_sel_q_14_q, clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr0(DUALMEM,33)@14
    u0_m0_wo0_wi0_delayr0_ia <= d_xIn_0_14_q;
    u0_m0_wo0_wi0_delayr0_aa <= u0_m0_wo0_wi0_wa0_q;
    u0_m0_wo0_wi0_delayr0_ab <= u0_m0_wo0_wi0_ra9_resize_b;
    u0_m0_wo0_wi0_delayr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => d_in0_m0_wi0_wo0_assign_sel_q_14_q(0),
        aclr0 => u0_m0_wo0_wi0_delayr0_reset0,
        clock0 => clk,
        address_b => u0_m0_wo0_wi0_delayr0_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr0_iq,
        address_a => u0_m0_wo0_wi0_delayr0_aa,
        data_a => u0_m0_wo0_wi0_delayr0_ia
    );
    u0_m0_wo0_wi0_delayr0_reset0 <= areset;
        u0_m0_wo0_wi0_delayr0_q <= u0_m0_wo0_wi0_delayr0_iq(15 downto 0);

	--u0_m0_wo0_wi0_join1(BITJOIN,35)@14
    u0_m0_wo0_wi0_join1_q <= u0_m0_wo0_wi0_split1_d & u0_m0_wo0_wi0_split1_c & u0_m0_wo0_wi0_split1_b & u0_m0_wo0_wi0_delayr0_q;

	--u0_m0_wo0_wi0_delayr1(DUALMEM,37)@14
    u0_m0_wo0_wi0_delayr1_ia <= u0_m0_wo0_wi0_join1_q;
    u0_m0_wo0_wi0_delayr1_aa <= u0_m0_wo0_wi0_wa9_q;
    u0_m0_wo0_wi0_delayr1_ab <= u0_m0_wo0_wi0_ra9_resize_b;
    u0_m0_wo0_wi0_delayr1_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 64,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => u0_m0_wo0_wi0_we19_seq_q(0),
        aclr0 => u0_m0_wo0_wi0_delayr1_reset0,
        clock0 => clk,
        address_b => u0_m0_wo0_wi0_delayr1_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr1_iq,
        address_a => u0_m0_wo0_wi0_delayr1_aa,
        data_a => u0_m0_wo0_wi0_delayr1_ia
    );
    u0_m0_wo0_wi0_delayr1_reset0 <= areset;
        u0_m0_wo0_wi0_delayr1_q <= u0_m0_wo0_wi0_delayr1_iq(63 downto 0);

	--u0_m0_wo0_wi0_split1(BITSELECT,36)@14
    u0_m0_wo0_wi0_split1_in <= u0_m0_wo0_wi0_delayr1_q;
    u0_m0_wo0_wi0_split1_b <= u0_m0_wo0_wi0_split1_in(15 downto 0);
    u0_m0_wo0_wi0_split1_c <= u0_m0_wo0_wi0_split1_in(31 downto 16);
    u0_m0_wo0_wi0_split1_d <= u0_m0_wo0_wi0_split1_in(47 downto 32);
    u0_m0_wo0_wi0_split1_e <= u0_m0_wo0_wi0_split1_in(63 downto 48);

	--u0_m0_wo0_wi0_join5(BITJOIN,39)@14
    u0_m0_wo0_wi0_join5_q <= u0_m0_wo0_wi0_split5_d & u0_m0_wo0_wi0_split5_c & u0_m0_wo0_wi0_split5_b & u0_m0_wo0_wi0_split1_e;

	--u0_m0_wo0_wi0_wa9(COUNTER,31)@14
    -- every=1, low=0, high=3, step=1, init=0
    u0_m0_wo0_wi0_wa9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_wa9_i <= TO_UNSIGNED(0,2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_we19_seq_q = "1") THEN
                    u0_m0_wo0_wi0_wa9_i <= u0_m0_wo0_wi0_wa9_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_wa9_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_wa9_i,2));


	--u0_m0_wo0_wi0_ra9_count1(COUNTER,18)@13
    -- every=2, low=0, high=3, step=1, init=0
    u0_m0_wo0_wi0_ra9_count1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra9_count1_i <= TO_UNSIGNED(0,2);
            u0_m0_wo0_wi0_ra9_count1_sc <= TO_SIGNED(-1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_ra9_count1_sc(0) = '1') THEN
                    u0_m0_wo0_wi0_ra9_count1_sc <= u0_m0_wo0_wi0_ra9_count1_sc - (-1);
                ELSE
                    u0_m0_wo0_wi0_ra9_count1_sc <= u0_m0_wo0_wi0_ra9_count1_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_ra9_count1_sc(0) = '1') THEN
                    u0_m0_wo0_wi0_ra9_count1_i <= u0_m0_wo0_wi0_ra9_count1_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra9_count1_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_ra9_count1_i,2));


	--u0_m0_wo0_wi0_ra9_count1_lut(LOOKUP,19)@13
    u0_m0_wo0_wi0_ra9_count1_lut: PROCESS (u0_m0_wo0_wi0_ra9_count1_q)
    BEGIN
        -- Begin reserved scope level
            CASE (u0_m0_wo0_wi0_ra9_count1_q) IS
                WHEN "00" =>  u0_m0_wo0_wi0_ra9_count1_lut_q <= "000";
                WHEN "01" =>  u0_m0_wo0_wi0_ra9_count1_lut_q <= "010";
                WHEN "10" =>  u0_m0_wo0_wi0_ra9_count1_lut_q <= "010";
                WHEN "11" =>  u0_m0_wo0_wi0_ra9_count1_lut_q <= "000";
                WHEN OTHERS => -- unreachable
                    u0_m0_wo0_wi0_ra9_count1_lut_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--u0_m0_wo0_wi0_ra9_count1_lutreg(REG,20)@13
    u0_m0_wo0_wi0_ra9_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra9_count1_lutreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                u0_m0_wo0_wi0_ra9_count1_lutreg_q <= u0_m0_wo0_wi0_ra9_count1_lut_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_ra9_count0(COUNTER,17)@13
    -- every=1, low=0, high=1, step=1, init=0
    u0_m0_wo0_wi0_ra9_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra9_count0_i <= TO_UNSIGNED(0,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                    u0_m0_wo0_wi0_ra9_count0_i <= u0_m0_wo0_wi0_ra9_count0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra9_count0_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_ra9_count0_i,2));


	--u0_m0_wo0_wi0_ra9_add_0_0(ADD,21)@13
    u0_m0_wo0_wi0_ra9_add_0_0_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_wi0_ra9_count0_q);
    u0_m0_wo0_wi0_ra9_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_ra9_count1_lutreg_q);
    u0_m0_wo0_wi0_ra9_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra9_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_ra9_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_ra9_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_ra9_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra9_add_0_0_q <= u0_m0_wo0_wi0_ra9_add_0_0_o(3 downto 0);


	--u0_m0_wo0_wi0_ra9_resize(BITSELECT,22)@14
    u0_m0_wo0_wi0_ra9_resize_in <= u0_m0_wo0_wi0_ra9_add_0_0_q(1 downto 0);
    u0_m0_wo0_wi0_ra9_resize_b <= u0_m0_wo0_wi0_ra9_resize_in(1 downto 0);

	--u0_m0_wo0_wi0_delayr5(DUALMEM,41)@14
    u0_m0_wo0_wi0_delayr5_ia <= u0_m0_wo0_wi0_join5_q;
    u0_m0_wo0_wi0_delayr5_aa <= u0_m0_wo0_wi0_wa9_q;
    u0_m0_wo0_wi0_delayr5_ab <= u0_m0_wo0_wi0_ra9_resize_b;
    u0_m0_wo0_wi0_delayr5_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 64,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => u0_m0_wo0_wi0_we19_seq_q(0),
        aclr0 => u0_m0_wo0_wi0_delayr5_reset0,
        clock0 => clk,
        address_b => u0_m0_wo0_wi0_delayr5_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr5_iq,
        address_a => u0_m0_wo0_wi0_delayr5_aa,
        data_a => u0_m0_wo0_wi0_delayr5_ia
    );
    u0_m0_wo0_wi0_delayr5_reset0 <= areset;
        u0_m0_wo0_wi0_delayr5_q <= u0_m0_wo0_wi0_delayr5_iq(63 downto 0);

	--u0_m0_wo0_wi0_split5(BITSELECT,40)@14
    u0_m0_wo0_wi0_split5_in <= u0_m0_wo0_wi0_delayr5_q;
    u0_m0_wo0_wi0_split5_b <= u0_m0_wo0_wi0_split5_in(15 downto 0);
    u0_m0_wo0_wi0_split5_c <= u0_m0_wo0_wi0_split5_in(31 downto 16);
    u0_m0_wo0_wi0_split5_d <= u0_m0_wo0_wi0_split5_in(47 downto 32);
    u0_m0_wo0_wi0_split5_e <= u0_m0_wo0_wi0_split5_in(63 downto 48);

	--u0_m0_wo0_wi0_join11(BITJOIN,45)@14
    u0_m0_wo0_wi0_join11_q <= u0_m0_wo0_wi0_split11_d & u0_m0_wo0_wi0_split11_c & u0_m0_wo0_wi0_split11_b & u0_m0_wo0_wi0_split5_e;

	--u0_m0_wo0_wi0_delayr11(DUALMEM,47)@14
    u0_m0_wo0_wi0_delayr11_ia <= u0_m0_wo0_wi0_join11_q;
    u0_m0_wo0_wi0_delayr11_aa <= u0_m0_wo0_wi0_wa19_q;
    u0_m0_wo0_wi0_delayr11_ab <= u0_m0_wo0_wi0_ra19_resize_b;
    u0_m0_wo0_wi0_delayr11_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 64,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => u0_m0_wo0_wi0_we19_seq_q(0),
        aclr0 => u0_m0_wo0_wi0_delayr11_reset0,
        clock0 => clk,
        address_b => u0_m0_wo0_wi0_delayr11_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr11_iq,
        address_a => u0_m0_wo0_wi0_delayr11_aa,
        data_a => u0_m0_wo0_wi0_delayr11_ia
    );
    u0_m0_wo0_wi0_delayr11_reset0 <= areset;
        u0_m0_wo0_wi0_delayr11_q <= u0_m0_wo0_wi0_delayr11_iq(63 downto 0);

	--u0_m0_wo0_wi0_split11(BITSELECT,46)@14
    u0_m0_wo0_wi0_split11_in <= u0_m0_wo0_wi0_delayr11_q;
    u0_m0_wo0_wi0_split11_b <= u0_m0_wo0_wi0_split11_in(15 downto 0);
    u0_m0_wo0_wi0_split11_c <= u0_m0_wo0_wi0_split11_in(31 downto 16);
    u0_m0_wo0_wi0_split11_d <= u0_m0_wo0_wi0_split11_in(47 downto 32);
    u0_m0_wo0_wi0_split11_e <= u0_m0_wo0_wi0_split11_in(63 downto 48);

	--u0_m0_wo0_wi0_join15(BITJOIN,49)@14
    u0_m0_wo0_wi0_join15_q <= u0_m0_wo0_wi0_split15_d & u0_m0_wo0_wi0_split15_c & u0_m0_wo0_wi0_split15_b & u0_m0_wo0_wi0_split11_e;

	--u0_m0_wo0_wi0_wa19(COUNTER,32)@14
    -- every=1, low=0, high=7, step=1, init=6
    u0_m0_wo0_wi0_wa19: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_wa19_i <= TO_UNSIGNED(6,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_we19_seq_q = "1") THEN
                    u0_m0_wo0_wi0_wa19_i <= u0_m0_wo0_wi0_wa19_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_wa19_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_wa19_i,3));


	--u0_m0_wo0_wi0_we19_seq(SEQUENCE,29)@13
    u0_m0_wo0_wi0_we19_seq: PROCESS (clk, areset)
        variable u0_m0_wo0_wi0_we19_seq_c : signed (4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_we19_seq_c := "00000";
            u0_m0_wo0_wi0_we19_seq_q <= "0";
            u0_m0_wo0_wi0_we19_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_wi0_we19_seq_c = "11111") THEN
                    u0_m0_wo0_wi0_we19_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_we19_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_we19_seq_eq = '1') THEN
                    u0_m0_wo0_wi0_we19_seq_c := u0_m0_wo0_wi0_we19_seq_c + 3;
                ELSE
                    u0_m0_wo0_wi0_we19_seq_c := u0_m0_wo0_wi0_we19_seq_c - 1;
                END IF;
                u0_m0_wo0_wi0_we19_seq_q <= std_logic_vector(u0_m0_wo0_wi0_we19_seq_c(4 DOWNTO 4));
            ELSE
                u0_m0_wo0_wi0_we19_seq_q <= "0";
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_ra19_count1(COUNTER,24)@13
    -- every=2, low=0, high=7, step=1, init=0
    u0_m0_wo0_wi0_ra19_count1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra19_count1_i <= TO_UNSIGNED(0,3);
            u0_m0_wo0_wi0_ra19_count1_sc <= TO_SIGNED(-1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_ra19_count1_sc(0) = '1') THEN
                    u0_m0_wo0_wi0_ra19_count1_sc <= u0_m0_wo0_wi0_ra19_count1_sc - (-1);
                ELSE
                    u0_m0_wo0_wi0_ra19_count1_sc <= u0_m0_wo0_wi0_ra19_count1_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_ra19_count1_sc(0) = '1') THEN
                    u0_m0_wo0_wi0_ra19_count1_i <= u0_m0_wo0_wi0_ra19_count1_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra19_count1_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_ra19_count1_i,3));


	--u0_m0_wo0_wi0_ra19_count1_lut(LOOKUP,25)@13
    u0_m0_wo0_wi0_ra19_count1_lut: PROCESS (u0_m0_wo0_wi0_ra19_count1_q)
    BEGIN
        -- Begin reserved scope level
            CASE (u0_m0_wo0_wi0_ra19_count1_q) IS
                WHEN "000" =>  u0_m0_wo0_wi0_ra19_count1_lut_q <= "0010";
                WHEN "001" =>  u0_m0_wo0_wi0_ra19_count1_lut_q <= "0000";
                WHEN "010" =>  u0_m0_wo0_wi0_ra19_count1_lut_q <= "0100";
                WHEN "011" =>  u0_m0_wo0_wi0_ra19_count1_lut_q <= "0010";
                WHEN "100" =>  u0_m0_wo0_wi0_ra19_count1_lut_q <= "0110";
                WHEN "101" =>  u0_m0_wo0_wi0_ra19_count1_lut_q <= "0100";
                WHEN "110" =>  u0_m0_wo0_wi0_ra19_count1_lut_q <= "0000";
                WHEN "111" =>  u0_m0_wo0_wi0_ra19_count1_lut_q <= "0110";
                WHEN OTHERS => -- unreachable
                    u0_m0_wo0_wi0_ra19_count1_lut_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--u0_m0_wo0_wi0_ra19_count1_lutreg(REG,26)@13
    u0_m0_wo0_wi0_ra19_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra19_count1_lutreg_q <= "0010";
        ELSIF rising_edge(clk) THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                u0_m0_wo0_wi0_ra19_count1_lutreg_q <= u0_m0_wo0_wi0_ra19_count1_lut_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_ra19_add_0_0(ADD,27)@13
    u0_m0_wo0_wi0_ra19_add_0_0_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_wi0_ra9_count0_q);
    u0_m0_wo0_wi0_ra19_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_ra19_count1_lutreg_q);
    u0_m0_wo0_wi0_ra19_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra19_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_ra19_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_ra19_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_ra19_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra19_add_0_0_q <= u0_m0_wo0_wi0_ra19_add_0_0_o(4 downto 0);


	--u0_m0_wo0_wi0_ra19_resize(BITSELECT,28)@14
    u0_m0_wo0_wi0_ra19_resize_in <= u0_m0_wo0_wi0_ra19_add_0_0_q(2 downto 0);
    u0_m0_wo0_wi0_ra19_resize_b <= u0_m0_wo0_wi0_ra19_resize_in(2 downto 0);

	--u0_m0_wo0_wi0_delayr15(DUALMEM,51)@14
    u0_m0_wo0_wi0_delayr15_ia <= u0_m0_wo0_wi0_join15_q;
    u0_m0_wo0_wi0_delayr15_aa <= u0_m0_wo0_wi0_wa19_q;
    u0_m0_wo0_wi0_delayr15_ab <= u0_m0_wo0_wi0_ra19_resize_b;
    u0_m0_wo0_wi0_delayr15_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 64,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => u0_m0_wo0_wi0_we19_seq_q(0),
        aclr0 => u0_m0_wo0_wi0_delayr15_reset0,
        clock0 => clk,
        address_b => u0_m0_wo0_wi0_delayr15_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr15_iq,
        address_a => u0_m0_wo0_wi0_delayr15_aa,
        data_a => u0_m0_wo0_wi0_delayr15_ia
    );
    u0_m0_wo0_wi0_delayr15_reset0 <= areset;
        u0_m0_wo0_wi0_delayr15_q <= u0_m0_wo0_wi0_delayr15_iq(63 downto 0);

	--u0_m0_wo0_wi0_split15(BITSELECT,50)@14
    u0_m0_wo0_wi0_split15_in <= u0_m0_wo0_wi0_delayr15_q;
    u0_m0_wo0_wi0_split15_b <= u0_m0_wo0_wi0_split15_in(15 downto 0);
    u0_m0_wo0_wi0_split15_c <= u0_m0_wo0_wi0_split15_in(31 downto 16);
    u0_m0_wo0_wi0_split15_d <= u0_m0_wo0_wi0_split15_in(47 downto 32);
    u0_m0_wo0_wi0_split15_e <= u0_m0_wo0_wi0_split15_in(63 downto 48);

	--d_u0_m0_wo0_wi0_split15_e_16(DELAY,142)@14
    d_u0_m0_wo0_wi0_split15_e_16 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_split15_e, xout => d_u0_m0_wo0_wi0_split15_e_16_q, clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_wa19_q_16(DELAY,138)@14
    d_u0_m0_wo0_wi0_wa19_q_16 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_wa19_q, xout => d_u0_m0_wo0_wi0_wa19_q_16_q, clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_we19_seq_q_16(DELAY,137)@14
    d_u0_m0_wo0_wi0_we19_seq_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_we19_seq_q, xout => d_u0_m0_wo0_wi0_we19_seq_q_16_q, clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delRdAddr11_q_16(DELAY,141)@14
    d_u0_m0_wo0_wi0_delRdAddr11_q_16 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_ra19_resize_b, xout => d_u0_m0_wo0_wi0_delRdAddr11_q_16_q, clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr19(DUALMEM,53)@16
    u0_m0_wo0_wi0_delayr19_ia <= d_u0_m0_wo0_wi0_split15_e_16_q;
    u0_m0_wo0_wi0_delayr19_aa <= d_u0_m0_wo0_wi0_wa19_q_16_q;
    u0_m0_wo0_wi0_delayr19_ab <= d_u0_m0_wo0_wi0_delRdAddr11_q_16_q;
    u0_m0_wo0_wi0_delayr19_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 16,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => d_u0_m0_wo0_wi0_we19_seq_q_16_q(0),
        aclr0 => u0_m0_wo0_wi0_delayr19_reset0,
        clock0 => clk,
        address_b => u0_m0_wo0_wi0_delayr19_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr19_iq,
        address_a => u0_m0_wo0_wi0_delayr19_aa,
        data_a => u0_m0_wo0_wi0_delayr19_ia
    );
    u0_m0_wo0_wi0_delayr19_reset0 <= areset;
        u0_m0_wo0_wi0_delayr19_q <= u0_m0_wo0_wi0_delayr19_iq(15 downto 0);

	--d_u0_m0_wo0_wi0_delayr0_q_16(DELAY,139)@14
    d_u0_m0_wo0_wi0_delayr0_q_16 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr0_q, xout => d_u0_m0_wo0_wi0_delayr0_q_16_q, clk => clk, aclr => areset );

	--u0_m0_wo0_sym_add0(ADD,87)@16
    u0_m0_wo0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_delayr0_q_16_q(15)) & d_u0_m0_wo0_wi0_delayr0_q_16_q);
    u0_m0_wo0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_delayr19_q(15)) & u0_m0_wo0_wi0_delayr19_q);
    u0_m0_wo0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add0_a) + SIGNED(u0_m0_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add0_q <= u0_m0_wo0_sym_add0_o(16 downto 0);


	--u0_m0_wo0_dec0(LOOKUP,57)@10
    u0_m0_wo0_dec0: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec0_q <= "1";
            u0_m0_wo0_dec0_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000000000" =>  u0_m0_wo0_dec0_q <= "1";
                    u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000000001" =>  u0_m0_wo0_dec0_q <= "0";
                    u0_m0_wo0_dec0_e <= busIn_w;
                WHEN OTHERS =>
                    u0_m0_wo0_dec0_q <= (others => '-');
                    u0_m0_wo0_dec0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_ca9(COUNTER,56)@13
    -- every=2, low=0, high=1, step=1, init=0
    u0_m0_wo0_ca9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca9_i <= TO_UNSIGNED(0,1);
            u0_m0_wo0_ca9_sc <= TO_SIGNED(0,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca9_sc(0) = '1') THEN
                    u0_m0_wo0_ca9_sc <= u0_m0_wo0_ca9_sc - (-1);
                ELSE
                    u0_m0_wo0_ca9_sc <= u0_m0_wo0_ca9_sc + (-1);
                END IF;
                IF (u0_m0_wo0_ca9_sc(0) = '1') THEN
                    u0_m0_wo0_ca9_i <= u0_m0_wo0_ca9_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca9_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca9_i,1));


	--d_u0_m0_wo0_ca9_q_15(DELAY,143)@13
    d_u0_m0_wo0_ca9_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_ca9_q, xout => d_u0_m0_wo0_ca9_q_15_q, clk => clk, aclr => areset );

	--u0_m0_wo0_cm0(DUALMEM,59)@15
    u0_m0_wo0_cm0_ia <= d_busIn_d_11_q;
    u0_m0_wo0_cm0_aa <= u0_m0_wo0_dec0_q;
    u0_m0_wo0_cm0_ab <= d_u0_m0_wo0_ca9_q_15_q;
    u0_m0_wo0_cm0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_u0_m0_wo0_cm0.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec0_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm0_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm0_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_cm0_iq,
        address_a => u0_m0_wo0_cm0_aa,
        data_a => u0_m0_wo0_cm0_ia
    );
    u0_m0_wo0_cm0_reset1 <= areset;
        u0_m0_wo0_cm0_q <= u0_m0_wo0_cm0_iq(15 downto 0);

	--u0_m0_wo0_mtree_mult1_9(MULT,97)@17
    u0_m0_wo0_mtree_mult1_9_a <= u0_m0_wo0_cm0_q;
    u0_m0_wo0_mtree_mult1_9_b <= u0_m0_wo0_sym_add0_q;
    u0_m0_wo0_mtree_mult1_9_reset <= areset;

    u0_m0_wo0_mtree_mult1_9_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 16,
    lpm_widthb => 17,
    lpm_widthp => 33,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_9_a,
    datab => u0_m0_wo0_mtree_mult1_9_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_9_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_9_s1
    );
    u0_m0_wo0_mtree_mult1_9_q <= u0_m0_wo0_mtree_mult1_9_s1;

	--d_u0_m0_wo0_wi0_split1_b_16(DELAY,140)@14
    d_u0_m0_wo0_wi0_split1_b_16 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_split1_b, xout => d_u0_m0_wo0_wi0_split1_b_16_q, clk => clk, aclr => areset );

	--u0_m0_wo0_sym_add1(ADD,88)@16
    u0_m0_wo0_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_split1_b_16_q(15)) & d_u0_m0_wo0_wi0_split1_b_16_q);
    u0_m0_wo0_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_split15_e_16_q(15)) & d_u0_m0_wo0_wi0_split15_e_16_q);
    u0_m0_wo0_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add1_a) + SIGNED(u0_m0_wo0_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add1_q <= u0_m0_wo0_sym_add1_o(16 downto 0);


	--u0_m0_wo0_dec1(LOOKUP,60)@10
    u0_m0_wo0_dec1: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec1_q <= "1";
            u0_m0_wo0_dec1_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000000010" =>  u0_m0_wo0_dec1_q <= "1";
                    u0_m0_wo0_dec1_e <= busIn_w;
                WHEN "000000000011" =>  u0_m0_wo0_dec1_q <= "0";
                    u0_m0_wo0_dec1_e <= busIn_w;
                WHEN OTHERS =>
                    u0_m0_wo0_dec1_q <= (others => '-');
                    u0_m0_wo0_dec1_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm1(DUALMEM,62)@15
    u0_m0_wo0_cm1_ia <= d_busIn_d_11_q;
    u0_m0_wo0_cm1_aa <= u0_m0_wo0_dec1_q;
    u0_m0_wo0_cm1_ab <= d_u0_m0_wo0_ca9_q_15_q;
    u0_m0_wo0_cm1_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_u0_m0_wo0_cm1.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec1_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm1_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm1_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_cm1_iq,
        address_a => u0_m0_wo0_cm1_aa,
        data_a => u0_m0_wo0_cm1_ia
    );
    u0_m0_wo0_cm1_reset1 <= areset;
        u0_m0_wo0_cm1_q <= u0_m0_wo0_cm1_iq(15 downto 0);

	--u0_m0_wo0_mtree_mult1_8(MULT,98)@17
    u0_m0_wo0_mtree_mult1_8_a <= u0_m0_wo0_cm1_q;
    u0_m0_wo0_mtree_mult1_8_b <= u0_m0_wo0_sym_add1_q;
    u0_m0_wo0_mtree_mult1_8_reset <= areset;

    u0_m0_wo0_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 16,
    lpm_widthb => 17,
    lpm_widthp => 33,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_8_a,
    datab => u0_m0_wo0_mtree_mult1_8_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_8_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_8_s1
    );
    u0_m0_wo0_mtree_mult1_8_q <= u0_m0_wo0_mtree_mult1_8_s1;

	--u0_m0_wo0_mtree_add0_4(ADD,111)@19
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_mult1_8_q(32)) & u0_m0_wo0_mtree_mult1_8_q);
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_mult1_9_q(32)) & u0_m0_wo0_mtree_mult1_9_q);
    u0_m0_wo0_mtree_add0_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(33 downto 0);


	--u0_m0_wo0_sym_add2(ADD,89)@14
    u0_m0_wo0_sym_add2_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split1_c(15)) & u0_m0_wo0_wi0_split1_c);
    u0_m0_wo0_sym_add2_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split15_d(15)) & u0_m0_wo0_wi0_split15_d);
    u0_m0_wo0_sym_add2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add2_a) + SIGNED(u0_m0_wo0_sym_add2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add2_q <= u0_m0_wo0_sym_add2_o(16 downto 0);


	--u0_m0_wo0_dec2(LOOKUP,63)@10
    u0_m0_wo0_dec2: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec2_q <= "1";
            u0_m0_wo0_dec2_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000000100" =>  u0_m0_wo0_dec2_q <= "1";
                    u0_m0_wo0_dec2_e <= busIn_w;
                WHEN "000000000101" =>  u0_m0_wo0_dec2_q <= "0";
                    u0_m0_wo0_dec2_e <= busIn_w;
                WHEN OTHERS =>
                    u0_m0_wo0_dec2_q <= (others => '-');
                    u0_m0_wo0_dec2_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm2(DUALMEM,65)@13
    u0_m0_wo0_cm2_ia <= d_busIn_d_11_q;
    u0_m0_wo0_cm2_aa <= u0_m0_wo0_dec2_q;
    u0_m0_wo0_cm2_ab <= u0_m0_wo0_ca9_q;
    u0_m0_wo0_cm2_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_u0_m0_wo0_cm2.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec2_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm2_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm2_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_cm2_iq,
        address_a => u0_m0_wo0_cm2_aa,
        data_a => u0_m0_wo0_cm2_ia
    );
    u0_m0_wo0_cm2_reset1 <= areset;
        u0_m0_wo0_cm2_q <= u0_m0_wo0_cm2_iq(15 downto 0);

	--u0_m0_wo0_mtree_mult1_7(MULT,99)@15
    u0_m0_wo0_mtree_mult1_7_a <= u0_m0_wo0_cm2_q;
    u0_m0_wo0_mtree_mult1_7_b <= u0_m0_wo0_sym_add2_q;
    u0_m0_wo0_mtree_mult1_7_reset <= areset;

    u0_m0_wo0_mtree_mult1_7_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 16,
    lpm_widthb => 17,
    lpm_widthp => 33,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_7_a,
    datab => u0_m0_wo0_mtree_mult1_7_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_7_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_7_s1
    );
    u0_m0_wo0_mtree_mult1_7_q <= u0_m0_wo0_mtree_mult1_7_s1;

	--u0_m0_wo0_sym_add3(ADD,90)@14
    u0_m0_wo0_sym_add3_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split1_d(15)) & u0_m0_wo0_wi0_split1_d);
    u0_m0_wo0_sym_add3_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split15_c(15)) & u0_m0_wo0_wi0_split15_c);
    u0_m0_wo0_sym_add3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add3_a) + SIGNED(u0_m0_wo0_sym_add3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add3_q <= u0_m0_wo0_sym_add3_o(16 downto 0);


	--u0_m0_wo0_dec3(LOOKUP,66)@10
    u0_m0_wo0_dec3: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec3_q <= "1";
            u0_m0_wo0_dec3_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000000110" =>  u0_m0_wo0_dec3_q <= "1";
                    u0_m0_wo0_dec3_e <= busIn_w;
                WHEN "000000000111" =>  u0_m0_wo0_dec3_q <= "0";
                    u0_m0_wo0_dec3_e <= busIn_w;
                WHEN OTHERS =>
                    u0_m0_wo0_dec3_q <= (others => '-');
                    u0_m0_wo0_dec3_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm3(DUALMEM,68)@13
    u0_m0_wo0_cm3_ia <= d_busIn_d_11_q;
    u0_m0_wo0_cm3_aa <= u0_m0_wo0_dec3_q;
    u0_m0_wo0_cm3_ab <= u0_m0_wo0_ca9_q;
    u0_m0_wo0_cm3_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_u0_m0_wo0_cm3.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec3_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm3_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm3_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_cm3_iq,
        address_a => u0_m0_wo0_cm3_aa,
        data_a => u0_m0_wo0_cm3_ia
    );
    u0_m0_wo0_cm3_reset1 <= areset;
        u0_m0_wo0_cm3_q <= u0_m0_wo0_cm3_iq(15 downto 0);

	--u0_m0_wo0_mtree_mult1_6(MULT,100)@15
    u0_m0_wo0_mtree_mult1_6_a <= u0_m0_wo0_cm3_q;
    u0_m0_wo0_mtree_mult1_6_b <= u0_m0_wo0_sym_add3_q;
    u0_m0_wo0_mtree_mult1_6_reset <= areset;

    u0_m0_wo0_mtree_mult1_6_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 16,
    lpm_widthb => 17,
    lpm_widthp => 33,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_6_a,
    datab => u0_m0_wo0_mtree_mult1_6_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_6_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_6_s1
    );
    u0_m0_wo0_mtree_mult1_6_q <= u0_m0_wo0_mtree_mult1_6_s1;

	--u0_m0_wo0_mtree_add0_3(ADD,110)@17
    u0_m0_wo0_mtree_add0_3_a <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_mult1_6_q(32)) & u0_m0_wo0_mtree_mult1_6_q);
    u0_m0_wo0_mtree_add0_3_b <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_mult1_7_q(32)) & u0_m0_wo0_mtree_mult1_7_q);
    u0_m0_wo0_mtree_add0_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_q <= u0_m0_wo0_mtree_add0_3_o(33 downto 0);


	--u0_m0_wo0_sym_add4(ADD,91)@14
    u0_m0_wo0_sym_add4_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split1_e(15)) & u0_m0_wo0_wi0_split1_e);
    u0_m0_wo0_sym_add4_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split15_b(15)) & u0_m0_wo0_wi0_split15_b);
    u0_m0_wo0_sym_add4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add4_a) + SIGNED(u0_m0_wo0_sym_add4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add4_q <= u0_m0_wo0_sym_add4_o(16 downto 0);


	--u0_m0_wo0_dec4(LOOKUP,69)@10
    u0_m0_wo0_dec4: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec4_q <= "0";
            u0_m0_wo0_dec4_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000001001" =>  u0_m0_wo0_dec4_q <= "0";
                    u0_m0_wo0_dec4_e <= busIn_w;
                WHEN "000000001000" =>  u0_m0_wo0_dec4_q <= "1";
                    u0_m0_wo0_dec4_e <= busIn_w;
                WHEN OTHERS =>
                    u0_m0_wo0_dec4_q <= (others => '-');
                    u0_m0_wo0_dec4_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm4(DUALMEM,71)@13
    u0_m0_wo0_cm4_ia <= d_busIn_d_11_q;
    u0_m0_wo0_cm4_aa <= u0_m0_wo0_dec4_q;
    u0_m0_wo0_cm4_ab <= u0_m0_wo0_ca9_q;
    u0_m0_wo0_cm4_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_u0_m0_wo0_cm4.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec4_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm4_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm4_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_cm4_iq,
        address_a => u0_m0_wo0_cm4_aa,
        data_a => u0_m0_wo0_cm4_ia
    );
    u0_m0_wo0_cm4_reset1 <= areset;
        u0_m0_wo0_cm4_q <= u0_m0_wo0_cm4_iq(15 downto 0);

	--u0_m0_wo0_mtree_mult1_5(MULT,101)@15
    u0_m0_wo0_mtree_mult1_5_a <= u0_m0_wo0_cm4_q;
    u0_m0_wo0_mtree_mult1_5_b <= u0_m0_wo0_sym_add4_q;
    u0_m0_wo0_mtree_mult1_5_reset <= areset;

    u0_m0_wo0_mtree_mult1_5_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 16,
    lpm_widthb => 17,
    lpm_widthp => 33,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_5_a,
    datab => u0_m0_wo0_mtree_mult1_5_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_5_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_5_s1
    );
    u0_m0_wo0_mtree_mult1_5_q <= u0_m0_wo0_mtree_mult1_5_s1;

	--u0_m0_wo0_sym_add5(ADD,92)@14
    u0_m0_wo0_sym_add5_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split5_b(15)) & u0_m0_wo0_wi0_split5_b);
    u0_m0_wo0_sym_add5_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split11_e(15)) & u0_m0_wo0_wi0_split11_e);
    u0_m0_wo0_sym_add5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add5_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add5_a) + SIGNED(u0_m0_wo0_sym_add5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add5_q <= u0_m0_wo0_sym_add5_o(16 downto 0);


	--u0_m0_wo0_dec5(LOOKUP,72)@10
    u0_m0_wo0_dec5: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec5_q <= "1";
            u0_m0_wo0_dec5_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000001010" =>  u0_m0_wo0_dec5_q <= "1";
                    u0_m0_wo0_dec5_e <= busIn_w;
                WHEN "000000001011" =>  u0_m0_wo0_dec5_q <= "0";
                    u0_m0_wo0_dec5_e <= busIn_w;
                WHEN OTHERS =>
                    u0_m0_wo0_dec5_q <= (others => '-');
                    u0_m0_wo0_dec5_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm5(DUALMEM,74)@13
    u0_m0_wo0_cm5_ia <= d_busIn_d_11_q;
    u0_m0_wo0_cm5_aa <= u0_m0_wo0_dec5_q;
    u0_m0_wo0_cm5_ab <= u0_m0_wo0_ca9_q;
    u0_m0_wo0_cm5_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_u0_m0_wo0_cm5.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec5_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm5_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm5_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_cm5_iq,
        address_a => u0_m0_wo0_cm5_aa,
        data_a => u0_m0_wo0_cm5_ia
    );
    u0_m0_wo0_cm5_reset1 <= areset;
        u0_m0_wo0_cm5_q <= u0_m0_wo0_cm5_iq(15 downto 0);

	--u0_m0_wo0_mtree_mult1_4(MULT,102)@15
    u0_m0_wo0_mtree_mult1_4_a <= u0_m0_wo0_cm5_q;
    u0_m0_wo0_mtree_mult1_4_b <= u0_m0_wo0_sym_add5_q;
    u0_m0_wo0_mtree_mult1_4_reset <= areset;

    u0_m0_wo0_mtree_mult1_4_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 16,
    lpm_widthb => 17,
    lpm_widthp => 33,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_4_a,
    datab => u0_m0_wo0_mtree_mult1_4_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_4_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_4_s1
    );
    u0_m0_wo0_mtree_mult1_4_q <= u0_m0_wo0_mtree_mult1_4_s1;

	--u0_m0_wo0_mtree_add0_2(ADD,109)@17
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_mult1_4_q(32)) & u0_m0_wo0_mtree_mult1_4_q);
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_mult1_5_q(32)) & u0_m0_wo0_mtree_mult1_5_q);
    u0_m0_wo0_mtree_add0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(33 downto 0);


	--u0_m0_wo0_mtree_add1_1(ADD,113)@18
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add0_2_q(33)) & u0_m0_wo0_mtree_add0_2_q);
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add0_3_q(33)) & u0_m0_wo0_mtree_add0_3_q);
    u0_m0_wo0_mtree_add1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(34 downto 0);


	--u0_m0_wo0_sym_add6(ADD,93)@14
    u0_m0_wo0_sym_add6_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split5_c(15)) & u0_m0_wo0_wi0_split5_c);
    u0_m0_wo0_sym_add6_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split11_d(15)) & u0_m0_wo0_wi0_split11_d);
    u0_m0_wo0_sym_add6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add6_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add6_a) + SIGNED(u0_m0_wo0_sym_add6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add6_q <= u0_m0_wo0_sym_add6_o(16 downto 0);


	--u0_m0_wo0_dec6(LOOKUP,75)@10
    u0_m0_wo0_dec6: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec6_q <= "1";
            u0_m0_wo0_dec6_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000001100" =>  u0_m0_wo0_dec6_q <= "1";
                    u0_m0_wo0_dec6_e <= busIn_w;
                WHEN "000000001101" =>  u0_m0_wo0_dec6_q <= "0";
                    u0_m0_wo0_dec6_e <= busIn_w;
                WHEN OTHERS =>
                    u0_m0_wo0_dec6_q <= (others => '-');
                    u0_m0_wo0_dec6_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm6(DUALMEM,77)@13
    u0_m0_wo0_cm6_ia <= d_busIn_d_11_q;
    u0_m0_wo0_cm6_aa <= u0_m0_wo0_dec6_q;
    u0_m0_wo0_cm6_ab <= u0_m0_wo0_ca9_q;
    u0_m0_wo0_cm6_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_u0_m0_wo0_cm6.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec6_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm6_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm6_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_cm6_iq,
        address_a => u0_m0_wo0_cm6_aa,
        data_a => u0_m0_wo0_cm6_ia
    );
    u0_m0_wo0_cm6_reset1 <= areset;
        u0_m0_wo0_cm6_q <= u0_m0_wo0_cm6_iq(15 downto 0);

	--u0_m0_wo0_mtree_mult1_3(MULT,103)@15
    u0_m0_wo0_mtree_mult1_3_a <= u0_m0_wo0_cm6_q;
    u0_m0_wo0_mtree_mult1_3_b <= u0_m0_wo0_sym_add6_q;
    u0_m0_wo0_mtree_mult1_3_reset <= areset;

    u0_m0_wo0_mtree_mult1_3_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 16,
    lpm_widthb => 17,
    lpm_widthp => 33,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_3_a,
    datab => u0_m0_wo0_mtree_mult1_3_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_3_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_3_s1
    );
    u0_m0_wo0_mtree_mult1_3_q <= u0_m0_wo0_mtree_mult1_3_s1;

	--u0_m0_wo0_sym_add7(ADD,94)@14
    u0_m0_wo0_sym_add7_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split5_d(15)) & u0_m0_wo0_wi0_split5_d);
    u0_m0_wo0_sym_add7_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split11_c(15)) & u0_m0_wo0_wi0_split11_c);
    u0_m0_wo0_sym_add7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add7_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add7_a) + SIGNED(u0_m0_wo0_sym_add7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add7_q <= u0_m0_wo0_sym_add7_o(16 downto 0);


	--u0_m0_wo0_dec7(LOOKUP,78)@10
    u0_m0_wo0_dec7: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec7_q <= "1";
            u0_m0_wo0_dec7_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000001110" =>  u0_m0_wo0_dec7_q <= "1";
                    u0_m0_wo0_dec7_e <= busIn_w;
                WHEN "000000001111" =>  u0_m0_wo0_dec7_q <= "0";
                    u0_m0_wo0_dec7_e <= busIn_w;
                WHEN OTHERS =>
                    u0_m0_wo0_dec7_q <= (others => '-');
                    u0_m0_wo0_dec7_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm7(DUALMEM,80)@13
    u0_m0_wo0_cm7_ia <= d_busIn_d_11_q;
    u0_m0_wo0_cm7_aa <= u0_m0_wo0_dec7_q;
    u0_m0_wo0_cm7_ab <= u0_m0_wo0_ca9_q;
    u0_m0_wo0_cm7_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_u0_m0_wo0_cm7.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec7_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm7_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm7_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_cm7_iq,
        address_a => u0_m0_wo0_cm7_aa,
        data_a => u0_m0_wo0_cm7_ia
    );
    u0_m0_wo0_cm7_reset1 <= areset;
        u0_m0_wo0_cm7_q <= u0_m0_wo0_cm7_iq(15 downto 0);

	--u0_m0_wo0_mtree_mult1_2(MULT,104)@15
    u0_m0_wo0_mtree_mult1_2_a <= u0_m0_wo0_cm7_q;
    u0_m0_wo0_mtree_mult1_2_b <= u0_m0_wo0_sym_add7_q;
    u0_m0_wo0_mtree_mult1_2_reset <= areset;

    u0_m0_wo0_mtree_mult1_2_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 16,
    lpm_widthb => 17,
    lpm_widthp => 33,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_2_a,
    datab => u0_m0_wo0_mtree_mult1_2_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_2_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_2_s1
    );
    u0_m0_wo0_mtree_mult1_2_q <= u0_m0_wo0_mtree_mult1_2_s1;

	--u0_m0_wo0_mtree_add0_1(ADD,108)@17
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_mult1_2_q(32)) & u0_m0_wo0_mtree_mult1_2_q);
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_mult1_3_q(32)) & u0_m0_wo0_mtree_mult1_3_q);
    u0_m0_wo0_mtree_add0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(33 downto 0);


	--u0_m0_wo0_sym_add8(ADD,95)@14
    u0_m0_wo0_sym_add8_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split5_e(15)) & u0_m0_wo0_wi0_split5_e);
    u0_m0_wo0_sym_add8_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_split11_b(15)) & u0_m0_wo0_wi0_split11_b);
    u0_m0_wo0_sym_add8: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add8_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add8_a) + SIGNED(u0_m0_wo0_sym_add8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add8_q <= u0_m0_wo0_sym_add8_o(16 downto 0);


	--u0_m0_wo0_dec8(LOOKUP,81)@10
    u0_m0_wo0_dec8: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec8_q <= "1";
            u0_m0_wo0_dec8_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000010000" =>  u0_m0_wo0_dec8_q <= "1";
                    u0_m0_wo0_dec8_e <= busIn_w;
                WHEN "000000010001" =>  u0_m0_wo0_dec8_q <= "0";
                    u0_m0_wo0_dec8_e <= busIn_w;
                WHEN OTHERS =>
                    u0_m0_wo0_dec8_q <= (others => '-');
                    u0_m0_wo0_dec8_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm8(DUALMEM,83)@13
    u0_m0_wo0_cm8_ia <= d_busIn_d_11_q;
    u0_m0_wo0_cm8_aa <= u0_m0_wo0_dec8_q;
    u0_m0_wo0_cm8_ab <= u0_m0_wo0_ca9_q;
    u0_m0_wo0_cm8_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_u0_m0_wo0_cm8.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec8_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm8_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm8_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_cm8_iq,
        address_a => u0_m0_wo0_cm8_aa,
        data_a => u0_m0_wo0_cm8_ia
    );
    u0_m0_wo0_cm8_reset1 <= areset;
        u0_m0_wo0_cm8_q <= u0_m0_wo0_cm8_iq(15 downto 0);

	--u0_m0_wo0_mtree_mult1_1(MULT,105)@15
    u0_m0_wo0_mtree_mult1_1_a <= u0_m0_wo0_cm8_q;
    u0_m0_wo0_mtree_mult1_1_b <= u0_m0_wo0_sym_add8_q;
    u0_m0_wo0_mtree_mult1_1_reset <= areset;

    u0_m0_wo0_mtree_mult1_1_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 16,
    lpm_widthb => 17,
    lpm_widthp => 33,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_1_a,
    datab => u0_m0_wo0_mtree_mult1_1_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_1_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_1_s1
    );
    u0_m0_wo0_mtree_mult1_1_q <= u0_m0_wo0_mtree_mult1_1_s1;

	--u0_m0_wo0_wi0_delayr9(DUALMEM,43)@14
    u0_m0_wo0_wi0_delayr9_ia <= u0_m0_wo0_wi0_split5_e;
    u0_m0_wo0_wi0_delayr9_aa <= u0_m0_wo0_wi0_wa9_q;
    u0_m0_wo0_wi0_delayr9_ab <= u0_m0_wo0_wi0_ra9_resize_b;
    u0_m0_wo0_wi0_delayr9_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => u0_m0_wo0_wi0_we19_seq_q(0),
        aclr0 => u0_m0_wo0_wi0_delayr9_reset0,
        clock0 => clk,
        address_b => u0_m0_wo0_wi0_delayr9_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr9_iq,
        address_a => u0_m0_wo0_wi0_delayr9_aa,
        data_a => u0_m0_wo0_wi0_delayr9_ia
    );
    u0_m0_wo0_wi0_delayr9_reset0 <= areset;
        u0_m0_wo0_wi0_delayr9_q <= u0_m0_wo0_wi0_delayr9_iq(15 downto 0);

	--u0_m0_wo0_sym_add9(ADD,96)@14
    u0_m0_wo0_sym_add9_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_delayr9_q(15)) & u0_m0_wo0_wi0_delayr9_q);
    u0_m0_wo0_sym_add9_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_delayr9_q(15)) & u0_m0_wo0_wi0_delayr9_q);
    u0_m0_wo0_sym_add9_i <= u0_m0_wo0_sym_add9_a;
    u0_m0_wo0_sym_add9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add9_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_14_q = "1") THEN
                u0_m0_wo0_sym_add9_o <= u0_m0_wo0_sym_add9_i;
            ELSE
                u0_m0_wo0_sym_add9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add9_a) + SIGNED(u0_m0_wo0_sym_add9_b));
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add9_q <= u0_m0_wo0_sym_add9_o(16 downto 0);


	--u0_m0_wo0_dec9_q_const(CONSTANT,126)@0
    u0_m0_wo0_dec9_q_const_q <= "01";

	--u0_m0_wo0_dec9(LOOKUP,84)@10
    u0_m0_wo0_dec9: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec9_e <= "0";
        ELSIF rising_edge(bus_clk) THEN            CASE (busIn_a) IS
                WHEN "000000010010" =>                     u0_m0_wo0_dec9_e <= busIn_w;
                WHEN OTHERS =>
                    u0_m0_wo0_dec9_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm9(DUALMEM,86)@13
    u0_m0_wo0_cm9_ia <= d_busIn_d_11_q;
    u0_m0_wo0_cm9_aa <= u0_m0_wo0_dec9_q_const_q(0 downto 0);
    u0_m0_wo0_cm9_ab <= u0_m0_wo0_ca9_q;
    u0_m0_wo0_cm9_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "channel_filter1_0002_rtl_u0_m0_wo0_cm9.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec9_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm9_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm9_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_cm9_iq,
        address_a => u0_m0_wo0_cm9_aa,
        data_a => u0_m0_wo0_cm9_ia
    );
    u0_m0_wo0_cm9_reset1 <= areset;
        u0_m0_wo0_cm9_q <= u0_m0_wo0_cm9_iq(15 downto 0);

	--u0_m0_wo0_mtree_mult1_0(MULT,106)@15
    u0_m0_wo0_mtree_mult1_0_a <= u0_m0_wo0_cm9_q;
    u0_m0_wo0_mtree_mult1_0_b <= u0_m0_wo0_sym_add9_q;
    u0_m0_wo0_mtree_mult1_0_reset <= areset;

    u0_m0_wo0_mtree_mult1_0_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 16,
    lpm_widthb => 17,
    lpm_widthp => 33,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_0_a,
    datab => u0_m0_wo0_mtree_mult1_0_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_0_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_0_s1
    );
    u0_m0_wo0_mtree_mult1_0_q <= u0_m0_wo0_mtree_mult1_0_s1;

	--u0_m0_wo0_mtree_add0_0(ADD,107)@17
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_mult1_0_q(32)) & u0_m0_wo0_mtree_mult1_0_q);
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_mult1_1_q(32)) & u0_m0_wo0_mtree_mult1_1_q);
    u0_m0_wo0_mtree_add0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(33 downto 0);


	--u0_m0_wo0_mtree_add1_0(ADD,112)@18
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add0_0_q(33)) & u0_m0_wo0_mtree_add0_0_q);
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add0_1_q(33)) & u0_m0_wo0_mtree_add0_1_q);
    u0_m0_wo0_mtree_add1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(34 downto 0);


	--u0_m0_wo0_mtree_add2_0(ADD,114)@19
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR((35 downto 35 => u0_m0_wo0_mtree_add1_0_q(34)) & u0_m0_wo0_mtree_add1_0_q);
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR((35 downto 35 => u0_m0_wo0_mtree_add1_1_q(34)) & u0_m0_wo0_mtree_add1_1_q);
    u0_m0_wo0_mtree_add2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(35 downto 0);


	--u0_m0_wo0_mtree_add3_0(ADD,115)@20
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR((36 downto 36 => u0_m0_wo0_mtree_add2_0_q(35)) & u0_m0_wo0_mtree_add2_0_q);
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR((36 downto 34 => u0_m0_wo0_mtree_add0_4_q(33)) & u0_m0_wo0_mtree_add0_4_q);
    u0_m0_wo0_mtree_add3_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(36 downto 0);


	--u0_m0_wo0_accum(ADD,118)@21
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR((37 downto 37 => u0_m0_wo0_mtree_add3_0_q(36)) & u0_m0_wo0_mtree_add3_0_q);
    u0_m0_wo0_accum_b <= u0_m0_wo0_adelay_q;
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_21_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(37 downto 0);


	--u0_m0_wo0_oseq(SEQUENCE,119)@19
    u0_m0_wo0_oseq: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : signed (4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "00010";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_19_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "11111") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 3;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= std_logic_vector(u0_m0_wo0_oseq_c(4 DOWNTO 4));
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_oseq_gated(LOGICAL,120)@20
    u0_m0_wo0_oseq_gated_a <= u0_m0_wo0_oseq_q;
    u0_m0_wo0_oseq_gated_b <= d_u0_m0_wo0_compute_q_20_q;
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_gated_a and u0_m0_wo0_oseq_gated_b;

	--u0_m0_wo0_oseq_gated_reg(REG,121)@20
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF rising_edge(clk) THEN
            u0_m0_wo0_oseq_gated_reg_q <= u0_m0_wo0_oseq_gated_q;
        END IF;
    END PROCESS;


	--outchan(COUNTER,124)@21
    -- every=1, low=0, high=1, step=1, init=1
    outchan: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outchan_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_oseq_gated_reg_q = "1") THEN
                    outchan_i <= outchan_i + 1;
            END IF;
        END IF;
    END PROCESS;
    outchan_q <= STD_LOGIC_VECTOR(RESIZE(outchan_i,2));


	--d_out0_m0_wo0_assign_sel_q_22(DELAY,144)@21
    d_out0_m0_wo0_assign_sel_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_oseq_gated_reg_q, xout => d_out0_m0_wo0_assign_sel_q_22_q, clk => clk, aclr => areset );

	--xOut(PORTOUT,125)@22
    xOut_v <= d_out0_m0_wo0_assign_sel_q_22_q;
    xOut_c <= STD_LOGIC_VECTOR("000000" & outchan_q);
    xOut_0 <= u0_m0_wo0_accum_q;


end normal;
