----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.11.2023 15:12:59
-- Design Name: 
-- Module Name: crash_test - Behavioral
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

entity crash_test is
    Port ( clk : in STD_LOGIC;
           raz : in std_logic;
           game_on : in STD_LOGIC;
           game_pause : in std_logic;
           game_done : in std_logic; 
           bird_start_y : in STD_LOGIC_VECTOR (7 downto 0);
           bird_end_y : in STD_LOGIC_VECTOR (7 downto 0);
           pipe_1_x_start : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_1_x_end : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_1_y_gap_start : in STD_LOGIC_VECTOR (7 downto 0);
           pipe_2_x_start : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_2_x_end : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_2_y_gap_start : in STD_LOGIC_VECTOR (7 downto 0);
           pipe_3_x_start : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_3_x_end : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_3_y_gap_start : in STD_LOGIC_VECTOR (7 downto 0);
           crash : out STD_LOGIC);
end crash_test;

architecture Behavioral of crash_test is

begin
process(clk)
begin
if(rising_edge(clk)) then
  if(raz='1') then
    crash <='0';     
    elsif(game_on = '1' and game_pause ='0' and game_done='0') then
                if ((((start_pos_x >= unsigned(pipe_1_x_start) and end_pos_x <= unsigned(pipe_1_x_end)) or ( end_pos_x >= unsigned(pipe_1_x_start) and start_pos_x < unsigned(pipe_1_x_start)) or ( start_pos_x <= unsigned(pipe_1_x_end) and end_pos_x > unsigned(pipe_1_x_end))) and ((unsigned(bird_start_y) < unsigned(pipe_1_y_gap_start)) or (unsigned(bird_end_y) >= unsigned(pipe_1_y_gap_start) + gap))) or
                    (((start_pos_x >= unsigned(pipe_2_x_start) and end_pos_x <= unsigned(pipe_2_x_end)) or ( end_pos_x >= unsigned(pipe_2_x_start) and start_pos_x < unsigned(pipe_2_x_start)) or ( start_pos_x <= unsigned(pipe_2_x_end) and end_pos_x > unsigned(pipe_2_x_end))) and ((unsigned(bird_start_y) < unsigned(pipe_2_y_gap_start)) or (unsigned(bird_end_y) >= unsigned(pipe_2_y_gap_start) + gap))) or
                    (((start_pos_x >= unsigned(pipe_3_x_start) and end_pos_x <= unsigned(pipe_3_x_end)) or ( end_pos_x >= unsigned(pipe_3_x_start) and start_pos_x < unsigned(pipe_3_x_start)) or ( start_pos_x <= unsigned(pipe_3_x_end) and end_pos_x > unsigned(pipe_3_x_end))) and ((unsigned(bird_start_y) < unsigned(pipe_3_y_gap_start)) or (unsigned(bird_end_y) >= unsigned(pipe_3_y_gap_start) + gap))) or
                   (unsigned(bird_end_y) > V_END )) then
                   crash <= '1';
                else
                   crash <= '0';    
                end if;
                
    else
        crash <= '0';
    end if;     
                 
    end if;                  
end process;
end Behavioral;
