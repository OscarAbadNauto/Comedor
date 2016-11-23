-- ========================================
--  Aqui esta un llenado complementario que
--  tambien se usa como unidad de testeo
-- ========================================


-- ========================================
-- Administrador (idAdministrador, dni, apellido_paterno,
--           apellido_materno,nombre,usuario,contrasenia)
-- ========================================
-- TRUNCATE TABLE Administrador;

call p_insertar_admin('76190877','HUARACC','HUARCAYA','GUSTAVO ADOLFO','ROOT','ROOT',75);
call p_insertar_admin('70273275','RAMIREZ','VERA','CARLOS AUGUSTO','SYS','SYS',75);

/*
call p_login_admin('ROOT','ROOT');
call p_login_admin('SYS','SYS');
*/

-- ========================================
-- Alumno (dni, apellido_paterno,apellido_materno,nombre,
--           contrasenia,codigo,escuela)
-- ========================================
INSERT INTO Alumno (dni, apellido_paterno,apellido_materno,nombre,
         contrasenia,codigo,escuela)
  VALUES ('73091842','Arce','Llantoy','Luis','letmein1234', '14200180',
  (select idEscuela from Escuela where detalle='Ingeniería de Software'));

INSERT INTO Alumno (dni, apellido_paterno,apellido_materno,nombre,
         codigo,escuela)
  VALUES ('75073934','Abad','Nauto','Oscar Francescoli',
 '14200212',(select idEscuela from Escuela where detalle='Ingeniería de Software'));

INSERT INTO Alumno (dni, apellido_paterno,apellido_materno,nombre,
         codigo,escuela)
  VALUES ('49074234','Huaira','Reyna','Max Nimrod',
 '12200056',(select idEscuela from Escuela where detalle='Ingeniería de Software'));

INSERT INTO Alumno (dni, apellido_paterno,apellido_materno,nombre,
         codigo,escuela)
  VALUES ('48563304','Quino','Crispin','Alexander Nelson',
 '14200198',(select idEscuela from Escuela where detalle='Ingeniería de Software'));

INSERT INTO Alumno (dni, apellido_paterno,apellido_materno,nombre,
         codigo,escuela)
  VALUES ('46073980','Yataco','Irrazaval','Saroff Wilfredo',
 '11200169',(select idEscuela from Escuela where detalle='Ingeniería de Software'));






insert into programacion (fecha,idComida)
  values ('2016-11-05',1);
insert into programacion (fecha,idComida)
  values ('2016-11-05',2);
insert into programacion (fecha,idComida)
  values ('2016-11-05',3);
insert into programacion (fecha,idComida)
  values ('2016-11-06',1);
insert into programacion (fecha,idComida)
  values ('2016-11-06',2);
insert into programacion (fecha,idComida)
  values ('2016-11-06',3);

insert into programacion (fecha,idComida)
  values ('2016-11-07',1);
insert into programacion (fecha,idComida)
  values ('2016-11-07',2);
insert into programacion (fecha,idComida)
  values ('2016-11-07',3);
insert into programacion (fecha,idComida)
  values ('2016-11-08',1);
insert into programacion (fecha,idComida)
  values ('2016-11-08',2);
insert into programacion (fecha,idComida)
  values ('2016-11-08',3);

insert into programacion (fecha,idComida)
  values ('2016-11-09',1);
insert into programacion (fecha,idComida)
  values ('2016-11-09',2);
insert into programacion (fecha,idComida)
  values ('2016-11-09',3);
insert into programacion (fecha,idComida)
  values ('2016-11-10',1);
insert into programacion (fecha,idComida)
  values ('2016-11-10',2);
insert into programacion (fecha,idComida)
  values ('2016-11-10',3);

insert into programacion (fecha,idComida)
  values ('2016-11-11',1);
insert into programacion (fecha,idComida)
  values ('2016-11-11',2);
insert into programacion (fecha,idComida)
  values ('2016-11-11',3);
insert into programacion (fecha,idComida)
  values ('2016-11-12',1);
insert into programacion (fecha,idComida)
  values ('2016-11-12',2);
insert into programacion (fecha,idComida)
  values ('2016-11-12',3);

insert into programacion (fecha,idComida)
  values ('2016-11-13',1);
insert into programacion (fecha,idComida)
  values ('2016-11-13',2);
