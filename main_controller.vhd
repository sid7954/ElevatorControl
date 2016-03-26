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
USE IEEE.NUMERIC_STD.ALL;
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
		currFloor : inout std_logic_vector(2 downto 0);
		currDir : inout std_logic_vector(1 downto 0);
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
		newFloor : out std_logic_vector(2 downto 0);
		newDir : out std_logic_vector(1 downto 0)
		);
end component;

signal newFloor : std_logic_vector(2 downto 0):= "000";
signal newDir : std_logic_vector(1 downto 0) := "00";
signal motorcontrollerdone : std_logic := '1';
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
		  idle => currDir(0),
		  dirBit => currDir(1),
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
			curr_floor=>currFloor
	);
	FTG1 : FTG PORT MAP (
			clk=>clk,
			reset=>reset,
			fireAlarm => fireAlarm,
			currFloor=> currFloor,
			currDir=> currDir,
			req => req,
			newFloor=>newFloor,
			newDir=>newDir
	);
	
	currDir_currFloor_update: process (clk,reset,floor_sensor, newDir)
	begin
		if reset='1' then
			currDir <= "00";
		elsif rising_edge(clk)then
			if newDir= "10" or newDir="11" then
				--lift does not have to change floor
				currDir <= "10";
				motorcontrollerdone <= '1';
			elsif newDir="00" then
				--lift has to go down (here lift cannot be currently on the 1st floor )
				if currFloor="010" then
					--if lift was currently at 2nd floor
					if (floor_sensor(0)='1' and floor_sensor(1)='1') then
						--if the lift reaches the 1st floor, change the current direction to idle
						currDir<="10";
						currFloor<= "001";
						motorcontrollerdone <= '1';
					else 
						--else currDir is down, the motor controller keeps on going down
						currDir<="00";
						motorcontrollerdone <= '0';
					end if;
				elsif currFloor="011" then
					if (floor_sensor(2)='1' and floor_sensor(3)='1') then
						currDir<="10";
						currFloor<= "010";
						motorcontrollerdone <= '1';
					else 
						currDir<="00";
						motorcontrollerdone <= '0';
					end if;
				elsif currFloor="100" then
					if (floor_sensor(4)='1' and floor_sensor(5)='1') then
						currDir<="10";
						currFloor<= "011";
						motorcontrollerdone <= '1';
					else 
						currDir<="00";
						motorcontrollerdone <= '0';
					end if;
				elsif currFloor="101" then
					if (floor_sensor(6)='1' and floor_sensor(7)='1') then
						currDir<="10";
						currFloor<= "100";
						motorcontrollerdone <= '1';
					else 
						currDir<="00";
						motorcontrollerdone <= '0';
					end if;
				end if;
			elsif newDir="01" then
			--lift has to go up (here lift cannot be currently on the 5th floor )
				if currFloor="001" then
					--if lift was currently at 1st floor
					if (floor_sensor(1)='1' and floor_sensor(2)='1') then
						--if the lift reaches the 2nd floor, change the current direction to idle
						currDir<="10";
						currFloor<= "010";
						motorcontrollerdone <= '1';
					else 
						--else currDir is down, the motor controller keeps on going up
						currDir<="01";
						motorcontrollerdone <= '0';
					end if;
				elsif currFloor="010" then
					if (floor_sensor(4)='1' and floor_sensor(5)='1') then
						currDir<="10";
						currFloor<= "011";
						motorcontrollerdone <= '1';
					else 
						currDir<="01";
						motorcontrollerdone <= '0';
					end if;
				elsif currFloor="011" then
					if (floor_sensor(6)='1' and floor_sensor(7)='1') then
						currDir<="10";
						currFloor<= "100";
						motorcontrollerdone <= '1';
					else 
						currDir<="01";
						motorcontrollerdone <= '0';
					end if;
				elsif currFloor="100" then
					if (floor_sensor(8)='1' and floor_sensor(9)='1') then
						currDir<="10";
						currFloor<= "101";
						motorcontrollerdone <= '1';
					else 
						currDir<="01";
						motorcontrollerdone <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;	
	
	Dooropening : process (clk,reset,motorcontrollerdone,currFloor)
	begin
		if reset ='1' then
			state1<='0';
			done1<='1';
			state2<='0';
			done2<='1';
			state3<='0';
			done3<='1';
			state4<='0';
			done4<='1';
			state5<='0';
			done5<='1';
		elsif rising_edge(clk)then
			if motorcontrollerdone ='1' then
				if currFloor = newFloor then
					--door needs to openend
					if currFloor = "001" then
						--door on 1st floor need to be opened
						state1 <='1';
						state2 <='0';
						state3 <='0';
						state4 <='0';
						state5 <='0';
					elsif currFloor = "010" then
						--door on 2nd floor need to be opened
						state1 <='0';
						state2 <='1';
						state3 <='0';
						state4 <='0';
						state5 <='0';
					elsif currFloor = "011" then
						--door on 3rd floor need to be opened
						state1 <='0';
						state2 <='0';
						state3 <='1';
						state4 <='0';
						state5 <='0';
					elsif currFloor = "100" then
						--door on 4th floor need to be opened
						state1 <='0';
						state2 <='0';
						state3 <='0';
						state4 <='1';
						state5 <='0';
					elsif currFloor = "101" then
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
	end process;
end Behavioral;
