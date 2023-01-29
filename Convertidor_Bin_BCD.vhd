--Bloque Convertidor Binario a BCD, Obtenido GitHub VAsanza
--Grupo: Ricardo Romero, Gabriel Sancho
--8-bit Binary Data Decoder to BCD (Units, Tens and Hundreds)
--https://github.com/VHDL-Digital-Systems
--http://blog.espol.edu.ec/sistemasdigitalesfiec
--Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity Convertidor_Bin_BCD is
    port(
        num_bin: in  std_logic_vector(6 downto 0);
        decena,unidad: out STD_LOGIC_VECTOR(3 downto 0)); 
end Convertidor_Bin_BCD;

--Architecture
architecture solve of Convertidor_Bin_BCD is
	-- Signals,Constants,Variables,Components
	signal salida: std_logic_vector(19 downto 9);
	begin
    --Process #1
	proceso_bcd: process(num_bin)
	--Sequential programming
	variable z: std_logic_vector(19 downto 0);
		begin
		-- Inicialización de datos en cero.
		z := (others => '0');
		-- Se realizan los primeros tres corrimientos.
		z(9 downto 3) := num_bin;
		for i in 0 to 5 loop
			-- Unidades (4 bits).
			if z(12 downto 9) > 4 then
				z(12 downto 9) := z(12 downto 9) + 3;
			end if;
			-- Decenas (4 bits).
			if z(16 downto 13) > 4 then
				z(16 downto 13) := z(16 downto 13) + 3;
			end if;
			-- Centenas (3 bits).
			if z(19 downto 17) > 4 then
				z(19 downto 17) := z(19 downto 17) + 3;
			end if;
			-- Corrimiento a la izquierda.
			z(19 downto 1) := z(18 downto 0);
		end loop;
		-- Pasando datos de variable Z, correspondiente a BCD.
		salida <= z(19 downto 9);
		decena <= salida(16 downto 13);
		unidad <= salida(12 downto 9);
	end process;
	--Process #n...
end solve;