insert into programacion (fecha,idComida)
  values ('2016-11-13',3);
insert into programacion (fecha,idComida)
  values ('2016-11-14',1);
insert into programacion (fecha,idComida)
  values ('2016-11-14',2);
insert into programacion (fecha,idComida)
  values ('2016-11-14',3);

insert into programacion (fecha,idComida)
  values ('2016-11-15',1);
insert into programacion (fecha,idComida)
  values ('2016-11-15',2);
insert into programacion (fecha,idComida)
  values ('2016-11-15',3);
insert into programacion (fecha,idComida)
  values ('2016-11-16',1);
insert into programacion (fecha,idComida)
  values ('2016-11-16',2);
insert into programacion (fecha,idComida)
  values ('2016-11-16',3);

insert into programacion (fecha,idComida)
  values ('2016-11-17',1);
insert into programacion (fecha,idComida)
  values ('2016-11-17',2);
insert into programacion (fecha,idComida)
  values ('2016-11-17',3);
insert into programacion (fecha,idComida)
  values ('2016-11-18',1);
insert into programacion (fecha,idComida)
  values ('2016-11-18',2);
insert into programacion (fecha,idComida)
  values ('2016-11-18',3);

insert into programacion (fecha,idComida)
  values ('2016-11-19',1);
insert into programacion (fecha,idComida)
  values ('2016-11-19',2);
insert into programacion (fecha,idComida)
  values ('2016-11-19',3);
insert into programacion (fecha,idComida)
  values ('2016-11-20',1);
insert into programacion (fecha,idComida)
  values ('2016-11-20',2);
insert into programacion (fecha,idComida)
  values ('2016-11-20',3);

insert into programacion (fecha,idComida)
  values ('2016-11-21',1);
insert into programacion (fecha,idComida)
  values ('2016-11-21',2);
insert into programacion (fecha,idComida)
  values ('2016-11-21',3);
insert into programacion (fecha,idComida)
  values ('2016-11-22',1);
insert into programacion (fecha,idComida)
  values ('2016-11-22',2);
insert into programacion (fecha,idComida)
  values ('2016-11-22',3);
  
insert into programacion (fecha,idComida)
  values ('2016-11-23',1);
insert into programacion (fecha,idComida)
  values ('2016-11-23',2);
insert into programacion (fecha,idComida)
  values ('2016-11-23',3);
insert into programacion (fecha,idComida)
  values ('2016-11-24',1);
insert into programacion (fecha,idComida)
  values ('2016-11-24',2);
insert into programacion (fecha,idComida)
  values ('2016-11-24',3);
  
insert into programacion (fecha,idComida)
  values ('2016-11-25',1);
insert into programacion (fecha,idComida)
  values ('2016-11-25',2);
insert into programacion (fecha,idComida)
  values ('2016-11-25',3);
insert into programacion (fecha,idComida)
  values ('2016-11-26',1);
insert into programacion (fecha,idComida)
  values ('2016-11-26',2);
insert into programacion (fecha,idComida)
  values ('2016-11-26',3);
  
insert into programacion (fecha,idComida)
  values ('2016-11-27',1);
insert into programacion (fecha,idComida)
  values ('2016-11-27',2);
insert into programacion (fecha,idComida)
  values ('2016-11-27',3);
insert into programacion (fecha,idComida)
  values ('2016-11-28',1);
insert into programacion (fecha,idComida)
  values ('2016-11-28',2);
insert into programacion (fecha,idComida)
  values ('2016-11-28',3);

call p_insertar_programacion('2016-11-29',1);




/* call p_agregar_plato_a_programacion(fecha,idComida,idPlato)
idComida:1 = Desayuno
         2 = Almuerzo
         3 = Cena
*/
call p_insertar_plato_a_programacion('2016-11-05',1,24);
call p_insertar_plato_a_programacion('2016-11-05',1,25);

call p_insertar_plato_a_programacion('2016-11-05',2,4);
call p_insertar_plato_a_programacion('2016-11-05',2,12);
call p_insertar_plato_a_programacion('2016-11-05',2,13);
call p_insertar_plato_a_programacion('2016-11-05',2,31);

call p_insertar_plato_a_programacion('2016-11-05',3,8);
call p_insertar_plato_a_programacion('2016-11-05',3,16);







call p_insertar_plato_a_programacion('2016-11-06',1,24);
call p_insertar_plato_a_programacion('2016-11-06',1,25);

