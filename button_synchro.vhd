----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2023 18:34:11
-- Design Name: 
-- Module Name: button_synchro - Behavioral
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
use work.constants.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity button_synchro is
    Port ( input : in STD_LOGIC;
           raz : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_jump : in std_logic;
           output : out STD_LOGIC);
end button_synchro;

architecture Behavioral of button_synchro is


signal temp : std_logic;
signal count : integer := 0 ;
signal start_tempo : std_logic;
signal tempo :std_logic := '0';
begin
process(clk)    
begin
    if rising_edge(clk) then        
        if(raz ='1') then
                start_tempo <= '0';            
                temp <= '0';
                tempo <= '0';
                output <='0';
        elsif(clk_jump ='1') then            
            temp <= input;
            start_tempo <= (input xor temp) and input;  
            output <='0';
            if(start_tempo ='1' or tempo ='1') then   
                if (count = bird_jump-1) then 
                    count <= 0;
                    tempo <= '0';
                    output <='0';
                else
                    count <= count +1;
                    tempo <= '1';
                    output <='1';
                    if(start_tempo ='1') then
                        count<= 0;
                    end if; 
                end if;
                
            end if;
        end if;
end if;
end process;

end Behavioral;