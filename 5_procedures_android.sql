-- =====================================================================
-- PROCEDIMIENTOS ANDROID
-- 
-- Archivo : procedures_android.sql
-- Objetivo: Facilitar las consultas
-- Base de datos: MySQL
-- =====================================================================

/*======================
-- PROCEDURES Y CONSULTAS PARA ANDROID
  ====================*/


/*======================
-- CONSULTA 1
-- Log in de Alumno
-- consulta de usuario y contraseña de la misma fila que sean iguales a un par dado
  ====================*/
DROP PROCEDURE IF EXISTS p_login;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_login`(
	IN alu_codigo VARCHAR(8),
    IN alu_contra VARCHAR(30)
)
BEGIN
	SELECT *
	FROM Alumno
	WHERE CODIGO_UNIVERSITARIO=alu_codigo AND contrasenia=SUBSTRING(sha1(alu_CONTRA),1,30);
END$$
DELIMITER ;

-- call p_login('14200180','letmein1234');


/*======================
-- CONSULTA 2
-- verificar si hay tickets disponibles y en que turnos y piso
-- Tener en cuenta existe un horario para generar ticket:
-- 		* 08:00 - 13:59 : Para el almuerzo
-- 		* 14:00 - 17:59 : Para la cena
  ====================*/
DROP PROCEDURE IF EXISTS p_verificar_ticket;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_verificar_ticket`()
BEGIN
	declare almuerzo_inicio time;
    declare almuerzo_fin time;
    declare cena_inicio time;
    declare cena_fin time;
    declare tiempo_actual time;
    declare fecha_actual date;
	set almuerzo_inicio ='08:00:00';
    set almuerzo_fin ='13:59:00';
    set cena_inicio = '14:00:00';
    set cena_fin = '17:59:00';
    set tiempo_actual=curtime();
	set fecha_actual=curdate();
	
    IF almuerzo_inicio <= tiempo_actual AND  tiempo_actual <=almuerzo_fin THEN
		SELECT t.numero as Turno,c.nivel as Nivel,c.raciones as 'Cantidad disponible'
		 FROM Contador C
			JOIN Turno T ON (c.idTurno=t.idTurno)
            JOIN Programacion P ON (c.idProgramacion=p.idProgramacion)
		 WHERE p.fecha=fecha_actual AND p.idComida=(SELECT idComida FROM COMIDA WHERE DETALLE='Almuerzo');
	else
		if cena_inicio <=tiempo_actual AND  tiempo_actual <=cena_fin THEN
			SELECT t.numero as Turno,c.nivel as Nivel,c.raciones as 'Cantidad disponible'
			 FROM Contador C
				JOIN Turno T ON (c.idTurno=t.idTurno)
				JOIN Programacion P ON (c.idProgramacion=p.idProgramacion)
			 WHERE p.fecha=fecha_actual AND p.idComida=(SELECT idComida FROM COMIDA WHERE DETALLE='Cena');
			 
		else
			SIGNAL sqlstate '45001' set message_text = "Fuera de horario. Informacion no disponible en este momento";
		END IF;
    end if;
END$$
DELIMITER ;

-- call p_verificar_ticket();


/*======================
-- CONSULTA 3 : es la misma que la 1era
  ====================*/

/*======================
-- CONSULTA 4
-- ver la programacion de menu de la semana
--  con su desayuno almuerzo y cena
  ====================*/
DROP FUNCTION IF EXISTS f_retornar_fecha;
DELIMITER $$
USE `comedor`$$
CREATE FUNCTION `f_retornar_fecha` (dia INT)
RETURNS varchar(10)
BEGIN
    declare mifecha date;
    declare i int;
    set mifecha=curdate();
    set i=0;
	while i < dia do -- (0 = Monday, 1 = Tuesday, … 6 = Sunday)weekday(x)
		set mifecha=DATE_SUB(mifecha,INTERVAL 1 DAY);
        set i=i+1;
	end while;
	RETURN str_to_date(mifecha,'%Y-%m-%d');
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS p_programacion_semanal;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_programacion_semanal`(
	e_dia varchar(9),
    e_comida varchar(8)
)BEGIN
	declare f date;
    declare dia_nro INT;
    declare comida_nro INT;
    CASE e_dia
	 WHEN 'Lunes' 		THEN SET dia_nro=6;
     WHEN 'Martes' 		THEN SET dia_nro=5;
     WHEN 'Miercoles' 	THEN SET dia_nro=4;
     WHEN 'Jueves' 		THEN SET dia_nro=3;
     WHEN 'Viernes' 	THEN SET dia_nro=2;
     WHEN 'Sabado' 		THEN SET dia_nro=1;
     WHEN 'Domingo' 	THEN SET dia_nro=0;
     ELSE
        BEGIN
			SIGNAL sqlstate '45001' set message_text = "Error de sintaxis, usar 'Lunes','Martes',etc";
        END;
    END CASE;
    CASE e_comida
	 WHEN 'Desayuno' THEN SET comida_nro=1;
     WHEN 'Almuerzo' THEN SET comida_nro=2;
     WHEN 'Cena' 	 THEN SET comida_nro=3;
     ELSE
        BEGIN
			SIGNAL sqlstate '45001' set message_text = "Error de sintaxis, usar 'Desayuno','Almuerzo',etc";
        END;
    END CASE;
    set f=DATE_FORMAT(f_retornar_fecha(dia_nro), '%Y-%m-%d');
	select l.detalle,l.proteinas,l.energia,l.hierro
    from programacionplato o 
		JOIN plato l ON (o.idPlato=l.idPlato)
        JOIN programacion p ON (o.idProgramacion=p.idProgramacion)
    where p.fecha=f AND p.idComida=comida_nro
    ORDER BY p.fecha;
END$$
DELIMITER ;

call p_programacion_semanal('Domingo','Desayuno');
call p_programacion_semanal('Lunes','Almuerzo');
call p_programacion_semanal('Lunes','Cena');




/*======================
-- CONSULTA 5
-- Primero usar la CONSULTA 2 y luego SEPARAR TICKET
  ====================*/
DROP PROCEDURE IF EXISTS p_insert_ticket;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insert_ticket`(
	IN t_idAlumno INT,
    IN t_idProgramacion VARCHAR(30),
    IN t_idTurno VARCHAR(8),
    IN t_nivel VARCHAR(30)
)BEGIN
	INSERT INTO Ticket (idAlumno,idProgramacion,idTurno,nivel)
		VALUES (t_idAlumno,t_idProgramacion,t_idTurno,t_nivel);
	-- el numero de ticket se hace automaticamente
    -- mediante el trigger 't_hay_ticket'
END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS p_activar_alumno;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_activar_alumno`(
	IN	alu_dni                   VARCHAR(8),
    IN	alu_codigo_universitario  VARCHAR(8),
    IN	alu_contrasenia           VARCHAR(30)
)
BEGIN
	DECLARE id INT;
    set id= -1;
    set id=(SELECT idAlumno FROM ALUMNO WHERE DNI=alu_dni AND codigo_universitario=alu_codigo_universitario);
    IF(id=-1) THEN
		SIGNAL sqlstate '45001' set message_text = "DNI y codigo no coinciden o alumno no se encuentra registrado";
	else
		UPDATE Alumno SET          
		contrasenia	= SUBSTRING(sha1(alu_contrasenia),1,30)
		WHERE idAlumno=id;
    end if;
    
END$$
DELIMITER ;