call p_insertar_plato_a_programacion('2016-11-06',2,4);
call p_insertar_plato_a_programacion('2016-11-06',2,12);
call p_insertar_plato_a_programacion('2016-11-06',2,13);
call p_insertar_plato_a_programacion('2016-11-06',2,31);

call p_insertar_plato_a_programacion('2016-11-06',3,8);
call p_insertar_plato_a_programacion('2016-11-06',3,16);







call p_insertar_plato_a_programacion('2016-11-07',1,24);
call p_insertar_plato_a_programacion('2016-11-07',1,25);

call p_insertar_plato_a_programacion('2016-11-07',2,4);
call p_insertar_plato_a_programacion('2016-11-07',2,12);
call p_insertar_plato_a_programacion('2016-11-07',2,13);
call p_insertar_plato_a_programacion('2016-11-07',2,31);

call p_insertar_plato_a_programacion('2016-11-07',3,8);
call p_insertar_plato_a_programacion('2016-11-07',3,16);







call p_insertar_plato_a_programacion('2016-11-08',1,24);
call p_insertar_plato_a_programacion('2016-11-08',1,25);

call p_insertar_plato_a_programacion('2016-11-08',2,4);
call p_insertar_plato_a_programacion('2016-11-08',2,12);
call p_insertar_plato_a_programacion('2016-11-08',2,13);
call p_insertar_plato_a_programacion('2016-11-08',2,31);

call p_insertar_plato_a_programacion('2016-11-08',3,8);
call p_insertar_plato_a_programacion('2016-11-08',3,16);







call p_insertar_plato_a_programacion('2016-11-09',1,24);
call p_insertar_plato_a_programacion('2016-11-09',1,25);

call p_insertar_plato_a_programacion('2016-11-09',2,4);
call p_insertar_plato_a_programacion('2016-11-09',2,12);
call p_insertar_plato_a_programacion('2016-11-09',2,13);
call p_insertar_plato_a_programacion('2016-11-09',2,31);

call p_insertar_plato_a_programacion('2016-11-09',3,8);
call p_insertar_plato_a_programacion('2016-11-09',3,16);







call p_insertar_plato_a_programacion('2016-11-10',1,24);
call p_insertar_plato_a_programacion('2016-11-10',1,25);

call p_insertar_plato_a_programacion('2016-11-10',2,4);
call p_insertar_plato_a_programacion('2016-11-10',2,12);
call p_insertar_plato_a_programacion('2016-11-10',2,13);
call p_insertar_plato_a_programacion('2016-11-10',2,31);

call p_insertar_plato_a_programacion('2016-11-10',3,8);
call p_insertar_plato_a_programacion('2016-11-10',3,16);







call p_insertar_plato_a_programacion('2016-11-11',1,24);
call p_insertar_plato_a_programacion('2016-11-11',1,25);

call p_insertar_plato_a_programacion('2016-11-11',2,4);
call p_insertar_plato_a_programacion('2016-11-11',2,12);
call p_insertar_plato_a_programacion('2016-11-11',2,13);
call p_insertar_plato_a_programacion('2016-11-11',2,31);

call p_insertar_plato_a_programacion('2016-11-11',3,8);
call p_insertar_plato_a_programacion('2016-11-11',3,16);







call p_insertar_plato_a_programacion('2016-11-12',1,24);
call p_insertar_plato_a_programacion('2016-11-12',1,25);

call p_insertar_plato_a_programacion('2016-11-12',2,4);
call p_insertar_plato_a_programacion('2016-11-12',2,12);
call p_insertar_plato_a_programacion('2016-11-12',2,13);
call p_insertar_plato_a_programacion('2016-11-12',2,31);

call p_insertar_plato_a_programacion('2016-11-12',3,8);
call p_insertar_plato_a_programacion('2016-11-12',3,16);







call p_insertar_plato_a_programacion('2016-11-13',1,24);
call p_insertar_plato_a_programacion('2016-11-13',1,25);

call p_insertar_plato_a_programacion('2016-11-13',2,4);
call p_insertar_plato_a_programacion('2016-11-13',2,12);
call p_insertar_plato_a_programacion('2016-11-13',2,13);
call p_insertar_plato_a_programacion('2016-11-13',2,31);

