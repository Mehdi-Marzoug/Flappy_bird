----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2023 19:39:37
-- Design Name: 
-- Module Name: clk_manager - Behavioral
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

entity clk_manager is
    Port ( clk : in STD_LOGIC;
           clk_100 : out STD_LOGIC;
           CE_perc : out std_logic;
           clk_125 : out std_logic;
           clk_150 : out std_logic;
           clk_175 : out std_logic;
           clk_50 : out std_logic
           );
end clk_manager;

architecture Behavioral of clk_manager is
signal count_val : natural range 0 to 10000000 := 0;
signal count_val_1 : natural range 0 to 10000000 := 0;
signal count_val_2 : natural range 0 to 10000000 := 0;
signal count_val_3 : natural range 0 to 10000000 := 0;
signal count_val_4 : natural range 0 to 10000000 := 0;
signal count_val_5 : natural range 0 to 10000000 := 0;


begin
  counter_value: process (clk)
  begin
    if(rising_edge(clk)) then
        if(count_val = 999999) then
            count_val <= 0;
            clk_100 <= '1';
        else 
            count_val <= count_val + 1;
            clk_100 <= '0';
        end if;
    end if;
  end process;  
   counter_value_perc: process (clk)
  begin 
    if(clk' event and clk='1')then
      if(count_val_1 = 33333) then
        count_val_1 <= 0;
        CE_perc <= '1';
      else
        count_val_1 <= count_val_1+1;
        CE_perc <= '0' ;
      end if;
    end if;
  end process counter_value_perc; 
  counter_value_50: process (clk)
  begin
    if(rising_edge(clk)) then
        if(count_val_2 = 2000000-1) then
            count_val_2 <= 0;
            clk_50 <= '1';
        else 
            count_val_2 <= count_val_2 + 1;
            clk_50 <= '0';
        end if;
    end if;
  end process;
  counter_value_125: process (clk)
  begin
    if(rising_edge(clk)) then
        if(count_val_3 = 800000-1) then
            count_val_3 <= 0;
            clk_125 <= '1';
        else 
            count_val_3 <= count_val_3 + 1;
            clk_125 <= '0';
        end if;
    end if;
  end process;
  counter_value_150: process (clk)
  begin
    if(rising_edge(clk)) then
        if(count_val_4 = 666667-1) then
            count_val_4 <= 0;
            clk_150 <= '1';
        else 
            count_val_4 <= count_val_4 + 1;
            clk_150 <= '0';
        end if;
    end if;
  end process;
  counter_value_175: process (clk)
  begin
    if(rising_edge(clk)) then
        if(count_val_5 = 571429-1) then
            count_val_5 <= 0;
            clk_175 <= '1';
        else 
            count_val_5 <= count_val_5 + 1;
            clk_175 <= '0';
        end if;
    end if;
  end process;
   
  
           

end Behavioral;
