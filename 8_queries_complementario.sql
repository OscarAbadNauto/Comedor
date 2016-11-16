-- ========================================
-- Consultas (Queries): Aqui estan las consultas mas frecuentes y
--  tambien se usa como unidad de testeo
-- ========================================

SELECT * FROM ALUMNO;
SELECT * FROM ADMINISTRADOR;


call p_login_admin('ROOT','ROOT');
call p_login_admin('SYS','SYS');


call p_login('14200180','letmein1234');
call p_login('14200198','letmein1234');
call p_login('11200169','batmanxd1234');
call p_login('14200212','batmanxd1234');
call p_login('12200056','batmanxd1234');



call p_activar_alumno('33063326','01234567','32');
select * from alumno;
 
 
 
select p.idprogramacion,c.detalle,p.fecha,p.contador
 from programacion p join comida c
 on (p.idComida=c.idComida)
 order by p.idprogramacion;

select p.idprogramacion,c.detalle,p.fecha,p.contador
 from programacion p join comida c
 on (p.idComida=c.idComida)
 order by p.idComida,p.idProgramacion;


select * from contador;
 


select * from programacion where fecha='2016-11-28' and idComida=3;


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



call p_todoslosplatos();

call p_platos_por_tipo('S');



call p_platos_por_detalle('rojo');

call p_buscar_tipo_y_detalle('S','Arroz');

call p_listar_platos_de_programacion('2016-11-05',1);
call p_listar_platos_de_programacion('2016-11-05',2);
call p_listar_platos_de_programacion('2016-11-05',3);

call p_listar_platos_de_programacion('2016-11-06',1);
call p_listar_platos_de_programacion('2016-11-06',2);
call p_listar_platos_de_programacion('2016-11-06',3);

call p_listar_platos_de_programacion('2016-11-07',1);
call p_listar_platos_de_programacion('2016-11-07',2);
call p_listar_platos_de_programacion('2016-11-07',3);


call p_listar_platos_de_programacion('2016-11-28',3);

