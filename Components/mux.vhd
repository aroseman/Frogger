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

entity Mux is port
	( 
		s0,s1,s2, d0,d1,d2,d3,d5,d6,d7: in std_logic;  
	
		F: out std_logic 
	);
end Mux;
----------------------------------------------------------------------

-- Architecture 
architecture Mux_a of Mux is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------

    
   
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal ns0   : std_logic; 
	signal ns1   : std_logic;
	signal ns2   : std_logic;

	signal out_and_d0 : std_logic;
	signal out_and_d1 : std_logic;
	signal out_and_d2 : std_logic;
	signal out_and_d3 : std_logic;
	signal out_and_d4 : std_logic;
	signal out_and_d5 : std_logic;
	signal out_and_d6 : std_logic;
	signal out_and_d7 : std_logic;
	
	

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------

        
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------	
	ns0	<= NOT s0;
	ns1	<= NOT s1;
	ns2	<= NOT s2;
	
	out_and_d0 <= ns0 AND ns1 AND ns2 AND d0;
	out_and_d1 <= ns2 AND ns1 AND s0 AND d1;
	out_and_d2 <= ns2 AND s1 AND ns0 AND d2;
	out_and_d3 <= ns2 AND s0 AND s1 AND d3;
	out_and_d4 <= s2 AND ns1 AND ns0 AND d4;
	out_and_d5 <= s2 AND ns1 AND s0 AND d5;
	out_and_d6 <= s2 AND s1 AND ns0 AND d6;
	out_and_d7 <= s2 AND s1 AND s0 AND d7;
	
	F <= out_and_d0 OR out_and_d1 OR out_and_d2 OR out_and_d3 OR out_and_d4 OR out_and_d5 OR out_and_d6 OR out_and_d7 ;
		 
end Mux_a; -- .same name as the architecture