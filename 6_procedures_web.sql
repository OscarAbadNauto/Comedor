-- =====================================================================
-- PROCEDIMIENTOS WEB
-- 
-- Archivo : procedures_web.sql
-- Objetivo: Facilitar las consultas
-- Base de datos: MySQL
-- =====================================================================

/*======================
-- PROCEDURES Y CONSULTAS PARA WEB
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
	IN	a_apellido_paterno      VARCHAR(45),
	IN	a_apellido_materno      VARCHAR(45),
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
DROP PROCEDURE IF EXISTS p_login_admin;
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

-- call p_login_admin('ROOT','ROOT');


DROP PROCEDURE IF EXISTS p_insertar_plato_a_programacion;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertar_plato_a_programacion`(
	IN prog_fecha DATE,
    IN prog_idComida INT,
    IN plat_idPlato INT
)
BEGIN
	insert into programacionplato (idProgramacion,idPlato) values ((SELECT idProgramacion
	 FROM Programacion
	 WHERE fecha=prog_fecha AND idComida=prog_idComida),plat_idPlato);
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS p_listar_platos_de_programacion;
DELIMITER $$
-- ver los platos de una programacion
-- entrada: fecha, idComida
-- salida: el conjunto de platos
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_listar_platos_de_programacion`(
	IN prog_fecha DATE,
    IN prog_idComida INT
)
BEGIN
	select b.idPlato,b.detalle,b.tipo,b.energia,b.proteinas,b.hierro
	 from ProgramacionPlato c join
		Programacion a on (c.idProgramacion=a.idProgramacion) join
		Plato b on (c.idPlato=b.idPlato)
	 where a.fecha=prog_fecha AND a.idComida=prog_idComida;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS p_buscar_plato;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_buscar_plato`(
    	in consulta                   VARCHAR(40)
)
BEGIN
  SELECT * 
	FROM PLATO 
	WHERE DETALLE LIKE concat('%',consulta,'%');

END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS p_buscar_segundo;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_buscar_segundo`(
    	in consulta                   VARCHAR(40)
)
BEGIN
  SELECT * 
	FROM SEGUNDO 
	WHERE DETALLE LIKE concat('%',consulta,'%');

END $$
DELIMITER ;


