
-- ========================================
-- Facultad (idFacultad, detalle, numero)
-- ========================================
-- TRUNCATE TABLE FACULTAD;
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Medicina Humana', '01');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Derecho y Ciencia Política', '02');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Letras y Ciencias Humanas', '03');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Farmacia y Bioquimica', '04');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Odontología', '05');  
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Educación', '06');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Química e Ingeniería Química', '07');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Medicina Veterinaria', '08');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ciencias Administrativas', '09');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ciencias Biológicas', '10');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ciencias Contables', '11');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ciencias Económicas', '12');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ciencias Físicas', '13');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ciencias Matemáticas', '14');
  INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ciencias Sociales', '15');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ingeniería Geológica,Minera,Metalurgica y Geográfica', '16');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ingeniería Industrial', '17');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Psicología', '18');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ingeniería Electrónica y Eléctrica', '19');
 INSERT INTO Facultad ( detalle, numero)
 VALUES ( 'Facultad de Ingeniería de Sistemas e Informática', '20');



-- ========================================
-- Escuela (idEscuela, detalle, numero,idFacultad)
-- ========================================
-- TRUNCATE TABLE Escuela;
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Medicina Humana', '1', 1);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Obstetricia', '2', 1);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Enfermería', '3', 1);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Tecnología Médica: Laboratorio Clinico y Anatomía Patológica', '4.1', 1);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Tecnología Médica: Terapia Física y Rehabilitación', '4.2', 1);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Tecnología Médica: Radiología', '4.3', 1);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Tecnología Médica: Terapia Ocupacional', '4.4', 1);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Nutrición', '5', 1);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Derecho', '2', 2);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ciencia Política', '3', 2);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Literatura', '1', 3);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Filosofía', '3', 3);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Lingüística', '4', 3);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Comunicación Social', '5', 3);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Arte', '6', 3);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Bibliotecología y Ciencias de la Información', '7', 3);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Danza', '8', 3);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Conservación y Restauración', '9', 3);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Farmacia y Bioquímica', '1', 4);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ciencias de los Alimentos', '2', 4);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Toxicología', '3', 4);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Odontología', '1', 5);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Educación Inicial', '1.1', 6);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Educación Primaria', '1.2', 6);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Educación Secundaria: Inglés y Castellano', '1.3.1', 6);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Educación Secundaria: Lenguaje y Literatura', '1.3.2', 6);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Educación Secundaria: Historia y Geografía', '1.3.3', 6);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Educación Secundaria: Filosofía, Tutoría y Ciencias Sociales', '1.3.4', 6);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Educación Secundaria: Matemática y Física', '1.3.5', 6);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Educación Secundaria: Biología y Química', '1.3.6', 6);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Educación Física', '2', 6);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Química', '1', 7);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Química', '2', 7);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Agroindustrial', '3', 7);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Medicina Veterinaria', '1', 8);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Administración', '1', 9);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Administración de Turismo', '2', 9);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Administración de Negocios Internacionales', '3', 9);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ciencias Biológicas', '1', 10);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Genética y Biotecnología', '2', 10);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Microbiología y Parasitología', '3', 10);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Contabilidad', '1', 11);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Gestión Tributaria', '2', 11);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Auditoría Empresarial y Pública', '3', 11);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Economía', '1', 12);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Economía Pública', '2', 12);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Economía Internacional', '3', 12);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Física', '1', 13);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Mecánica de Fluidos', '2', 13);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Matemática', '1', 14);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Estadística', '2', 14);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Investigación Operativa', '4', 14);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Computación Científica', '5', 14);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Historia', '1', 15);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Sociología', '2', 15);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Antropología', '3', 15);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Arqueología', '4', 15);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Trabajo Social', '5', 15);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Geografía', '7', 15);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Geológica', '2', 16);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Geográfica', '3', 16);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería de Minas', '5', 16);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Metalúrgica', '6', 16);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Civil', '7', 16);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Ambiental', '8', 16);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Industrial', '1', 17);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Textil y Confecciones', '2', 17);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería de Seguridad y Salud en el Trabajo', '3', 17);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Psicología', '1', 18);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Psicología Organizacional y de Gestión Humana', '2', 18);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Electrónica', '1', 19);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería Eléctrica', '2', 19);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería de Telecomunicaciones', '3', 19);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería de Sistemas', '1', 20);
INSERT INTO Escuela( detalle, numero, idFacultad)
 VALUES ( 'Ingeniería de Software', '2', 20);


