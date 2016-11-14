
CREATE DATABASE COMEDOR;
USE COMEDOR;

-- ===============
-- esquema CLIENTE Y ORGANIZACION
-- ===============
CREATE TABLE Facultad (
		idFacultad INT NOT NULL, 
		detalle VARCHAR(70) NOT NULL, 
		numero VARCHAR(2)
);

ALTER TABLE Facultad ADD CONSTRAINT pk_facultad
   PRIMARY KEY (idFacultad);

ALTER TABLE Facultad MODIFY idFacultad INT AUTO_INCREMENT;

ALTER TABLE Facultad ADD CONSTRAINT unico_Facultad_numero
      UNIQUE (numero);



CREATE TABLE Escuela (
		idEscuela INT NOT NULL, 
		detalle VARCHAR(70) NOT NULL, 
		numero VARCHAR(6),
		idFacultad INT NOT NULL
);

ALTER TABLE Escuela ADD CONSTRAINT pk_escuela
   PRIMARY KEY (idEscuela);

ALTER TABLE Escuela MODIFY idEscuela INT AUTO_INCREMENT;

ALTER TABLE Escuela ADD CONSTRAINT FK_Escuel_idFacul FOREIGN KEY
	(idFacultad)
	REFERENCES Facultad
	(idFacultad);

CREATE TABLE Administrador (
		idAdministrador   INT NOT NULL, 
		dni               VARCHAR(8) NOT NULL, 
		apellido_paterno  VARCHAR(45) NOT NULL, 
		apellido_materno  VARCHAR(45) NOT NULL, 
		nombre            VARCHAR(50) NOT NULL, 
		usuario           VARCHAR(40) NOT NULL, 
		contrasenia       VARCHAR(40) NOT NULL, 
		idEscuela         INT NULL
);

ALTER TABLE Administrador ADD CONSTRAINT pk_administrador
   PRIMARY KEY (idAdministrador);

ALTER TABLE Administrador MODIFY idAdministrador INT AUTO_INCREMENT;

ALTER TABLE Administrador ADD CONSTRAINT unico_Administrador_dni
      UNIQUE (dni);

ALTER TABLE Administrador ADD CONSTRAINT unico_Administrador_usuario
      UNIQUE (usuario);

ALTER TABLE Administrador ADD CONSTRAINT FK_Administra_idEs FOREIGN KEY
	(idEscuela)
	REFERENCES Escuela (idEscuela);



CREATE TABLE Alumno (
		idAlumno              INT NOT NULL, 
		dni                   VARCHAR(8) NOT NULL, 
		apellido_materno      VARCHAR(45) NOT NULL, 
		apellido_paterno      VARCHAR(45) NOT NULL, 
		nombre                VARCHAR(50) NOT NULL, 
		usuario               VARCHAR(30) NOT NULL,
		contrasenia           VARCHAR(30) NULL,
		codigo_universitario  VARCHAR(8) NOT NULL, 
		idEscuela             INT NOT NULL
);

ALTER TABLE Alumno ADD CONSTRAINT pk_alumno
   PRIMARY KEY (idAlumno);

ALTER TABLE Alumno MODIFY idAlumno INT AUTO_INCREMENT;

ALTER TABLE Alumno ADD CONSTRAINT unico_Alumno_dni
      UNIQUE (dni);

ALTER TABLE Alumno ADD CONSTRAINT unico_Alumno_usuario
      UNIQUE (usuario);

ALTER TABLE Alumno ADD CONSTRAINT unico_Alumno_codigo
      UNIQUE (codigo_universitario);

ALTER TABLE Alumno ADD CONSTRAINT FK_Alumno_idEscue FOREIGN KEY
	(idEscuela)
	REFERENCES Escuela
	(idEscuela);




/*
DROP TABLE Administrador;
DROP TABLE Alumno;
DROP TABLE Escuela;
DROP TABLE Facultad;
*/




-- ===============
-- esquema PRODUCTO
-- ===============
CREATE TABLE Comida (
		idComida INT NOT NULL, 
		detalle VARCHAR(10) NOT NULL,
		raciones INT NOT NULL
);

ALTER TABLE Comida ADD CONSTRAINT pk_comida
   PRIMARY KEY (idComida);

ALTER TABLE Comida ADD CONSTRAINT  ch_racion_postiva
   CHECK (raciones >=0 AND raciones <=35000);
-- DATO: San Marcos tiene 35 000 estudiantes aprox.


CREATE TABLE Plato (
		idPlato INT NOT NULL, 
		detalle VARCHAR(40) NOT NULL, 
		tipo CHAR(1), 
    -- Tipo puede ser: Tipo might be:
    -- E: Entrada
    -- S: Segundo
    -- R: Refresco
    -- B: Bebida Caliente
    -- P: Pan con algo
    -- F: Fruta
		energia FLOAT (6,2), 
    -- energía en Kcal
		proteinas FLOAT (5,2), 
    -- proteinas en gramos
		hierro FLOAT (4,2)
    -- hierro en miligramos
);

ALTER TABLE Plato ADD CONSTRAINT pk_plato
   PRIMARY KEY (idPlato);

ALTER TABLE Plato MODIFY idPlato INT AUTO_INCREMENT;

ALTER TABLE Plato ADD CONSTRAINT  check_Plat_tipo
   CHECK (tipo in ('E','S','R','F','B','F'));
-- E: Entrada
-- S: Segundo
-- R: Refresco
-- B: Bebida Caliente
-- P: Pan con algo
-- F: Fruta

CREATE TABLE ComidaNivel (
        idComida INT NOT NULL,
		nivel INT NOT NULL
);

