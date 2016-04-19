------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 4/16/15
-- Lab # and name	: Lab9 - matrix test
-- Student 1		: Robin Panda
-- Student 2		: That Other Guy Jr.

-- Description		: displays a test image on the led matrix pmod
--					  	  Utilizes code style that should not be used elsewhere in lab.

-- Changes 
-- 		1.0	- Original Just sends buttons/sw to rows/columns
--			2.0   - Picture @ 64 Hz row clock (128Hz on Nexys)
--			2.1   - 4x refresh rate, reversed column order so when statement isn't mirrored
--			2.2   - another 2x refresh rate (1khz)

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------

-- Library Declarations 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity 
entity matrixtop is
    Port ( row : out  STD_LOGIC_VECTOR (8 downto 1);
           col : out  STD_LOGIC_VECTOR (1 to 8); -- cause reversing bits would suck
--           sw : in  STD_LOGIC_VECTOR (7 downto 0);
--           btn : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in STD_LOGIC);
end matrixtop;

-- Architecture 
-- DO NOT USE THESE IN YOUR CODE
architecture Behavioral of matrixtop is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------

	-- NONE	
	
	-------------------------------------------------------
	-- Internal Signal Declarations	
	-------------------------------------------------------
	
signal cnt: std_logic_vector (17 downto 0);
signal rowclk: std_logic_vector (3 downto 0);

begin
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------

	-- NONE

	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------

-- DO NOT USE THIS CODE STYLE IN YOUR CODE! I DO NOT WANT TO SEE PROCESS OR EVENT!

	process(clk)
		begin 
			if clk'event and clk = '1' then
				-- every 781.25k clocks
				if cnt = "010111110101111000" then
					rowclk <= rowclk +1;
					cnt <="000000000000000000";
				else
					cnt <= cnt +1;
				end if;
			end if;
	end process;
	
	--decoder
	--must go to row to keep display bright
	with rowclk select row <=
		"00000001" when "0000",
		"00000010" when "0001",
		"00000100" when "0010",
		"00001000" when "0011",
		"00010000" when "0100",
		"00100000" when "0101",
		"01000000" when "0110",
		"10000000" when "0111",
		"00000001" when "1000",
		"00000010" when "1001",
		"00000100" when "1010",
		"00001000" when "1011",
		"00010000" when "1100",
		"00100000" when "1101",
		"01000000" when "1110",
		"10000000" when "1111",
      (others => 'X') when others;
	
	--image to display
	with rowclk select col <=
		"00111100" when "0000",
		"01000010" when "0001",
		"10011001" when "0010",
		"10000001" when "0011",
		"11000011" when "0100",
		"10111101" when "0101",
		"01000010" when "0110",
		"00111100" when "0111",
		"00111100" when "1000",
		"01000010" when "1001",
		"10000001" when "1010",
		"10000001" when "1011",
		"10000001" when "1100",
		"10000001" when "1101",
		"01000010" when "1110",
		"00111100" when "1111",
      (others => 'X') when others;

	
--col <= sw(7) & sw(6) & sw(5) & sw(4) & sw(3) & sw(2) & sw(1) & sw(0);
--row <= btn & '0' & '0' & '0' & '0';

end Behavioral;

