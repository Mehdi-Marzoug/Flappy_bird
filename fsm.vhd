----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2023 15:59:50
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm is
    Port ( clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           clk_game : in std_logic;
           start_button : in std_logic ;
           jump_button : in std_logic ;
           pause_button : in std_logic ;
           crashed : in std_logic;
           game_on : out std_logic ;
           game_pause : out std_logic;
           game_done : out std_logic);
end fsm;

architecture Behavioral of fsm is
type t_etat is (game_menu,play,pause,game_over);
  signal etat_present : t_etat;
  signal etat_futur : t_etat;

begin
determination_etat_futur: process(etat_present,jump_button,pause_button,crashed,start_button)
  begin
    case etat_present is
  when game_menu => if jump_button ='1' then
      etat_futur <= play;
    else
      etat_futur <= game_menu;
    end if;
  when play => if pause_button  ='1' then
                    etat_futur <= pause;
                elsif ( crashed = '1' ) then 
                    etat_futur <= game_over;    
                else
                    etat_futur <= play;
            end if;

  when pause => if jump_button ='1' then
    etat_futur <= play;
  else
    etat_futur <= pause;
  end if;
  when game_over => if start_button ='1' then
    etat_futur <= play;
  else
    etat_futur <= game_over;
  end if;
  end case;
end process;

calcul_sortie: process(etat_present)
begin
case etat_present is
when game_menu => game_on <= '0' ; game_pause <='0' ; game_done <= '0'; 
when play => game_on <= '1' ; game_pause <='0' ; game_done <= '0';
when PAUSE => game_on <= '0' ; game_pause <='1' ; game_done <= '0';
when game_over => game_on <= '0' ; game_pause <='0' ; game_done <= '1';
end case ;
end process;

 registre : process(clk)
 begin
 if rising_edge(clk) then
    if raz = '1' then
        etat_present <= game_menu ;
    elsif(clk_game='1') then
        etat_present <= etat_futur;
    end if;
 end if;
 end process;
end Behavioral;
