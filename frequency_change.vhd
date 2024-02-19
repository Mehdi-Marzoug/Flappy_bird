----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2023 09:55:05
-- Design Name: 
-- Module Name: frequency_change - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequency_change is
    Port ( clk : in STD_LOGIC;
           clk_100 : in STD_LOGIC;
           score : in STD_LOGIC_VECTOR(9 downto 0);
           clk_125 : in std_logic;
           clk_150 : in std_logic;
           clk_175 : in std_logic;
           clk_50 : in std_logic;
           clk_game : out STD_LOGIC;
           score_interval : in std_logic_vector(5 downto 0));
end frequency_change;

architecture Behavioral of frequency_change is

begin
process(clk) 
begin
if(rising_edge(clk)) then 
    if(to_integer(unsigned(score))/ to_integer(unsigned(score_interval)) =0)then
        clk_game <= clk_100; 
    elsif(to_integer(unsigned(score))/ to_integer(unsigned(score_interval)) =1)then 
        clk_game <= clk_125;
    elsif(to_integer(unsigned(score))/ to_integer(unsigned(score_interval)) =2)then
        clk_game <= clk_150;
    elsif(to_integer(unsigned(score))/ to_integer(unsigned(score_interval)) =3)then   
        clk_game <= clk_175;
    else 
        clk_game <= clk_175;
    end if;
end if;
end process;
end Behavioral;
