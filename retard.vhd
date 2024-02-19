----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2023 18:48:17
-- Design Name: 
-- Module Name: retard - Behavioral
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

entity retard is
    Port ( clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (8 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           x_retard : out STD_LOGIC_VECTOR (8 downto 0);
           y_retard : out STD_LOGIC_VECTOR (7 downto 0));
end retard;

architecture Behavioral of retard is
signal count_val : integer :=0;
signal x_q : std_logic_vector(8 downto 0);
signal x_q_q : std_logic_vector(8 downto 0);
signal x_q_q_q : std_logic_vector(8 downto 0);
signal x_q_q_q_q : std_logic_vector(8 downto 0);
signal x_q_q_q_q_q : std_logic_vector(8 downto 0);
signal x_q_q_q_q_q_q : std_logic_vector(8 downto 0);
signal y_q : std_logic_vector(7 downto 0);
signal y_q_q : std_logic_vector(7 downto 0);
signal y_q_q_q : std_logic_vector(7 downto 0);
signal y_q_q_q_q : std_logic_vector(7 downto 0);
signal y_q_q_q_q_q : std_logic_vector(7 downto 0);
signal y_q_q_q_q_q_q : std_logic_vector(7 downto 0);
begin
process(CLK) is
begin
  if rising_edge(CLK) then
    x_q <= x;
    x_q_q <= x_q;
    x_q_q_q <= x_q_q;
    x_q_q_q_q <= x_q_q_q;
    x_q_q_q_q_q <= x_q_q_q_q;
    x_q_q_q_q_q_q <= x_q_q_q_q_q;
  end if;
end process;             
x_retard <= x_q_q_q_q;

process(CLK) is
begin
  if rising_edge(CLK) then
    y_q <= y;
    y_q_q <= y_q;
    y_q_q_q <= y_q_q;
    y_q_q_q_q <= y_q_q_q;
    y_q_q_q_q_q <= y_q_q_q_q;    
    y_q_q_q_q_q_q <= y_q_q_q_q_q;
  end if;
end process;             
y_retard <= y_q_q_q_q;
end Behavioral;
