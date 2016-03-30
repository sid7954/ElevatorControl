--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:07:59 03/29/2016
-- Design Name:   
-- Module Name:   /home/aviral/CS 254 Proj/ElevatorControl/bench2.vhd
-- Project Name:  PROJECT
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main_controller
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY bench2 IS
END bench2;
 
ARCHITECTURE behavior OF bench2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main_controller
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         fireAlarm : IN  std_logic;
         req : IN  std_logic_vector(12 downto 0);
         weight : IN  std_logic_vector(8 downto 0);
         floor_sensor : IN  std_logic_vector(9 downto 0);
         currFloor : OUT  std_logic_vector(2 downto 0);
         currDir : OUT  std_logic_vector(1 downto 0);
         motorUp : OUT  std_logic;
         motorDown : OUT  std_logic;
         energy : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal fireAlarm : std_logic := '0';
   signal req : std_logic_vector(12 downto 0) := (others => '0');
   signal weight : std_logic_vector(8 downto 0) := (others => '0');
   signal floor_sensor : std_logic_vector(9 downto 0);

	--BiDirs
   signal currFloor : std_logic_vector(2 downto 0):="001";
   signal currDir : std_logic_vector(1 downto 0):="10";

 	--Outputs
   signal motorUp : std_logic:='0';
   signal motorDown : std_logic:='0';
   signal energy : std_logic_vector(9 downto 0):="0000000000";

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main_controller PORT MAP (
          clk => clk,
          reset => reset,
          fireAlarm => fireAlarm,
          req => req,
          weight => weight,
          floor_sensor => floor_sensor,
          currFloor => currFloor,
          currDir => currDir,
          motorUp => motorUp,
          motorDown => motorDown,
          energy => energy
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		reset<='1';
		floor_sensor <="0001000000";
      wait for clk_period*10;
		reset<='0';
		currFloor<="001";
	   currDir <= "10";
		floor_sensor <= "0001000000";
		weight<="011111111";
      wait for clk_period*20;
		req <="0000000001000";
		wait for clk_period*20;
		floor_sensor <="0011000000";
		wait for clk_period*20;
		floor_sensor <="0000110000";
		wait for clk_period*20;
		floor_sensor <="0000001100";		
      wait;
   end process;

END;
