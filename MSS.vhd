--MSS
--Grupo: Ricardo Romero, Gabriel Sancho
library ieee;
use ieee.std_logic_1164.all;

entity MSS is
	port(Clk,Resetn,Start,Limite_i,Intercambiar,Limite_j,Mostrar,jmax: in std_logic;
	     RorW,En_j,Ld_j,En_i,Ld_i,En_1,En_2,S0,S1,Result,Fin: out std_logic;
		  estados: out std_logic_vector(4 downto 0));
end MSS;

architecture solucion of MSS is
type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Too,Tp,Tq,Tr);
signal y: estado;
begin
	process(Clk, Resetn)
	begin
		if Resetn='0' then y<=Ta;
		elsif (Clk' event and Clk='1') then
			case y is
				when Ta=> if Start='1' then y<=Tb; else y<=Ta; end if;
				when Tb=> if Start='1' then y<=Tb; else y<=Tc; end if;
				when Tc=> y<=Td;
				when Td=> y<=Te;
				when Te=> y<=Tf;
				when Tf=> if Intercambiar='1' then y<=Tg; else y<=Ti; end if; 
				when Tg=> y<=Th;
				when Th=> y<=Ti;
				when Ti=> if Limite_j='1' then y<=Tk; else y<=Tj; end if;
				when Tj=> y<=Td;
				when Tk=> if Limite_i='1' then y<=Tm; else y<=Tl; end if;
				when Tl=> y<=Tc;
				when Tm=> if Mostrar='1' then y<=Tn; else y<=Tm; end if;
				when Tn=> if Mostrar='1' then y<=Tn; else y<=Too; end if;
				when Too=> if Mostrar='1' then y<=Tp; else y<=Too; end if;
				when Tp=> if Mostrar='1' then y<=Tp; else y<=Tq; end if;
				when Tq=> if jmax='1' then y<=Ta; else y<=Tr; end if;
				when Tr=> y<=Too;
				end case;
		end if;
	end process;
	
	process(y)
	begin
	RorW<='0';En_j<='0';Ld_j<='0';En_i<='0';Ld_i<='0';En_1<='0';En_2<='0';S0<='0';S1<='0';Result<='0';Fin<='0'; estados<="00000";
	case y is
			when Ta=> estados<="00001";
			when Tb=> estados<="00010";
			when Tc=> estados<="00011";En_j<='1';Ld_j<='1';
			when Td=> estados<="00100";En_1<='1';
			when Te=> estados<="00101";S0<='1'; En_2<='1';
			when Tf=> estados<="00110";
			when Tg=> estados<="00111";S1<='1'; RorW<='1';
			when Th=> estados<="01000";S0<='1'; RorW<='1';
			when Ti=> estados<="01001";
			when Tj=> estados<="01010";En_j<='1';
			when Tk=> estados<="01011";
			when Tl=> estados<="01100";En_i<='1';
			when Tm=> estados<="01101";Fin<='1'; En_i<='1'; Ld_i<='1'; En_j<='1'; Ld_j<='1';
			when Tn=> estados<="01110";Fin<='1';
			when Too=> estados<="01111";Result<='1';
			when Tp=> estados<="10000";Result<='1';
			when Tq=> estados<="10001";Result<='1';
			when Tr=> estados<="10010";En_j<='1'; Result<='1';
			when others=>
		end case;
	end process;
end solucion;