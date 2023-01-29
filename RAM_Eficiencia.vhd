--RAM - EFICIENCIA
--Grupo: Ricardo Romero, Gabriel Sancho
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RAM_Eficiencia is
port (Data: in std_logic_vector(6 downto 0);
		Address: in std_logic_vector (5 downto 0);
		R_W,Clock: in std_logic;
		Q: out std_logic_vector(6 downto 0));
end RAM_Eficiencia;

architecture solucion of RAM_Eficiencia is
type Ram_table is array (0 to 49) of std_logic_vector(6 downto 0);
signal Rammemory: Ram_table;
attribute ram_init_file: string;
attribute ram_init_file of Rammemory: signal is "Datos_Eficiencia.mif";
begin
	process(R_W,Clock,Address)
	begin
		if (Clock'event and Clock='1') then
			if R_W='1' then 
				rammemory(conv_integer(Address))<=Data;
			end if;
		end if;
	end process;
	Q<= Rammemory(conv_integer(Address));
end solucion;