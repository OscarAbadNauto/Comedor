-- =====================================================================
-- VISTAS Y PROCEDIMIENTOS
-- 
-- Archivo : views_procedures
-- Objetivo: Facilitar las consultas
-- Base de datos: MySQL
-- Se tiene 4 partes
-- 		1.Vistas
-- 		2.Procedimientos para la web
-- 		3.Procedimientos para el android
-- 		4.Otros procedimientos
-- =====================================================================


/*======================
-- VISTAS
  ====================*/
CREATE VIEW ENTRADA AS
 SELECT * FROM PLATO WHERE TIPO='E';
CREATE VIEW Segundo AS
 SELECT * FROM PLATO WHERE TIPO='S';
CREATE VIEW Refresco AS
 SELECT * FROM PLATO WHERE TIPO='R';
CREATE VIEW BebidaCaliente AS
 SELECT * FROM PLATO WHERE TIPO='B';
CREATE VIEW Pan AS
 SELECT * FROM PLATO WHERE TIPO='P';

-- SELECT * FROM SEGUNDO WHERE DETALLE LIKE '%Arroz%';










/*======================
-- PROCEDURES PARA WEB
  ====================*/
  
/*======================
-- consulta (login) de administrador
  ====================*/
/*DROP PROCEDURE IF EXISTS p_login_admin;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_login_admin`(
	IN adm_usuario VARCHAR(40),
    IN adm_contra VARCHAR(40)
)
BEGIN
	SELECT *
 FROM administrador
 WHERE usuario=adm_usuario AND contrasenia=SUBSTRING(sha1(adm_contra),1,30);
END$$
DELIMITER ;

-- call p_login_admin('ROOT','ROOT');*/




/*======================
-- PROCEDURES Y CONSULTAS PARA ANDROID
  ====================*/


/*======================
-- CONSULTA 1
-- Log in de Alumno
-- consulta de usuario y contraseña de la misma fila que sean iguales a un par dado
  ====================*/
/*DROP PROCEDURE IF EXISTS p_login;
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

-- call p_login('14200180','letmein1234');*/


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
  -- funcion que nos ayuda
  -- retorna la fecha (en varchar(10)) del
  -- ultimo domingo que paso
DROP FUNCTION IF EXISTS p_hallar_domingo_floor;
DELIMITER $$
USE `comedor`$$
CREATE FUNCTION `p_hallar_domingo_floor` (hoy DATE)
RETURNS varchar(10)
BEGIN
	declare x date;
    set x=hoy;
	while DAYOFWEEK(x) > 1 do -- (1 = Sunday, 2 = Monday, …, 7 = Saturday)
		set x=DATE_SUB(x,INTERVAL 1 DAY);
	end while ;
	RETURN str_to_date(x,'%Y-%m-%d');
END$$
DELIMITER ;

-- select p_hallar_domingo_floor(curdate());

  -- funcion que nos ayuda
  -- retorna la fecha (en varchar(10)) del
  -- ultimo lunes que paso
DROP FUNCTION IF EXISTS p_hallar_lunes_floor;
DELIMITER $$
USE `comedor`$$
CREATE FUNCTION `p_hallar_lunes_floor` (hoy DATE)
RETURNS varchar(10)
BEGIN
	declare x date;
    set x=hoy;
	while weekday(x) > 0 do -- (0 = Monday, 1 = Tuesday, … 6 = Sunday)
		set x=DATE_SUB(x,INTERVAL 1 DAY);
	end while ;
	RETURN str_to_date(x,'%Y-%m-%d');
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS p_programacion_semanal;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_programacion_semanal`()
BEGIN
    declare f date;
    set f=DATE_FORMAT(p_hallar_domingo_floor(curdate()), '%Y-%m-%d');
	select DAYNAME(p.fecha)/*,DAYOFWEEK(p.fecha)*/,DAYOFMONTH(p.fecha),c.detalle,l.detalle,l.proteinas,l.energia,l.hierro
    from programacionplato o 
		JOIN plato l ON (o.idPlato=l.idPlato)
        JOIN programacion p ON (o.idProgramacion=p.idProgramacion)
        JOIN comida c ON (p.idComida=c.idComida)
    where p.fecha=f OR p.fecha=DATE_ADD(f,INTERVAL 1 DAY) OR p.fecha=DATE_ADD(f,INTERVAL 2 DAY)
				    OR p.fecha=DATE_ADD(f,INTERVAL 3 DAY) OR p.fecha=DATE_ADD(f,INTERVAL 4 DAY)
                    OR p.fecha=DATE_ADD(f,INTERVAL 5 DAY) OR p.fecha=DATE_ADD(f,INTERVAL 6 DAY)
    ORDER BY p.fecha;
    -- La suma nutricional por cada programacion manejarlo sumando.
END$$
DELIMITER ;

-- call p_programacion_semanal();


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






/*======================
-- PROCEDURES OTROS
  ====================*/
DROP PROCEDURE IF EXISTS p_insertar_alumno;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertar_alumno`(
	IN	alu_dni                   VARCHAR(8),
	IN	alu_apellido_materno      VARCHAR(45),
	IN	alu_apellido_paterno      VARCHAR(45),
	IN	alu_nombre                VARCHAR(50),
	IN	alu_usuario               VARCHAR(30),
    IN	alu_contrasenia           VARCHAR(30), 
	IN	alu_codigo_universitario  VARCHAR(8),
	IN	alu_idEscuela             INT
)
BEGIN
	INSERT INTO Alumno (dni, apellido_paterno,apellido_materno,
		nombre,usuario,contrasenia,codigo_universitario,idEscuela)
	VALUES (alu_dni,alu_apellido_paterno,alu_apellido_materno,alu_nombre,
		alu_usuario,SUBSTRING(sha1(alu_contrasenia),1,30),alu_codigo_universitario,alu_idEscuela);
