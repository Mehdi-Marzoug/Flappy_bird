----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2023 14:18:09
-- Design Name: 
-- Module Name: Score - Behavioral
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

entity score_counter is
  Port (
  pipe_1_x_start : in STD_LOGIC_VECTOR (8 downto 0);
  pipe_2_x_start : in STD_LOGIC_VECTOR (8 downto 0);
  pipe_3_x_start : in STD_LOGIC_VECTOR (8 downto 0);
  clk: in std_logic;
  clk_game : in std_logic;
  reset: in std_logic; 
  start_button : in std_logic;
  game_on : in std_logic;  
  game_done : in std_logic;
  game_pause : in std_logic;
  score : out std_logic_vector(9 downto 0);
  max_score : out std_logic_vector(9 downto 0)
  );
end Score_counter;

architecture Behavioral of Score_counter is
signal s_score : integer range 0 to 1000 := 0  ; 
signal s_max_score : integer range 0 to 1000 := 0  ; 

signal pipe_closest_x : std_logic_vector(8 downto 0) ;
begin
score_rising : process(clk) 
begin 

if(rising_edge(clk)) then 
    if(reset = '1') then 
        s_score <= 0;
    elsif(clk_game = '1') then    
    if(game_done = '1' and game_on = '0' and game_pause ='0') then  
        if(start_button ='1') then 
            s_score <= 0;
        else    
            s_score <= s_score; 
        end if;
    elsif(game_on = '1'and game_pause = '0' and game_done = '0') then 
        if(start_pos_x    = to_integer(unsigned(pipe_closest_x))) then 
            s_score<= s_score +1 ; 
            end if;  
    end if;
  end if;  
        
end if;
end process score_rising; 

score_max : process(clk)begin
if(rising_edge(clk))then     
    if(s_score > s_max_score)then 
        s_max_score <= s_score;    
      end if;
end if;
end process score_max;
max_score <=  std_logic_vector(to_unsigned(s_max_score, 10));

pipe_closest_p : process(pipe_3_x_start,pipe_2_x_start,pipe_1_x_start) 
begin 
    if(pipe_3_x_start < pipe_2_x_start ) then 
        pipe_closest_x <= pipe_3_x_start;
    elsif(pipe_2_x_start < pipe_1_x_start )then 
        pipe_closest_x <= pipe_2_x_start; 
    else
        pipe_closest_x <= pipe_1_x_start;
        
    end if ; 
    
end process pipe_closest_p;
score <= std_logic_vector(to_unsigned(s_score,10));
end Behavioral;
