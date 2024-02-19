----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2023 17:53:04
-- Design Name: 
-- Module Name: jump_manager - Behavioral
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
use work.constants.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--use FACIAL_NUM in the PMOD module
-- bird_jump = 10
entity jump_manager is
    Port ( clk : in STD_LOGIC;
           clk_game : in std_logic;
           jump_button : in STD_LOGIC_VECTOR (15 downto 0);
           jump_order : out std_logic);
end jump_manager;

architecture Behavioral of jump_manager is
signal s_jump_height : integer ;
signal s_jump_order : std_logic ;
begin

process(jump_button)
begin
    if(jump_button(1) ='1' or jump_button(2) ='1' or jump_button(3) ='1' or jump_button(4) ='1' or jump_button(5) ='1' or jump_button(6) ='1' or jump_button(7) ='1' or jump_button(8) ='1' or jump_button(9) ='1' ) then
        s_jump_order <= '1';
    else 
        s_jump_order <= '0';
    end if;
end process;        

jump_order <= s_jump_order;
end Behavioral;
