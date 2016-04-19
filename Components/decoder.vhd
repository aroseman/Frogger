------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date			: 3/19/2016
-- Lab # and name	: Lab 8 "Tug of War"
-- Student 1		: Andrew Roseman
-- Student 2		: 

-- Description		: Replicates the tug of war game using LED's to represent the middle of the rope, Right player
--                    wins if center reaches LED(0) and left player wins if center reaches LED(14)


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity Decoder is port
	( 
		s0,s1,s2,enabler: in std_logic; 
	
		d0,d1,d2,d3,d4,d5,d6,d7 : out std_logic  
	);
end Decoder;
----------------------------------------------------------------------

-- Architecture 
architecture Decoder_a of Decoder is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------

    
   
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal ns0   : std_logic; 
	signal ns1   : std_logic;
	

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	

        
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------	
	ns0	<= NOT s0;
	ns1	<= NOT s1;
	
	d0 <= enabler AND ns0 AND ns1;
	d1 <= enabler AND ns1 AND s0;
	d2 <= enabler AND s1 AND ns0;
	d3 <= enabler AND s1 AND s0;
	
		 
end Decoder_a; -- .same name as the architecture