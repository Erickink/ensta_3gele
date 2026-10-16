------------------------------------------------
--- From Jean-Christophe Le Lann test_bench file
------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity test_bench is
end entity;

architecture sim of test_bench is
	constant CLOCK_PERIOD: time := 10 ns;
	signal clk : std_logic := '0';
	signal resetn : std_logic := '0';
	signal running: boolean := true;

	procedure wait_cycles(n : natural) is
	begin
		for i in 1 to n loop
			wait until rising_edge(clk);
		end loop;
	end procedure;

   	signal a: std_logic := '0';
	signal b: std_logic := '0';
	signal sum: std_logic;
	signal cout: std_logic;
begin
	resetn <= '0', '1' after 420 ns;
	clk <= not(clk) after CLOCK_PERIOD/2 when running else clk;

	dut: entity work.half_adder(rtl)
		port map(
			a => a,
			b => b,
			sum => sum,
			cout => cout
		);

	stimulus: process
	begin
		a <= '0'; 
		b <= '0';
		report "running testbench for half_adder(rtl)";
		report "waiting for asynchronous reset";
		wait until resetn = '1';
		wait_cycles(10);
		report "applying stimuli...";

		a <= '0'; 
		b <= '0';
		wait until rising_edge(clk);
		a <= '0'; 
		b <= '1';
		wait until rising_edge(clk);
		a <= '1'; 
		b <= '0';
		wait until rising_edge(clk);
		a <= '1'; 
		b <= '1';
		wait until rising_edge(clk);
		
		wait_cycles(100);
		report "end of simulation";
		running <= false;
		wait;
	end process;
end architecture;