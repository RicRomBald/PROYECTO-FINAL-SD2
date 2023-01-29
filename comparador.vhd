--Bloque Comparador, Obtenido GitHub VAsanza
--Grupo: Ricardo Romero, Gabriel Sancho
library ieee;
use ieee.std_logic_1164.all;

entity Comparador is
	generic (n: integer := 7);
	port ( A,B: in std_logic_vector(n-1 downto 0);
		 AMayorB,AIgualB,AMenorB: out std_logic);
end Comparador;

architecture solucion of Comparador is
begin
	AMayorB<='1' when (A>B) else '0';
	AIgualB<='1' when (A=B) else '0';
	AMenorB<='1' when (A<B) else '0';
end Solucion;
