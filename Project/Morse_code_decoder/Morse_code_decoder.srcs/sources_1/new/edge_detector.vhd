----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2023 11:45:13
-- Design Name: 
-- Module Name: edge - Behavioral
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


entity edge is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           sig_in : in STD_LOGIC; 
           r_out : out STD_LOGIC;
           f_out : out STD_LOGIC
          );
end edge;

architecture Behavioral of edge is

    signal s_sig_out : std_logic_vector(1 downto 0);
    signal s_sig_in : std_logic;


begin
     p_edge : process(clk)   
    begin
        if rising_edge(clk) then
           s_sig_in <= sig_in;
            end if;
    end process p_edge;
    
   d_ff0 : entity work.d_ff_rst     
        port map(
            clk => clk,
            rst => rst,
            d => s_sig_in,
            q => s_sig_out(1)
        );
        
    d_ff1 : entity work.d_ff_rst
        port map(
            clk => clk,
            rst => rst,
            d => s_sig_out(1),
            q => s_sig_out(0)
        );
   r_out <= s_sig_out(1) and not(s_sig_out(0));  
    
   f_out <= not(s_sig_out(1)) and s_sig_out(0); 
   
   

 
end architecture Behavioral;