----------------------------------------------------------------------------------
-- PmodKYPD V1.0
-- Y. Bornat, 2019/11/02
----------------------------------------------------------------------------------
-- This module handles the 4x4 hexadecimal keypad
-- It performs polling on the next column each millisecond
--
-- The pmod_in and pmod_out signals are dedicated to the PMOD I/Os. pmod_out must be
-- output to pins 1 to 4 of the PMOD, pmod_in must be read from pins 7 to 10 of the
-- PMOD.
--
-- The user output of the module (bout_out) is a std_logic_vector(15 downto 0), each
-- bit of which represent a key. Two layouts are available:
--
-- FACIAL_NUM = False: physical layout
--
--   0  |  1  |  2  |  3
-- -----+-----+-----+-----
--   4  |  5  |  6  |  7
-- -----+-----+-----+-----
--   8  |  9  | 10  | 11
-- -----+-----+-----+-----
--  12  | 13  | 14  | 15
--
--
-- FACIAL_NUM = True: Facial layout
--          agrees to hexadecimal marking on keys
--
--   1  |  2  |  3  | 10
-- -----+-----+-----+-----
--   4  |  5  |  6  | 11
-- -----+-----+-----+-----
--   7  |  8  |  9  | 12
-- -----+-----+-----+-----
--   0  | 15  | 14  | 13
--
--
-- Although official documentation reports tat simultaneous presses cannot be
-- detected, this module accurately detects two simultaneaous presses. Because
-- of hardware limitations, it is not reliable any more fror three simultaneous
-- presses (local shortcuts among keys)
--
--
-- PLANNED FEATURES:
--------------------
-- * user-defined polling frequency
-- * debouncing (may be overriden by setting a slow polling frequency)
-- * stream-like key press/release reporting
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PMOD_KYPD is
    Generic (CLK_FREQ   : integer := 100000000;
             FACIAL_NUM : boolean := True);
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           pmod_in  : in  STD_LOGIC_VECTOR (7 downto 4);
           pmod_out : out STD_LOGIC_VECTOR (3 downto 0);
           bout_out : out STD_LOGIC_VECTOR (15 downto 0));
end PMOD_KYPD;

architecture Behavioral of PMOD_KYPD is

-- polling occurs each millisec so we define a constant for the max value of
-- the clock division counter. This value could further be tunable through generics
constant max_clk_div : integer := CLK_FREQ/1000-1;

signal addressed_col : integer range 0 to 3;               -- the column being polled
signal clock_divider : integer range 0 to max_clk_div;     -- the clock divider counter
signal raw_buttons   : std_logic_vector(15 downto 0);      -- local layout for key values

begin


    -- first we set the clock divider counter
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                clock_divider <= 0;
            elsif clock_divider = max_clk_div then
                clock_divider <= 0;
            else
                clock_divider <= clock_divider + 1;
            end if;
        end if;
    end process;

    
    -- this is how we define the polled column
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                addressed_col <= 0;
            elsif clock_divider = max_clk_div then
                if addressed_col = 3 then
                    addressed_col <= 0;
                else
                    addressed_col <= addressed_col + 1;
                end if;
            end if;
        end if;
    end process;


    -- now we set the column selection according to the polled column
    process(addressed_col)
    begin
        case addressed_col is
            when 0 => pmod_out <= "0ZZZ";
            when 1 => pmod_out <= "Z0ZZ";
            when 2 => pmod_out <= "ZZ0Z";
            when 3 => pmod_out <= "ZZZ0";
        end case;
    end process;


    -- now we set the key values
    -- according to the column currently polled, we assign the keypad feedback
    -- to the corrrect 4 bits
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                raw_buttons <= "0000000000000000";
            elsif clock_divider = max_clk_div then
                case addressed_col is
                    when 0 => raw_buttons( 3 downto  0) <= not pmod_in;
                    when 1 => raw_buttons( 7 downto  4) <= not pmod_in;
                    when 2 => raw_buttons(11 downto  8) <= not pmod_in;
                    when 3 => raw_buttons(15 downto 12) <= not pmod_in;
                end case;
            end if;
        end if;
    end process;


    -- this process defines the output layout,
    -- it only consists in bit reordering according to a constant value, so it does not
    -- require any resource
    process(raw_buttons)
    begin
        if FACIAL_NUM then
            bout_out( 3 downto  0) <= raw_buttons(11) & raw_buttons( 7) & raw_buttons( 3) & raw_buttons( 0); 
            bout_out( 7 downto  4) <= raw_buttons( 1) & raw_buttons(10) & raw_buttons( 6) & raw_buttons( 2); 
            bout_out(11 downto  8) <= raw_buttons(14) & raw_buttons(15) & raw_buttons( 9) & raw_buttons( 5); 
            bout_out(15 downto 12) <= raw_buttons( 4) & raw_buttons( 8) & raw_buttons(12) & raw_buttons(13); 
            
        else
            bout_out( 3 downto  0) <= raw_buttons(15) & raw_buttons(11) & raw_buttons(7) & raw_buttons(3); 
            bout_out( 7 downto  4) <= raw_buttons(14) & raw_buttons(10) & raw_buttons(6) & raw_buttons(2); 
            bout_out(11 downto  8) <= raw_buttons(13) & raw_buttons( 9) & raw_buttons(5) & raw_buttons(1); 
            bout_out(15 downto 12) <= raw_buttons(12) & raw_buttons( 8) & raw_buttons(4) & raw_buttons(0); 
        end if;
    end process;


end Behavioral;
