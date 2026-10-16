library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		a, b: in std_logic;
		cin: in std_logic;
		sum, cout: out std_logic
	);
end entity;

architecture rtl of full_adder is
	signal s_0, cout_0, cout_1: std_logic;
begin
	ha_0: entity work.half_adder(rtl)
		port map(
			a => a,
			b => b,
			sum => s_0,
			cout => cout_0
		);
	ha_1: entity work.half_adder(rtl)
		port map(
			a => cin,
			b => s_0,
			sum => sum,
			cout => cout_1
		);
	cout <= cout_0 or cout_1;
end architecture;
