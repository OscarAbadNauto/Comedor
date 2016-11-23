-- ========================================
-- Triggers necesarios para comenzar el proceso
-- ========================================



-- ========================================
-- Ingresar los Contadores de una Programacion
-- al insertar una programación automaticamente
-- ========================================
DROP TRIGGER IF EXISTS t_insert_contadores;
delimiter //
create trigger t_insert_contadores after insert on programacion
for each row 
begin
 declare x int;
 declare y int;
 declare turnos int;
 declare niveles int;
 if new.idComida<> (select idComida from Comida where detalle='Desayuno') then
	 set turnos = (SELECT COUNT(*)
					FROM TURNO
					WHERE idComida=new.idComida);
	 set niveles = (select count(n.nivel)
					from COMIDANIVEL n join comida c ON (n.idComida=c.idComida)
					where c.idComida=new.idComida
					group by c.idComida);
	 set x = 1 ;
	 while x <= niveles do
		 
		set y = 1 ;
		 while y <= turnos do
			insert into contador (idProgramacion,idTurno,nivel,raciones)
				values (new.idProgramacion,y,x,(SELECT raciones
						   FROM comida
						   WHERE idComida=new.idComida)/(turnos*niveles));
			
			set y=y+1;
		 end while;
		 
		 set x=x+1;
	 end while ;
 end if;
end;//
delimiter ;





