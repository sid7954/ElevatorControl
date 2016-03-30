----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:03:09 03/22/2016 
-- Design Name: 
-- Module Name:    FTG - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FTG is
	port(
		clk : in std_logic;
		reset : in std_logic;
		fireAlarm : in std_logic;
		currFloor : in std_logic_vector(2 downto 0);
		currDir : in std_logic_vector(1 downto 0);
		req : in std_logic_vector(12 downto 0);
		newFloor : inout std_logic_vector(2 downto 0);
		newDir : inout std_logic_vector(1 downto 0)
		);
end FTG;

--currDir values: 00 for idle, 01 for up, 10 for down
--currFloor values : Binary conversion for each ddecimal value (1 to 5)
--req[13] : each bit of req logic vector corresponds to req[i] 0<=i<=12
--clk : Every combinational computation occurs at the rising edge of a clock cycle
--At every clock cycle, newFloor, newDir are computed and sent back to Main Cont.
--Convention for req: req(0,1,2,3,4): in_lift req for the 5 floors
--req(5) : floor 1, req(6, 7): up, down of floor 2, .....  
architecture Behavioral of FTG is
signal max_flr : std_logic_vector(2 downto 0) := "000";
signal tmp_newflr : std_logic_vector(2 downto 0) := "000";
signal min_flr : std_logic_vector(2 downto 0) := "000";
signal tmpd_newflr : std_logic_vector(2 downto 0) := "000";
begin
 
FindNextValues : process(clk, reset, fireAlarm) 
	variable i : integer := conv_integer(unsigned(currFloor));
	variable j : integer := 0;
	variable flag : std_logic := '0';