call p_insertar_plato_a_programacion('2016-11-13',3,8);
call p_insertar_plato_a_programacion('2016-11-13',3,16);







call p_insertar_plato_a_programacion('2016-11-14',1,24);
call p_insertar_plato_a_programacion('2016-11-14',1,25);

call p_insertar_plato_a_programacion('2016-11-14',2,4);
call p_insertar_plato_a_programacion('2016-11-14',2,12);
call p_insertar_plato_a_programacion('2016-11-14',2,13);
call p_insertar_plato_a_programacion('2016-11-14',2,31);

call p_insertar_plato_a_programacion('2016-11-14',3,8);
call p_insertar_plato_a_programacion('2016-11-14',3,16);







call p_insertar_plato_a_programacion('2016-11-15',1,24);
call p_insertar_plato_a_programacion('2016-11-15',1,25);

call p_insertar_plato_a_programacion('2016-11-15',2,4);
call p_insertar_plato_a_programacion('2016-11-15',2,12);
call p_insertar_plato_a_programacion('2016-11-15',2,13);
call p_insertar_plato_a_programacion('2016-11-15',2,31);

call p_insertar_plato_a_programacion('2016-11-15',3,8);
call p_insertar_plato_a_programacion('2016-11-15',3,16);







call p_insertar_plato_a_programacion('2016-11-16',1,24);
call p_insertar_plato_a_programacion('2016-11-16',1,25);

call p_insertar_plato_a_programacion('2016-11-16',2,4);
call p_insertar_plato_a_programacion('2016-11-16',2,12);
call p_insertar_plato_a_programacion('2016-11-16',2,13);
call p_insertar_plato_a_programacion('2016-11-16',2,31);

call p_insertar_plato_a_programacion('2016-11-16',3,8);
call p_insertar_plato_a_programacion('2016-11-16',3,16);







call p_insertar_plato_a_programacion('2016-11-17',1,24);
call p_insertar_plato_a_programacion('2016-11-17',1,25);

call p_insertar_plato_a_programacion('2016-11-17',2,4);
call p_insertar_plato_a_programacion('2016-11-17',2,12);
call p_insertar_plato_a_programacion('2016-11-17',2,13);
call p_insertar_plato_a_programacion('2016-11-17',2,31);

call p_insertar_plato_a_programacion('2016-11-17',3,8);
call p_insertar_plato_a_programacion('2016-11-17',3,16);







call p_insertar_plato_a_programacion('2016-11-18',1,24);
call p_insertar_plato_a_programacion('2016-11-18',1,25);

call p_insertar_plato_a_programacion('2016-11-18',2,4);
call p_insertar_plato_a_programacion('2016-11-18',2,12);
call p_insertar_plato_a_programacion('2016-11-18',2,13);
call p_insertar_plato_a_programacion('2016-11-18',2,31);

call p_insertar_plato_a_programacion('2016-11-18',3,8);
call p_insertar_plato_a_programacion('2016-11-18',3,16);







call p_insertar_plato_a_programacion('2016-11-19',1,24);
call p_insertar_plato_a_programacion('2016-11-19',1,25);

call p_insertar_plato_a_programacion('2016-11-19',2,4);
call p_insertar_plato_a_programacion('2016-11-19',2,12);
call p_insertar_plato_a_programacion('2016-11-19',2,13);
call p_insertar_plato_a_programacion('2016-11-19',2,31);

call p_insertar_plato_a_programacion('2016-11-19',3,8);
call p_insertar_plato_a_programacion('2016-11-19',3,16);







call p_insertar_plato_a_programacion('2016-11-20',1,24);
call p_insertar_plato_a_programacion('2016-11-20',1,25);

call p_insertar_plato_a_programacion('2016-11-20',2,4);
call p_insertar_plato_a_programacion('2016-11-20',2,12);
call p_insertar_plato_a_programacion('2016-11-20',2,13);
call p_insertar_plato_a_programacion('2016-11-20',2,31);

call p_insertar_plato_a_programacion('2016-11-20',3,8);
call p_insertar_plato_a_programacion('2016-11-20',3,16);







call p_insertar_plato_a_programacion('2016-11-21',1,24);
call p_insertar_plato_a_programacion('2016-11-21',1,25);

