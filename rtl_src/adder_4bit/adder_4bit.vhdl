library ieee;
use ieee.std_logic_1164.all;

entity adder_4bit is
	port(
		a, b: in std_logic_vector(3 downto 0);
		sum: out std_logic_vector(3 downto 0);
		cout: out std_logic
	);
end entity;

architecture rtl of adder_4bit is
	signal carry: std_logic_vector(3 downto 0);
begin
	fa_0: entity work.full_adder(rtl)
		port map(
			a => a(0),
			b => b(0),
			cin => '0',
			sum => sum(0),
			cout => carry(0)
		);
	gen_fa: for i in 1 to 3 generate
		fa: entity work.full_adder(rtl)
			port map(
				a => a(i),
				b => b(i),
				cin => carry(i-1),
				sum => sum(i),
				cout => carry(i)
			);
	end generate;
	cout <= carry(3);
end architecture;
