CREATE DATABASE BD_SODI_CONSULTORES;
USE BD_SODI_CONSULTORES;

DROP DATABASE BD_SODI_CONSULTORES;

CREATE TABLE TB_USUARIOS (
  COD_USUARIO INT AUTO_INCREMENT,
  APELLIDO_USUARIO varchar(30) DEFAULT NULL,
  NOMBRE_USUARIO varchar(30) DEFAULT NULL,
  PAIS varchar(50) DEFAULT NULL,
  PERFIL varchar(30) DEFAULT NULL,
  CORREO varchar(50) DEFAULT NULL,
  CLAVE_USUARIO varchar(20) DEFAULT NULL,
  FECHA_CREACION varchar(20) DEFAULT NULL,
  ESTADO varchar(10) DEFAULT NULL,
  PRIMARY KEY (COD_USUARIO)
);&& 

DELIMITER &&
CREATE PROCEDURE INSERTAR_USUARIOS (
  APELLIDO_USUARIO varchar(30) ,NOMBRE_USUARIO varchar(30) ,PAIS varchar(50) ,
PERFIL varchar(30) ,CORREO varchar(50) ,CLAVE_USUARIO varchar(20) ,
  ESTADO varchar(10))
  BEGIN
  INSERT INTO TB_USUARIOS VALUES(DEFAULT,APELLIDO_USUARIO  ,NOMBRE_USUARIO  ,PAIS ,
  PERFIL ,CORREO  ,CLAVE_USUARIO  ,
  now()  ,ESTADO );
  END&&


DELIMITER &&
CREATE PROCEDURE ACTUALIZAR_USUARIO (  _COD_USUARIO INT,
  _APELLIDO_USUARIO varchar(30) ,_NOMBRE_USUARIO varchar(30) ,_PAIS varchar(50) ,
_PERFIL varchar(30) ,_CORREO varchar(50) ,_CLAVE_USUARIO varchar(20) ,_FECHA_CREACION VARCHAR(100),
  _ESTADO varchar(10))
  BEGIN
  UPDATE TB_USUARIOS SET   APELLIDO_USUARIO= _APELLIDO_USUARIO  ,NOMBRE_USUARIO=_NOMBRE_USUARIO  ,PAIS=_PAIS  ,
PERFIL=_PERFIL ,CORREO=_CORREO  ,CLAVE_USUARIO=_CLAVE_USUARIO,FECHA_CREACION=_FECHA_CREACION  ,ESTADO=_ESTADO WHERE COD_USUARIO=_COD_USUARIO;
  END&&


DELIMITER &&
CREATE PROCEDURE ELIMINAR_USUARIOS (_COD_USUARIO int)
BEGIN 
UPDATE TB_USUARIOS SET ESTADO='INACTIVO' WHERE COD_USUARIO=_COD_USUARIO;
END&&


INSERT INTO TB_USUARIOS VALUES (DEFAULT,'HERRERA','OCTAVIO','HUEHUE','ADMIN','OCTAVIO@GMAIL.COM','ABC.123','2018-09-24 21:55:34','ACTIVO');&&

INSERT INTO TB_USUARIOS VALUES (DEFAULT,'CONSULOR','sodi001','HUEHUE','ADMIN','sodiconsultores@gmail.com','sodi001','2018-09-24 21:55:34','ACTIVO');&&

SELECT * FROM TB_USUARIOS WHERE NOMBRE_USUARIO = 'OCTAVIO' AND CLAVE_USUARIO = 'ABC.123';

drop procedure insertar_usuario_cliente;
set @id:=0;
call insertar_usuario_cliente(@id,'asdf','afsd');
select @id;


create table tb_clientes(
id_cliente int ,
nombre1 varchar(50),
nombre2 varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
nacimiento varchar(50),
edad varchar(50),
pais varchar(50),
departamento varchar(50),
recidencia varchar(50),
direccion varchar(50),
tel1 int,
tel2 int,
recidencial int,
correo varchar(50),
fechaRegistro varchar(50),
fecha_final varchar(50),
nombre_usuario varchar(50),
estado int,
genero varchar(20),
primary key (id_cliente)
);

drop table tb_clientes;

DELIMITER &&
CREATE PROCEDURE insertar_cliente(inout cod int)
begin
select ifnull(max(id_cliente),0)+1 into cod from tb_clientes;
insert into tb_clientes values(cod,'Primer Nombre','Segundo Nombre','Primer Apellido',
'segundo apellido','Nacimiento',0,'pais'
,'Departamento','recidencia','direccion',0,0,0,'correo',now(),'','',1,'');
insert into tb_estudios values(cod,'NINGUNO','NINGUNO','NINGUNO');
insert into tb_info values(cod,0,0);
insert into tb_enlaces values(cod,'Facebook','');
insert into tb_enlaces values(cod,'Instagram','');
insert into tb_enlaces values(cod,'LinkIn','');
insert into tb_enlaces values(cod,'otro','');
insert into tb_estados values(cod,'','','','','');
insert into tb_pdf values(cod,'','');
END&&


