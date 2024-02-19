----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2023 02:48:54 PM
-- Design Name: 
-- Module Name: modulo_8 - Behavioral
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

entity modulo_8 is
    Port ( C_E : in STD_LOGIC;
           clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           sortie_modulo_8 : out STD_LOGIC_VECTOR (2 downto 0));
end modulo_8;

architecture Behavioral of modulo_8 is

signal anode_counter : unsigned (2 downto 0) :=(others => '0');

begin 
counter : process(clk)
    begin   
        if(clk'event and clk ='1') then 
            if(C_E ='1') then       
                if(anode_counter = to_unsigned(7, 3)) then    
                      anode_counter <= to_unsigned(0, 3);       
                  else
                      anode_counter <= anode_counter + 1;
                  end if;
            end if;
         end if;   
     end process counter ; 
 
 process(anode_counter,raz) 
    begin 
        if(raz='1') then
            AN <= "11111111";
        else                 
            case anode_counter is 
                when "000" => AN <= "01111111";
                when "001" => AN <= "10111111";
                when "010" => AN <= "11011111";
                when "011" => AN <= "11101111";
                when "100" => AN <= "11110111";
                when "101" => AN <= "11111011";
                when "110" => AN <= "11111101";
                when "111" => AN <= "11111110";
                when others => AN <= "11111111";
            end case;  
        end if;
  end process ; 
   sortie_modulo_8 <= std_logic_vector(anode_counter);   
end Behavioral;
