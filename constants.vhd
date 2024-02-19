----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2023 15:29:51
-- Design Name: 
-- Module Name: constants - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
package constants is
    --bird 
    constant flappy_height: integer := 12;
    --constant flappy_width: integer := 17;
    constant start_pos_y: integer := 75;
    constant start_pos_x: integer := 100;
    constant end_pos_x: integer := 117;
    constant bird_jump: integer := 25;
    constant bird_fall: integer:= 4;
	 	
    -- VGA
    constant H_ACTIVE: integer:= 320; 
    constant H_START: integer:= 0;
    constant H_END: integer:= 319;

    constant V_ACTIVE: integer:= 240;
    constant V_START: integer:= 0;
    constant V_END: integer:= 239;

    --pipe
    constant pipe_width: integer:= 30;	
    constant pipe_distance: integer := 85;
    constant pipe_tip_width : integer :=10;
    constant pipe_1_gap_start_pos_y: integer := 30;
    constant pipe_2_gap_start_pos_y: integer := 50;
    constant pipe_3_gap_start_pos_y: integer := 40;
    constant gap: integer := 65;	   	
    constant min_y_gap_start : integer := 30;
    constant max_y_gap_start : integer := 163;
    constant pipe_start_pos_x : integer := 250;	
    -- game over
    constant game_over_start_x: integer:= 110;
    constant game_over_end_x: integer:= 210;
    constant game_over_start_y: integer:= 95;
    constant game_over_end_y: integer:=145;
    -- pause
    constant pause_start_x: integer:=135;
    constant pause_end_x: integer:=185;
    constant pause_start_y: integer:=95;
    constant pause_end_y: integer:=145;
    --background
    constant start_background : integer:=170;
end constants;
