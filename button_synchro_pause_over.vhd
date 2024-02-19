library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.constants.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity button_synchro_pause_over is
    Port ( input : in STD_LOGIC;
           raz : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_100 : in std_logic;
           output : out STD_LOGIC);
end button_synchro_pause_over;

architecture Behavioral of button_synchro_pause_over is
signal temp : std_logic;
begin
process(clk)
    begin
    if rising_edge(clk) then
        if(raz ='1') then
            output <= '0';
            temp <= '0';
        elsif(clk_100 ='1') then
            temp <= input;
            output <= (input xor temp) and input;
        end if;
end if;
end process;
end Behavioral;