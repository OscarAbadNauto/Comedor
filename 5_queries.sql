-- ========================================
-- Consultas (Queries): Aqui estan las consultas mas frecuentes y
--  tambien se usa como unidad de testeo
-- ========================================



SELECT * FROM SEGUNDO WHERE DETALLE LIKE '%Arroz%';

SELECT * FROM entrada WHERE DETALLE LIKE '%Sopa%';

/*======================
-- Todas las escuelas y a que facultad pertenecen
  ====================*/
SELECT e.idescuela, e.NUMERO, e.detalle, e.idFacultad, f.DETALLE as Facultad
 FROM Escuela e
      JOIN Facultad f ON (e.idFacultad = f.idFacultad);



SELECT * FROM ALUMNO;
SELECT * FROM ADMINISTRADOR;





SELECT * FROM COMIDA;

/*======================
-- Las comidas y que niveles ofrecen (1 es solo el piso 1
-- 									2 es ambos niveles)
  ====================*/
SELECT c.idComida,c.detalle,count(n.nivel) as niveles
 FROM COMIDANIVEL n
	join comida c ON (n.idComida=c.idComida)
 group by c.idComida
 ORDER BY c.idComida;


-- SELECT * FROM TURNO;

/*======================
-- Todos los turnos y a que comida pertenecen
  ====================*/
SELECT t.idTurno,concat('Turno ',t.numero) AS turno,t.hora_inicio AS inicio,
	    t.hora_fin AS fin,c.detalle as comida
 FROM TURNO t
      JOIN COMIDA c ON (t.idComida= c.idComida)
 ORDER BY c.detalle,t.numero;
 
 
 
select * from programacion;
select * from contador;
 
 
select * from plato;
 



SELECT * FROM SEGUNDO WHERE DETALLE LIKE '%Arroz%';


/*======================
-- Formato actual de ticket
  ====================*/
select a.codigo_universitario,a.apellido_paterno,a.apellido_materno,a.nombre,
		UCASE(c.detalle),p.fecha,u.hora_inicio,u.hora_fin,
        t.nivel,u.numero,concat(t.numero,' -')
from ticket t
	JOIN alumno a ON (t.idAlumno =a.idAlumno)
    JOIN programacion p ON (p.idProgramacion=t.idProgramacion)
    JOIN comida c ON (p.idComida=c.idComida)
    JOIN turno u ON (t.idTurno=u.idTurno);







