--Bloque Mux 2 a 1 7 Bits
--Grupo: Ricardo Romero, Gabriel Sancho
library ieee;
use ieee.std_logic_1164.all;

entity Mux_2to1_7Bits is
generic (n: integer := 7);
port( Sel: in std_logic;
		I0,I1: in std_logic_vector (n-1 downto 0);
		Q: out std_logic_vector (n-1 downto 0));
end Mux_2to1_7Bits;

architecture solucion of Mux_2to1_7Bits is
begin
	process(Sel)
	begin
		case Sel is
			when '0'=>Q<=I0;
			when '1'=>Q<=I1;
		end case;
	end process;
end solucion;