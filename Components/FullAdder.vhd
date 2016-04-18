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

entity FullAdder is port
	( 
		a,b,cin: in std_logic; -- a,b, and carry in
		
		cout, s : out std_logic --carryout and sum
	);
end FullAdder;
----------------------------------------------------------------------

-- Architecture 
architecture FullAdder_a of FullAdder is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------

    
   
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal na   : std_logic; 
	signal nb   : std_logic;
	signal ncin : std_logic;
	
	

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------

        
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------	
	na	<= NOT a;
	nb	<= NOT b;
	ncin	<= NOT cin;
	
	
	cout <= (a AND cin) OR (a AND b) OR (b AND cin);
	s    <= (a AND nb AND ncin) OR (a AND b AND cin) OR (na AND b AND ncin) OR (na AND nb AND cin);
	
	
		 
end FullAdder_a; -- .same name as the architecture