-- ========================================
-- Comida (idComida,detalle,raciones)
-- ========================================
-- TRUNCATE TABLE Comida;
INSERT INTO Comida(idComida,detalle,raciones)
 VALUES (1,'Desayuno',100);
INSERT INTO Comida (idComida,detalle,raciones)
 VALUES (2,'Almuerzo',2500);
INSERT INTO Comida (idComida,detalle,raciones)
 VALUES (3,'Cena',1000);

INSERT INTO ComidaNivel (idComida,nivel)
 VALUES (1,1);
INSERT INTO ComidaNivel (idComida,nivel)
 VALUES (2,1);
INSERT INTO ComidaNivel (idComida,nivel)
 VALUES (2,2);
INSERT INTO ComidaNivel (idComida,nivel)
 VALUES (3,1);


-- ========================================
-- Turno (idTurno,hora_inicio,hora_fin,numero)
-- ========================================
-- TRUNCATE TABLE Turno;
INSERT INTO Turno (idTurno,idComida,hora_inicio,hora_fin,numero)
 VALUES (1,2,'12:00:00','12:19:00',1);
INSERT INTO Turno (idTurno,idComida,hora_inicio,hora_fin,numero)
 VALUES (2,2,'12:20:00','12:39:00',2);
INSERT INTO Turno (idTurno,idComida,hora_inicio,hora_fin,numero)
 VALUES (3,2,'12:40:00','12:59:00',3);
INSERT INTO Turno (idTurno,idComida,hora_inicio,hora_fin,numero)
 VALUES (4,2,'13:00:00','13:19:00',4);
INSERT INTO Turno (idTurno,idComida,hora_inicio,hora_fin,numero)
 VALUES (5,2,'13:20:00','13:39:00',5);

INSERT INTO Turno (idTurno,idComida,hora_inicio,hora_fin,numero)
 VALUES (6,3,'17:00:00','17:29:00',1);
INSERT INTO Turno (idTurno,idComida,hora_inicio,hora_fin,numero)
 VALUES (7,3,'17:30:00','17:59:00',2);



-- ========================================
-- Plato ( detalle,tipo,energia,proteinas,hierro)
-- ========================================
-- TRUNCATE TABLE Plato;
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Sopa sustancia','E',201,4.5,0.4);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Caldillo de huevos','E',350,10.3,3.6);
 
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Sopa de Pescado','E',400,12.5,4.0);
 
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Sopa de Casa','E',300,10.2,2.6);
 
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Sopa a la minuta','E',350,9.5,2.5);
 
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Sopa de moron','E',420,12.5,3.6);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Arroz con Garbanzos guisados','S',201,4.5,0.4);
 
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Arroz chaufa','S',320,20.5,5.6);
 
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Arroz pallares guisados','S',400,23.6,5.4);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Tallarin rojo con pollo','S',320,24.7,4.2);
 
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Guiso de quinua','S',430,26.5,3.8);
 
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Carapulcra con cerdo','S',410,27.8,3.2);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Refresco de cocona','R',201,4.5,0.4);
 
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Refrezco de manzana','R',150,3.5,0.3);
 
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Refresco de pina','R',170,3.7,0.2);
  
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Refresco de membrillo','R',180,4.3,0.3);
  
INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Refresco de carambola','R',160,4.0,0.1);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Refresco de maracuya','R',190,1.2,0.2);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Avena con Manzana','B',201,4.5,0.4);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Avena con Membrillo','B',198,5.4,0.4);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Avena con Chocolate','B',250,4.3,0.6);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Quinua con pina','B',240,3.5,0.7);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Ponche de Habas','B',210,2.5,0.6);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Quinua con leche','B',200,2.5,0.8);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Pan con queso fresco','P',201,4.5,0.4);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Pan con camote','P',198,4.0,0.8);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Pan con aceituna','P',200,3.0,0.6);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Pan con mermelada','P',200,4.0,0.4);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Pan con manjar blanco','P',250,3.0,0.6);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Pan con pate','P',170,3.0,0.8);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Fruta','F',201,4.5,0.4);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Manzana','F',59,0.5,0.3);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('platano','F',105,1.3,0.6);

INSERT INTO Plato (detalle,tipo,energia,proteinas,hierro)
 VALUES ('Mandarina','F',45,0.6,0.3);



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


