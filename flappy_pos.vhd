------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 01.11.2023 15:03:57
---- Design Name: 
---- Module Name: flappy_pos - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.constants.ALL;
---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

entity flappy_pos is
    Port ( clk : in STD_LOGIC;
           raz : in std_logic; 
           --clk_fall : in std_logic;
           --clk_jump : in std_logic;
           clk_game : in std_logic;
           game_on : in STD_LOGIC;
           game_pause : in std_logic;
           game_done : in std_logic;
           jump_button : in std_logic ;
           flappy_start_y : out STD_LOGIC_vector(7 downto 0);
           flappy_end_y : out STD_LOGIC_vector(7 downto 0));
end flappy_pos;

architecture Behavioral of flappy_pos is
signal start_y: integer ;
signal end_y: integer ;
begin
position : process(clk) 
begin
    if(rising_edge(clk)) then
       if(raz ='1') then 
            start_y <= start_pos_y;
            end_y <= flappy_height + start_y; 
      elsif(clk_game ='1') then         
       if( game_on = '0' and game_pause ='0' and game_done='1') then 
                start_y <= start_pos_y;  
                end_y <= flappy_height + start_y ;
        end if;        
        if( game_on = '1' and game_pause ='0' and game_done='0') then                          
            if(jump_button = '1') then 
                start_y <= start_y - 2;
                end_y <= start_y + flappy_height;
                if (start_y < 0) then
                    start_y <= 1;
                    end_y <= start_y + flappy_height;
                end if;        
            else 
                    start_y <= start_y + bird_fall;
                    end_y <= start_y + flappy_height;
            end if;        
        end if;  
       end if;
    end if;    
end process;
flappy_start_y <= std_logic_vector(to_unsigned(start_y,8));
flappy_end_y <= std_logic_vector(to_unsigned(end_y,8));                
end Behavioral;


