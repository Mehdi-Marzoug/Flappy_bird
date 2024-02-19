----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2023 15:40:42
-- Design Name: 
-- Module Name: mux_ram - Behavioral
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
use work.constants.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_ram is
    Port ( clk : in STD_LOGIC;
           game_done : in STD_LOGIC;
           game_on : in STD_LOGIC;
           game_pause : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (8 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           pixel_RAM_play : in STD_LOGIC_VECTOR (2 downto 0);
           pixel_RAM_game_over : in STD_LOGIC_VECTOR (2 downto 0);
           pixel_RAM_MENU : in STD_LOGIC_VECTOR (2 downto 0);
           pixel_RAM_background : in STD_LOGIC_VECTOR (2 downto 0);
           pixel_RAM_pause : in STD_LOGIC_VECTOR (2 downto 0);
           pixel_VGA : out STD_LOGIC_VECTOR (2 downto 0));
end mux_ram;

architecture Behavioral of mux_ram is

begin
process(clk)
begin
if(rising_edge(clk)) then
    if(game_on = '1' and game_pause ='0' and game_done='0') then
              if( pixel_RAM_play ="111" and unsigned(y) >= start_background  ) then
                    pixel_VGA <= pixel_RAM_background;
               else 
                    pixel_VGA <= pixel_RAM_play;
               end if;
    elsif(game_on = '0' and game_pause ='0' and game_done='0') then
        pixel_VGA <= pixel_RAM_MENU; 
    elsif(game_on = '0' and game_pause ='0' and game_done='1') then
        if((unsigned(x) >=  game_over_start_x-1 ) and (unsigned(x) <=  game_over_end_x-1))  then 
            if( (unsigned(y) >= game_over_start_y  ) and (unsigned(y) <= game_over_end_y-1) ) then
               pixel_VGA <= pixel_RAM_game_over;
            else 
               if( pixel_RAM_play ="111" and unsigned(y) >= start_background ) then
                    pixel_VGA <= pixel_RAM_background;
               else 
                    pixel_VGA <= pixel_RAM_play;
               end if;     
            end if;
        else 
                if( pixel_RAM_play ="111" and unsigned(y) >= start_background ) then
                    pixel_VGA <= pixel_RAM_background;
               else 
                    pixel_VGA <= pixel_RAM_play;
               end if;
        end if;
    elsif(game_on = '0' and game_pause ='1' and game_done='0') then
        if((unsigned(x) >=  pause_start_x ) and (unsigned(x)) <=  (pause_end_x-1))  then 
                if( (unsigned(y) >= pause_start_y  ) and (unsigned(y) <= pause_end_y-1) ) then
                    pixel_VGA <= pixel_RAM_pause; 
                else 
                    if( pixel_RAM_play ="111" and unsigned(y) >= start_background ) then
                        pixel_VGA <= pixel_RAM_background;
                    else 
                        pixel_VGA <= pixel_RAM_play;
                    end if;                
                end if;
        else 
              if( pixel_RAM_play ="111" and unsigned(y) >= start_background ) then
                    pixel_VGA <= pixel_RAM_background;
               else 
                    pixel_VGA <= pixel_RAM_play;
               end if; 
        end if;                 
    end if;
end if;
end process; 
                       
end Behavioral;
