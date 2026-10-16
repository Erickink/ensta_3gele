------------------------------------------------
--- From Jean-Christophe Le Lann test_bench file
------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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

   	signal a: std_logic_vector(3 downto 0) := (others => '0');
	signal b: std_logic_vector(3 downto 0) := (others => '0');
	signal sum: std_logic_vector(3 downto 0);
	signal cout: std_logic;
begin
	resetn <= '0', '1' after 420 ns;
	clk <= not(clk) after CLOCK_PERIOD/2 when running else clk;

	dut: entity work.adder_4bit(rtl)
		port map(
			a => a,
			b => b,
			sum => sum,
			cout => cout
		);
	
	stimulus: process
	variable expected_sum: signed(3 downto 0);
    variable nb_errors: natural := 0;
	function vector_to_string(v: std_logic_vector(3 downto 0)) return String is
	begin
		return integer'image(to_integer(unsigned(v)));
	end;
	begin
		a <= (others => '0'); 
		b <= (others => '0');
		report "running testbench for adder_8bit(rtl)";
		report "waiting for asynchronous reset";
		wait until resetn = '1';
		wait_cycles(10);
		report "applying stimuli...";
		for i in 0 to 16 loop
			for j in 0 to 16 loop
				a <= std_logic_vector(to_unsigned(i, 4)); --bitwise
				b <= std_logic_vector(to_unsigned(j, 4)); --bitwise
				wait until rising_edge(clk);
				expected_sum := signed(a) + signed(b);
				if expected_sum /= signed(sum) then
					report "ERROR for sum : " & vector_to_string(a) & "+" & vector_to_string(b);
					report "expecting " & vector_to_string(std_logic_vector(expected_sum)) & ". Got " & vector_to_string(sum);
					nb_errors := nb_errors + 1;
				else
					report "OK for sum : " & vector_to_string(a) & "+" & vector_to_string(b);
				end if;
			end loop;
		end loop;
		
		wait_cycles(100);
		a <= std_logic_vector(to_signed(4, 4));
		b <= std_logic_vector(to_signed(-7, 4));
		wait_cycles(100);
		report "end of simulation";
		report "number of errors detected : " & integer'image(nb_errors);
		running <= false;
		wait;
	end process;
end architecture;