ALTER TABLE ComidaNivel ADD CONSTRAINT pk_PT
   PRIMARY KEY (idComida, nivel);
   
ALTER TABLE ComidaNivel ADD CONSTRAINT ComiNivel_Comi_FK FOREIGN KEY
	(idComida)
	REFERENCES Comida
	(idComida);

CREATE TABLE Programacion (
		idProgramacion INT NOT NULL,
        idComida INT NOT NULL,
		fecha DATE NOT NULL,
        contador INT DEFAULT 1 NOT NULL
);

ALTER TABLE Programacion ADD CONSTRAINT pk_Programacion
   PRIMARY KEY (idProgramacion);

ALTER TABLE Programacion MODIFY idProgramacion INT AUTO_INCREMENT;

ALTER TABLE Programacion ADD CONSTRAINT Programaci_Comi_FK FOREIGN KEY
	(idComida)
	REFERENCES Comida
	(idComida);

ALTER TABLE Programacion ADD CONSTRAINT comida_x_fecha
	UNIQUE (idComida,fecha);
      


CREATE TABLE Turno (
		idTurno INT NOT NULL, 
        idComida INT NOT NULL,
		hora_inicio TIME NOT NULL, 
		hora_fin TIME NOT NULL, 
		numero CHAR(1) NOT NULL
);

ALTER TABLE Turno ADD CONSTRAINT pk_Turno
   PRIMARY KEY (idTurno);

ALTER TABLE Turno ADD CONSTRAINT FK_Turno_idComida FOREIGN KEY
	(idComida)
	REFERENCES Comida
	(idComida);

CREATE TABLE Contador (
		idContador INT NOT NULL, 
        idProgramacion INT NOT NULL,
        idTurno INT NOT NULL,
		nivel INT NOT NULL, 
		raciones INT NOT NULL
);

ALTER TABLE Contador ADD CONSTRAINT pk_Contador
   PRIMARY KEY (idContador);

ALTER TABLE Contador MODIFY idContador INT AUTO_INCREMENT;

ALTER TABLE Contador ADD CONSTRAINT Contador_Progra_FK FOREIGN KEY
	(idProgramacion)
	REFERENCES Programacion
	(idProgramacion) ON DELETE CASCADE;

ALTER TABLE Contador ADD CONSTRAINT Contador_Turn_FK FOREIGN KEY
	(idTurno)
	REFERENCES Turno
	(idTurno);

ALTER TABLE Contador ADD CONSTRAINT contador_regla
      UNIQUE (idProgramacion,idTurno,nivel);

CREATE TABLE ProgramacionPlato (
		idProgramacion INT NOT NULL, 
		idPlato INT NOT NULL
);

ALTER TABLE ProgramacionPlato ADD CONSTRAINT pk_ProgramxPlato
   PRIMARY KEY (idProgramacion, idPlato);

ALTER TABLE ProgramacionPlato ADD CONSTRAINT Programac_Prog_FK FOREIGN KEY
	(idProgramacion)
	REFERENCES Programacion
	(idProgramacion);

ALTER TABLE ProgramacionPlato ADD CONSTRAINT Programaci_Plat_FK FOREIGN KEY
	(idPlato)
	REFERENCES Plato
	(idPlato) ON DELETE CASCADE;



/*
DROP TABLE CONTADOR;
DROP TABLE PROGRAMACIONPLATO;
DROP TABLE COMIDANIVEL;
DROP TABLE PROGRAMACION;
DROP TABLE TURNO;
DROP TABLE COMIDA;
DROP TABLE PLATO;
*/

-- ===============
-- esquema TRANSACCION
-- ===============
CREATE TABLE Ticket (
		idTicket 		INT NOT NULL,
		estado 			CHAR(1) DEFAULT 'R' NOT NULL, 
		idAlumno 		INT NOT NULL, 
		idProgramacion 	INT NOT NULL,
        idTurno			INT NOT NULL,
        nivel 			INT NOT NULL,
        numero			INT NULL
);

ALTER TABLE Ticket ADD CONSTRAINT pk_Ticket
   PRIMARY KEY (idTicket);

ALTER TABLE Ticket MODIFY idTicket INT AUTO_INCREMENT;

ALTER TABLE Ticket ADD CONSTRAINT  chck_Ticket_estado
   CHECK (estado in ('R','A','N'));

ALTER TABLE Ticket ADD CONSTRAINT chck_Ticket_nivel
	CHECK (nivel in (1,2));

ALTER TABLE Ticket ADD CONSTRAINT Tick_Programaci_FK FOREIGN KEY
	(idProgramacion)
	REFERENCES Programacion
	(idProgramacion) ON DELETE CASCADE;

ALTER TABLE Ticket ADD CONSTRAINT Tick_Turno_FK FOREIGN KEY
	(idTurno)
	REFERENCES Turno
	(idTurno);

ALTER TABLE Ticket ADD CONSTRAINT T_A_FK FOREIGN KEY
	(idAlumno)
	REFERENCES Alumno
	(idAlumno);

ALTER TABLE Ticket ADD CONSTRAINT ya_saco_ticket
      UNIQUE (idAlumno,idProgramacion);






/*
DROP TABLE TICKET;


DROP TABLE Administrador;
DROP TABLE Alumno;
DROP TABLE Escuela;
DROP TABLE Facultad;


DROP TABLE CONTADOR;
DROP TABLE PROGRAMACIONPLATO;
DROP TABLE COMIDANIVEL;
DROP TABLE PROGRAMACION;
DROP TABLE TURNO;
DROP TABLE COMIDA;
DROP TABLE PLATO;
*/