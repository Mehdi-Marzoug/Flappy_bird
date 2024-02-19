----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2023 14:46:00
-- Design Name: 
-- Module Name: affichage_pipe - Behavioral
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
use work.constants.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity affichage is
    Port ( clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           choice : in std_logic;
           choice_2 : in std_logic;
           choice_3 : in std_logic;
           choice_4 : in std_logic;
           choice_5 : in std_logic;
           easy : in std_logic;
           medium : in std_logic;
           hard : in std_logic;
           JA : inout  STD_LOGIC_VECTOR (7 downto 0);
           Sept_segments : out std_logic_vector(6 downto 0);
           AN : out std_logic_vector(7 downto 0);
           VGA_hs       : out std_logic;   
           VGA_vs       : out std_logic;  
           VGA_color    : out std_logic_vector(11 downto 0));
           
end affichage;

architecture Behavioral of affichage is

component address_counter is
    Port ( clk : in STD_LOGIC;
           clk_game : in STD_LOGIC;
           raz : in STD_LOGIC;
           address : out STD_LOGIC_VECTOR (9 downto 0);
           write : out std_logic; 
           x : out STD_LOGIC_VECTOR (8 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component retard is 
    Port ( clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (8 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           x_retard : out STD_LOGIC_VECTOR (8 downto 0);
           y_retard : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component fsm is
    Port ( clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           clk_game : in std_logic;
           start_button : in std_logic ;
           jump_button : in std_logic ;
           pause_button : in std_logic ;
           crashed : in std_logic;
           game_on : out std_logic ;
           game_pause : out std_logic;
           game_done : out std_logic);
end component;

component graphic_pipe is
    Port ( clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (8 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           game_on : in STD_LOGIC;
           game_pause : in std_logic;
           game_done : in std_logic; 
           flappy_start_y : in std_logic_vector (7 downto 0);
           flappy_end_y : in std_logic_vector (7 downto 0);
           pipe_1_x_start : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_1_x_end : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_1_y_gap_start : in STD_LOGIC_VECTOR (7 downto 0);
           pipe_2_x_start : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_2_x_end : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_2_y_gap_start : in STD_LOGIC_VECTOR (7 downto 0);
           pipe_3_x_start : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_3_x_end : in STD_LOGIC_VECTOR (8 downto 0);
           pipe_3_y_gap_start : in STD_LOGIC_VECTOR (7 downto 0);
           pixel_adrr: out std_logic_vector(10 downto 0);
           game_over_adrr: out std_logic_vector(12 downto 0);
           pause_adrr: out std_logic_vector(12 downto 0);
           background_adrr: out std_logic_vector(16 downto 0);
           menu_adrr: out std_logic_vector(16 downto 0));
end component;

component pipe_generator is
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
end component;

component clk_manager is
    Port ( clk : in STD_LOGIC;
           clk_100 : out STD_LOGIC;
           CE_perc : out std_logic;
           clk_125 : out std_logic;
           clk_150 : out std_logic;
           clk_175 : out std_logic;
           clk_50 : out std_logic);
end component;

component frequency_change is
    Port ( clk : in STD_LOGIC;
           clk_100 : in STD_LOGIC;
           score : in STD_LOGIC_VECTOR(9 downto 0);
           clk_125 : in std_logic;
           clk_150 : in std_logic;
           clk_175 : in std_logic;
           clk_50 : in std_logic;
           clk_game : out STD_LOGIC;
           score_interval : in std_logic_vector(5 downto 0));
end component;

component jump_manager is
    Port ( clk : in STD_LOGIC;
           clk_game : in std_logic;
           jump_button : in STD_LOGIC_VECTOR (15 downto 0);
           jump_order : out std_logic);
end component;

component DATA is
    Port( clk : in std_logic;
          address : in std_logic_vector( 10 downto 0);
          data_out : out std_logic_vector(2 downto 0));
end component; 

component bee is
    Port( clk : in std_logic;
          address : in std_logic_vector( 10 downto 0);
          bee_out : out std_logic_vector(2 downto 0));
end component; 

component twitter_bird is
    Port( clk : in std_logic;
          address : in std_logic_vector( 10 downto 0);
          twitter_out : out std_logic_vector(2 downto 0));
end component; 

component angry_bird is
    Port( clk : in std_logic;
          address : in std_logic_vector( 10 downto 0);
          angry_bird_out : out std_logic_vector(2 downto 0));
end component; 

component angry_cat is
    Port( clk : in std_logic;
          address : in std_logic_vector( 10 downto 0);
          angry_cat_out : out std_logic_vector(2 downto 0));
end component; 

component pinguin is
    Port( clk : in std_logic;
          address : in std_logic_vector( 10 downto 0);
          pinguin_out : out std_logic_vector(2 downto 0));
end component; 

component button_synchro is 
    Port ( input : in STD_LOGIC;
           raz : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_jump :  in std_logic;
           output : out STD_LOGIC);
end component;

component button_synchro_pause_over is 
    Port ( input : in STD_LOGIC;
           raz : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_100 :  in std_logic;
           output : out STD_LOGIC);
end component;

component game_over is
PORT (
      clk          : IN  STD_LOGIC;
      address         : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
      pixel_game_over       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
      );
END component;

component background is
PORT (
      clk          : IN  STD_LOGIC;
      address         : IN  STD_LOGIC_VECTOR(16 DOWNTO 0);
      pixel_background       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
      );
END component;

component pause is
PORT (
      clk          : IN  STD_LOGIC;
      address         : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
      pixel_pause       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
      );
END component;

component random_rom IS
PORT (
      clk          : IN  STD_LOGIC;
      address         : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
      random_value       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
END  component ;

component menu is
PORT (
      clk          : IN  STD_LOGIC;
      address         : IN  STD_LOGIC_VECTOR(16 DOWNTO 0);
      pixel_menu       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
      );
END component;

component flappy_or_bee is
    Port ( 
           choice : in std_logic;
           choice_2 : in std_logic;
           choice_3 : in std_logic;
           choice_4 : in std_logic;
           choice_5 : in std_logic;
           twitter_data : in STD_LOGIC_VECTOR (2 downto 0);
           flappy_data : in STD_LOGIC_VECTOR (2 downto 0);
           angry_bird_data : in STD_LOGIC_VECTOR (2 downto 0);
           angry_cat_data : in STD_LOGIC_VECTOR (2 downto 0);
           bee_data : in STD_LOGIC_VECTOR (2 downto 0);
           pinguin_data : in STD_LOGIC_VECTOR (2 downto 0);
           play_data : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component difficulty is
    Port (
           easy : in std_logic;
           medium : in std_logic;
           hard : in std_logic;
           score_interval : out std_logic_vector(5 downto 0));
end component;

component flappy_pos is 
    Port ( clk : in STD_LOGIC;
           raz : in std_logic; 
           clk_game : in std_logic;
           game_on : in STD_LOGIC;
           game_pause : in std_logic;
           game_done : in std_logic;
           jump_button : in std_logic ;
           flappy_start_y : out STD_LOGIC_vector(7 downto 0);
           flappy_end_y : out STD_LOGIC_vector(7 downto 0));
end component;  

component crash_test is
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
end component;     

component score_counter is
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
end component;

component modulo_8 is
    Port ( C_E : in STD_LOGIC;
           clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           sortie_modulo_8 : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component mux8_1 is
    Port ( COMMANDE : in STD_LOGIC_VECTOR (2 downto 0);
           E0 : in STD_LOGIC_VECTOR (6 downto 0);
           E1 : in STD_LOGIC_VECTOR (6 downto 0);
           E2 : in STD_LOGIC_VECTOR (6 downto 0);
           E3 : in STD_LOGIC_VECTOR (6 downto 0);
           E4 : in STD_LOGIC_VECTOR (6 downto 0);
           E5 : in STD_LOGIC_VECTOR (6 downto 0);
           E6 : in STD_LOGIC_VECTOR (6 downto 0);
           E7 : in STD_LOGIC_VECTOR (6 downto 0);
           S  : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component transcodeur is
    Port ( max : in STD_LOGIC_VECTOR (9 downto 0);
           nb_binaire : in STD_LOGIC_VECTOR (9 downto 0);
           s_cent : out std_logic_vector(6 downto 0) ;
           s_diz : out std_logic_vector(6 downto 0) ;
          s_unit : out std_logic_vector(6 downto 0); 
          s_cent_max : out std_logic_vector(6 downto 0) ;
           s_diz_max : out std_logic_vector(6 downto 0) ;
          s_unit_max : out std_logic_vector(6 downto 0)
           );
end component;

component PMOD_KYPD is
    Generic (CLK_FREQ   : integer := 100000000;
             FACIAL_NUM : boolean := True);
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           pmod_in  : in  STD_LOGIC_VECTOR (7 downto 4);
           pmod_out : out STD_LOGIC_VECTOR (3 downto 0);
           bout_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component mux_ram is
Port ( clk : in STD_LOGIC;
           game_done : in STD_LOGIC;
           game_on : in STD_LOGIC;
           game_pause : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (8 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           pixel_RAM_play : in STD_LOGIC_VECTOR (2 downto 0);
           pixel_RAM_game_over : in STD_LOGIC_VECTOR (2 downto 0);
           pixel_RAM_MENU : in STD_LOGIC_VECTOR (2 downto 0);
           pixel_RAM_background : in STD_LOGIC_VECTOR (2 downto 0);
           pixel_RAM_pause : in STD_LOGIC_VECTOR (2 downto 0);
           pixel_VGA : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component random_gen_V1 is
    generic (size  : integer := 168;  -- the cycle of the shift register
             seed  : integer := 2016; -- the number of cycles used to seed the generator
             cycle : integer := 168;  -- how much bit shifts to draw a new value ? (may reduce cycle size if submultiple of (2**size - 1)
             outpt : integer := 7);   -- output size (must be lower than 'size')
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           update   : in  STD_LOGIC;
           rdy      : out STD_LOGIC;
           rand_val : out STD_LOGIC_VECTOR (outpt - 1 downto 0));
end component;

component VGA_bitmap_320x240 is
    generic(CLK_FREQ : integer := 100000000;         -- clk frequency, must be multiple of 25M
            RAM_BPP  : integer range 1 to 12:= 3;    -- number of bits per pixel for display
            HARD_BPP : integer range 1 to 16:= 12;    -- number of bits per pixel actually available in hardware
            INDEXED  : integer range 0 to  1:= 0;    -- colors are indexed (1) or directly coded from RAM value (0)
            READBACK : integer range 0 to  1:= 0);   -- readback enabled ? might save some resources

    port(clk          : in  std_logic;
         reset        : in  std_logic;
         VGA_hs       : out std_logic;   -- horisontal vga syncr.
         VGA_vs       : out std_logic;   -- vertical vga syncr.
         VGA_color    : out std_logic_vector(HARD_BPP - 1 downto 0);

         pixel_x      : in  std_logic_vector(8 downto 0);
         pixel_y      : in  std_logic_vector(7 downto 0);
         data_in      : in  std_logic_vector( RAM_BPP - 1 downto 0);
         data_write   : in  std_logic;
         data_read    : in  std_logic:='0';
         data_rout    : out std_logic;
         data_out     : out std_logic_vector( RAM_BPP - 1 downto 0);
         
         end_of_frame : out std_logic;

         palette_w    : in  std_logic:='0';
         palette_idx  : in  std_logic_vector( RAM_BPP - 1 downto 0):=(others => '0');
         palette_val  : in  std_logic_vector(HARD_BPP - 1 downto 0):=(others => '0'));
end component;

signal s_write : std_logic;
signal s_address : std_logic_vector(9 downto 0);
signal s_data_out : std_logic_vector(2 downto 0);
signal s_x : std_logic_vector( 8 downto 0);
signal s_y : std_logic_vector ( 7 downto 0);
signal s_x_retard : std_logic_vector( 8 downto 0);
signal s_y_retard : std_logic_vector ( 7 downto 0);
signal s_VGA_color : std_logic_vector(11 downto 0);
constant color : std_logic_vector(2 downto 0):="100";--gbr
signal s_color : std_logic_vector(2 downto 0);
signal s_pipe_1_x_start :  STD_LOGIC_VECTOR (8 downto 0);
signal s_pipe_1_x_end :  STD_LOGIC_VECTOR (8 downto 0);
signal s_pipe_1_y_gap_start :  STD_LOGIC_VECTOR (7 downto 0);
signal s_pipe_2_x_start :  STD_LOGIC_VECTOR (8 downto 0);
signal s_pipe_2_x_end :  STD_LOGIC_VECTOR (8 downto 0);
signal s_pipe_2_y_gap_start :  STD_LOGIC_VECTOR (7 downto 0);
signal s_pipe_3_x_start :  STD_LOGIC_VECTOR (8 downto 0);
signal s_pipe_3_x_end :  STD_LOGIC_VECTOR (8 downto 0);
signal s_pipe_3_y_gap_start :  STD_LOGIC_VECTOR (7 downto 0);
signal s_pixel_adrr: std_logic_vector(10 downto 0);
signal s_game_over_adrr: std_logic_vector(12 downto 0);
signal s_menu_adrr: std_logic_vector(16 downto 0);
signal s_background_adrr: std_logic_vector(16 downto 0);
signal s_pause_adrr: std_logic_vector(12 downto 0);
signal s_clk_100 : std_logic;
signal s_clk_50 : std_logic;
signal s_clk_125 : std_logic;
signal s_clk_150 : std_logic;
signal s_clk_175 : std_logic;
signal s_clk_game : std_logic;
signal s_CE_perc : std_logic;
signal s_nbr_binaire : std_logic_vector(9 downto 0);
signal s_max_score : std_logic_vector(9 downto 0);
signal s_s_cent : std_logic_vector(6 downto 0);
signal s_s_diz : std_logic_vector(6 downto 0);
signal s_s_unit : std_logic_vector(6 downto 0);
signal s_s_unit_max : std_logic_vector(6 downto 0);
signal s_s_cent_max : std_logic_vector(6 downto 0);
signal s_s_diz_max : std_logic_vector(6 downto 0);

signal s_sortie_mod_8 : std_logic_vector(2 downto 0);
signal s_flappy_start_y : std_logic_vector (7 downto 0) ;
signal s_flappy_end_y : std_logic_vector (7 downto 0);
signal s_jump_button : std_logic;
signal s_play_button : std_logic;
signal s_pause_button : std_logic;
signal s_game_on : std_logic;
signal s_game_pause : std_logic;
signal s_game_done : std_logic;
signal s_crash : std_logic;
signal s_pixel_game_over : std_logic_vector(2 downto 0);
signal s_pixel_play : std_logic_vector(2 downto 0);
signal s_pixel_menu : std_logic_vector(2 downto 0);
signal s_pixel_pause : std_logic_vector(2 downto 0);
signal s_pixel_background : std_logic_vector(2 downto 0);
signal s_bee_out : std_logic_vector(2 downto 0);
signal s_flappy_out : std_logic_vector(2 downto 0);
signal s_twitter_out : std_logic_vector(2 downto 0);
signal s_angry_bird_out : std_logic_vector(2 downto 0);
signal s_pinguin_out : std_logic_vector(2 downto 0);
signal s_angry_cat_out : std_logic_vector(2 downto 0);

signal s_adresse_rand : std_logic_vector(9 downto 0);

signal s_score_interval : std_logic_vector(5 downto 0);

signal s_random_value : std_logic_vector(7 downto 0);
signal s_jump_order : std_logic;

signal s_bout_out : std_logic_vector(15 downto 0);
           
signal s_data_read    : std_logic;
signal s_data_rout    : std_logic;
signal s_data_out_mem : std_logic_vector(2 downto 0);
signal s_end_of_frame : std_logic;
signal s_palette_w    : std_logic;
signal s_palette_idx  : std_logic_vector(2 downto 0);
signal s_palette_val  : std_logic_vector(11 downto 0);


begin
Compteur : address_counter port map(
            clk => clk,
            clk_game => s_clk_game,
            raz => raz,
            address => s_address,
            write => s_write,
            x => s_x,
            y => s_y);

flappy : flappy_pos port map(
            clk => clk ,
            raz => raz ,
            clk_game => s_clk_50,
            game_on => s_game_on ,
            game_pause => s_game_pause ,
            game_done => s_game_done ,
            jump_button => s_jump_button,
            flappy_start_y => s_flappy_start_y,
            flappy_end_y => s_flappy_end_y);
            
                                     
pmod : entity work.pmod_kypd 
        generic map(
             CLK_FREQ  => 100000000,
             FACIAL_NUM => True)   -- output size (must be lower than 'size 
         port map(
           clk      => clk,
           reset    => raz,
           pmod_in   => JA(7 downto 4),
           pmod_out      => JA(3 downto 0),
           bout_out => s_bout_out);                                            
            
crashed : crash_test port map(
           clk => clk,
           raz => raz,
           game_on => s_game_on,
           game_pause => s_game_pause,
           game_done => s_game_done, 
           bird_start_y => s_flappy_start_y ,
           bird_end_y => s_flappy_end_y, 
           pipe_1_x_start => s_pipe_1_x_start,
           pipe_1_x_end => s_pipe_1_x_end,
           pipe_1_y_gap_start => s_pipe_1_y_gap_start,
           pipe_2_x_start => s_pipe_2_x_start,
           pipe_2_x_end => s_pipe_2_x_end,
           pipe_2_y_gap_start => s_pipe_2_y_gap_start,
           pipe_3_x_start => s_pipe_3_x_start,
           pipe_3_x_end => s_pipe_3_x_end,
           pipe_3_y_gap_start => s_pipe_3_y_gap_start,
           crash => s_crash); 
            
 states : fsm port map(
           clk => clk,
           raz => raz,
           clk_game => s_clk_100,
           start_button => s_play_button,
           jump_button => s_jump_button,
           pause_button => s_pause_button,
           crashed => s_crash,
           game_on => s_game_on,
           game_pause =>s_game_pause,
           game_done => s_game_done);           

freq : clk_manager port map(
            clk => clk,
            clk_100 => s_clk_100,
            CE_perc => s_CE_perc,
           clk_125 => s_clk_125,
           clk_150 => s_clk_150,
           clk_175 => s_clk_175,
           clk_50 => s_clk_50);

graphic : DATA port map(
            clk => clk,
            address => s_pixel_adrr,
            data_out => s_flappy_out);
            
graphic_bee : bee port map(
            clk => clk,
            address => s_pixel_adrr,
            bee_out => s_bee_out);   
            
tweet : twitter_bird port map(
            clk => clk,
            address => s_pixel_adrr,
            twitter_out => s_twitter_out);          
            
angty_bird : angry_bird port map(
            clk => clk,
            address => s_pixel_adrr,
            angry_bird_out => s_angry_bird_out);      
          
angty_cat : angry_cat port map(
            clk => clk,
            address => s_pixel_adrr,
            angry_cat_out => s_angry_cat_out);               
     
pinguin_bird : pinguin port map(
            clk => clk,
            address => s_pixel_adrr,
            pinguin_out => s_pinguin_out);                          
            
choose_bee  : flappy_or_bee port map(
            choice => choice,
            choice_2 => choice_2,
            choice_3 => choice_3,
            choice_4 => choice_4,
            choice_5 => choice_5,
            twitter_data =>s_twitter_out,
            angry_bird_data =>s_angry_bird_out,
            angry_cat_data =>s_angry_cat_out,
            pinguin_data =>s_pinguin_out,
            flappy_data =>s_flappy_out,
            bee_data => s_bee_out,
            play_data => s_pixel_play);                 
            
button_to_jump : button_synchro port map(
            clk => clk,
            raz => raz,
            clk_jump => s_clk_100,
            input => s_jump_order,
            output => s_jump_button);
            
button_to_replay : button_synchro_pause_over port map(
            clk => clk,
            raz => raz,
            clk_100 => s_clk_100,
            input => s_bout_out(0),
            output => s_play_button);       
            
button_to_pause : button_synchro_pause_over port map(
            clk => clk,
            raz => raz,
            clk_100 => s_clk_100,
            input => s_bout_out(13),
            output => s_pause_button); 
            
jump : jump_manager port map(
            clk => clk,
            clk_game => s_clk_100,
            jump_button => s_bout_out,
            jump_order => s_jump_order);
                                        

delay : retard port map (
            clk => clk,
            raz => raz,
            x => s_x,
            y => s_y,
            x_retard => s_x_retard,
            y_retard => s_y_retard);
            
speed : frequency_change port map(
            clk => clk,
           clk_100 => s_clk_100,
           score => s_nbr_binaire,
           clk_125 => s_clk_125,
           clk_150 => s_clk_150,
           clk_175 => s_clk_175,
           clk_50 => s_clk_50,
           clk_game => s_clk_game,
           score_interval => s_score_interval);            
        
Score : score_counter port map (
            pipe_1_x_start => s_pipe_1_x_start,
            pipe_2_x_start => s_pipe_2_x_start,
            pipe_3_x_start => s_pipe_3_x_start,
            clk => clk,
            clk_game => s_clk_100,
            reset => raz,
            start_button => s_play_button,
            game_on => s_game_on,  
            game_done => s_game_done,
            game_pause => s_game_pause,
            score => s_nbr_binaire,
            max_score => s_max_score);      
            
random: random_rom port map(
            clk => clk,
            address => s_adresse_rand,
            random_value => s_random_value);                  

pipe_generation : pipe_generator port map (
           clk => clk,
           raz => raz,
           clk_game => s_clk_game,
           game_on => s_game_on,
           game_pause => s_game_pause,
           game_done => s_game_done,
           random_gen_value => s_random_value,
           adresse_rand => s_adresse_rand,
           pipe_1_x_start => s_pipe_1_x_start,
           pipe_1_x_end => s_pipe_1_x_end,
           pipe_1_y_gap_start => s_pipe_1_y_gap_start,
           pipe_2_x_start => s_pipe_2_x_start,
           pipe_2_x_end => s_pipe_2_x_end,
           pipe_2_y_gap_start => s_pipe_2_y_gap_start,
           pipe_3_x_start => s_pipe_3_x_start,
           pipe_3_x_end => s_pipe_3_x_end,
           pipe_3_y_gap_start => s_pipe_3_y_gap_start);
           
pipe_illustartion : graphic_pipe port map(
           clk => clk,
           raz => raz,
           x => s_x,
           y => s_y,
           game_on => s_game_on,
           game_pause => s_game_pause,
           game_done => s_game_done, 
           flappy_start_y =>s_flappy_start_y ,
           flappy_end_y => s_flappy_end_y,
           pipe_1_x_start => s_pipe_1_x_start,
           pipe_1_x_end => s_pipe_1_x_end,
           pipe_1_y_gap_start => s_pipe_1_y_gap_start,
           pipe_2_x_start => s_pipe_2_x_start,
           pipe_2_x_end => s_pipe_2_x_end,
           pipe_2_y_gap_start => s_pipe_2_y_gap_start,
           pipe_3_x_start => s_pipe_3_x_start,
           pipe_3_x_end => s_pipe_3_x_end,
           pipe_3_y_gap_start => s_pipe_3_y_gap_start,
           pixel_adrr => s_pixel_adrr,
           game_over_adrr =>s_game_over_adrr,
           pause_adrr =>s_pause_adrr,
           background_adrr =>s_background_adrr,
           menu_adrr =>s_menu_adrr);  
           
hardness : difficulty port map (
    easy => easy,
    medium => medium,
    hard => hard,
    score_interval => s_score_interval);                  
      
mod8 : modulo_8 port map(
    clk => clk,
    raz => raz,
    C_E => s_CE_perc,
    AN => AN,
    sortie_modulo_8 => s_sortie_mod_8);
trans : transcodeur port map(
    max=> s_max_score,
    nb_binaire => s_nbr_binaire,
    s_cent => s_s_cent,
    s_diz => s_s_diz,
    s_unit => s_s_unit,
    s_cent_max => s_s_cent_max,
    s_diz_max => s_s_diz_max,
    s_unit_max => s_s_unit_max
    );
mux8 : mux8_1 port map(
    COMMANDE => s_sortie_mod_8,
    E0 => "1111111",
    E1 => s_s_cent,
    E2 => s_s_diz,
    E3 => s_s_unit,
    E4 => "1111111",
    E5 => s_s_cent_max,
    E6 => s_s_diz_max,
    E7 => s_s_unit_max,
    S => Sept_segments);
 over : game_over port map( 
    clk => clk,
    address => s_game_over_adrr,
    pixel_game_over => s_pixel_game_over);  
    
 halt : pause port map( 
    clk => clk,
    address => s_pause_adrr,
    pixel_pause => s_pixel_pause);   
    
 game_menu : menu port map( 
    clk => clk,
    address => s_menu_adrr,
    pixel_menu => s_pixel_menu);   
    
game_back : background port map( 
    clk => clk,
    address => s_background_adrr,
    pixel_background => s_pixel_background);  
    
muxram : mux_ram port map(
           clk => clk,
           game_done => s_game_done,
           game_on => s_game_on,
           x => s_x,
           y=> s_y,
           game_pause => s_game_pause,
           pixel_RAM_play => s_pixel_play,
           pixel_RAM_game_over => s_pixel_game_over,
           pixel_RAM_MENU => s_pixel_menu,
           pixel_RAM_background => s_pixel_background,
           pixel_RAM_pause => s_pixel_pause,
           pixel_VGA => s_data_out);   
                       

vga :  entity work.VGA_bitmap_320x240
      generic map(
                  CLK_FREQ =>  100000000,
                  RAM_BPP  => 3,            -- number of bits per pixels
                  HARD_BPP => 12,
                  INDEXED  => 0,            -- do not used indexed colors
                  READBACK => 0)   
 port map(
         clk          => clk,
         reset        => raz,
         
         VGA_hs       => VGA_hs,
         VGA_vs       => VGA_vs,
         VGA_color    => s_VGA_color,
         
         pixel_x      => s_x_retard,
         pixel_y      => s_y_retard,
         data_in      => s_data_out,
         data_write   => s_write,
         
         data_read    => s_data_read,
         data_rout    => s_data_rout,
         data_out     => s_data_out_mem,
         
         end_of_frame => s_end_of_frame,

         palette_w    => s_palette_w,
         palette_idx  => s_palette_idx,
         palette_val  => s_palette_val
         );
 
 s_data_read   <= '0';       
 s_palette_w   <= '0';
 s_palette_idx <= "000";
 s_palette_val <= "000000000000";
 
 s_color<= color;        
 VGA_color <= s_VGA_color;
 
end Behavioral;

