/*usar database*/
drop database if exists Empresa;
create database Empresa;
use Empresa;
/******tabla Empleado*********/
create table Empleado(
   cod_e  varchar(10)primary key,
   nombre varchar (30),
   cod_d  varchar(10),
   fecha_incorporacion date
    );
/******tabla Esjefe*********/
create table Esjefe(
   cod_e varchar(10),
   cod_jefe varchar(10),
   foreign key(cod_e)references Empleado(cod_e)on delete cascade on update cascade,
   foreign key(cod_jefe)references Empleado(cod_e)on delete cascade on update cascade,
   primary key(cod_e)
    );
/******tabla Proyecto*********/
create table Proyecto(
   Cod_p varchar(10)primary key
    );
/******tabla Emp_Proy*********/
create table Emp_Proy(
   cod_e varchar(10),
   cod_p varchar(10),
   foreign key(cod_e)references Empleado(cod_e)on delete cascade on update cascade,
   foreign key(cod_p)references Proyecto(cod_p)on delete cascade on update cascade,
   primary key(cod_e,cod_p)
    );
/*****tabla Departamento*********/
   create table Departamento(
   cod_d varchar(10) primary key,
   nombre varchar (30),
   responsable varchar(30),
   foreign key(responsable)references Empleado(cod_e)on delete set null on update cascade,
   unique(responsable)
    );
/*****Añadir FK a la tabla Empleado**/
   alter table Empleado add foreign key(cod_d)references Departamento(cod_d)on delete set null on update cascade;
/*INSERTAR VALORES*/
insert into Empleado values("00001","Juan Carlos Pérez",NULL,"2005-06-15");
insert into Departamento values("D001","Dirección",NULL);
update Empleado SET cod_d="D001" WHERE cod_e="00001";


insert into Departamento values("D002","Ventas",NULL);
insert into Departamento values("D003","Compras",NULL);

insert into Empleado values("00002","Juana Benito Bermúdez","D001","2005-06-15");
insert into Empleado values("00003","Ana Benito Bermúdez","D002","2005-09-12");
insert into Empleado values("00004","José Losada Gato","D003","2005-09-22");
insert into Empleado values("00005","Marina Villaoslada Suárez","D002","2008-01-29");
insert into Empleado values("00006","Juan García Garcés","D002","2018-10-05");


insert into Esjefe values("00002","00001");
insert into Esjefe values("00003","00001");
insert into Esjefe values("00004","00002");
insert into Esjefe values("00005","00002");
insert into Esjefe values("00006","00002");

insert into Proyecto values("AL-01");
insert into Proyecto values("AL-21");
insert into Proyecto values("XP-01");

insert into Emp_Proy values("00002","AL-01");
insert into Emp_Proy values("00005","AL-01");
insert into Emp_Proy values("00006","AL-01");
insert into Emp_Proy values("00003","AL-21");
insert into Emp_Proy values("00002","XP-01");
insert into Emp_Proy values("00004","XP-01");








