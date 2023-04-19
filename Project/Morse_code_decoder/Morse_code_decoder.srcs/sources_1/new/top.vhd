


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( 
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC);
end top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------
architecture behavioral of top is
  -- No internal signals are needed today:)
begin

  --------------------------------------------------------
  -- Instance (copy) of driver_7seg_4digits entity
  --------------------------------------------------------
   hex2seg : entity work.hex_7seg
      port map (
           blank     => BTNC,
          inp(0) => SW(0),
          inp(1) => SW(1),
          inp(2) => SW(2),
          inp(3) => SW(3),
          inp(4) => SW(4),
          inp(5) => SW(5),
          inp(6) => SW(6),
          inp(7) => SW(7),
              seg(6) => CA,
             seg(5) => CB,
             seg(4) => CC,
             seg(3) => CD,
             seg(2) => CE,
             seg(1) => CF,
             seg(0) => CG
          
          );

  --------------------------------------------------------
  -- Other settings
  --------------------------------------------------------
  -- Disconnect the top four digits of the 7-segment display
         AN <= b"1111_0111";

end architecture behavioral;