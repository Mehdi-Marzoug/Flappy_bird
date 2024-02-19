----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2023 14:50:49
-- Design Name: 
-- Module Name: bee - Behavioral
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

entity twitter_bird is
    Port ( clk : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (10 downto 0);
           twitter_out : out STD_LOGIC_VECTOR (2 downto 0));
end twitter_bird;

architecture Behavioral of twitter_bird is

begin
process(clk)
begin
if(rising_edge(clk)) then
    case address is 
 when "00000000000" => twitter_out <= "111";
 when "00000000001" => twitter_out <= "111";
 when "00000000010" => twitter_out <= "111";
 when "00000000011" => twitter_out <= "111";
 when "00000000100" => twitter_out <= "111";
 when "00000000101" => twitter_out <= "111";
 when "00000000110" => twitter_out <= "111";
 when "00000000111" => twitter_out <= "111";
 when "00000001000" => twitter_out <= "111";
 when "00000001001" => twitter_out <= "111";
 when "00000001010" => twitter_out <= "111";
 when "00000001011" => twitter_out <= "111";
 when "00000001100" => twitter_out <= "111";
 when "00000001101" => twitter_out <= "111";
 when "00000001110" => twitter_out <= "111";
 when "00000001111" => twitter_out <= "111";
 when "00000010000" => twitter_out <= "111";
 when "00000010001" => twitter_out <= "111";
 when "00000010010" => twitter_out <= "111";
 when "00000010011" => twitter_out <= "111";
 when "00000010100" => twitter_out <= "111";
 when "00000010101" => twitter_out <= "111";
 when "00000010110" => twitter_out <= "111";
 when "00000010111" => twitter_out <= "111";
 when "00000011000" => twitter_out <= "111";
 when "00000011001" => twitter_out <= "111";
 when "00000011010" => twitter_out <= "111";
 when "00000011011" => twitter_out <= "111";
 when "00000011100" => twitter_out <= "001";
 when "00000011101" => twitter_out <= "001";
 when "00000011110" => twitter_out <= "001";
 when "00000011111" => twitter_out <= "001";
 when "00000100000" => twitter_out <= "111";
 when "00000100001" => twitter_out <= "111";
 when "00000100010" => twitter_out <= "111";
 when "00000100011" => twitter_out <= "111";
 when "00000100100" => twitter_out <= "111";
 when "00000100101" => twitter_out <= "111";
 when "00000100110" => twitter_out <= "111";
 when "00000100111" => twitter_out <= "111";
 when "00000101000" => twitter_out <= "111";
 when "00000101001" => twitter_out <= "111";
 when "00000101010" => twitter_out <= "111";
 when "00000101011" => twitter_out <= "111";
 when "00000101100" => twitter_out <= "001";
 when "00000101101" => twitter_out <= "001";
 when "00000101110" => twitter_out <= "000";
 when "00000101111" => twitter_out <= "000";
 when "00000110000" => twitter_out <= "001";
 when "00000110001" => twitter_out <= "001";
 when "00000110010" => twitter_out <= "111";
 when "00000110011" => twitter_out <= "111";
 when "00000110100" => twitter_out <= "111";
 when "00000110101" => twitter_out <= "111";
 when "00000110110" => twitter_out <= "111";
 when "00000110111" => twitter_out <= "111";
 when "00000111000" => twitter_out <= "111";
 when "00000111001" => twitter_out <= "111";
 when "00000111010" => twitter_out <= "111";
 when "00000111011" => twitter_out <= "111";
 when "00000111100" => twitter_out <= "001";
 when "00000111101" => twitter_out <= "001";
 when "00000111110" => twitter_out <= "001";
 when "00000111111" => twitter_out <= "000";
 when "00001000000" => twitter_out <= "000";
 when "00001000001" => twitter_out <= "001";
 when "00001000010" => twitter_out <= "000";
 when "00001000011" => twitter_out <= "000";
 when "00001000100" => twitter_out <= "111";
 when "00001000101" => twitter_out <= "111";
 when "00001000110" => twitter_out <= "111";
 when "00001000111" => twitter_out <= "111";
 when "00001001000" => twitter_out <= "111";
 when "00001001001" => twitter_out <= "111";
 when "00001001010" => twitter_out <= "111";
 when "00001001011" => twitter_out <= "001";
 when "00001001100" => twitter_out <= "001";
 when "00001001101" => twitter_out <= "001";
 when "00001001110" => twitter_out <= "001";
 when "00001001111" => twitter_out <= "001";
 when "00001010000" => twitter_out <= "001";
 when "00001010001" => twitter_out <= "001";
 when "00001010010" => twitter_out <= "001";
 when "00001010011" => twitter_out <= "001";
 when "00001010100" => twitter_out <= "111";
 when "00001010101" => twitter_out <= "111";
 when "00001010110" => twitter_out <= "111";
 when "00001010111" => twitter_out <= "111";
 when "00001011000" => twitter_out <= "111";
 when "00001011001" => twitter_out <= "111";
 when "00001011010" => twitter_out <= "111";
 when "00001011011" => twitter_out <= "001";
 when "00001011100" => twitter_out <= "001";
 when "00001011101" => twitter_out <= "001";
 when "00001011110" => twitter_out <= "001";
 when "00001011111" => twitter_out <= "001";
 when "00001100000" => twitter_out <= "001";
 when "00001100001" => twitter_out <= "001";
 when "00001100010" => twitter_out <= "001";
 when "00001100011" => twitter_out <= "001";
 when "00001100100" => twitter_out <= "001";
 when "00001100101" => twitter_out <= "111";
 when "00001100110" => twitter_out <= "111";
 when "00001100111" => twitter_out <= "111";
 when "00001101000" => twitter_out <= "111";
 when "00001101001" => twitter_out <= "111";
 when "00001101010" => twitter_out <= "001";
 when "00001101011" => twitter_out <= "001";
 when "00001101100" => twitter_out <= "001";
 when "00001101101" => twitter_out <= "001";
 when "00001101110" => twitter_out <= "001";
 when "00001101111" => twitter_out <= "001";
 when "00001110000" => twitter_out <= "001";
 when "00001110001" => twitter_out <= "001";
 when "00001110010" => twitter_out <= "001";
 when "00001110011" => twitter_out <= "001";
 when "00001110100" => twitter_out <= "001";
 when "00001110101" => twitter_out <= "001";
 when "00001110110" => twitter_out <= "111";
 when "00001110111" => twitter_out <= "111";
 when "00001111000" => twitter_out <= "001";
 when "00001111001" => twitter_out <= "001";
 when "00001111010" => twitter_out <= "001";
 when "00001111011" => twitter_out <= "001";
 when "00001111100" => twitter_out <= "001";
 when "00001111101" => twitter_out <= "001";
 when "00001111110" => twitter_out <= "001";
 when "00001111111" => twitter_out <= "001";
 when "00010000000" => twitter_out <= "001";
 when "00010000001" => twitter_out <= "001";
 when "00010000010" => twitter_out <= "001";
 when "00010000011" => twitter_out <= "001";
 when "00010000100" => twitter_out <= "001";
 when "00010000101" => twitter_out <= "001";
 when "00010000110" => twitter_out <= "111";
 when "00010000111" => twitter_out <= "111";
 when "00010001000" => twitter_out <= "111";
 when "00010001001" => twitter_out <= "111";
 when "00010001010" => twitter_out <= "111";
 when "00010001011" => twitter_out <= "111";
 when "00010001100" => twitter_out <= "001";
 when "00010001101" => twitter_out <= "001";
 when "00010001110" => twitter_out <= "001";
 when "00010001111" => twitter_out <= "001";
 when "00010010000" => twitter_out <= "001";
 when "00010010001" => twitter_out <= "001";
 when "00010010010" => twitter_out <= "001";
 when "00010010011" => twitter_out <= "001";
 when "00010010100" => twitter_out <= "001";
 when "00010010101" => twitter_out <= "001";
 when "00010010110" => twitter_out <= "111";
 when "00010010111" => twitter_out <= "111";
 when "00010011000" => twitter_out <= "111";
 when "00010011001" => twitter_out <= "111";
 when "00010011010" => twitter_out <= "111";
 when "00010011011" => twitter_out <= "111";
 when "00010011100" => twitter_out <= "111";
 when "00010011101" => twitter_out <= "111";
 when "00010011110" => twitter_out <= "111";
 when "00010011111" => twitter_out <= "001";
 when "00010100000" => twitter_out <= "001";
 when "00010100001" => twitter_out <= "001";
 when "00010100010" => twitter_out <= "001";
 when "00010100011" => twitter_out <= "001";
 when "00010100100" => twitter_out <= "001";
 when "00010100101" => twitter_out <= "001";
 when "00010100110" => twitter_out <= "111";
 when "00010100111" => twitter_out <= "111";
 when "00010101000" => twitter_out <= "111";
 when "00010101001" => twitter_out <= "111";
 when "00010101010" => twitter_out <= "111";
 when "00010101011" => twitter_out <= "111";
 when "00010101100" => twitter_out <= "111";
 when "00010101101" => twitter_out <= "111";
 when "00010101110" => twitter_out <= "111";
 when "00010101111" => twitter_out <= "111";
 when "00010110000" => twitter_out <= "111";
 when "00010110001" => twitter_out <= "111";
 when "00010110010" => twitter_out <= "111";
 when "00010110011" => twitter_out <= "000";
 when "00010110100" => twitter_out <= "111";
 when "00010110101" => twitter_out <= "000";
 when "00010110110" => twitter_out <= "111";
 when "00010110111" => twitter_out <= "111";
 when "00010111000" => twitter_out <= "111";
 when "00010111001" => twitter_out <= "111";
 when "00010111010" => twitter_out <= "111";
 when "00010111011" => twitter_out <= "111";
 when "00010111100" => twitter_out <= "111";
 when "00010111101" => twitter_out <= "111";
 when "00010111110" => twitter_out <= "111";
 when "00010111111" => twitter_out <= "111";
 when "00011000000" => twitter_out <= "111";
 when "00011000001" => twitter_out <= "111";
 when "00011000010" => twitter_out <= "111";
 when "00011000011" => twitter_out <= "111";
 when "00011000100" => twitter_out <= "111";
 when "00011000101" => twitter_out <= "111";
 when "00011000110" => twitter_out <= "111";
 when "00011000111" => twitter_out <= "111";
 when "00011001000" => twitter_out <= "111";
 when "00011001001" => twitter_out <= "111";
 when "00011001010" => twitter_out <= "111";
 when "00011001011" => twitter_out <= "111";

   when "00011001100" => twitter_out <= "111";
     when "00111110100" => twitter_out <= "010";	
     when others => twitter_out <= "111";
 end case;
 end if;
 end process;   

end Behavioral;    