END$$
DELIMITER ;
/*
call p_insertar_alumno('73091842','Arce','Llantoy','Luis','LArce','letmein1234',
 '14200180',(select idEscuela from Escuela where detalle='Ingeniería de Software'));
call p_insertar_alumno('48563304','Quino','Crispin','Alexander Nelson','AQuino','letmein1234',
 '14200198',(select idEscuela from Escuela where detalle='Ingeniería de Software'));
*/

-- DATOS POR ALUMNO
DROP PROCEDURE IF EXISTS p_datosalumnoporid;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_datosalumnoporid`(
   IN PIDALUMNO INT
)
BEGIN
 SELECT *
 FROM Alumno
 WHERE idAlumno =PIDALUMNO;
END $$
DELIMITER $$

-- ELIMINAR ALUMNO
DROP PROCEDURE IF EXISTS p_eliminaalumno;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_eliminaalumno`(
  IN PIDALUMNO INTEGER
)
BEGIN
  DELETE FROM Alumno WHERE idAlumno=PIDALUMNO;
END $$
DELIMITER ;

-- LISTAR ALUMNOS
DROP PROCEDURE IF EXISTS p_listaralumnos;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_listaralumnos`()
BEGIN
 SELECT *
 FROM Alumno
 ORDER BY idAlumno;
END $$
DELIMITER ;

-- ACTUALIZAR ALUMNO
DROP PROCEDURE IF EXISTS p_actualizaralumno;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_actualizaralumno`(
    	in pidAlumno              INT  , 
		in pdni                   VARCHAR(8)  , 
		in papellido_materno      VARCHAR(45)  , 
		in papellido_paterno      VARCHAR(45)  , 
		in pnombre                VARCHAR(50)  , 
		in pusuario               VARCHAR(30)  ,
		in pcontrasenia           VARCHAR(30)  , 
		in pcodigo_universitario  VARCHAR(8)  , 
		in pidEscuela             INT 
)
BEGIN
  UPDATE Alumno SET
	idAlumno = pidAlumno,               
	dni= pdni,                  
	apellido_materno = papellido_materno,      
	apellido_paterno = papellido_paterno,     
	nombre = pnombre,                
	usuario	= pusuario,               
	contrasenia	= pcontrasenia,           
	codigo_universitario = pcodigo_universitario,   
	idEscuela = pidEscuela    

  WHERE idAlumno=pidAlumno;

END $$
DELIMITER ;


-- ADMINNISTRADOR 
DROP PROCEDURE IF EXISTS p_insertar_admin;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertar_admin`(
	IN	a_dni                   VARCHAR(8),
	IN	a_apellido_materno      VARCHAR(45),
	IN	a_apellido_paterno      VARCHAR(45),
	IN	a_nombre                VARCHAR(50),
	IN	a_usuario               VARCHAR(40),
    IN	a_contrasenia           VARCHAR(40), 
	IN	a_idEscuela             INT
)
BEGIN
	INSERT INTO Administrador (dni, apellido_paterno,apellido_materno,
		nombre,usuario,contrasenia,idEscuela)
	VALUES (a_dni,a_apellido_paterno,a_apellido_materno,a_nombre,
		a_usuario,SUBSTRING(sha1(a_contrasenia),1,30),a_idEscuela);
END$$
DELIMITER ;

-- DATOS POR ADMINISTRADORID
DROP PROCEDURE IF EXISTS p_datosadminporid;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_datosadminporid`(
   IN PIDADMIN INT
)
BEGIN
 SELECT *
 FROM Administrador
 WHERE idAdministrador =PIDADMIN;
END $$
DELIMITER $$

-- ELIMINAR ADMINISTRADOR
DROP PROCEDURE IF EXISTS p_eliminaadmin;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_eliminaadmin`(
  IN PIDADMIN INTEGER
)
BEGIN
  DELETE FROM Administrador WHERE idAdministrador=PIDADMIN;
END $$
DELIMITER ;

-- LISTAR ADMINISTRADORES
DROP PROCEDURE IF EXISTS p_listaradmin;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_listaradmin`()
BEGIN
 SELECT *
 FROM Administrador
 ORDER BY idAdministrador;
END $$
DELIMITER ;

-- ACTUALIZAR ADMINISTRADOR
DROP PROCEDURE IF EXISTS p_actualizaradmin;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_actualizaradmin`(
    	in pidAdmin             INT  , 
		in pdni                   VARCHAR(8)  , 
		in papellido_materno      VARCHAR(45)  , 
		in papellido_paterno      VARCHAR(45)  , 
		in pnombre                VARCHAR(50)  , 
		in pusuario               VARCHAR(40)  ,
		in pcontrasenia           VARCHAR(40)  , 
		in pidEscuela             INT 
)
BEGIN
  UPDATE Administrador SET
	idAdministrador = pidAdmin,               
	dni= pdni,                  
	apellido_materno = papellido_materno,      
	apellido_paterno = papellido_paterno,     
	nombre = pnombre,                
	usuario	= pusuario,               
	contrasenia	= pcontrasenia,            
	idEscuela = pidEscuela    

  WHERE idAdministrador=pidAdmin;

END $$
DELIMITER ;

-- LOGIN ADMINISTRADOR
DROP PROCEDURE IF EXISTS p_login;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_login`( in pusuario VARCHAR(40)  ,
   IN pcontrasenia   VARCHAR(40) 
)
BEGIN
 SELECT *
 FROM Administrador
 WHERE usuario =pusuario and contrasenia=pcontrasenia  ;
END $$
DELIMITER ;