begin
	if (clk' event and clk = '1') then
		-- FireAlarm High 
		-- Should the req array be set back to 0? We are aborting, therefore
		-- Fire Alarm must be high for atleast one clock cycle
		-- If the Alarm remains high for mulitple clock cycles, 
		-- we said, that only the FTG module can change the currDir value, but after fire Alarm we need to abort
		-- How do we do this?
		-- How do we ensure that the lift's variables are not assigned out of range?
		--No pains in this block for re-assignment of nF and nD
		tmp_newflr <= "000";
		max_flr <= currFloor;
		if (fireAlarm = '1') then
			if (currDir = "00") then
				newDir <= "00";
				newFloor <= currFloor - 1;
			else 
				newFloor <= currFloor;
				if (currDir = "10") then
					newDir <= "10";
				else
					newDir <= "01";
				end if;
			end if;
		end if;
		
		-- FireAlarm Low
		if (fireAlarm = '0') then
			-- Check for 5 and 0 separately
			if (currDir = "01") then
				for i in 1 to 5 loop
					if (i < conv_integer(currFloor+1)) then
						next when true;
					end if;
					if (i=5) then
						if (req(4) = '1') then
							tmp_newFlr <= "101";
							newDir <= currDir;
							exit;
						else
							if (req(12) = '1') then
								max_flr <="101";
							end if;
						end if;
					else
						if (req(i-1) = '1' or req(2 + 2*i) = '1') then
							tmp_newFlr <= conv_std_logic_vector(i, tmp_newFlr' length);
							newDir <= currDir;
							exit;
						else 
							if (req(3 + 2*i) = '1')  then
								if (conv_integer(max_flr) < i) then
									max_flr <= conv_std_logic_vector(i, max_flr' length);
								end if;
							end if;
						end if;
					end if;
				end loop;
				
				if ((max_flr < currFloor or max_flr = currFloor) and tmp_newFlr = "000") then
					newFloor <= currFloor;
					for j in 5 downto 1 loop
						if (j > conv_integer(currFloor-1)) then
							next when true;
						else
						if (j=1) then
							if (req(5) = '1' or req(0) = '1') then
								newDir <= "00";
								exit;
							end if;
						end if;
						if ( j/=1 and ((3+2*j)<13) and (req(2+2*j) = '1' or req(j-1) = '1' or req(3+2*j) = '1')) then
							newDir <= "00";
							exit; -- exit the process here;
						end if;
						newDir <= "10";	--Default assignment
						end if;
					end loop;
				end if;
				
				if (tmp_newFlr = "000" and (max_flr > currFloor)) then
					newFloor <= max_flr;
					newDir <= currDir;
					-- Write something to exit from the process here
				else
					if (tmp_newFlr /= "000") then
						newFloor <= tmp_newFlr;
					end if;
					--exit;	--trying to find some command to return from the process itself
				end if;
			end if;
			
			--- If curr Direction is down
			min_flr <= currFloor;
			tmpd_newFlr <= "000";
			if (currDir = "00") then
				for i in 5 downto 1 loop
					if (i > conv_integer(currFloor-1)) then
						next when true;
					end if;	
					if (i=1) then
						if (req(0) = '1') then
							tmpd_newFlr <= "001";
							newDir <= currDir;
							exit;
						else
							if (req(5) = '1') then
								min_flr <="101";
							end if;
						end if;
					else
						if ((3+2*i)<13 and (req(i-1) = '1' or req(3 + 2*i) = '1')) then
							tmpd_newFlr <= conv_std_logic_vector(i, tmp_newFlr' length);
							newDir <= currDir;
							exit;
						else 
							if (req(2 + 2*i) = '1')  then
								if (conv_integer(min_flr) > i) then
									min_flr <= conv_std_logic_vector(i, min_flr' length);
								end if;
							end if;
						end if;
					end if;
				end loop;
				
				if ((min_flr > currFloor or min_flr = currFloor) and tmpd_newFlr = "000") then
					newFloor <= currFloor;
					for j in 1 to 5 loop
						if ( j < conv_integer(currFloor+1)) then
							next when true;
						end if;
						if (j=5) then
							if (req(4) = '1' or req(12) = '1') then
								newDir <= "01";
								exit;
							end if;
						end if;
						if ( j/=5 and (req(2+2*j) = '1' or req(j-1) = '1' or req(3+2*j) = '1')) then
							newDir <= "01";
							exit; -- exit the process here;
						end if;
						newDir <= "10";	--Default assignment
					end loop;
				end if;
				
				if (tmpd_newFlr = "000" and (min_flr < currFloor)) then
					newFloor <= min_flr;
					newDir <= currDir;
					-- Write something to exit from the process here
				else
					if (tmpd_newFlr /= "000") then
						newFloor <= tmpd_newFlr;
					end if;
					--exit;	--trying to find some command to return from the process itself
				end if;	
			end if;
			
			if (currDir  = "10") then
				--Check in floors below for a high request
				for i in 1 to 5 loop
					if ( i > conv_integer(currFloor-1)) then
						next when true;
					end if;	
					if (i = 1 and (req(0) = '1' or req(5) = '1')) then
						newFloor <= "001";
						newDir <= "00";
						flag := '1';
						exit;
					else
						if (i/=1 and (3+2*i)<13 and (req(i-1) = '1' or req(2+2*i) = '1' or req(3+2*i) = '1')) then
							newFloor <= conv_std_logic_vector(i, newFloor'length);
							newDir <= "00";
							flag := '1';
							exit;
						end if;
					end if;
				end loop;
				
				-- Check in floors above for a high request
				if (flag = '0') then
				for i in 1 to 5 loop
					if ( i < conv_integer(currFloor+1)) then
						next when true;
					end if;
					if (i = 5 and (req(4) = '1' or req(12) = '1')) then
						newFloor <= "101";
						newDir <= "01";
						exit;
					else
						if (i/=5 and (req(i-1) = '1' or req(2+2*i) = '1' or req(3+2*i) = '1')) then
							newFloor <= conv_std_logic_vector(i, newFloor'length);
							newDir <= "01";
							exit;
						end if;
					end if;
					newFloor <= currFloor;
					newDir <= "10";
				end loop;	
				end if;
				--it was the same floor (no requests high)
								
			end if;
		end if;
	end if;	
end process FindNextValues;

end Behavioral;

