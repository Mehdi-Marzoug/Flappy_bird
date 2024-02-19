----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2023 14:53:47
-- Design Name: 
-- Module Name: flappy_or_bee - Behavioral
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

entity flappy_or_bee is
    Port ( choice : in std_logic;
           choice_2 : in std_logic;
           choice_3 : in std_logic;
           choice_4 : in std_logic;
           choice_5 : in std_logic;
           flappy_data : in STD_LOGIC_VECTOR (2 downto 0);
           twitter_data : in STD_LOGIC_VECTOR (2 downto 0);
           angry_bird_data : in STD_LOGIC_VECTOR (2 downto 0);
           angry_cat_data : in STD_LOGIC_VECTOR (2 downto 0);
           bee_data : in STD_LOGIC_VECTOR (2 downto 0);
           pinguin_data : in STD_LOGIC_VECTOR (2 downto 0);
           play_data : out STD_LOGIC_VECTOR (2 downto 0));
end flappy_or_bee;

architecture Behavioral of flappy_or_bee is

begin
process(choice,choice_2,choice_3,choice_4,choice_5,bee_data,twitter_data,angry_bird_data,pinguin_data,angry_cat_data,flappy_data)
begin
    if(choice= '1' and choice_2='0' and choice_3='0' and choice_4='0' and choice_5='0') then
        play_data <= bee_data;
    elsif(choice='0' and choice_2='1' and choice_3='0' and choice_4='0' and choice_5='0') then
        play_data <= twitter_data;
    elsif(choice='0' and choice_2='0' and choice_3='1' and choice_4='0'and choice_5='0') then
        play_data <= angry_bird_data;    
    elsif(choice='0' and choice_2='0' and choice_3='0' and choice_4='1' and choice_5='0') then
        play_data <= pinguin_data;
    elsif(choice='0' and choice_2='0' and choice_3='0' and choice_4='0' and choice_5='1') then
        play_data <= angry_cat_data;         
    else    
        play_data <= flappy_data;    
    end if;
end process;    
end Behavioral;
