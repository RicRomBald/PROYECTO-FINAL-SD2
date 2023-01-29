--Bloque Registro de Sostenimiento
--Grupo: Ricardo Romero, Gabriel Sancho
library ieee;
use ieee.std_logic_1164.all;

entity Sostenimiento is
generic (n: integer := 10);
port (Data: in std_logic_vector(n-1 downto 0);
		En, Clock, Resetn: in std_logic;
		Q: out std_logic_vector(n-1 downto 0));
end Sostenimiento;

architecture solucion of Sostenimiento is
begin
	process(Resetn,Clock)
		begin
		if Resetn='0' then Q<=(others=>'0');
		elsif (clock'event and clock='1') then
			if En='1' then Q<=Data;
			end if;
		end  if;
	end process;
end solucion;