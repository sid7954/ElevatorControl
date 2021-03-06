----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:00:46 03/26/2016 
-- Design Name: 
-- Module Name:    main_controller - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.std_logic_unsigned.ALL;
--USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main_controller is
Port (
		clk : in std_logic;
		reset : in std_logic;
		fireAlarm : in std_logic;
		req : in std_logic_vector(12 downto 0);
		weight : in std_logic_vector(8 downto 0);
		floor_sensor : in std_logic_vector (9 downto 0);
		currFloor : out std_logic_vector(2 downto 0);
		currDir : out std_logic_vector(1 downto 0);
		motorUp: out std_logic;
		motorDown: out std_logic;
		energy: out std_logic_vector(9 downto 0)
		);
end main_controller;

architecture Behavioral of main_controller is
component Door_controller is
	port (  state : in  STD_LOGIC;
           weight : in  STD_LOGIC_VECTOR(8 downto 0);
           done : out  STD_LOGIC;
		     clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

component motor_controller is
 Port (	  idle : in  STD_LOGIC;
           dirBit : in  STD_LOGIC;
           motorUp : out  STD_LOGIC;
           motorDown : out  STD_LOGIC;
		     clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

component Memory is
PORT(
		clk : IN STD_LOGIC;
		curr_floor : IN STD_LOGIC_VECTOR ( 2 downto 0 );
		weight: IN STD_LOGIC_VECTOR ( 8 downto 0 );
		reset : IN STD_LOGIC;
		energy : OUT STD_LOGIC_VECTOR ( 9 downto 0 )
		);
end component;

component FTG is
PORT(
		clk : in std_logic;
		reset : in std_logic;
		fireAlarm : in std_logic;
		currFloor : in std_logic_vector(2 downto 0);
		currDir : in std_logic_vector(1 downto 0);
		req : in std_logic_vector(12 downto 0);
		newFloor : inout std_logic_vector(2 downto 0);
		newDir : inout std_logic_vector(1 downto 0)
		);
end component;

signal newFloor : std_logic_vector(2 downto 0):= "001";
signal newDir : std_logic_vector(1 downto 0) := "10";
signal tempDir : std_logic_vector(1 downto 0) := "10";
signal tempCurrFloor : std_logic_vector(2 downto 0) := "001";
signal tempCurrDir : std_logic_vector(1 downto 0) := "10";
signal motorcontrollerdone : std_logic := '1';
signal counter : std_logic_vector(1 downto 0) := "00";
signal newFloorStored : std_logic_vector(2 downto 0) := "001";
signal tempReq : std_logic_vector(12 downto 0):= "0000000000000";
signal tempFire : std_logic := '0';
signal flag :std_logic:='0';
signal state1 : std_logic := '0';
signal done1 : std_logic := '1';
signal state2 : std_logic := '0';
signal done2 : std_logic := '1';
signal state3 : std_logic := '0';
signal done3 : std_logic := '1';
signal state4 : std_logic := '0';
signal done4 : std_logic := '1';
signal state5 : std_logic := '0';
signal done5 : std_logic := '1';
--Architecture of main_controller begins
begin
	motor_contoller1 : motor_controller PORT MAP(
<<<<<<< HEAD
		  idle => tempDir(1),
		  dirBit => tempDir(0),
=======
		  idle => tempDir(0),
		  dirBit => tempDir(1),
>>>>>>> 58897351fcd82c9fb4ee81280f1b12ace67e0868
		  motorUp => motorUp,
		  motorDown => motorDown,
		  clk => clk,
		  reset => reset
	);
	door1 : Door_controller PORT MAP(
		  state => state1,
		  weight => weight,
		  done => done1,
		  clk => clk,
		  reset=> reset
	);
	door2 : Door_controller PORT MAP(
		  state => state2,
		  weight => weight,
		  done => done2,
		  clk => clk,
		  reset=> reset
	);
	door3 : Door_controller PORT MAP(
		  state => state3,
		  weight => weight,
		  done => done3,
		  clk => clk,
		  reset=> reset
	);
	door4 : Door_controller PORT MAP(
		  state => state4,
		  weight => weight,
		  done => done4,
		  clk => clk,
		  reset=> reset
	);
	door5 : Door_controller PORT MAP(
		  state => state5,
		  weight => weight,
		  done => done5,
		  clk => clk,
		  reset=> reset
	);
	Memory1 : Memory PORT MAP(
			clk=> clk,
			reset=>reset,
			energy=>energy,
			weight=> weight,
			curr_floor=>tempCurrFloor
	);
	FTG1 : FTG PORT MAP (
			clk=>clk,
			reset=>reset,
			fireAlarm => fireAlarm,
			currFloor=> tempCurrFloor,
			currDir=> tempCurrDir,
<<<<<<< HEAD
			req => tempReq,
=======
			req => req,
>>>>>>> 58897351fcd82c9fb4ee81280f1b12ace67e0868
			newFloor=>newFloor,
			newDir=>newDir
	);
	
<<<<<<< HEAD
	tempReq_Update : process(clk,reset, req, newFloorStored,tempCurrFloor, tempFire) 
	variable i : integer := 0;
	begin
		if (reset = '1') then
			tempReq <= "0000000000000";
		elsif (tempFire = '1') then
			tempReq <= "0000000000000";
		elsif (clk' event and clk = '1') then
			for i in 0 to 12 loop
				if (req(i) = '1' and tempReq(i) = '0') then
					tempReq(i) <= '1';
				end if;
			end loop;
			
			if (tempCurrFloor = newFloorStored) then
				if (tempCurrFloor = "001") then
					tempReq(0) <= '0';
					tempReq(5) <= '0';
				elsif (tempCurrFloor = "010") then
					tempReq(1) <= '0';
					tempReq(6) <= '0';
					tempReq(7) <= '0';
				elsif (tempCurrFloor = "011") then
					tempReq(2) <= '0';
					tempReq(8) <= '0';
					tempReq(9) <= '0';
				elsif (tempCurrFloor = "100") then
					tempReq(3) <= '0';
					tempReq(10) <= '0';
					tempReq(11) <= '0';
				elsif (tempCurrFloor = "101") then
					tempReq(4) <= '0';
					tempReq(12) <= '0';
				end if;
			end if;
		end if;
	end process tempReq_Update;
	
	currDir_currFloor_update: process (clk,reset,floor_sensor, newDir, newFloor, done1, done2, done3, done4, done5)
=======
	currDir_currFloor_update: process (clk,reset,floor_sensor, newDir, newFloor)
>>>>>>> 58897351fcd82c9fb4ee81280f1b12ace67e0868
	begin
		if reset='1' then
			tempCurrDir <= "10";
			currDir <= "10";
		elsif rising_edge(clk)then
<<<<<<< HEAD
			if(counter = "11") then
				flag <= '0';
			end if;
			if (done1 = '1' and done2 = '1' and done3='1' and done4='1' and done5='1' and flag = '0') then
				if newDir= "10" or newDir="11" then
					--lift does not have to change floor
					tempCurrDir <= "10";
					currDir <= "10";
					tempDir<="10";
					if tempcurrFloor = newFloor then
						--tempDir<="10";
						newFloorStored <= newFloor;
						motorcontrollerdone <= '1';
					end if;
				elsif newDir="00" then
					tempCurrDir <= "00";
					currDir <= "00";
					--lift has to go down (here lift cannot be currently on the 1st floor )
					if tempCurrFloor="010" then
						--if lift was currently at 2nd floor
						if (floor_sensor(0)='1' and floor_sensor(1)='1') then
							--if the lift reaches the 1st floor, change the current direction to idle
							
							currFloor<= "001";
							tempCurrFloor <= "001";
							if (newFloor = "001") then
								tempDir<="10";
								flag<= '1';
								newFloorStored <= newFloor;
								motorcontrollerdone <= '1';
							end if;
						else 
							--else currDir is down, the motor controller keeps on going down
							tempDir<="00";
							motorcontrollerdone <= '0';
						end if;
					elsif tempCurrFloor="011" then
						if (floor_sensor(2)='1' and floor_sensor(3)='1') then
							
							tempCurrFloor <= "010";
							currFloor<= "010";
							if (newFloor = "010") then
								tempDir<="10";
								flag<= '1';
								newFloorStored <= newFloor;
								motorcontrollerdone <= '1';
							end if;
						else 
							tempDir<="00";
							motorcontrollerdone <= '0';
						end if;
					elsif tempCurrFloor="100" then
						if (floor_sensor(4)='1' and floor_sensor(5)='1') then
							
							tempCurrFloor <= "011";
							currFloor<= "011";
							if (newFloor = "011") then
								tempDir<="10";
								flag<= '1';
								newFloorStored <= newFloor;
								motorcontrollerdone <= '1';
							end if;
						else 
							tempDir<="00";
							motorcontrollerdone <= '0';
						end if;
					elsif tempCurrFloor="101" then
						if (floor_sensor(6)='1' and floor_sensor(7)='1') then
							
							tempCurrFloor <= "100";
							currFloor<= "100";
							if (newFloor = "100") then
								tempDir<="10";
								flag<= '1';
								newFloorStored <= newFloor;
								motorcontrollerdone <= '1';
							end if;
						else 
							tempDir<="00";
							motorcontrollerdone <= '0';
						end if;
					end if;
				elsif newDir="01" then
					tempCurrDir <= "01";
					currDir <= "01";
				--lift has to go up (here lift cannot be currently on the 5th floor )
					if tempCurrFloor="001" then
						--if lift was currently at 1st floor
						if (floor_sensor(3)='1' and floor_sensor(2)='1') then
							--if the lift reaches the 2nd floor, change the current direction to idle
							
							tempCurrFloor <= "010";
							currFloor<= "010";
							if (newFloor = "010") then
								tempDir<="10";
								flag<= '1';
								newFloorStored <= newFloor;
								motorcontrollerdone <= '1';
							end if;
						else 
							--else currDir is down, the motor controller keeps on going up
							tempDir<="01";
							motorcontrollerdone <= '0';
						end if;
					elsif tempCurrFloor="010" then
						if (floor_sensor(4)='1' and floor_sensor(5)='1') then
							
							tempCurrFloor <= "011";
							currFloor<= "011";
							if (newFloor = "011") then
								tempDir<="10";
								flag<= '1';
								newFloorStored <= newFloor;
								motorcontrollerdone <= '1';
							end if;
						else 
							tempDir<="01";
							motorcontrollerdone <= '0';
						end if;
					elsif tempCurrFloor="011" then
						if (floor_sensor(6)='1' and floor_sensor(7)='1') then
							
							tempCurrFloor <= "100";
							currFloor<= "100";
							if (newFloor = "100") then
								tempDir<="10";
								flag<= '1';
								newFloorStored <= newFloor;
								motorcontrollerdone <= '1';
							end if;
						else 
							tempDir<="01";
							motorcontrollerdone <= '0';
						end if;
					elsif tempCurrFloor="100" then
						if (floor_sensor(8)='1' and floor_sensor(9)='1') then
							
							tempCurrFloor <="101";
							currFloor<= "101";
							if (newFloor = "101") then
								tempDir<="10";
								flag<= '1';
								newFloorStored <= newFloor;
								motorcontrollerdone <= '1';
							end if;
						else 
							tempDir<="01";
							motorcontrollerdone <= '0';
						end if;
=======
			if newDir= "10" or newDir="11" then
				--lift does not have to change floor
				tempCurrDir <= "10";
				currDir <= "10";
				motorcontrollerdone <= '1';
			elsif newDir="00" then
				tempCurrDir <= "00";
				currDir <= "00";
				--lift has to go down (here lift cannot be currently on the 1st floor )
				if tempCurrFloor="010" then
					--if lift was currently at 2nd floor
					if (floor_sensor(0)='1' and floor_sensor(1)='1') then
						--if the lift reaches the 1st floor, change the current direction to idle
						tempDir<="10";
						currFloor<= "001";
						tempCurrFloor <= "001";
						motorcontrollerdone <= '1';
					else 
						--else currDir is down, the motor controller keeps on going down
						tempDir<="00";
						motorcontrollerdone <= '0';
					end if;
				elsif tempCurrFloor="011" then
					if (floor_sensor(2)='1' and floor_sensor(3)='1') then
						tempDir<="10";
						tempCurrFloor <= "010";
						currFloor<= "010";
						motorcontrollerdone <= '1';
					else 
						tempDir<="00";
						motorcontrollerdone <= '0';
					end if;
				elsif tempCurrFloor="100" then
					if (floor_sensor(4)='1' and floor_sensor(5)='1') then
						tempDir<="10";
						tempCurrFloor <= "011";
						currFloor<= "011";
						motorcontrollerdone <= '1';
					else 
						tempDir<="00";
						motorcontrollerdone <= '0';
					end if;
				elsif tempCurrFloor="101" then
					if (floor_sensor(6)='1' and floor_sensor(7)='1') then
						tempDir<="10";
						tempCurrFloor <= "100";
						currFloor<= "100";
						motorcontrollerdone <= '1';
					else 
						tempDir<="00";
						motorcontrollerdone <= '0';
					end if;
				end if;
			elsif newDir="01" then
				tempCurrDir <= "01";
				currDir <= "01";
			--lift has to go up (here lift cannot be currently on the 5th floor )
				if tempCurrFloor="001" then
					--if lift was currently at 1st floor
					if (floor_sensor(3)='1' and floor_sensor(2)='1') then
						--if the lift reaches the 2nd floor, change the current direction to idle
						tempDir<="10";
						tempCurrFloor <= "010";
						currFloor<= "010";
						motorcontrollerdone <= '1';
					else 
						--else currDir is down, the motor controller keeps on going up
						tempDir<="01";
						motorcontrollerdone <= '0';
					end if;
				elsif tempCurrFloor="010" then
					if (floor_sensor(4)='1' and floor_sensor(5)='1') then
						tempDir<="10";
						tempCurrFloor <= "011";
						currFloor<= "011";
						motorcontrollerdone <= '1';
					else 
						tempDir<="01";
						motorcontrollerdone <= '0';
					end if;
				elsif tempCurrFloor="011" then
					if (floor_sensor(6)='1' and floor_sensor(7)='1') then
						tempDir<="10";
						tempCurrFloor <= "100";
						currFloor<= "100";
						motorcontrollerdone <= '1';
					else 
						tempDir<="01";
						motorcontrollerdone <= '0';
					end if;
				elsif tempCurrFloor="100" then
					if (floor_sensor(8)='1' and floor_sensor(9)='1') then
						tempDir<="10";
						tempCurrFloor <="101";
						currFloor<= "101";
						motorcontrollerdone <= '1';
					else 
						tempDir<="01";
						motorcontrollerdone <= '0';
>>>>>>> 58897351fcd82c9fb4ee81280f1b12ace67e0868
					end if;
				end if;
			end if;
		if flag = '1' then
			if counter ="11" then
				counter <= "00";
			else
				counter <= counter +"01";
			end if;
		end if;
<<<<<<< HEAD
		end if;
=======
>>>>>>> 58897351fcd82c9fb4ee81280f1b12ace67e0868
		currFloor<=tempCurrFloor;
		currDir<=tempCurrDir;
	end process currDir_currFloor_update;	
	
<<<<<<< HEAD
	Dooropening : process (clk,reset,motorcontrollerdone) --removed tempCurrFloor from the sensitivity list here
=======
	Dooropening : process (clk,reset,motorcontrollerdone,tempCurrFloor)
>>>>>>> 58897351fcd82c9fb4ee81280f1b12ace67e0868
	begin
		if reset ='1' then
			state1<='0';
			state2<='0';
			state3<='0';
			state4<='0';
			state5<='0';
		elsif rising_edge(clk)then
			if motorcontrollerdone ='1' then
<<<<<<< HEAD
				if tempCurrFloor = newFloorStored then
=======
				if tempCurrFloor = newFloor then
>>>>>>> 58897351fcd82c9fb4ee81280f1b12ace67e0868
					--door needs to openend
					if tempCurrFloor = "001" then
						--door on 1st floor need to be opened
						state1 <='1';
						state2 <='0';
						state3 <='0';
						state4 <='0';
						state5 <='0';
					elsif tempCurrFloor = "010" then
						--door on 2nd floor need to be opened
						state1 <='0';
						state2 <='1';
						state3 <='0';
						state4 <='0';
						state5 <='0';
					elsif tempCurrFloor = "011" then
						--door on 3rd floor need to be opened
						state1 <='0';
						state2 <='0';
						state3 <='1';
						state4 <='0';
						state5 <='0';
					elsif tempCurrFloor = "100" then
						--door on 4th floor need to be opened
						state1 <='0';
						state2 <='0';
						state3 <='0';
						state4 <='1';
						state5 <='0';
					elsif tempCurrFloor = "101" then
						--door on 5th floor need to be opened
						state1 <='0';
						state2 <='0';
						state3 <='0';
						state4 <='0';
						state5 <='1';
					end if;
				else 
					--door need not be openend, so setting all the states to 0
					-- all the dones will be = 1 from the door_controller module process
					state1 <='0';
					state2 <='0';
					state3 <='0';
					state4 <='0';
					state5 <='0';
				end if;
			end if;
		end if;
	end process Dooropening;
<<<<<<< HEAD
	
--	Counter_proc : process(flag, clk)
	---begin
		--if (clk' event and clk = '1') then 
			--if flag = '1' then
			--	if counter ="11" then
				--	counter <= "00";
			--else 
					--counter <= counter +"01";
				--end if;
			--end if;
		--end if;
	--end process Counter_proc;	
			
=======
>>>>>>> 58897351fcd82c9fb4ee81280f1b12ace67e0868
end Behavioral;
