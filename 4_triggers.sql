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





-- ========================================
--  No permitir que se generen tickets
-- si no hay raciones.
-- ========================================
DROP TRIGGER IF EXISTS t_hay_ticket;
delimiter //
create trigger t_hay_ticket before insert on ticket
for each row 
begin
 declare nro_raciones int;
 set nro_raciones = (select raciones
					 from contador
					 where idTurno=new.idTurno AND idProgramacion=new.idProgramacion AND nivel=new.nivel);
 IF nro_raciones <= 0 THEN
    SIGNAL sqlstate '45001' set message_text = "No hay tickets";
 else 
	set new.numero=(select contador
				from programacion
                where idProgramacion=new.idProgramacion);
 END IF;
 
end;//
delimiter ;




-- ========================================
-- Al generar un ticket, descontar en el Contador
--  respectivo y aumentar el contador de la programacion
-- ========================================
DROP TRIGGER IF EXISTS descontar_cont_aument_progra;

delimiter //
create trigger descontar_cont_aument_progra after insert on ticket
for each row 
begin
 UPDATE contador
	SET raciones=raciones-1
	WHERE idTurno=new.idTurno AND idProgramacion=new.idProgramacion AND nivel=new.nivel;
 UPDATE programacion
	SET contador=contador+1
	WHERE idProgramacion=new.idProgramacion;
 
end;//
delimiter ;




