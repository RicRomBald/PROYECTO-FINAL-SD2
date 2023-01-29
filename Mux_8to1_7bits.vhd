--Bloque Mux 8 a 1 7 Bits
--Grupo: Ricardo Romero, Gabriel Sancho
library ieee;
use ieee.std_logic_1164.all;

entity Mux_8to1_7bits is
port( Sel: in std_logic_vector(2 downto 0);
		I0,I1,I2,I3,I4,I5,I6,I7: in std_logic_vector (6 downto 0);
		Q: out std_logic_vector (6 downto 0));
end Mux_8to1_7bits;

architecture solucion of Mux_8to1_7bits is
begin
	process(Sel)
	begin
		case Sel is
			when "000"=> Q<=I0;
			when "001"=> Q<=I1;
			when "010"=> Q<=I2;
			when "011"=> Q<=I3;
			when "100"=> Q<=I4;
			when "101"=> Q<=I5;
			when "110"=> Q<=I6;
			when "111"=> Q<=I7;
		end case;
	end process;
end solucion;