drop procedure insertar_cliente;
drop procedure actualizar_cliente;
select * from tb_clientes;

DELIMITER &&
CREATE PROCEDURE actualizar_cliente (
id int ,
nom1 varchar(50),
nom2 varchar(50),
ape1 varchar(50),
ape2 varchar(50),
naci varchar(50),
ed varchar(50),
pa varchar(50),
dep varchar(50),
reci varchar(50),
dire varchar(50),
te1 int,te2 int,recide int,
corre varchar(50),
nombre_usu varchar(50),
es int,
gen varchar(20))
BEGIN
update tb_clientes set 
nombre1=nom1,
nombre2=nom2 ,
apellido1=ape1,
apellido2=ape2,
nacimiento=naci,
edad=ed,
pais=pa,
departamento=dep,
recidencia=reci,
direccion=dire,
tel1=te1,
tel2=te2 ,
recidencial=recide ,
correo=corre,
nombre_usuario=nombre_usu,
genero=gen,
estado=es where id_cliente=id;
END&&



create table tb_estudios (
id_cliente int not null,
nombre_nivel_estudio varchar(50),
nombre_formacion varchar(50),
nombre_campo_estudio varchar(50),
foreign key (id_cliente) references tb_clientes(id_cliente)
);


DELIMITER &&
CREATE PROCEDURE actualizar_estudio (id int,nombre varchar(50),formacion varchar(50)
,campo_estudio varchar(50))
BEGIN
update tb_estudios set 
nombre_nivel_estudio =nombre ,
nombre_formacion=formacion,
nombre_campo_estudio=campo_estudio
where id_cliente=id;
END&&






create table tb_info(
id_cliente int not null,
num_empleos int,
duracion_promedio int,
foreign key (id_cliente) references tb_clientes(id_cliente)
);&&
  
 
 DELIMITER &&
CREATE PROCEDURE actualizar_info (id int,num int,duracion int)
BEGIN
update tb_info set 
num_empleos=num,
duracion_promedio=duracion
where id_cliente=id;
END&&
 
 

create table tb_enlaces(
id_cliente int not null,
nombre_enlace varchar(50),
link varchar(250),
foreign key (id_cliente) references tb_clientes (id_cliente)
);&&




DELIMITER &&
CREATE PROCEDURE actualizar_enlace (id int,nombre varchar(50),lin varchar(250))
BEGIN
update tb_enlaces set link=lin where id_cliente=id and  nombre_enlace=nombre;
END&&

create table tb_estados(
id_cliente int auto_increment,
nombre_estado varchar(50),
estatus_actual varchar(50),
fecha_colocacion varchar(50),
entrevista varchar(50),
prueba_psico varchar(50),
primary key (id_cliente)
);&&


DELIMITER &&
CREATE PROCEDURE actualizar_estado (id int,nombre_es varchar(50),estatus_act varchar(50),
fecha varchar(50),entre varchar(50),prueba_p varchar(50))
BEGIN
update tb_estados set nombre_estado=nombre_es, estatus_actual=estatus_act,
fecha_colocacion=fecha,entrevista=entre,prueba_psico=prueba_p where id_cliente=id;
END&&

CREATE TABLE tb_pdf (
  id_cliente int not null,
  nombrepdf varchar(50),
  archivopdf mediumblob,
  PRIMARY KEY (id_cliente)
);&&


DELIMITER &&
CREATE PROCEDURE actualizar_pdf (cod int,nombre varchar(50),archivo mediumblob)
BEGIN
update tb_pdf set  nombrepdf=nombre, archivopdf=archivo where id_cliente =cod;
END&&


select * from tb_estudios;
select * from tb_clientes;
select * from tb_info;
select * from tb_enlaces;
select * from tb_estados;
select * from tb_pdf;

drop table tb_estudios;
drop table tb_clientes;
drop table tb_info;
drop table tb_enlaces;
drop table tb_estados;
drop table tb_pdf;

delete from tb_pdf where id_cliente=1;
DELETE FROM tb_estados where id_cliente=1;
delete from tb_info where id_cliente=1;
delete from tb_estudios where id_cliente=1;
delete from tb_enlaces where id_cliente=1;
delete from tb_clientes where id_cliente=1;




drop procedure BusquedaCompleja;
call BusquedaCompleja('MASCULINO',0,'','HUEHUETENANGO','');


select a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,a.correo,a.fechaRegistro
 from tb_clientes a,tb_estudios b
where nombre_nivel_estudio='UNIVERSITARIO' and a.id_cliente=b.id_cliente;

select * from tb_estudios;
select * from tb_clientes;
select * from tb_estados;



