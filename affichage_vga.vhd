-- Company:
-- Engineer:
--
-- Create Date: 10/13/2023 02:06:21 PM
-- Design Name:
-- Module Name: top_level_2 - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity affichage_vga is
  Port ( clk : in STD_LOGIC;
        raz : in STD_LOGIC;
        VGA_hs       : out std_logic;   -- horisontal vga syncr.
        VGA_vs       : out std_logic;   -- vertical vga syncr.
        VGA_color    : out std_logic_vector(11 downto 0));
end affichage_vga;

architecture Behavioral of affichage_vga is

component address_counter is
Port ( clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           address : out STD_LOGIC_VECTOR (16 downto 0);
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

component image_rom IS
PORT (
    Clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END component;


component VGA_bitmap_320x240 is
generic(CLK_FREQ : integer := 100000000;         -- clk frequency, must be multiple of 25M
            RAM_BPP  : integer range 1 to 12:= 8;    -- number of bits per pixel for display
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
signal s_address : std_logic_vector(16 downto 0);
signal s_data_out : std_logic_vector(2 downto 0);
signal s_x : std_logic_vector( 8 downto 0);
signal s_y : std_logic_vector ( 7 downto 0);
signal s_x_retard : std_logic_vector( 8 downto 0);
signal s_y_retard : std_logic_vector ( 7 downto 0);
signal s_VGA_color : std_logic_vector(11 downto 0);
constant color : std_logic_vector(2 downto 0):="100";--gbr
signal s_color : std_logic_vector(2 downto 0);

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
raz => raz,
address => s_address,
write => s_write,
x => s_x,
y => s_y);

--wav : image_rom port map(
--Clka => clk ,
--addra => s_address,
--douta => s_data_out);

retarder : retard port map (
clk => clk,
raz => raz,
x => s_x,
y => s_y,
x_retard => s_x_retard,
y_retard => s_y_retard);

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
         data_in      => s_color,
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