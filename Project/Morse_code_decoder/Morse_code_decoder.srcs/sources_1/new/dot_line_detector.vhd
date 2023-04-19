-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2023 15:27:16
-- Design Name: 
-- Module Name: dot_line_detector - Behavioral
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

entity dot_line_detector is
    Port (
        cnt_i : in STD_LOGIC_VECTOR (7 downto 0);
        decode_o : out std_logic
    );
end dot_line_detector;

architecture Behavioral of dot_line_detector is

begin
    p_dot_line_detector : process(cnt_i)
    begin
        case cnt_i is
            when "01010110" =>
                decode_o <= '0';     
            when others =>
                decode_o <= '1';   
                 
        end case;
    end process p_dot_line_detector;
end Behavioral;