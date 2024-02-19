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

entity angry_bird is
    Port ( clk : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (10 downto 0);
           angry_bird_out : out STD_LOGIC_VECTOR (2 downto 0));
end angry_bird;

architecture Behavioral of angry_bird is

begin
process(clk)
begin
if(rising_edge(clk)) then
    case address is
  when "00000000000" => angry_bird_out <= "111";
 when "00000000001" => angry_bird_out <= "111";
 when "00000000010" => angry_bird_out <= "111";
 when "00000000011" => angry_bird_out <= "111";
 when "00000000100" => angry_bird_out <= "111";
 when "00000000101" => angry_bird_out <= "000";
 when "00000000110" => angry_bird_out <= "000";
 when "00000000111" => angry_bird_out <= "000";
 when "00000001000" => angry_bird_out <= "100";
 when "00000001001" => angry_bird_out <= "100";
 when "00000001010" => angry_bird_out <= "000";
 when "00000001011" => angry_bird_out <= "000";
 when "00000001100" => angry_bird_out <= "111";
 when "00000001101" => angry_bird_out <= "111";
 when "00000001110" => angry_bird_out <= "111";
 when "00000001111" => angry_bird_out <= "111";
 when "00000010000" => angry_bird_out <= "111";
 when "00000010001" => angry_bird_out <= "111";
 when "00000010010" => angry_bird_out <= "111";
 when "00000010011" => angry_bird_out <= "111";
 when "00000010100" => angry_bird_out <= "111";
 when "00000010101" => angry_bird_out <= "000";
 when "00000010110" => angry_bird_out <= "000";
 when "00000010111" => angry_bird_out <= "100";
 when "00000011000" => angry_bird_out <= "100";
 when "00000011001" => angry_bird_out <= "100";
 when "00000011010" => angry_bird_out <= "100";
 when "00000011011" => angry_bird_out <= "100";
 when "00000011100" => angry_bird_out <= "100";
 when "00000011101" => angry_bird_out <= "000";
 when "00000011110" => angry_bird_out <= "111";
 when "00000011111" => angry_bird_out <= "111";
 when "00000100000" => angry_bird_out <= "111";
 when "00000100001" => angry_bird_out <= "111";
 when "00000100010" => angry_bird_out <= "111";
 when "00000100011" => angry_bird_out <= "111";
 when "00000100100" => angry_bird_out <= "111";
 when "00000100101" => angry_bird_out <= "000";
 when "00000100110" => angry_bird_out <= "000";
 when "00000100111" => angry_bird_out <= "100";
 when "00000101000" => angry_bird_out <= "100";
 when "00000101001" => angry_bird_out <= "100";
 when "00000101010" => angry_bird_out <= "100";
 when "00000101011" => angry_bird_out <= "100";
 when "00000101100" => angry_bird_out <= "100";
 when "00000101101" => angry_bird_out <= "100";
 when "00000101110" => angry_bird_out <= "100";
 when "00000101111" => angry_bird_out <= "000";
 when "00000110000" => angry_bird_out <= "111";
 when "00000110001" => angry_bird_out <= "111";
 when "00000110010" => angry_bird_out <= "111";
 when "00000110011" => angry_bird_out <= "111";
 when "00000110100" => angry_bird_out <= "111";
 when "00000110101" => angry_bird_out <= "000";
 when "00000110110" => angry_bird_out <= "000";
 when "00000110111" => angry_bird_out <= "100";
 when "00000111000" => angry_bird_out <= "100";
 when "00000111001" => angry_bird_out <= "100";
 when "00000111010" => angry_bird_out <= "100";
 when "00000111011" => angry_bird_out <= "100";
 when "00000111100" => angry_bird_out <= "100";
 when "00000111101" => angry_bird_out <= "100";
 when "00000111110" => angry_bird_out <= "100";
 when "00000111111" => angry_bird_out <= "100";
 when "00001000000" => angry_bird_out <= "100";
 when "00001000001" => angry_bird_out <= "000";
 when "00001000010" => angry_bird_out <= "000";
 when "00001000011" => angry_bird_out <= "111";
 when "00001000100" => angry_bird_out <= "111";
 when "00001000101" => angry_bird_out <= "000";
 when "00001000110" => angry_bird_out <= "000";
 when "00001000111" => angry_bird_out <= "100";
 when "00001001000" => angry_bird_out <= "100";
 when "00001001001" => angry_bird_out <= "100";
 when "00001001010" => angry_bird_out <= "100";
 when "00001001011" => angry_bird_out <= "100";
 when "00001001100" => angry_bird_out <= "100";
 when "00001001101" => angry_bird_out <= "100";
 when "00001001110" => angry_bird_out <= "100";
 when "00001001111" => angry_bird_out <= "100";
 when "00001010000" => angry_bird_out <= "100";
 when "00001010001" => angry_bird_out <= "100";
 when "00001010010" => angry_bird_out <= "100";
 when "00001010011" => angry_bird_out <= "000";
 when "00001010100" => angry_bird_out <= "111";
 when "00001010101" => angry_bird_out <= "000";
 when "00001010110" => angry_bird_out <= "000";
 when "00001010111" => angry_bird_out <= "100";
 when "00001011000" => angry_bird_out <= "100";
 when "00001011001" => angry_bird_out <= "100";
 when "00001011010" => angry_bird_out <= "100";
 when "00001011011" => angry_bird_out <= "100";
 when "00001011100" => angry_bird_out <= "100";
 when "00001011101" => angry_bird_out <= "100";
 when "00001011110" => angry_bird_out <= "000";
 when "00001011111" => angry_bird_out <= "000";
 when "00001100000" => angry_bird_out <= "100";
 when "00001100001" => angry_bird_out <= "100";
 when "00001100010" => angry_bird_out <= "000";
 when "00001100011" => angry_bird_out <= "000";
 when "00001100100" => angry_bird_out <= "000";
 when "00001100101" => angry_bird_out <= "000";
 when "00001100110" => angry_bird_out <= "111";
 when "00001100111" => angry_bird_out <= "000";
 when "00001101000" => angry_bird_out <= "000";
 when "00001101001" => angry_bird_out <= "100";
 when "00001101010" => angry_bird_out <= "100";
 when "00001101011" => angry_bird_out <= "100";
 when "00001101100" => angry_bird_out <= "100";
 when "00001101101" => angry_bird_out <= "100";
 when "00001101110" => angry_bird_out <= "100";
 when "00001101111" => angry_bird_out <= "100";
 when "00001110000" => angry_bird_out <= "111";
 when "00001110001" => angry_bird_out <= "000";
 when "00001110010" => angry_bird_out <= "100";
 when "00001110011" => angry_bird_out <= "100";
 when "00001110100" => angry_bird_out <= "000";
 when "00001110101" => angry_bird_out <= "100";
 when "00001110110" => angry_bird_out <= "100";
 when "00001110111" => angry_bird_out <= "111";
 when "00001111000" => angry_bird_out <= "111";
 when "00001111001" => angry_bird_out <= "000";
 when "00001111010" => angry_bird_out <= "100";
 when "00001111011" => angry_bird_out <= "100";
 when "00001111100" => angry_bird_out <= "100";
 when "00001111101" => angry_bird_out <= "100";
 when "00001111110" => angry_bird_out <= "100";
 when "00001111111" => angry_bird_out <= "100";
 when "00010000000" => angry_bird_out <= "100";
 when "00010000001" => angry_bird_out <= "111";
 when "00010000010" => angry_bird_out <= "111";
 when "00010000011" => angry_bird_out <= "100";
 when "00010000100" => angry_bird_out <= "100";
 when "00010000101" => angry_bird_out <= "111";
 when "00010000110" => angry_bird_out <= "100";
 when "00010000111" => angry_bird_out <= "100";
 when "00010001000" => angry_bird_out <= "111";
 when "00010001001" => angry_bird_out <= "111";
 when "00010001010" => angry_bird_out <= "000";
 when "00010001011" => angry_bird_out <= "100";
 when "00010001100" => angry_bird_out <= "100";
 when "00010001101" => angry_bird_out <= "100";
 when "00010001110" => angry_bird_out <= "100";
 when "00010001111" => angry_bird_out <= "100";
 when "00010010000" => angry_bird_out <= "100";
 when "00010010001" => angry_bird_out <= "100";
 when "00010010010" => angry_bird_out <= "100";
 when "00010010011" => angry_bird_out <= "110";
 when "00010010100" => angry_bird_out <= "110";
 when "00010010101" => angry_bird_out <= "110";
 when "00010010110" => angry_bird_out <= "110";
 when "00010010111" => angry_bird_out <= "100";
 when "00010011000" => angry_bird_out <= "000";
 when "00010011001" => angry_bird_out <= "111";
 when "00010011010" => angry_bird_out <= "111";
 when "00010011011" => angry_bird_out <= "000";
 when "00010011100" => angry_bird_out <= "100";
 when "00010011101" => angry_bird_out <= "100";
 when "00010011110" => angry_bird_out <= "100";
 when "00010011111" => angry_bird_out <= "100";
 when "00010100000" => angry_bird_out <= "111";
 when "00010100001" => angry_bird_out <= "111";
 when "00010100010" => angry_bird_out <= "111";
 when "00010100011" => angry_bird_out <= "110";
 when "00010100100" => angry_bird_out <= "110";
 when "00010100101" => angry_bird_out <= "110";
 when "00010100110" => angry_bird_out <= "110";
 when "00010100111" => angry_bird_out <= "110";
 when "00010101000" => angry_bird_out <= "110";
 when "00010101001" => angry_bird_out <= "000";
 when "00010101010" => angry_bird_out <= "111";
 when "00010101011" => angry_bird_out <= "111";
 when "00010101100" => angry_bird_out <= "111";
 when "00010101101" => angry_bird_out <= "000";
 when "00010101110" => angry_bird_out <= "000";
 when "00010101111" => angry_bird_out <= "100";
 when "00010110000" => angry_bird_out <= "111";
 when "00010110001" => angry_bird_out <= "111";
 when "00010110010" => angry_bird_out <= "111";
 when "00010110011" => angry_bird_out <= "111";
 when "00010110100" => angry_bird_out <= "111";
 when "00010110101" => angry_bird_out <= "111";
 when "00010110110" => angry_bird_out <= "111";
 when "00010110111" => angry_bird_out <= "110";
 when "00010111000" => angry_bird_out <= "000";
 when "00010111001" => angry_bird_out <= "000";
 when "00010111010" => angry_bird_out <= "111";
 when "00010111011" => angry_bird_out <= "111";
 when "00010111100" => angry_bird_out <= "111";
 when "00010111101" => angry_bird_out <= "111";
 when "00010111110" => angry_bird_out <= "111";
 when "00010111111" => angry_bird_out <= "111";
 when "00011000000" => angry_bird_out <= "000";
 when "00011000001" => angry_bird_out <= "000";
 when "00011000010" => angry_bird_out <= "000";
 when "00011000011" => angry_bird_out <= "000";
 when "00011000100" => angry_bird_out <= "000";
 when "00011000101" => angry_bird_out <= "000";
 when "00011000110" => angry_bird_out <= "000";
 when "00011000111" => angry_bird_out <= "000";
 when "00011001000" => angry_bird_out <= "000";
 when "00011001001" => angry_bird_out <= "000";
 when "00011001010" => angry_bird_out <= "111";
 when "00011001011" => angry_bird_out <= "111";
when "00011001100" => angry_bird_out <= "111";
     when "00111110100" => angry_bird_out <= "010";	
     when others => angry_bird_out <= "111";
 end case;
 end if;
 end process;   

end Behavioral;   