DELIMITER &&
CREATE PROCEDURE BusquedaCompleja(gene varchar(50),eda int,resi varchar(50),
nivel varchar(50),carrera varchar(50),estado varchar(50))
BEGIN
if (gene='' and eda=0 and resi='' and nivel='' and carrera='') then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and eda=0 and resi='' and nivel='' and estado='') then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  b.nombre_formacion=carrera and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and eda=0 and resi='' and nivel='') then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  b.nombre_formacion=carrera and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and eda=0 and resi='' and carrera='') then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  b.nombre_nivel_estudio=nivel and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and eda=0 and resi='' and estado='') then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where b.nombre_formacion=carrera and b.nombre_nivel_estudio=nivel and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and eda=0 and resi='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where b.nombre_formacion=carrera and b.nombre_nivel_estudio=nivel and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and eda=0 and nivel='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.recidencia=resi and b.nombre_formacion=carrera  and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and eda=0 and carrera='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.recidencia=resi and b.nombre_nivel_estudio=nivel  and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and eda=0 and estado='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.recidencia=resi and b.nombre_nivel_estudio=nivel  and b.nombre_formacion=carrera  and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (carrera='' and estado='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.edad=eda and a.recidencia=resi and b.nombre_nivel_estudio=nivel   and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (nivel='' and carrera='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  a.genero=gene and a.edad=eda and a.recidencia=resi and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (nivel='' and estado='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.edad=eda and a.recidencia=resi and b.nombre_formacion=carrera and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (resi='' and  nivel='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  a.genero=gene and a.edad=eda and b.nombre_formacion=carrera and c.nombre_estado=estado  and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (resi='' and  carrera='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  a.genero=gene and a.edad=eda and b.nombre_nivel_estudio=nivel  and c.nombre_estado=estado  and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (resi='' and  estado='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.edad=eda and b.nombre_nivel_estudio=nivel 
and b.nombre_formacion=carrera and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (eda=0 and  resi='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and b.nombre_nivel_estudio=nivel 
and b.nombre_formacion=carrera and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (eda=0 and  nivel='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  a.genero=gene and a.recidencia=resi and b.nombre_formacion=carrera and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (eda=0 and  carrera='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.recidencia=resi and b.nombre_nivel_estudio=nivel and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (eda=0 and  estado='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.recidencia=resi and b.nombre_nivel_estudio=nivel and b.nombre_formacion=carrera and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and  eda=0 ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.recidencia=resi and b.nombre_nivel_estudio=nivel 
and b.nombre_formacion=carrera and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and  resi='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  a.edad=eda and b.nombre_nivel_estudio=nivel 
and b.nombre_formacion=carrera and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and  nivel='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  a.edad=eda and a.recidencia=resi and b.nombre_formacion=carrera and c.nombre_estado=estado and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and  carrera='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  a.edad=eda and a.recidencia=resi and b.nombre_nivel_estudio=nivel and c.nombre_estado=estado
 and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' and  estado='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where  a.edad=eda and a.recidencia=resi and b.nombre_nivel_estudio=nivel and b.nombre_formacion=carrera
 and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (gene='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.edad=eda and a.recidencia=resi and b.nombre_nivel_estudio=nivel 
and b.nombre_formacion=carrera and c.nombre_estado=estado 
 and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (eda=0 ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.recidencia=resi and b.nombre_nivel_estudio=nivel 
and b.nombre_formacion=carrera and c.nombre_estado=estado 
 and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (resi='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.edad=eda and b.nombre_nivel_estudio=nivel 
and b.nombre_formacion=carrera and c.nombre_estado=estado 
 and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (nivel='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.edad=eda and a.recidencia=resi and b.nombre_formacion=carrera and c.nombre_estado=estado 
 and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
elseif (carrera='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.edad=eda and a.recidencia=resi and b.nombre_nivel_estudio=nivel and c.nombre_estado=estado 
 and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
 
elseif (estado='' ) then
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,b.nombre_formacion,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.edad=eda and a.recidencia=resi and b.nombre_nivel_estudio=nivel 
and b.nombre_formacion=carrera
 and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;

else
select a.id_cliente,a.nombre1 ,a.apellido1,a.edad, a.recidencia,b.nombre_nivel_estudio,c.nombre_estado
 from tb_clientes a,tb_estudios b, tb_estados c
where a.genero=gene and a.edad=eda and a.recidencia=resi and b.nombre_nivel_estudio=nivel 
and b.nombre_formacion=carrera and c.nombre_estado=estado 
and a.id_cliente=b.id_cliente and a.id_cliente=c.id_cliente;
END IF;
END&&

drop procedure BusquedaCompleja;
call BusquedaCompleja('MASCULINO',24,'HUEHUETENANGO','UNIVERSITARIO','','DESEMPLEADO');

SELECT * FROM tb_clientes;