call p_insertar_plato_a_programacion('2016-11-21',2,4);
call p_insertar_plato_a_programacion('2016-11-21',2,12);
call p_insertar_plato_a_programacion('2016-11-21',2,13);
call p_insertar_plato_a_programacion('2016-11-21',2,31);

call p_insertar_plato_a_programacion('2016-11-21',3,8);
call p_insertar_plato_a_programacion('2016-11-21',3,16);







call p_insertar_plato_a_programacion('2016-11-22',1,24);
call p_insertar_plato_a_programacion('2016-11-22',1,25);

call p_insertar_plato_a_programacion('2016-11-22',2,4);
call p_insertar_plato_a_programacion('2016-11-22',2,12);
call p_insertar_plato_a_programacion('2016-11-22',2,13);
call p_insertar_plato_a_programacion('2016-11-22',2,31);

call p_insertar_plato_a_programacion('2016-11-22',3,8);
call p_insertar_plato_a_programacion('2016-11-22',3,16);







call p_insertar_plato_a_programacion('2016-11-23',1,24);
call p_insertar_plato_a_programacion('2016-11-23',1,25);

call p_insertar_plato_a_programacion('2016-11-23',2,4);
call p_insertar_plato_a_programacion('2016-11-23',2,12);
call p_insertar_plato_a_programacion('2016-11-23',2,13);
call p_insertar_plato_a_programacion('2016-11-23',2,31);

call p_insertar_plato_a_programacion('2016-11-23',3,8);
call p_insertar_plato_a_programacion('2016-11-23',3,16);







call p_insertar_plato_a_programacion('2016-11-24',1,24);
call p_insertar_plato_a_programacion('2016-11-24',1,25);

call p_insertar_plato_a_programacion('2016-11-24',2,4);
call p_insertar_plato_a_programacion('2016-11-24',2,12);
call p_insertar_plato_a_programacion('2016-11-24',2,13);
call p_insertar_plato_a_programacion('2016-11-24',2,31);

call p_insertar_plato_a_programacion('2016-11-24',3,8);
call p_insertar_plato_a_programacion('2016-11-24',3,16);







call p_insertar_plato_a_programacion('2016-11-25',1,24);
call p_insertar_plato_a_programacion('2016-11-25',1,25);

call p_insertar_plato_a_programacion('2016-11-25',2,4);
call p_insertar_plato_a_programacion('2016-11-25',2,12);
call p_insertar_plato_a_programacion('2016-11-25',2,13);
call p_insertar_plato_a_programacion('2016-11-25',2,31);

call p_insertar_plato_a_programacion('2016-11-25',3,8);
call p_insertar_plato_a_programacion('2016-11-25',3,16);







call p_insertar_plato_a_programacion('2016-11-26',1,24);
call p_insertar_plato_a_programacion('2016-11-26',1,25);

call p_insertar_plato_a_programacion('2016-11-26',2,4);
call p_insertar_plato_a_programacion('2016-11-26',2,12);
call p_insertar_plato_a_programacion('2016-11-26',2,13);
call p_insertar_plato_a_programacion('2016-11-26',2,31);

call p_insertar_plato_a_programacion('2016-11-26',3,8);
call p_insertar_plato_a_programacion('2016-11-26',3,16);







call p_insertar_plato_a_programacion('2016-11-27',1,24);
call p_insertar_plato_a_programacion('2016-11-27',1,25);

call p_insertar_plato_a_programacion('2016-11-27',2,4);
call p_insertar_plato_a_programacion('2016-11-27',2,12);
call p_insertar_plato_a_programacion('2016-11-27',2,13);
call p_insertar_plato_a_programacion('2016-11-27',2,31);

call p_insertar_plato_a_programacion('2016-11-27',3,8);
call p_insertar_plato_a_programacion('2016-11-27',3,16);







call p_insertar_plato_a_programacion('2016-11-28',1,24);
call p_insertar_plato_a_programacion('2016-11-28',1,25);

call p_insertar_plato_a_programacion('2016-11-28',2,4);
call p_insertar_plato_a_programacion('2016-11-28',2,12);
call p_insertar_plato_a_programacion('2016-11-28',2,13);
call p_insertar_plato_a_programacion('2016-11-28',2,31);

call p_insertar_plato_a_programacion('2016-11-28',3,8);
call p_insertar_plato_a_programacion('2016-11-28',3,16);


call p_elimina_plato_programacion(72,16);
call p_actualizar_plato(72,8,9);














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
