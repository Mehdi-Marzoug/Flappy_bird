----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.11.2023 13:51:46
-- Design Name: 
-- Module Name: pipe_generator - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use work.constants.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pipe_generator is
    Port ( clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           clk_game : in std_logic;
           game_on : in STD_LOGIC;
           game_pause : in std_logic;
           game_done : in std_logic;
           random_gen_value : in std_logic_vector(7 downto 0);
           adresse_rand : out std_logic_vector(9 downto 0);
           pipe_1_x_start : out STD_LOGIC_VECTOR (8 downto 0);
           pipe_1_x_end : out STD_LOGIC_VECTOR (8 downto 0);
           pipe_1_y_gap_start : out STD_LOGIC_VECTOR (7 downto 0);
           pipe_2_x_start : out STD_LOGIC_VECTOR (8 downto 0);
           pipe_2_x_end : out STD_LOGIC_VECTOR (8 downto 0);
           pipe_2_y_gap_start : out STD_LOGIC_VECTOR (7 downto 0);
           pipe_3_x_start : out STD_LOGIC_VECTOR (8 downto 0);
           pipe_3_x_end : out STD_LOGIC_VECTOR (8 downto 0);
           pipe_3_y_gap_start : out STD_LOGIC_VECTOR (7 downto 0));
end pipe_generator;

architecture Behavioral of pipe_generator is
signal p1xs: integer ;
signal p1xe: integer ;

signal p2xs: integer ;
signal p2xe: integer ;

signal p3xs: integer ;
signal p3xe: integer ;

signal p1ygs: integer ;
signal p2ygs: integer ;
signal p3ygs: integer ;
signal random_value : unsigned(7 downto 0);

signal s_adresse_rand : integer := 0; 

begin

random_value <= unsigned(random_gen_value);
process(clk) 
begin
    if(rising_edge(clk)) then
        if(raz = '1') then
            p1xs <= H_START + pipe_start_pos_x; 
            p1xe <= p1xs + pipe_width ;
            p2xs <= p1xe + pipe_distance;
            p2xe <= p2xs + pipe_width;
            p3xs <= p2xe + pipe_distance;
            p3xe <= p3xs + pipe_width;
            p1ygs <= V_START + pipe_1_gap_start_pos_y;
            p2ygs <= V_START + pipe_2_gap_start_pos_y;
            p3ygs <= V_START + pipe_3_gap_start_pos_y; 
        elsif(clk_game = '1' ) then
        if (game_on = '1' and game_pause ='0' and game_done='0') then
            -- pipe 1    
            if (p1xe > H_START) then
                p1xs <= p1xs - 1;
                p1xe <= p1xe - 1;
            else
                p1xs <= H_END;
                p1xe <= H_END + pipe_width;
                p1ygs <= V_START + to_integer(random_value);
                if(s_adresse_rand <= 998)then
                    s_adresse_rand <= s_adresse_rand +1;
                else
                     s_adresse_rand <= 0;
                end if;
            end if;
            -- pipe 2
            if (p2xe > H_START) then
                p2xs <= p2xs - 1;
                p2xe <= p2xe - 1;
               
            else
                p2xs <= H_END;
                p2xe <= H_END + pipe_width;
                p2ygs <= V_START + to_integer(random_value);
                if(s_adresse_rand <= 998)then
                    s_adresse_rand <= s_adresse_rand +1;
                else
                     s_adresse_rand <= 0;
                end if;
             
            end if;
            -- pipe 3
            if (p3xe > H_START) then
                p3xs <= p3xs - 1;
                p3xe <= p3xe - 1; 
            else
                p3xs <= H_END;
                p3xe <= H_END + pipe_width;
                p3ygs <= V_START + to_integer(random_value);
                if(s_adresse_rand <= 998)then
                    s_adresse_rand <= s_adresse_rand +1;
                else
                     s_adresse_rand <= 0;
                end if;
            end if;
            
        elsif (game_on = '0' and game_pause ='0' and game_done='1') then
            p1xs <= H_START + pipe_start_pos_x; 
            p1xe <= p1xs + pipe_width ;
            p2xs <= p1xe + pipe_distance;
            p2xe <= p2xs + pipe_width;
            p3xs <= p2xe + pipe_distance;
            p3xe <= p3xs + pipe_width;
            p1ygs <= V_START + pipe_1_gap_start_pos_y;
            p2ygs <= V_START + pipe_2_gap_start_pos_y;
            p3ygs <= V_START + pipe_3_gap_start_pos_y; 
        end if;
      end if;   
    end if;
end process ;


pipe_1_x_start <= STD_LOGIC_VECTOR (to_unsigned(p1xs,9));
pipe_1_x_end <= STD_LOGIC_VECTOR (to_unsigned(p1xe,9));
pipe_1_y_gap_start <= STD_LOGIC_VECTOR (to_unsigned(p1ygs,8));
pipe_2_x_start <= STD_LOGIC_VECTOR (to_unsigned(p2xs,9));
pipe_2_x_end <= STD_LOGIC_VECTOR (to_unsigned(p2xe,9));
pipe_2_y_gap_start <= STD_LOGIC_VECTOR (to_unsigned(p2ygs,8));
pipe_3_x_start <= STD_LOGIC_VECTOR (to_unsigned(p3xs,9));
pipe_3_x_end <= STD_LOGIC_VECTOR (to_unsigned(p3xe,9));
pipe_3_y_gap_start <= STD_LOGIC_VECTOR (to_unsigned(p3ygs,8));
adresse_rand <= std_logic_vector(to_unsigned(s_adresse_rand,10));
end Behavioral;
