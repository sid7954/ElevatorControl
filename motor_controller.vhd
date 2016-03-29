----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:34 03/24/2016 
-- Design Name: 
-- Module Name:    motor_controll - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity motor_controller is
    Port ( idle : in  STD_LOGIC;
           dirBit : in  STD_LOGIC;
           motorUp : out  STD_LOGIC;
           motorDown : out  STD_LOGIC;
		     clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end motor_controller;

architecture Behavioral of motor_controller is

	begin
	process(clk,reset)
	begin 
		if reset = '1' then
			motorUp <= '0';
			motorDown <= '0';
		elsif clk'event and clk='1' then
			if idle = '1' then
				motorUp <= '0';
				motorDown <= '0';
			elsif dirBit = '1' then
				motorUp <= '1';
				motorDown <= '0';
			elsif dirBit = '0' then
				motorUp <= '0';
				motorDown <= '1';
			end if;
		end if;
	end process;
end Behavioral;

