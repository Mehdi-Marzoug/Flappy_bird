----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2023 16:17:37
-- Design Name: 
-- Module Name: adress_counter - Behavioral
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

entity address_counter is
    Port ( clk : in STD_LOGIC;
           clk_game : in STD_LOGIC;
           raz : in STD_LOGIC;
           address : out STD_LOGIC_VECTOR (9 downto 0);
           write : out std_logic ;
           x : out STD_LOGIC_VECTOR (8 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end address_counter;

architecture Behavioral of address_counter is
signal count_val : unsigned(9 downto 0) := (others => '0') ;
signal count_x : integer := 0 ;
signal count_y : integer := 0;
signal s_write : std_logic := '0';

begin 
                 
     counter_value_register : process(clk)
     begin    
        if(rising_edge(clk)) then
            if (raz ='1') then
                count_val <= (others => '0'); 
            elsif(clk_game='1') then           
                if(count_val = to_unsigned(999, 10)) then     
                        count_val <= (others => '0');       
                else
                        count_val <= count_val + 1;                             
                end if;
            end if;     
        end if;                     
     end process;   
                
    pixel_x : process(clk)
    begin               
        if(rising_edge(clk)) then
            if (raz ='1') then
                count_x  <= 0;
            elsif(s_write ='1') then    
                if(count_x = 319 ) then 
                    count_x <= 0;  
                else 
                    count_x <= count_x + 1;
                end if;
             end if; 
          end if;                            
     end process; 
     pixel_y : process(clk)
    begin               
        if(rising_edge(clk)) then
            if (raz ='1') then
                count_y <= 0; 
            elsif(s_write='1') then    
                if(count_x = 319 ) then
                    if(count_y = 239) then 
                        count_y <= 0;  
                    else 
                        count_y <= count_y + 1;   
                    end if;    
                end if;
            end if;    
         end if;                          
     end process; 
     
    writing : process (clk)
    begin
      if(rising_edge(clk)) then
        if (raz='1') then
            s_write <= '0';
        else
        s_write <= not s_write;
        end if;
      end if;      
     end process; 
          
                    
 address <= std_logic_vector(count_val);    
 x <= std_logic_vector(to_unsigned(count_x,9));
 y <= std_logic_vector(to_unsigned(count_y,8));
 write <=s_write;  
end Behavioral;
