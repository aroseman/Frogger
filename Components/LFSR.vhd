------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date			: 3/29/2016
-- Lab # and name	: Lab 7 "Tug of War"
-- Student 1		: Andrew Roseman
-- Student 2		: Shubham Patni

-- Description		: LFSR circuit

-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity LFSR is port
	( 
		clk, reset, enable					:	in std_logic;
		sw_0, sw_1, sw_2, sw_3,sw_4, sw_5,sw_6, sw_7 : in std_logic;
		qout1, qout2, qout3, qout4, qout5, qout6, qout7, qout8, check	:	out std_logic
	);
end LFSR;
----------------------------------------------------------------------

-- Architecture 
architecture LFSR_a of LFSR is
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
   
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal input	: std_logic; 
	
	--USER INPUTS
	signal q8	: std_logic; 
	signal q7	: std_logic;
	signal q6	: std_logic;
	signal q5	: std_logic;
	signal q4	: std_logic;
	signal q3	: std_logic;
	signal q2	: std_logic;
	signal q1	: std_logic;
	signal d1	: std_logic;
	signal d2	: std_logic;
	signal d3	: std_logic;
	signal d4	: std_logic;
	signal d5	: std_logic;
	signal d6	: std_logic;
	signal d7	: std_logic;
	signal d8	: std_logic;	
	--CARRY OUT 
	signal c_0	: std_logic;	
	signal c_1	: std_logic;
	signal c_2	: std_logic;	
    signal c_3  : std_logic;
    signal c_4	: std_logic;	
    signal c_5  : std_logic;
    signal c_6	: std_logic;	

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	
	dff270_re0 : dff270_re port map
	(

		 clk	=> clk		,
		 clken	=> enable	,
		 rst 	=> reset	,
		 d 	    => d1		,
		 q 	   => q1		
	);

	dff270_re1 : dff270_re port map
	(

		 clk	=> clk		,
		 clken	=> enable	,
		 rst 	=> reset	,
		 d 	    => d2		,
		 q    	=> q2		
	);

	dff270_re2 : dff270_re port map
	(

		 clk	=> clk		,
		 clken	=> enable	,
		 rst 	=> reset	,
		 d    	=> d3	,
		 q    	=> q3		
	);

	dff270_re3 : dff270_re port map
	(

		 clk	=> clk		,
		 clken	=> enable	,
		 rst 	=> reset	,
		 d    	=> d4		,
		 q    	=> q4		
	);
	
	dff270_re4 : dff270_re port map
	(

		 clk	=> clk		,
		 clken	=> enable	,
		 rst 	=> reset	,
		 d      => d5		,
		 q 	    => q5		
	);

	dff270_re5 : dff270_re port map
	(

		 clk	=> clk		,
		 clken	=> enable	,
		 rst 	=> reset	,
		 d    	=> d6		,
		 q    	=> q6		
	);

	dff270_re6 : dff270_re port map
	(

		 clk	=> clk		,
		 clken	=> enable	,
		 rst 	=> reset	,
		 d    	=> d7		,
		 q    	=> q7		
	);

	dff270_re7 : dff270_re port map
	(

		 clk	=> clk		,
		 clken	=> enable	,
		 rst 	=> reset	,
		 d 	    => d8		,
		 q     	=> q8		
	);
    
    FullAdder1 : FullAdder port map
    (
        a       => q1,
        b       => sw_0,
        cin     => '0',
        cout    =>  c_0,
        s       => open
     );
     
     FullAdder2 : FullAdder port map
     (
         a       => q2,
         b       => sw_1,
         cin     => c_0,
         cout    => c_1, 
         s       => open
      );
      
          FullAdder3 : FullAdder port map
      (
          a       => q3,
          b       => sw_2,
          cin     => c_1,
          cout    =>  c_2,
          s       => open
       );
       
       FullAdder4 : FullAdder port map
       (
           a       => q4,
           b       => sw_3,
           cin     => c_2,
           cout    => c_3, 
           s       => open
        );
        
            FullAdder5 : FullAdder port map
        (
            a       => q5,
            b       => sw_4,
            cin     => c_3,
            cout    =>  c_4,
            s       => open
         );
         
         FullAdder6 : FullAdder port map
         (
             a       => q6,
             b       => sw_5,
             cin     => c_4,
             cout    => c_5, 
             s       => open
          );
          
          FullAdder7 : FullAdder port map
          (
              a       => q7,
              b       => sw_6,
              cin     => c_5,
              cout    =>  c_6,
              s       => open
           );
           
           FullAdder8 : FullAdder port map
           (
               a       => q8,
               b       => sw_7,
               cin     => c_6,
               cout    => check, 
               s       => open
            );
     
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------	
	qout1	<= q1	; 
	qout2	<= q2	;
	qout3	<= q3	;
	qout4	<= q4	;
	qout5	<= q5	;
	qout6	<= q6	;
	qout7	<= q7	;
	qout8	<= q8	;
	input	<= q7 XNOR q8	;
	d1	<= input	;
	d2	<= q1	;
	d3	<= q2	;
	d4	<= q3	;
	d5	<= q4	;
	d6	<= q5	;	 
	d7	<= q6	;
	d8	<= q7	;
end LFSR_a; -- .same name as the architecture