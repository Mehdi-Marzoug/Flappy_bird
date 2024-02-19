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

entity bee is
    Port ( clk : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (10 downto 0);
           bee_out : out STD_LOGIC_VECTOR (2 downto 0));
end bee;

architecture Behavioral of bee is

begin
process(clk)
begin
if(rising_edge(clk)) then
    case address is 
 when "00000000000" => bee_out <= "111";
 when "00000000001" => bee_out <= "111";
 when "00000000010" => bee_out <= "111";
 when "00000000011" => bee_out <= "111";
 when "00000000100" => bee_out <= "111";
 when "00000000101" => bee_out <= "111";
 when "00000000110" => bee_out <= "111";
 when "00000000111" => bee_out <= "111";
 when "00000001000" => bee_out <= "111";
 when "00000001001" => bee_out <= "111";
 when "00000001010" => bee_out <= "111";
 when "00000001011" => bee_out <= "111";
 when "00000001100" => bee_out <= "111";
 when "00000001101" => bee_out <= "111";
 when "00000001110" => bee_out <= "111";
 when "00000001111" => bee_out <= "111";
 when "00000010000" => bee_out <= "111";
 when "00000010001" => bee_out <= "111";
 when "00000010010" => bee_out <= "111";
 when "00000010011" => bee_out <= "111";
 when "00000010100" => bee_out <= "111";
 when "00000010101" => bee_out <= "111";
 when "00000010110" => bee_out <= "111";
 when "00000010111" => bee_out <= "000";
 when "00000011000" => bee_out <= "000";
 when "00000011001" => bee_out <= "000";
 when "00000011010" => bee_out <= "000";
 when "00000011011" => bee_out <= "000";
 when "00000011100" => bee_out <= "000";
 when "00000011101" => bee_out <= "111";
 when "00000011110" => bee_out <= "111";
 when "00000011111" => bee_out <= "000";
 when "00000100000" => bee_out <= "000";
 when "00000100001" => bee_out <= "000";
 when "00000100010" => bee_out <= "111";
 when "00000100011" => bee_out <= "111";
 when "00000100100" => bee_out <= "111";
 when "00000100101" => bee_out <= "111";
 when "00000100110" => bee_out <= "000";
 when "00000100111" => bee_out <= "000";
 when "00000101000" => bee_out <= "111";
 when "00000101001" => bee_out <= "000";
 when "00000101010" => bee_out <= "110";
 when "00000101011" => bee_out <= "110";
 when "00000101100" => bee_out <= "000";
 when "00000101101" => bee_out <= "000";
 when "00000101110" => bee_out <= "000";
 when "00000101111" => bee_out <= "000";
 when "00000110000" => bee_out <= "111";
 when "00000110001" => bee_out <= "111";
 when "00000110010" => bee_out <= "111";
 when "00000110011" => bee_out <= "111";
 when "00000110100" => bee_out <= "111";
 when "00000110101" => bee_out <= "111";
 when "00000110110" => bee_out <= "000";
 when "00000110111" => bee_out <= "110";
 when "00000111000" => bee_out <= "110";
 when "00000111001" => bee_out <= "000";
 when "00000111010" => bee_out <= "110";
 when "00000111011" => bee_out <= "110";
 when "00000111100" => bee_out <= "000";
 when "00000111101" => bee_out <= "110";
 when "00000111110" => bee_out <= "000";
 when "00000111111" => bee_out <= "111";
 when "00001000000" => bee_out <= "000";
 when "00001000001" => bee_out <= "000";
 when "00001000010" => bee_out <= "111";
 when "00001000011" => bee_out <= "111";
 when "00001000100" => bee_out <= "111";
 when "00001000101" => bee_out <= "111";
 when "00001000110" => bee_out <= "000";
 when "00001000111" => bee_out <= "110";
 when "00001001000" => bee_out <= "110";
 when "00001001001" => bee_out <= "110";
 when "00001001010" => bee_out <= "000";
 when "00001001011" => bee_out <= "110";
 when "00001001100" => bee_out <= "110";
 when "00001001101" => bee_out <= "000";
 when "00001001110" => bee_out <= "110";
 when "00001001111" => bee_out <= "000";
 when "00001010000" => bee_out <= "110";
 when "00001010001" => bee_out <= "110";
 when "00001010010" => bee_out <= "111";
 when "00001010011" => bee_out <= "000";
 when "00001010100" => bee_out <= "111";
 when "00001010101" => bee_out <= "111";
 when "00001010110" => bee_out <= "000";
 when "00001010111" => bee_out <= "111";
 when "00001011000" => bee_out <= "000";
 when "00001011001" => bee_out <= "110";
 when "00001011010" => bee_out <= "110";
 when "00001011011" => bee_out <= "000";
 when "00001011100" => bee_out <= "110";
 when "00001011101" => bee_out <= "110";
 when "00001011110" => bee_out <= "000";
 when "00001011111" => bee_out <= "110";
 when "00001100000" => bee_out <= "000";
 when "00001100001" => bee_out <= "110";
 when "00001100010" => bee_out <= "000";
 when "00001100011" => bee_out <= "000";
 when "00001100100" => bee_out <= "000";
 when "00001100101" => bee_out <= "111";
 when "00001100110" => bee_out <= "000";
 when "00001100111" => bee_out <= "000";
 when "00001101000" => bee_out <= "111";
 when "00001101001" => bee_out <= "000";
 when "00001101010" => bee_out <= "110";
 when "00001101011" => bee_out <= "110";
 when "00001101100" => bee_out <= "000";
 when "00001101101" => bee_out <= "110";
 when "00001101110" => bee_out <= "110";
 when "00001101111" => bee_out <= "000";
 when "00001110000" => bee_out <= "110";
 when "00001110001" => bee_out <= "000";
 when "00001110010" => bee_out <= "110";
 when "00001110011" => bee_out <= "000";
 when "00001110100" => bee_out <= "000";
 when "00001110101" => bee_out <= "000";
 when "00001110110" => bee_out <= "111";
 when "00001110111" => bee_out <= "111";
 when "00001111000" => bee_out <= "000";
 when "00001111001" => bee_out <= "111";
 when "00001111010" => bee_out <= "000";
 when "00001111011" => bee_out <= "110";
 when "00001111100" => bee_out <= "110";
 when "00001111101" => bee_out <= "000";
 when "00001111110" => bee_out <= "110";
 when "00001111111" => bee_out <= "110";
 when "00010000000" => bee_out <= "000";
 when "00010000001" => bee_out <= "110";
 when "00010000010" => bee_out <= "000";
 when "00010000011" => bee_out <= "110";
 when "00010000100" => bee_out <= "000";
 when "00010000101" => bee_out <= "000";
 when "00010000110" => bee_out <= "000";
 when "00010000111" => bee_out <= "111";
 when "00010001000" => bee_out <= "111";
 when "00010001001" => bee_out <= "111";
 when "00010001010" => bee_out <= "000";
 when "00010001011" => bee_out <= "111";
 when "00010001100" => bee_out <= "000";
 when "00010001101" => bee_out <= "110";
 when "00010001110" => bee_out <= "110";
 when "00010001111" => bee_out <= "000";
 when "00010010000" => bee_out <= "110";
 when "00010010001" => bee_out <= "000";
 when "00010010010" => bee_out <= "110";
 when "00010010011" => bee_out <= "000";
 when "00010010100" => bee_out <= "110";
 when "00010010101" => bee_out <= "110";
 when "00010010110" => bee_out <= "111";
 when "00010010111" => bee_out <= "000";
 when "00010011000" => bee_out <= "111";
 when "00010011001" => bee_out <= "111";
 when "00010011010" => bee_out <= "111";
 when "00010011011" => bee_out <= "111";
 when "00010011100" => bee_out <= "000";
 when "00010011101" => bee_out <= "111";
 when "00010011110" => bee_out <= "000";
 when "00010011111" => bee_out <= "110";
 when "00010100000" => bee_out <= "110";
 when "00010100001" => bee_out <= "000";
 when "00010100010" => bee_out <= "110";
 when "00010100011" => bee_out <= "000";
 when "00010100100" => bee_out <= "110";
 when "00010100101" => bee_out <= "000";
 when "00010100110" => bee_out <= "110";
 when "00010100111" => bee_out <= "000";
 when "00010101000" => bee_out <= "111";
 when "00010101001" => bee_out <= "111";
 when "00010101010" => bee_out <= "111";
 when "00010101011" => bee_out <= "111";
 when "00010101100" => bee_out <= "111";
 when "00010101101" => bee_out <= "111";
 when "00010101110" => bee_out <= "000";
 when "00010101111" => bee_out <= "000";
 when "00010110000" => bee_out <= "000";
 when "00010110001" => bee_out <= "111";
 when "00010110010" => bee_out <= "000";
 when "00010110011" => bee_out <= "111";
 when "00010110100" => bee_out <= "000";
 when "00010110101" => bee_out <= "000";
 when "00010110110" => bee_out <= "000";
 when "00010110111" => bee_out <= "000";
 when "00010111000" => bee_out <= "111";
 when "00010111001" => bee_out <= "111";
 when "00010111010" => bee_out <= "111";
 when "00010111011" => bee_out <= "111";
 when "00010111100" => bee_out <= "111";
 when "00010111101" => bee_out <= "111";
 when "00010111110" => bee_out <= "111";
 when "00010111111" => bee_out <= "111";
 when "00011000000" => bee_out <= "111";
 when "00011000001" => bee_out <= "111";
 when "00011000010" => bee_out <= "000";
 when "00011000011" => bee_out <= "000";
 when "00011000100" => bee_out <= "000";
 when "00011000101" => bee_out <= "000";
 when "00011000110" => bee_out <= "111";
 when "00011000111" => bee_out <= "111";
 when "00011001000" => bee_out <= "111";
 when "00011001001" => bee_out <= "111";
 when "00011001010" => bee_out <= "111";
 when "00011001011" => bee_out <= "111";

    when "00011001100" => bee_out <= "111";
     when "00111110100" => bee_out <= "010";	
     when others => bee_out <= "111";
 end case;
 end if;
 end process;   

end Behavioral;