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

entity pinguin is
    Port ( clk : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (10 downto 0);
           pinguin_out : out STD_LOGIC_VECTOR (2 downto 0));
end pinguin;

architecture Behavioral of pinguin is

begin
process(clk)
begin
if(rising_edge(clk)) then
    case address is 
     when "00000000000" => pinguin_out <= "111";
 when "00000000001" => pinguin_out <= "111";
 when "00000000010" => pinguin_out <= "111";
 when "00000000011" => pinguin_out <= "111";
 when "00000000100" => pinguin_out <= "111";
 when "00000000101" => pinguin_out <= "111";
 when "00000000110" => pinguin_out <= "111";
 when "00000000111" => pinguin_out <= "000";
 when "00000001000" => pinguin_out <= "000";
 when "00000001001" => pinguin_out <= "000";
 when "00000001010" => pinguin_out <= "111";
 when "00000001011" => pinguin_out <= "111";
 when "00000001100" => pinguin_out <= "111";
 when "00000001101" => pinguin_out <= "111";
 when "00000001110" => pinguin_out <= "111";
 when "00000001111" => pinguin_out <= "111";
 when "00000010000" => pinguin_out <= "111";
 when "00000010001" => pinguin_out <= "111";
 when "00000010010" => pinguin_out <= "111";
 when "00000010011" => pinguin_out <= "111";
 when "00000010100" => pinguin_out <= "111";
 when "00000010101" => pinguin_out <= "000";
 when "00000010110" => pinguin_out <= "000";
 when "00000010111" => pinguin_out <= "000";
 when "00000011000" => pinguin_out <= "000";
 when "00000011001" => pinguin_out <= "000";
 when "00000011010" => pinguin_out <= "000";
 when "00000011011" => pinguin_out <= "000";
 when "00000011100" => pinguin_out <= "000";
 when "00000011101" => pinguin_out <= "000";
 when "00000011110" => pinguin_out <= "111";
 when "00000011111" => pinguin_out <= "111";
 when "00000100000" => pinguin_out <= "111";
 when "00000100001" => pinguin_out <= "111";
 when "00000100010" => pinguin_out <= "111";
 when "00000100011" => pinguin_out <= "111";
 when "00000100100" => pinguin_out <= "111";
 when "00000100101" => pinguin_out <= "111";
 when "00000100110" => pinguin_out <= "000";
 when "00000100111" => pinguin_out <= "111";
 when "00000101000" => pinguin_out <= "111";
 when "00000101001" => pinguin_out <= "000";
 when "00000101010" => pinguin_out <= "111";
 when "00000101011" => pinguin_out <= "000";
 when "00000101100" => pinguin_out <= "111";
 when "00000101101" => pinguin_out <= "111";
 when "00000101110" => pinguin_out <= "000";
 when "00000101111" => pinguin_out <= "111";
 when "00000110000" => pinguin_out <= "111";
 when "00000110001" => pinguin_out <= "111";
 when "00000110010" => pinguin_out <= "111";
 when "00000110011" => pinguin_out <= "111";
 when "00000110100" => pinguin_out <= "111";
 when "00000110101" => pinguin_out <= "111";
 when "00000110110" => pinguin_out <= "111";
 when "00000110111" => pinguin_out <= "000";
 when "00000111000" => pinguin_out <= "111";
 when "00000111001" => pinguin_out <= "111";
 when "00000111010" => pinguin_out <= "110";
 when "00000111011" => pinguin_out <= "110";
 when "00000111100" => pinguin_out <= "110";
 when "00000111101" => pinguin_out <= "111";
 when "00000111110" => pinguin_out <= "111";
 when "00000111111" => pinguin_out <= "000";
 when "00001000000" => pinguin_out <= "111";
 when "00001000001" => pinguin_out <= "111";
 when "00001000010" => pinguin_out <= "111";
 when "00001000011" => pinguin_out <= "111";
 when "00001000100" => pinguin_out <= "111";
 when "00001000101" => pinguin_out <= "111";
 when "00001000110" => pinguin_out <= "111";
 when "00001000111" => pinguin_out <= "000";
 when "00001001000" => pinguin_out <= "000";
 when "00001001001" => pinguin_out <= "111";
 when "00001001010" => pinguin_out <= "111";
 when "00001001011" => pinguin_out <= "111";
 when "00001001100" => pinguin_out <= "110";
 when "00001001101" => pinguin_out <= "111";
 when "00001001110" => pinguin_out <= "111";
 when "00001001111" => pinguin_out <= "111";
 when "00001010000" => pinguin_out <= "000";
 when "00001010001" => pinguin_out <= "000";
 when "00001010010" => pinguin_out <= "111";
 when "00001010011" => pinguin_out <= "111";
 when "00001010100" => pinguin_out <= "111";
 when "00001010101" => pinguin_out <= "111";
 when "00001010110" => pinguin_out <= "111";
 when "00001010111" => pinguin_out <= "000";
 when "00001011000" => pinguin_out <= "000";
 when "00001011001" => pinguin_out <= "111";
 when "00001011010" => pinguin_out <= "111";
 when "00001011011" => pinguin_out <= "111";
 when "00001011100" => pinguin_out <= "111";
 when "00001011101" => pinguin_out <= "111";
 when "00001011110" => pinguin_out <= "111";
 when "00001011111" => pinguin_out <= "111";
 when "00001100000" => pinguin_out <= "111";
 when "00001100001" => pinguin_out <= "111";
 when "00001100010" => pinguin_out <= "000";
 when "00001100011" => pinguin_out <= "000";
 when "00001100100" => pinguin_out <= "111";
 when "00001100101" => pinguin_out <= "111";
 when "00001100110" => pinguin_out <= "111";
 when "00001100111" => pinguin_out <= "111";
 when "00001101000" => pinguin_out <= "000";
 when "00001101001" => pinguin_out <= "000";
 when "00001101010" => pinguin_out <= "111";
 when "00001101011" => pinguin_out <= "111";
 when "00001101100" => pinguin_out <= "111";
 when "00001101101" => pinguin_out <= "111";
 when "00001101110" => pinguin_out <= "111";
 when "00001101111" => pinguin_out <= "111";
 when "00001110000" => pinguin_out <= "111";
 when "00001110001" => pinguin_out <= "111";
 when "00001110010" => pinguin_out <= "111";
 when "00001110011" => pinguin_out <= "000";
 when "00001110100" => pinguin_out <= "000";
 when "00001110101" => pinguin_out <= "111";
 when "00001110110" => pinguin_out <= "111";
 when "00001110111" => pinguin_out <= "111";
 when "00001111000" => pinguin_out <= "111";
 when "00001111001" => pinguin_out <= "000";
 when "00001111010" => pinguin_out <= "000";
 when "00001111011" => pinguin_out <= "111";
 when "00001111100" => pinguin_out <= "111";
 when "00001111101" => pinguin_out <= "111";
 when "00001111110" => pinguin_out <= "111";
 when "00001111111" => pinguin_out <= "111";
 when "00010000000" => pinguin_out <= "111";
 when "00010000001" => pinguin_out <= "111";
 when "00010000010" => pinguin_out <= "111";
 when "00010000011" => pinguin_out <= "111";
 when "00010000100" => pinguin_out <= "000";
 when "00010000101" => pinguin_out <= "000";
 when "00010000110" => pinguin_out <= "111";
 when "00010000111" => pinguin_out <= "111";
 when "00010001000" => pinguin_out <= "111";
 when "00010001001" => pinguin_out <= "111";
 when "00010001010" => pinguin_out <= "000";
 when "00010001011" => pinguin_out <= "000";
 when "00010001100" => pinguin_out <= "111";
 when "00010001101" => pinguin_out <= "111";
 when "00010001110" => pinguin_out <= "111";
 when "00010001111" => pinguin_out <= "111";
 when "00010010000" => pinguin_out <= "111";
 when "00010010001" => pinguin_out <= "111";
 when "00010010010" => pinguin_out <= "111";
 when "00010010011" => pinguin_out <= "111";
 when "00010010100" => pinguin_out <= "111";
 when "00010010101" => pinguin_out <= "000";
 when "00010010110" => pinguin_out <= "000";
 when "00010010111" => pinguin_out <= "111";
 when "00010011000" => pinguin_out <= "111";
 when "00010011001" => pinguin_out <= "111";
 when "00010011010" => pinguin_out <= "111";
 when "00010011011" => pinguin_out <= "111";
 when "00010011100" => pinguin_out <= "111";
 when "00010011101" => pinguin_out <= "000";
 when "00010011110" => pinguin_out <= "000";
 when "00010011111" => pinguin_out <= "110";
 when "00010100000" => pinguin_out <= "110";
 when "00010100001" => pinguin_out <= "110";
 when "00010100010" => pinguin_out <= "110";
 when "00010100011" => pinguin_out <= "110";
 when "00010100100" => pinguin_out <= "000";
 when "00010100101" => pinguin_out <= "000";
 when "00010100110" => pinguin_out <= "111";
 when "00010100111" => pinguin_out <= "111";
 when "00010101000" => pinguin_out <= "111";
 when "00010101001" => pinguin_out <= "111";
 when "00010101010" => pinguin_out <= "111";
 when "00010101011" => pinguin_out <= "111";
 when "00010101100" => pinguin_out <= "111";
 when "00010101101" => pinguin_out <= "111";
 when "00010101110" => pinguin_out <= "111";
 when "00010101111" => pinguin_out <= "111";
 when "00010110000" => pinguin_out <= "111";
 when "00010110001" => pinguin_out <= "110";
 when "00010110010" => pinguin_out <= "110";
 when "00010110011" => pinguin_out <= "110";
 when "00010110100" => pinguin_out <= "111";
 when "00010110101" => pinguin_out <= "111";
 when "00010110110" => pinguin_out <= "111";
 when "00010110111" => pinguin_out <= "111";
 when "00010111000" => pinguin_out <= "111";
 when "00010111001" => pinguin_out <= "111";
 when "00010111010" => pinguin_out <= "111";
 when "00010111011" => pinguin_out <= "111";
 when "00010111100" => pinguin_out <= "111";
 when "00010111101" => pinguin_out <= "111";
 when "00010111110" => pinguin_out <= "111";
 when "00010111111" => pinguin_out <= "111";
 when "00011000000" => pinguin_out <= "111";
 when "00011000001" => pinguin_out <= "111";
 when "00011000010" => pinguin_out <= "111";
 when "00011000011" => pinguin_out <= "111";
 when "00011000100" => pinguin_out <= "111";
 when "00011000101" => pinguin_out <= "111";
 when "00011000110" => pinguin_out <= "111";
 when "00011000111" => pinguin_out <= "111";
 when "00011001000" => pinguin_out <= "111";
 when "00011001001" => pinguin_out <= "111";
 when "00011001010" => pinguin_out <= "111";
 when "00011001011" => pinguin_out <= "111";
 
when "00011001100" => pinguin_out <= "111";
     when "00111110100" => pinguin_out <= "010";	
     when others => pinguin_out <= "111";
 end case;
 end if;
 end process;   

end Behavioral;   