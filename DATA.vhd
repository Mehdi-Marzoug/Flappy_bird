----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2023 16:49:24
-- Design Name: 
-- Module Name: DATA - Behavioral
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

entity DATA is
    Port ( clk : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (10 downto 0);
           data_out : out STD_LOGIC_VECTOR (2 downto 0));
end DATA;

architecture Behavioral of DATA is

begin
process(clk)
begin
if(rising_edge(clk)) then
    case address is 
 when "00000000000" => data_out <= "111";
 when "00000000001" => data_out <= "111";
 when "00000000010" => data_out <= "111";
 when "00000000011" => data_out <= "111";
 when "00000000100" => data_out <= "111";
 when "00000000101" => data_out <= "111";
 when "00000000110" => data_out <= "000";
 when "00000000111" => data_out <= "000";
 when "00000001000" => data_out <= "000";
 when "00000001001" => data_out <= "000";
 when "00000001010" => data_out <= "000";
 when "00000001011" => data_out <= "000";
 when "00000001100" => data_out <= "111";
 when "00000001101" => data_out <= "111";
 when "00000001110" => data_out <= "111";
 when "00000001111" => data_out <= "111";
 when "00000010000" => data_out <= "111";
 when "00000010001" => data_out <= "111";
 when "00000010010" => data_out <= "111";
 when "00000010011" => data_out <= "111";
 when "00000010100" => data_out <= "111";
 when "00000010101" => data_out <= "000";
 when "00000010110" => data_out <= "000";
 when "00000010111" => data_out <= "111";
 when "00000011000" => data_out <= "111";
 when "00000011001" => data_out <= "111";
 when "00000011010" => data_out <= "000";
 when "00000011011" => data_out <= "111";
 when "00000011100" => data_out <= "111";
 when "00000011101" => data_out <= "000";
 when "00000011110" => data_out <= "111";
 when "00000011111" => data_out <= "111";
 when "00000100000" => data_out <= "111";
 when "00000100001" => data_out <= "111";
 when "00000100010" => data_out <= "111";
 when "00000100011" => data_out <= "111";
 when "00000100100" => data_out <= "111";
 when "00000100101" => data_out <= "000";
 when "00000100110" => data_out <= "111";
 when "00000100111" => data_out <= "111";
 when "00000101000" => data_out <= "110";
 when "00000101001" => data_out <= "110";
 when "00000101010" => data_out <= "000";
 when "00000101011" => data_out <= "111";
 when "00000101100" => data_out <= "111";
 when "00000101101" => data_out <= "111";
 when "00000101110" => data_out <= "111";
 when "00000101111" => data_out <= "000";
 when "00000110000" => data_out <= "111";
 when "00000110001" => data_out <= "111";
 when "00000110010" => data_out <= "111";
 when "00000110011" => data_out <= "111";
 when "00000110100" => data_out <= "111";
 when "00000110101" => data_out <= "000";
 when "00000110110" => data_out <= "111";
 when "00000110111" => data_out <= "110";
 when "00000111000" => data_out <= "110";
 when "00000111001" => data_out <= "110";
 when "00000111010" => data_out <= "110";
 when "00000111011" => data_out <= "000";
 when "00000111100" => data_out <= "111";
 when "00000111101" => data_out <= "111";
 when "00000111110" => data_out <= "111";
 when "00000111111" => data_out <= "000";
 when "00001000000" => data_out <= "111";
 when "00001000001" => data_out <= "000";
 when "00001000010" => data_out <= "111";
 when "00001000011" => data_out <= "111";
 when "00001000100" => data_out <= "111";
 when "00001000101" => data_out <= "000";
 when "00001000110" => data_out <= "110";
 when "00001000111" => data_out <= "110";
 when "00001001000" => data_out <= "110";
 when "00001001001" => data_out <= "110";
 when "00001001010" => data_out <= "110";
 when "00001001011" => data_out <= "110";
 when "00001001100" => data_out <= "000";
 when "00001001101" => data_out <= "111";
 when "00001001110" => data_out <= "111";
 when "00001001111" => data_out <= "111";
 when "00001010000" => data_out <= "000";
 when "00001010001" => data_out <= "111";
 when "00001010010" => data_out <= "000";
 when "00001010011" => data_out <= "111";
 when "00001010100" => data_out <= "111";
 when "00001010101" => data_out <= "111";
 when "00001010110" => data_out <= "000";
 when "00001010111" => data_out <= "110";
 when "00001011000" => data_out <= "110";
 when "00001011001" => data_out <= "110";
 when "00001011010" => data_out <= "110";
 when "00001011011" => data_out <= "110";
 when "00001011100" => data_out <= "110";
 when "00001011101" => data_out <= "110";
 when "00001011110" => data_out <= "000";
 when "00001011111" => data_out <= "111";
 when "00001100000" => data_out <= "111";
 when "00001100001" => data_out <= "111";
 when "00001100010" => data_out <= "111";
 when "00001100011" => data_out <= "000";
 when "00001100100" => data_out <= "111";
 when "00001100101" => data_out <= "111";
 when "00001100110" => data_out <= "111";
 when "00001100111" => data_out <= "000";
 when "00001101000" => data_out <= "000";
 when "00001101001" => data_out <= "000";
 when "00001101010" => data_out <= "000";
 when "00001101011" => data_out <= "000";
 when "00001101100" => data_out <= "110";
 when "00001101101" => data_out <= "110";
 when "00001101110" => data_out <= "110";
 when "00001101111" => data_out <= "110";
 when "00001110000" => data_out <= "000";
 when "00001110001" => data_out <= "000";
 when "00001110010" => data_out <= "000";
 when "00001110011" => data_out <= "000";
 when "00001110100" => data_out <= "000";
 when "00001110101" => data_out <= "000";
 when "00001110110" => data_out <= "111";
 when "00001110111" => data_out <= "000";
 when "00001111000" => data_out <= "110";
 when "00001111001" => data_out <= "111";
 when "00001111010" => data_out <= "111";
 when "00001111011" => data_out <= "111";
 when "00001111100" => data_out <= "110";
 when "00001111101" => data_out <= "000";
 when "00001111110" => data_out <= "110";
 when "00001111111" => data_out <= "110";
 when "00010000000" => data_out <= "000";
 when "00010000001" => data_out <= "100";
 when "00010000010" => data_out <= "100";
 when "00010000011" => data_out <= "100";
 when "00010000100" => data_out <= "100";
 when "00010000101" => data_out <= "100";
 when "00010000110" => data_out <= "100";
 when "00010000111" => data_out <= "000";
 when "00010001000" => data_out <= "000";
 when "00010001001" => data_out <= "111";
 when "00010001010" => data_out <= "111";
 when "00010001011" => data_out <= "111";
 when "00010001100" => data_out <= "111";
 when "00010001101" => data_out <= "000";
 when "00010001110" => data_out <= "110";
 when "00010001111" => data_out <= "110";
 when "00010010000" => data_out <= "000";
 when "00010010001" => data_out <= "100";
 when "00010010010" => data_out <= "000";
 when "00010010011" => data_out <= "000";
 when "00010010100" => data_out <= "000";
 when "00010010101" => data_out <= "000";
 when "00010010110" => data_out <= "000";
 when "00010010111" => data_out <= "000";
 when "00010011000" => data_out <= "111";
 when "00010011001" => data_out <= "000";
 when "00010011010" => data_out <= "111";
 when "00010011011" => data_out <= "111";
 when "00010011100" => data_out <= "110";
 when "00010011101" => data_out <= "000";
 when "00010011110" => data_out <= "110";
 when "00010011111" => data_out <= "110";
 when "00010100000" => data_out <= "110";
 when "00010100001" => data_out <= "110";
 when "00010100010" => data_out <= "000";
 when "00010100011" => data_out <= "100";
 when "00010100100" => data_out <= "100";
 when "00010100101" => data_out <= "100";
 when "00010100110" => data_out <= "100";
 when "00010100111" => data_out <= "100";
 when "00010101000" => data_out <= "000";
 when "00010101001" => data_out <= "111";
 when "00010101010" => data_out <= "111";
 when "00010101011" => data_out <= "000";
 when "00010101100" => data_out <= "000";
 when "00010101101" => data_out <= "000";
 when "00010101110" => data_out <= "000";
 when "00010101111" => data_out <= "110";
 when "00010110000" => data_out <= "110";
 when "00010110001" => data_out <= "110";
 when "00010110010" => data_out <= "110";
 when "00010110011" => data_out <= "110";
 when "00010110100" => data_out <= "000";
 when "00010110101" => data_out <= "000";
 when "00010110110" => data_out <= "000";
 when "00010110111" => data_out <= "000";
 when "00010111000" => data_out <= "000";
 when "00010111001" => data_out <= "111";
 when "00010111010" => data_out <= "111";
 when "00010111011" => data_out <= "111";
 when "00010111100" => data_out <= "111";
 when "00010111101" => data_out <= "111";
 when "00010111110" => data_out <= "111";
 when "00010111111" => data_out <= "111";
 when "00011000000" => data_out <= "000";
 when "00011000001" => data_out <= "000";
 when "00011000010" => data_out <= "000";
 when "00011000011" => data_out <= "000";
 when "00011000100" => data_out <= "000";
 when "00011000101" => data_out <= "111";
 when "00011000110" => data_out <= "111";
 when "00011000111" => data_out <= "111";
 when "00011001000" => data_out <= "111";
 when "00011001001" => data_out <= "111";
 when "00011001010" => data_out <= "111";
 when "00011001011" => data_out <= "111";
     when "00011001100" => data_out <= "111";
     when "00111110100" => data_out <= "010";	
     when others => data_out <= "111";
 end case;
 end if;
 end process;   

end Behavioral;
