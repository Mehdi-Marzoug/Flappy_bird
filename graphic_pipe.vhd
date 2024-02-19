--------------------------------------------------------------------------------------
------ Company: 
------ Engineer: 
------ 
------ Create Date: 19.11.2023 19:33:31

------ Design Name: 
------ Module Name: graphic_pipe - Behavioral
------ Project Name: 
------ Target Devices: 
------ Tool Versions: 
------ Description: 
------ 
------ Dependencies: 
------ 
------ Revision:
------ Revision 0.01 - File Created
------ Additional Comments:
------ 
--------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.constants.all; 

------ Uncomment the following library declaration if using
------ arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

------ Uncomment the following library declaration if instantiating
------ any Xilinx leaf cells in this code.
------library UNISIM;
------use UNISIM.VComponents.all;

entity graphic_pipe is
    Port ( 
           clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (8 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           game_on : in STD_LOGIC;
           game_pause : in std_logic;
           game_done : in std_logic; 
           flappy_start_y : in std_logic_vector (7 downto 0);
           flappy_end_y : in std_logic_vector (7 downto 0);
           pipe_1_x_start : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_1_x_end : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_1_y_gap_start : in STD_LOGIC_VECTOR (7 downto 0);
           pipe_2_x_start : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_2_x_end : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_2_y_gap_start : in STD_LOGIC_VECTOR (7 downto 0);
           pipe_3_x_start : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_3_x_end : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_3_y_gap_start : in STD_LOGIC_VECTOR (7 downto 0);
           pixel_adrr: out std_logic_vector(10 downto 0);
           game_over_adrr: out std_logic_vector(12 downto 0);
           pause_adrr: out std_logic_vector(12 downto 0);
           menu_adrr: out std_logic_vector(16 downto 0);
           background_adrr: out std_logic_vector(16 downto 0));
end graphic_pipe;

architecture Behavioral of graphic_pipe is
signal s_pixel_adrr : integer; 
signal s_game_over_adrr : integer; 
signal s_menu_adrr : integer;
signal s_pause_adrr : integer;
signal s_background_adrr : integer;

begin
pipes : process(clk)
begin
if rising_edge(clk) then 
         if(((unsigned(x) >=  game_over_start_x ) and (unsigned(x)) <=  (game_over_end_x-1))and game_on = '0' and game_pause ='0' and game_done='1') then
            if( (unsigned(y) >= game_over_start_y  ) and (unsigned(y) <= game_over_end_y-1) ) then
                s_game_over_adrr <= to_integer((unsigned(x) - game_over_start_x+1)+ (game_over_end_x-game_over_start_x)*(unsigned(y) - game_over_start_y ) ) ;
            end if; 
        elsif(((unsigned(x) >=  pause_start_x ) and (unsigned(x)) <=  (pause_end_x-1)) and game_on = '0' and game_pause ='1' and game_done='0') then
            if( (unsigned(y) >= pause_start_y  ) and (unsigned(y) <= pause_end_y-1) ) then
                s_pause_adrr <= to_integer((unsigned(x) - pause_start_x)+ (pause_end_x-pause_start_x)*(unsigned(y) - pause_start_y ) ) ;
            end if; 
        end if;      
        if((unsigned(x) >=  unsigned(pipe_1_x_start) ) and (unsigned(x)) <=  (unsigned(pipe_1_x_end)))  then  
            if( (unsigned(y) <= unsigned(pipe_1_y_gap_start) +1 ) or (unsigned(y) >= (unsigned(pipe_1_y_gap_start) + gap)) ) then 
                if( (unsigned(y) <= unsigned(pipe_1_y_gap_start) +1 - pipe_tip_width ) or (unsigned(y) >= (unsigned(pipe_1_y_gap_start) + gap + pipe_tip_width)) ) then 
                    if((unsigned(x) >=  unsigned(pipe_1_x_start) +2 ) and (unsigned(x)) <=  (unsigned(pipe_1_x_end)) -2)  then 
                        s_pixel_adrr<= 500 ;  -- green pixel 
                    else
                        s_pixel_adrr<= 204 ; --white pixel 
                    end if;
                else 
                    s_pixel_adrr<= 500 ;  -- green pixel
                end if;                
            elsif(unsigned(x)>= to_unsigned(start_pos_x,9) and unsigned(x) <= to_unsigned(end_pos_x,9)-1) then
                if( unsigned(y) <= unsigned(flappy_end_y)+3 and unsigned(y)>= unsigned(flappy_start_y) ) then 
                    s_pixel_adrr<= to_integer((unsigned(x) - to_unsigned(start_pos_x,9))+ (end_pos_x-start_pos_x)*(unsigned(y) - unsigned(flappy_start_y) ) ) ;
                else         
                    s_pixel_adrr<= 204 ; --white pixel
                    s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;               

                end if; 
            else
                s_pixel_adrr<= 204 ; --white pixel 
                s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;           
            end if;
            
        elsif( unsigned(x) >= 0 and (unsigned(x) <=  unsigned(pipe_1_x_end)) and unsigned(pipe_1_x_start) >unsigned(pipe_1_x_end) )  then 
            if( (unsigned(y) <= unsigned(pipe_1_y_gap_start) +1 ) or (unsigned(y) >= (unsigned(pipe_1_y_gap_start) + gap)) ) then 
                if( (unsigned(y) <= unsigned(pipe_1_y_gap_start) +1 - pipe_tip_width ) or (unsigned(y) >= (unsigned(pipe_1_y_gap_start) + gap + pipe_tip_width)) ) then 
                    if((unsigned(x)) <=  (unsigned(pipe_1_x_end)) -2)  then 
                        s_pixel_adrr<= 500 ;  -- green pixel 
                    else
                        s_pixel_adrr<= 204 ; --white pixel 
                        s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;
                    end if;
                else 
                    s_pixel_adrr<= 500 ;  -- green pixel
                end if;   
            else
                s_pixel_adrr<= 204 ; --white pixel  
                s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;          
            end if;
            
        elsif((unsigned(x) >=  unsigned(pipe_2_x_start) ) and (unsigned(x)) <= (unsigned(pipe_2_x_end)))then 
            if( (unsigned(y) < unsigned(pipe_2_y_gap_start) +1 ) or (unsigned(y) >= (unsigned(pipe_2_y_gap_start) + gap)) ) then 
                if( (unsigned(y) <= unsigned(pipe_2_y_gap_start) +1 - pipe_tip_width ) or (unsigned(y) >= (unsigned(pipe_2_y_gap_start) + gap + pipe_tip_width)) ) then 
                    if((unsigned(x) >=  unsigned(pipe_2_x_start) +2 ) and (unsigned(x)) <=  (unsigned(pipe_2_x_end)) -2)  then 
                        s_pixel_adrr<= 500 ;  -- green pixel 
                    else
                        s_pixel_adrr<= 204 ; --white pixel 
                    end if;
                else 
                    s_pixel_adrr<= 500 ;  -- green pixel
                end if;   
            elsif(unsigned(x)>= to_unsigned(start_pos_x,9) and unsigned(x) <= to_unsigned(end_pos_x,9)-1) then
                if( unsigned(y) <= unsigned(flappy_end_y)+3 and unsigned(y)>= unsigned(flappy_start_y) ) then 
                    s_pixel_adrr<= to_integer((unsigned(x) - to_unsigned(start_pos_x,9))+ (end_pos_x-start_pos_x)*(unsigned(y) - unsigned(flappy_start_y) ) ) ;
                else         
                    s_pixel_adrr<= 204 ; --white pixel
                    s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ; 
                end if; 
            else
                s_pixel_adrr<= 204 ; --white pixel   
                s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;      
            end if;
            
        elsif((unsigned(x) >= 0) and unsigned(x) <= unsigned(pipe_2_x_end)and  unsigned(pipe_2_x_start) >unsigned(pipe_2_x_end))then 
            if( (unsigned(y) < unsigned(pipe_2_y_gap_start) +1 ) or (unsigned(y) >= (unsigned(pipe_2_y_gap_start) + gap)) ) then 
                if( (unsigned(y) <= unsigned(pipe_2_y_gap_start) +1 - pipe_tip_width ) or (unsigned(y) >= (unsigned(pipe_2_y_gap_start) + gap + pipe_tip_width)) ) then 
                    if((unsigned(x)) <=  (unsigned(pipe_2_x_end)) -2)  then 
                        s_pixel_adrr<= 500 ;  -- green pixel 
                    else
                        s_pixel_adrr<= 204 ; --white pixel 
                        s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;
                    end if;
                else 
                    s_pixel_adrr<= 500 ;  -- green pixel
                end if;  
            else
                s_pixel_adrr<= 204 ; --white pixel 
                s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;        
            end if;   
             
        elsif((unsigned(x) >=  unsigned(pipe_3_x_start)) and (unsigned(x)) <= (unsigned(pipe_3_x_end))) then 
            if( (unsigned(y) < unsigned(pipe_3_y_gap_start) +1 ) or (unsigned(y) >= (unsigned(pipe_3_y_gap_start) + gap)) ) then 
                if( (unsigned(y) <= unsigned(pipe_3_y_gap_start) +1 - pipe_tip_width ) or (unsigned(y) >= (unsigned(pipe_3_y_gap_start) + gap + pipe_tip_width)) ) then 
                    if((unsigned(x) >=  unsigned(pipe_3_x_start) +2 ) and (unsigned(x)) <=  (unsigned(pipe_3_x_end)) -2)  then 
                        s_pixel_adrr<= 500 ;  -- green pixel 
                    else
                        s_pixel_adrr<= 204 ; --white pixel 
                    end if;
                else 
                    s_pixel_adrr<= 500 ;  -- green pixel
                end if;  
            elsif(unsigned(x)>= to_unsigned(start_pos_x,9) and unsigned(x) <= to_unsigned(end_pos_x,9)-1) then
                if( unsigned(y) <= unsigned(flappy_end_y)+3 and unsigned(y)>= unsigned(flappy_start_y) ) then 
                    s_pixel_adrr<= to_integer((unsigned(x) - to_unsigned(start_pos_x,9))+ (end_pos_x-start_pos_x)*(unsigned(y) - unsigned(flappy_start_y) ) ) ;
                else         
                    s_pixel_adrr<= 204 ; --white pixel
                    s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ; 
                end if; 
            else
                s_pixel_adrr<= 204 ; --white pixel 
                s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;        
            end if;
            
        elsif(( unsigned(x) >= 0 ) and unsigned(x) <= unsigned(pipe_3_x_end) and unsigned(pipe_3_x_start) >unsigned(pipe_3_x_end)) then 
            if( (unsigned(y) < unsigned(pipe_3_y_gap_start) +1 ) or (unsigned(y) >= (unsigned(pipe_3_y_gap_start) + gap)) ) then 
                if( (unsigned(y) <= unsigned(pipe_3_y_gap_start) +1 - pipe_tip_width ) or (unsigned(y) >= (unsigned(pipe_3_y_gap_start) + gap + pipe_tip_width)) ) then 
                    if((unsigned(x)) <=  (unsigned(pipe_3_x_end)) -2)  then 
                        s_pixel_adrr<= 500 ;  -- green pixel 
                    else
                        s_pixel_adrr<= 204 ; --white pixel 
                        s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;
                    end if;
                else 
                    s_pixel_adrr<= 500 ;  -- green pixel
                end if;  
            else
                s_pixel_adrr<= 204 ; --white pixel 
                s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;        
            end if;
            
        elsif(unsigned(x)>= to_unsigned(start_pos_x,9) and unsigned(x) <= to_unsigned(end_pos_x,9)-1) then
            if( unsigned(y) <= unsigned(flappy_end_y)+3 and unsigned(y)>= unsigned(flappy_start_y) ) then 
                s_pixel_adrr<= to_integer((unsigned(x) - to_unsigned(start_pos_x,9))+ (end_pos_x-start_pos_x)*(unsigned(y) - unsigned(flappy_start_y) ) ) ;
            else 
                s_pixel_adrr<= 204 ; --white pixel
                s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;     
            end if;  
        else
                s_pixel_adrr <= 204; 
                s_background_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;    
        end if;               
     if(game_on = '0' and game_pause ='0' and game_done='0') then
                s_menu_adrr <= to_integer(unsigned(x))+ H_ACTIVE*to_integer(unsigned(y))  ;               
     end if;              
                    
 end if;               
end process pipes; 

pixel_adrr <= std_logic_vector(to_unsigned(s_pixel_adrr,11));
game_over_adrr <= std_logic_vector(to_unsigned(s_game_over_adrr,13));
pause_adrr <= std_logic_vector(to_unsigned(s_pause_adrr,13));
menu_adrr <= std_logic_vector(to_unsigned(s_menu_adrr,17));
background_adrr <= std_logic_vector(to_unsigned(s_background_adrr,17));


end Behavioral;

