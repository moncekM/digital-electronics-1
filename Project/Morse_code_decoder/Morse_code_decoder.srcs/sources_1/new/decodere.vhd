----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2023 10:48:58 AM
-- Design Name: 
-- Module Name: decodere - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decodere is
    Port ( clk100MHz : in STD_LOGIC;
           input: in STD_LOGIC;
           
           rst : in std_logic;
           dot_line : out std_logic;
          space_out : out std_logic
           );
           
end decodere;

architecture Behavioral of decodere is
signal sig_en_250ms : std_logic;   
signal sig_reising_edge : std_logic; 
signal sig_falling_edge : std_logic; 
signal sig_cnt_out: STD_LOGIC_VECTOR (7 downto 0);
signal sig_cnt_out_space: STD_LOGIC_VECTOR (7 downto 0); 
begin
clk_en0 : entity work.clock_enable
      generic map(
          g_MAX => 25000000
      )
      port map(
          clk => CLK100MHZ,
          rst => rst,
          ce  => sig_en_250ms
      );
 bin_cnt0 : entity work.cnt_up_down
     generic map(
          g_CNT_WIDTH => 8
      )
      port map(
          clk => sig_en_250ms,
         rst =>rst,
         cnt_up=>'1',
         en=>sig_reising_edge,
         cnt=>sig_cnt_out
      );
      edge0: entity work.edge
      port map(
      clk=>sig_en_250ms,
      rst=>rst,
      sig_in=>input,
      r_out=>sig_reising_edge,
      f_out=>sig_falling_edge
      
      );
      dot_line_detector0: entity work.dot_line_detector
      port map(
      
      cnt_i=>sig_cnt_out,
      decode_o=>dot_line
      
      );
      bin_cnt1 : entity work.cnt_up_down
     generic map(
          g_CNT_WIDTH => 8
      )
      port map(
          clk => sig_en_250ms,
         rst =>rst,
         cnt_up=>'1',
         en=>sig_falling_edge,
         cnt=>sig_cnt_out_space
      );
      
      dot_line_detector1: entity work.dot_line_detector
      port map(
      
      cnt_i=>sig_cnt_out_space,
      decode_o=>space_out
      
      );
end Behavioral;
