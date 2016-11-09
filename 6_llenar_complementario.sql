-- ========================================
--  Aqui esta un llenado complementario que
--  tambien se usa como unidad de testeo
-- ========================================



-- ========================================
-- Administrador (idAdministrador, dni, apellido_paterno,
--           apellido_materno,nombre,usuario,contrasenia)
-- ========================================
-- TRUNCATE TABLE Administrador;
INSERT INTO Administrador (idAdministrador, dni, apellido_paterno,
                      apellido_materno,nombre,usuario,contrasenia)
 VALUES (1, '12345678', 'COMEDOR',
                      'COMEDOR','COMEDOR','ROOT',SUBSTRING(sha1('ROOT'),1,30));




-- ========================================
-- Alumno (dni, apellido_paterno,apellido_materno,nombre,
--           usuario,contrasenia,codigo,escuela)
-- ========================================
/*
call p_insertar_alumno('73091842','Arce','Llantoy','Luis','LArce','letmein1234',
 '14200180',(select idEscuela from Escuela where detalle='Ingeniería de Software'));
call p_insertar_alumno('48563304','Quino','Crispin','Alexander Nelson','AQuino','letmein1234',
 '14200198',(select idEscuela from Escuela where detalle='Ingeniería de Software'));
*/



insert into programacion (fecha,idComida)
  values ('2016-10-16',1);
insert into programacion (fecha,idComida)
  values ('2016-10-16',2);
insert into programacion (fecha,idComida)
  values ('2016-10-16',3);
insert into programacion (fecha,idComida)
  values ('2016-10-17',1);
insert into programacion (fecha,idComida)
  values ('2016-10-17',2);
insert into programacion (fecha,idComida)
  values ('2016-10-18',3);
insert into programacion (fecha,idComida)
  values ('2016-10-18',1);
insert into programacion (fecha,idComida)
  values ('2016-10-18',2);
insert into programacion (fecha,idComida)
  values ('2016-10-18',3);
insert into programacion (fecha,idComida)
  values ('2016-10-19',1);
insert into programacion (fecha,idComida)
  values ('2016-10-19',2);
insert into programacion (fecha,idComida)
  values ('2016-10-19',3);
insert into programacion (fecha,idComida)
  values ('2016-10-20',1);
insert into programacion (fecha,idComida)
  values ('2016-10-20',2);
insert into programacion (fecha,idComida)
  values ('2016-10-20',3);
insert into programacion (fecha,idComida)
  values ('2016-10-21',1);
insert into programacion (fecha,idComida)
  values ('2016-10-21',2);
insert into programacion (fecha,idComida)
  values ('2016-10-21',3);
insert into programacion (fecha,idComida)
  values ('2016-10-22',1);
insert into programacion (fecha,idComida)
  values ('2016-10-22',2);
insert into programacion (fecha,idComida)
  values ('2016-10-22',3);



insert into programacionplato (idProgramacion,idPlato) values (1,1);insert into programacionplato (idProgramacion,idPlato) values (1,2);
insert into programacionplato (idProgramacion,idPlato) values (4,1);insert into programacionplato (idProgramacion,idPlato) values (4,2);
insert into programacionplato (idProgramacion,idPlato) values (7,1);insert into programacionplato (idProgramacion,idPlato) values (7,2);

insert into programacionplato (idProgramacion,idPlato) values (10,1);insert into programacionplato (idProgramacion,idPlato) values (10,2);
insert into programacionplato (idProgramacion,idPlato) values (13,1);insert into programacionplato (idProgramacion,idPlato) values (13,2);
insert into programacionplato (idProgramacion,idPlato) values (16,1);insert into programacionplato (idProgramacion,idPlato) values (16,2);
insert into programacionplato (idProgramacion,idPlato) values (19,1);insert into programacionplato (idProgramacion,idPlato) values (19,2);
 



insert into programacionplato (idProgramacion,idPlato) values (2,4); insert into programacionplato (idProgramacion,idPlato) values (2,5); insert into programacionplato (idProgramacion,idPlato) values (2,3); insert into programacionplato (idProgramacion,idPlato) values (2,6);
insert into programacionplato (idProgramacion,idPlato) values (5,4); insert into programacionplato (idProgramacion,idPlato) values (5,5); insert into programacionplato (idProgramacion,idPlato) values (5,3); insert into programacionplato (idProgramacion,idPlato) values (5,6);
insert into programacionplato (idProgramacion,idPlato) values (8,4); insert into programacionplato (idProgramacion,idPlato) values (8,5); insert into programacionplato (idProgramacion,idPlato) values (8,3); insert into programacionplato (idProgramacion,idPlato) values (8,6);

insert into programacionplato (idProgramacion,idPlato) values (11,4);insert into programacionplato (idProgramacion,idPlato) values (11,5);insert into programacionplato (idProgramacion,idPlato) values (11,3);insert into programacionplato (idProgramacion,idPlato) values (11,6);
insert into programacionplato (idProgramacion,idPlato) values (14,4);insert into programacionplato (idProgramacion,idPlato) values (14,5);insert into programacionplato (idProgramacion,idPlato) values (14,3);insert into programacionplato (idProgramacion,idPlato) values (14,6);
insert into programacionplato (idProgramacion,idPlato) values (17,4);insert into programacionplato (idProgramacion,idPlato) values (17,5);insert into programacionplato (idProgramacion,idPlato) values (17,3);insert into programacionplato (idProgramacion,idPlato) values (17,6);
insert into programacionplato (idProgramacion,idPlato) values (20,4);insert into programacionplato (idProgramacion,idPlato) values (20,5);insert into programacionplato (idProgramacion,idPlato) values (20,3);insert into programacionplato (idProgramacion,idPlato) values (20,6);




insert into programacionplato (idProgramacion,idPlato) values (3,5);insert into programacionplato (idProgramacion,idPlato) values (3,6);
insert into programacionplato (idProgramacion,idPlato) values (6,5);insert into programacionplato (idProgramacion,idPlato) values (6,6);
insert into programacionplato (idProgramacion,idPlato) values (9,5);insert into programacionplato (idProgramacion,idPlato) values (9,6);

insert into programacionplato (idProgramacion,idPlato) values (12,5);insert into programacionplato (idProgramacion,idPlato) values (12,6);
insert into programacionplato (idProgramacion,idPlato) values (15,5);insert into programacionplato (idProgramacion,idPlato) values (15,6);
insert into programacionplato (idProgramacion,idPlato) values (18,5);insert into programacionplato (idProgramacion,idPlato) values (18,6);
insert into programacionplato (idProgramacion,idPlato) values (21,5);insert into programacionplato (idProgramacion,idPlato) values (21,6);



select * from plato;
select * from programacion;

truncate table programacion;

/*
truncate table ticket;

INSERT INTO Ticket (idAlumno,idProgramacion,idTurno,nivel)
 VALUES (1,1,5,2);

INSERT INTO Ticket (idAlumno,idProgramacion,idTurno,nivel)
 VALUES (2,1,5,2);
*/
/*
UPDATE contador SET raciones=1
WHERE idContador=10;

SELECT * FROM CONTADOR WHERE IDCONTADOR=10;
*/
