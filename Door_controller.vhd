----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:22 03/24/2016 
-- Design Name: 
-- Module Name:    Door_control - Behavioral 
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
--USE IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Door_controller is
    Port ( state : in  STD_LOGIC;
           weight : in  STD_LOGIC_VECTOR(8 downto 0);
           done : out  STD_LOGIC;
		   clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end Door_controller;

architecture Behavioral of Door_controller is
signal is_open : std_logic:='0';
signal op_counter : std_logic_vector(8 downto 0) := "000000000";
begin
	process(clk,reset)
	begin
	if clk'event and clk='1' then
		if reset = '1' then
			is_open <= '0'	;
			op_counter <= "000000000";
			done<='1';
		end if ;
			if state = '1' and op_counter < "111111111" then
				op_counter <= op_counter + "000011111";
<<<<<<< HEAD
=======
				is_open <= '1';
>>>>>>> 58897351fcd82c9fb4ee81280f1b12ace67e0868
				done <= '0';
				is_open <= '1';
			elsif state = '1' and op_counter >= "111111111" then
				is_open <= '0';
				done <= '1';
			elsif state = '0' then
				done <= '1';
				
			end if;
	end if;	
	end process;
end Behavioral;
