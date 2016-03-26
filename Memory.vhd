----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:26 03/23/2016 
-- Design Name: 
-- Module Name:    Memory - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory is
PORT(
		clk : IN STD_LOGIC;
		curr_floor : IN STD_LOGIC_VECTOR ( 2 downto 0 );
		weight: IN STD_LOGIC_VECTOR ( 8 downto 0 );
		reset : IN STD_LOGIC;
		energy : OUT STD_LOGIC_VECTOR ( 9 downto 0 )
		);
end Memory;

architecture Behavioral of Memory is

COMPONENT FIFO
			PORT (
			clk : IN STD_LOGIC;
			 rst : IN STD_LOGIC;
			 din : IN STD_LOGIC_VECTOR ( 31 downto 0 );
			 wr_en : IN STD_LOGIC;
			 rd_en : IN STD_LOGIC;
			 dout : OUT STD_LOGIC_VECTOR ( 31 downto 0 );
			 full : OUT STD_LOGIC;
			 empty : OUT STD_LOGIC
		  );
END COMPONENT;

signal write_enable : STD_LOGIC;
signal prev_floor : STD_LOGIC_VECTOR ( 2 downto 0 );
signal temp_energy : STD_LOGIC_VECTOR ( 9 downto 0 );
signal write_data : STD_LOGIC_VECTOR ( 31 downto 0 );
signal rd_en : STD_LOGIC;
signal dout : STD_LOGIC_VECTOR ( 31 downto 0 );

begin
	
	Memory_FiFo : FIFO
		PORT MAP(
			clk => clk,
			rst => reset,
			din => write_data,
			wr_en => write_enable,
			rd_en => rd_en,
			dout => dout
		);
	
	process(clk)
	begin
		if clk' event and clk = '1' then
			if reset = '0' then
				
				if write_enable = '1' then
					write_enable <= '0';
					energy <= temp_energy;
				end if;
				
				
				if curr_floor' event then
					
					if prev_floor < curr_floor then
						temp_energy <= temp_energy + "0000000011";
					else
						temp_energy <= temp_energy + "0000000010";
					end if;
				
					write_enable <= '1';
					write_data <= curr_floor & weight;
					
				end if;
			else
				write_enable <= '0';
				temp_energy <= "0000000000";
				energy <= "0000000000";
			end if;
			
			
			prev_floor <= curr_floor;
		end if;
	end process;
end Behavioral;
