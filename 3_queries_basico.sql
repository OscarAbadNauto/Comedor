-- ========================================
-- Consultas (Queries): Aqui estan las consultas mas frecuentes y
--  tambien se usa como unidad de testeo
-- ========================================

SELECT * FROM facultad;


/*======================
-- Todas las escuelas y a que facultad pertenecen
  ====================*/
SELECT e.idescuela, e.NUMERO, e.detalle, e.idFacultad, f.DETALLE as Facultad
 FROM Escuela e
      JOIN Facultad f ON (e.idFacultad = f.idFacultad);



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





/*======================
-- Todos los turnos y a que comida pertenecen
  ====================*/
SELECT t.idTurno,concat('Turno ',t.numero) AS turno,t.hora_inicio AS inicio,
	    t.hora_fin AS fin,c.detalle as comida
 FROM TURNO t
      JOIN COMIDA c ON (t.idComida= c.idComida)
 ORDER BY c.detalle,t.numero;
 
 

SELECT * FROM PLATO;

SELECT * FROM ENTRADA;
SELECT * FROM SEGUNDO;
SELECT * FROM Refresco;
-- Fruta es idPlato = 31


SELECT * FROM BebidaCaliente;
SELECT * FROM Pan;




