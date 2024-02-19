----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2023 16:41:19
-- Design Name: 
-- Module Name: difficulty - Behavioral
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

entity difficulty is
    Port ( easy : in std_logic;
           medium : in std_logic;
           hard : in std_logic;
           score_interval : out std_logic_vector(5 downto 0));
end difficulty;

architecture Behavioral of difficulty is

begin

process(easy,medium,hard)
    begin
        if(easy='1' and medium ='0' and hard ='0') then
            score_interval <= std_logic_vector(to_unsigned(20,6));
        elsif(easy='0' and medium ='1' and hard ='0') then
            score_interval <= std_logic_vector(to_unsigned(15,6)); 
        elsif(easy='0' and medium ='0' and hard ='1') then
            score_interval <= std_logic_vector(to_unsigned(10,6));    
        else 
            score_interval <= std_logic_vector(to_unsigned(20,6));  
        end if;
    --end if;
end process;                 

end Behavioral;
