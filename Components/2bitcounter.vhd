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

entity Counter1 is port
	( 
		 rst, clk, enable: in std_logic; 
		q0, q1 : out std_logic --carryout and sum ,cout
	);
end Counter1;
----------------------------------------------------------------------

-- Architecture 
architecture Counter1_a of Counter1 is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
	component dff270_re is port
	(
		 clk 	: in std_logic ;
		 clken	: in std_logic ;
		 rst 	: in std_logic ;
		 d 	: in std_logic ;
		 q 	: out std_logic
    	);
	end component;

	component FullAdder is port
	( 
		a,b,cin: in std_logic; -- a,b, and carry in
		
		cout, s : out std_logic --carryout and sum
	);
	end component;
    	
--	component Decoder is port
--	( 
--		s1,s2,enabler: in std_logic; 
	
--		d0,d1,d2,d3 : out std_logic
--	);
--	end component;
   
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal b0   : std_logic; 
	signal b1   : std_logic; 



	signal sum0   : std_logic;
	signal sum1   : std_logic; 

	signal cin1   : std_logic;
	signal cin2   : std_logic;
	
	
	

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	dff270_re0 : dff270_re  port map
	(
		 clk 	=> clk		,
		 clken	=> enable	,
		 rst 	=> rst		,
		 d 	=> sum0		,
		 q 	=> b0  		
    	);
	

	dff270_re1 : dff270_re  port map
	(
		 clk 	=> clk		,
		 clken	=> enable	,
		 rst 	=> rst		,
		 d 	=> sum1		,
		 q 	=> b1  		
    	);

    	
	
	FullAdder0 : FullAdder  port map
	(
		 a 	=> '1'		,
		 b	=> b0	,
		 cin 	=> '0'		,
		 cout 	=> cin1	,
		 s 	=> sum0  	
    	);

	FullAdder1 : FullAdder  port map
	(
		 a 	=> '0'	,
		 b	=> b1	,
		 cin 	=> cin1	,
		 cout 	=> cin2		,
		 s 	=> sum1		
    	);

----	<------	Decoder ------>
--	Decoder : Decoder is port map
--	( 
--		s1	=>	,
--		s2	=>	,
--		enabler	=>	, 
	
--		d0	=>	,
--		d1	=>	,
--		d2	=>	,
--		d3	=>	
--	);

	
	
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------	
	q0 <= b0;
	q1 <= b1;
	
	
		 
end Counter1_a; -- .same name as the architecture