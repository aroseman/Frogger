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

entity shiftRegister is port
	( 
		 input, clk, rst: in std_logic;
		 a_7, a_6, a_5, a_4, a_3, a_2, a_1, a_0 : out std_logic  
	);
end shiftRegister;
----------------------------------------------------------------------

-- Architecture 
architecture shiftRegister_a of shiftRegister is
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
	
	component enabler is port 
	( 
	    clk : in  STD_LOGIC;
        Sen: out STD_LOGIC
    );
    end component;

	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal a7_a6   : std_logic;
	signal a6_a5   : std_logic;
	signal a5_a4   : std_logic;
	signal a4_a3   : std_logic;
	signal a3_a2   : std_logic;
	signal a2_a1   : std_logic;
	signal a1_a0   : std_logic; 
	
	signal clk_out : std_logic;
	
begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
    enabler_1 : enabler port map 
    ( 
        clk => clk,
        Sen => clk_out
    );
	
	dff270_re7 : dff270_re  port map
	(
		 clk 	=> clk		,
		 --clken	=> clk_out	,
		 rst 	=> rst		,
		 d 	=> input,
		 q 	=> a7_a6  		
    );
	

	dff270_re6 : dff270_re  port map
	(
		 clk 	=> clk		,
		 --clken	=> clk_out	,
		 rst 	=> rst		,
		 d 	=> a7_a6 	,
		 q 	=> a6_a5  		
    	);

	dff270_re5 : dff270_re  port map
	(
		 clk 	=> clk		,
		 --clken	=> clk_out	,
		 rst 	=> rst		,
		 d 	=> a6_a5		,
		 q 	=> a5_a4 		
    	);
        
	dff270_re4 : dff270_re  port map
	(
		 clk 	=> clk		,
		 clken	=> clk_out	,
		 rst 	=> rst		,
		 d 	=> a5_a4		,
		 q 	=> a4_a3  		
    	);

	dff270_re3 : dff270_re  port map
	(
		 clk 	=> clk		,
		 clken	=> clk_out	,
		 rst 	=> rst		,
		 d 	=> a4_a3		,
		 q 	=> a3_a2  		
     );
     
     dff270_re2 : dff270_re  port map
     (
          clk     => clk        ,
          clken    => clk_out    ,
          rst     => rst        ,
          d     => a3_a2        ,
          q     => a2_a1         
     );
     
     dff270_re1 : dff270_re  port map
     (
          clk     => clk        ,
          clken    => clk_out    ,
          rst     => rst        ,
          d     => a2_a1        ,
          q     => a1_a0          
      );
      
      dff270_re0 : dff270_re  port map
      (
           clk     => clk        ,
           clken    => clk_out    ,
           rst     => rst        ,
           d     => a1_a0        ,
           q     => a_0          
      );
	
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------	
	a_7 <= a7_a6;
	a_6 <= a6_a5;
	a_5 <= a5_a4;
	a_4 <= a4_a3;
	a_3 <= a3_a2;
	a_2 <= a2_a1;
	a_1 <= a1_a0;
	
		 
end shiftRegister_a; -- .same name as the architecture