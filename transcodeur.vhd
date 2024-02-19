----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/15/2023 04:11:38 PM
-- Design Name: 
-- Module Name: transcodeur - Behavioral
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
use IEEE.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transcodeur is
    Port ( 
           max : in STD_LOGIC_VECTOR (9 downto 0);
           nb_binaire : in STD_LOGIC_VECTOR (9 downto 0);
           s_cent : out std_logic_vector(6 downto 0) ;
           s_diz : out std_logic_vector(6 downto 0) ;
          s_unit : out std_logic_vector(6 downto 0); 
          s_cent_max : out std_logic_vector(6 downto 0) ;
           s_diz_max : out std_logic_vector(6 downto 0) ;
          s_unit_max : out std_logic_vector(6 downto 0)
           );
end transcodeur;

architecture Behavioral of transcodeur is
signal nb_binaire_unit : integer;
signal nb_binaire_cent : integer;
signal nb_binaire_diz : integer;
signal nb_binaire_unit_max : integer;
signal nb_binaire_cent_max : integer;
signal nb_binaire_diz_max : integer;

begin
process(nb_binaire,nb_binaire_cent) 
begin 
nb_binaire_cent <= to_integer(signed(nb_binaire))/100;
case nb_binaire_cent is 
    when 0 => s_cent <= "1000000"; -- gfedcba
    when 1=> s_cent <= "1111001";
    when 2 => s_cent <= "0100100";
    when 3 => s_cent <=  "0110000";
    when 4 => s_cent <= "0011001";
    when 5 => s_cent <= "0010010";
    when 6 => s_cent <= "0000010";
    when 7 => s_cent <= "1111000";
    when 8 => s_cent <= "0000000";
    when 9 => s_cent <= "0010000";
    when others => s_cent <= "1111111";
end case ; 
end process;
 process(nb_binaire,nb_binaire_cent,nb_binaire_diz) 
begin
nb_binaire_diz <= (to_integer(signed(nb_binaire)) - nb_binaire_cent*100)/10;
case nb_binaire_diz is 
    when 0 => s_diz <= "1000000"; -- gfedcba
    when 1=> s_diz <= "1111001";
    when 2 => s_diz <= "0100100";
    when 3 => s_diz <=  "0110000";
    when 4 => s_diz <= "0011001";
    when 5 => s_diz <= "0010010";
    when 6 => s_diz <= "0000010";
    when 7=> s_diz <= "1111000";
    when 8 => s_diz <= "0000000";
    when 9 => s_diz <= "0010000";
    when others => s_diz <= "1111111";
end case ; 
end process;

process(nb_binaire,nb_binaire_cent,nb_binaire_diz,nb_binaire_unit) 
begin
nb_binaire_unit <= to_integer(signed(nb_binaire))- nb_binaire_cent *100 - nb_binaire_diz *10 ;
case nb_binaire_unit is 
    when 0 => s_unit <= "1000000"; -- gfedcba
    when 1=> s_unit <= "1111001";
    when 2 => s_unit <= "0100100";
    when 3 => s_unit <=  "0110000";
    when 4 => s_unit <= "0011001";
    when 5 => s_unit <= "0010010";
    when 6 => s_unit <= "0000010";
    when 7 => s_unit <= "1111000";
    when 8 => s_unit <= "0000000";
    when 9 => s_unit <= "0010000";
    when others => s_unit <= "1111111";
end case ; 
end process;

process(max,nb_binaire_cent_max) 
begin 
nb_binaire_cent_max <= to_integer(signed(max))/100;
case nb_binaire_cent_max is 
    when 0 => s_cent_max <= "1000000"; -- gfedcba
    when 1=> s_cent_max <= "1111001";
    when 2 => s_cent_max <= "0100100";
    when 3 => s_cent_max <=  "0110000";
    when 4 => s_cent_max <= "0011001";
    when 5 => s_cent_max <= "0010010";
    when 6 => s_cent_max <= "0000010";
    when 7 => s_cent_max <= "1111000";
    when 8 => s_cent_max <= "0000000";
    when 9 => s_cent_max <= "0010000";
    when others => s_cent_max <= "1111111";
end case ; 
end process;
 process(max,nb_binaire_cent_max,nb_binaire_diz_max) 
begin
nb_binaire_diz_max <= (to_integer(signed(max)) - nb_binaire_cent_max*100)/10;
case nb_binaire_diz_max is 
    when 0 => s_diz_max <= "1000000"; -- gfedcba
    when 1=> s_diz_max <= "1111001";
    when 2 => s_diz_max <= "0100100";
    when 3 => s_diz_max <=  "0110000";
    when 4 => s_diz_max <= "0011001";
    when 5 => s_diz_max <= "0010010";
    when 6 => s_diz_max <= "0000010";
    when 7=> s_diz_max <= "1111000";
    when 8 => s_diz_max <= "0000000";
    when 9 => s_diz_max <= "0010000";
    when others => s_diz_max <= "1111111";
end case ; 
end process;

process(max,nb_binaire_cent_max,nb_binaire_diz_max,nb_binaire_unit_max) 
begin
nb_binaire_unit_max <= to_integer(signed(max))- nb_binaire_cent_max *100 - nb_binaire_diz_max *10 ;
case nb_binaire_unit_max is 
    when 0 => s_unit_max <= "1000000"; -- gfedcba
    when 1=> s_unit_max <= "1111001";
    when 2 => s_unit_max <= "0100100";
    when 3 => s_unit_max <=  "0110000";
    when 4 => s_unit_max <= "0011001";
    when 5 => s_unit_max <= "0010010";
    when 6 => s_unit_max <= "0000010";
    when 7 => s_unit_max <= "1111000";
    when 8 => s_unit_max <= "0000000";
    when 9 => s_unit_max <= "0010000";
    when others => s_unit_max <= "1111111";
end case ; 
end process;

end Behavioral;
