--Bloque Restador de 6Bits
--Grupo: Ricardo Romero, Gabriel Sancho
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

 entity Restador6bits is
 port (A: in std_logic_vector(5 downto 0);
		 B: in std_logic_vector(5 downto 0); 
		 Salida: out std_logic_vector(5 downto 0));
end Restador6bits;

Architecture Solucion of Restador6bits is
Begin
	Salida<=(A-B);
end Solucion;