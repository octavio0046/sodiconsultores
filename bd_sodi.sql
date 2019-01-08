CREATE DATABASE BD_SODI_CONSULTORES;
USE BD_SODI_CONSULTORES;

DROP DATABASE SODI_CONSULTORES;



create table tb_enlaces(
id_enlace int auto_increment,
nombre_enlace varchar(50),
link varchar(100),
primary key (id_enlace)
);

drop table tb_enlaces;

insert into tb_enlaces values(default,'facebook','www.octavio.facebook.com');
insert into tb_enlaces values(default,'instagram','octavioherrera');


create table tb_estudios (
id_estudio int auto_increment,
nombre_nivel_estudio varchar(50),
primary key (id_estudio)
);

create table tb_formaciones(
id_formacion int auto_increment,
nombre_formacion varchar(50),
primary key (id_formacion)
);


create table tb_campos(
id_campo int auto_increment,
nombre_campo varchar(50),
primary key(id_campo)
);

create table tb_estados(
id_estado int auto_increment,
nombre_estado varchar(50),
fecha_colocacion varchar(50),
primary key (id_estado)
);

create table tb_info(
id_info int auto_increment,
num_empleos int,
duracion_promedio varchar(50),
primary key (id_info)
);


create table tb_usuario_cliente(
id_usu_clie int ,
correo  varchar(50),
contrasena varchar (50),
fecha_creacion varchar(50),
estado int ,
primary key (id_usu_clie) 
);

drop table tb_usuario_cliente;
drop table tb_clientes;

DELIMITER &&
CREATE PROCEDURE insertar_usuario_cliente (inout cod int,
correo varchar(50),contrasena varchar(50))
BEGIN
select ifnull(max(id_usu_clie),0)+1 into cod from tb_usuario_cliente;
INSERT INTO tb_usuario_cliente VALUES(cod,correo,contrasena,now(),1);
insert into tb_clientes values(cod,cod,'null','null','null','null','null',0,'null'
,'null','null','null',0,0,0,'null','null','null','null',1);
END&&

drop procedure insertar_usuario_cliente;

select * from tb_clientes;
SELECT * from tb_usuario_cliente;

set @id:=0;
call insertar_usuario_cliente(@id,'asdf','afsd');
select @id;



create table tb_clientes(
id_cliente int ,
id_usu_clie int not null,
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
primary key (id_cliente),
foreign key (id_usu_clie) references tb_usuario_cliente(id_usu_clie)
);

DELIMITER &&
CREATE PROCEDURE insertar_cliente (id_cliente int ,nombre_usuario varchar(50),id_usu_clie int,
nombre1 varchar(50),nombre2 varchar(50),apellido1 varchar(50),apellido2 varchar(50),
nacimiento varchar(50),edad varchar(50),pais varchar(50),departamento varchar(50),
recidencia varchar(50),direccion varchar(50),tel1 int,tel2 int,recidencial int,
correo varchar(50))
BEGIN
INSERT INTO tb_clientes VALUES(id_cliente,id_usu_clie,nombre1,nombre2 ,
apellido1,apellido2,nacimiento,edad,pais,departamento,recidencia,direccion,
tel1,tel2 ,recidencial ,correo,now(),'aun no',nombre_usuario,1);
END&&

DELIMITER &&
CREATE PROCEDURE actualizar_cliente (id int ,
nombre1 varchar(50),nombre2 varchar(50),apellido1 varchar(50),apellido2 varchar(50),
nacimiento varchar(50),edad varchar(50),pais varchar(50),departamento varchar(50),
recidencia varchar(50),direccion varchar(50),tel1 int,tel2 int,recidencial int,
correo varchar(50),nombre_usuario varchar(50),estado int)
BEGIN
update tb_clientes set 
nombre1=nombre1,
nombre2=nombre2 ,
apellido1=apellido1,
apellido2=apellido2,
nacimiento=nacimiento,
edad=edad,
pais=pais,
departamento=departamento,
recidencia=recidencia,
direccion=direccion,
tel1=tel1,
tel2=tel2 ,
recidencial=recidencial2 ,
correo=correo,
nombre_usuario=nombre_usuario,
estado=estado where id=id_cliente;
END&&

select * from tb_clientes ;
select  * from tb_clientes where id_cliente=17;


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
); 



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


INSERT INTO TB_USUARIOS VALUES (DEFAULT,'HERRERA','OCTAVIO','HUEHUE','EMPRESARIAL','OCTAVIO@GMAIL.COM','ABC','2018-09-24 21:55:34','ACTIVO');
INSERT INTO TB_USUARIOS VALUES (DEFAULT,'HERRERA','OCTAVIO','HUEHUE','ADMIN','OCTAVIO@GMAIL.COM','ABC.123','2018-09-24 21:55:34','ACTIVO');
