/**usar database**/
drop database if exists Examen1819;
create database Examen1819;
use Examen1819;
/******tabla Usuario*********/
create table Usuario(
   id int auto_increment primary key,
   nombre varchar(30)not null unique,
   edad int,
   tutor int,
   insignia int,
   foreign key (tutor)references Usuario(id)
    );
/******tabla Insignia*********/
create table Insignia(
   id int auto_increment primary key,
   descripcion varchar(50) not null unique 
    );
/*****Añadir FK a la tabla Usuario**/
   alter table Usuario add foreign key (insignia)references Insignia(id);
/******tabla Tipo_Accion*********/
create table Tipo_Accion(
   id int auto_increment primary key,
   descripcion varchar(30) not null
    );
/******Accion*********/
create table Accion(
   id int auto_increment,
   dia date,
   primary key(id,dia),
   foreign key(id) references Tipo_Accion(id)
    );
/******Objetivo*********/
create table Objetivo(
   nombre varchar(20) primary key
    );
/******Hacer*********/
create table Hacer(
   usuario int not null,
   tipo_a int,
   dia_a date,
   objetivo varchar(20),
   primary key(tipo_a,dia_a,objetivo),
   foreign key(usuario)references Usuario(id),
   foreign key(tipo_a,dia_a)references Accion(id,dia),
   foreign key(objetivo) references Objetivo(nombre)
    );
/******Exito*********/
create table Exito(
   tipo_a int,
   dia_a date,
   objetivo varchar(20),
   dia_fin date,
   foreign key(tipo_a,dia_a)references Accion(id,dia),
   foreign key(objetivo)references Hacer(objetivo)
    );
/******Fracaso********/
create table Fracaso(
   tipo_a int,
   dia_a date,
   objetivo varchar(20),
   dia_fin date,
   foreign key(tipo_a,dia_a)references Accion(id,dia),
   foreign key(objetivo)references Hacer(objetivo)
    );
/****INSERCION DE DATOS******/

/*Hacer dos inserciones correctas en Insignia, Tipo_Accion y Objetivo*/
insert into Insignia values("1","bronce");
insert into Insignia values("2","cobre");
insert into Tipo_Accion values("1","juegos");
insert into Tipo_Accion values("2","practicar");
insert into Objetivo values("juegojava");
insert into Objetivo values("programarjava");


/*Hacer una inserción en Usuario sin tutor*/
insert into Usuario(id,nombre,edad,insignia) values("1","juan","20","1");

/*Hacer una inserción en Usuario sin insignia*/
insert into Usuario(id,nombre,edad,tutor) values("2","pablo","22","1");

/*Hacer dos inserciones con referencias a tutor e insignia en Usuario*/
insert into Usuario(id,nombre,edad,tutor,insignia) values("3","tomas","25","2","1");
insert into Usuario(id,nombre,edad,tutor,insignia) values("4","pedro","30","1","1");

/*Hacer dos inserciones en Tipo_Acción*/
insert into Tipo_Accion values("3","examinar");
insert into Tipo_Accion values("4","actitud");

/*Hacer dos inserciones en Acción con referencia a Tipo_Acción*/
insert into Accion values("1","2022-10-10");
insert into Accion values("2","2021-11-11");
*********************************INCOMPLETO**********************
/*Hacer una inserción en Acción con fecha nula y otra con Tipo de Accion nula.*/
insert into Accion values("3",null);//no puede ser nula ya que fecha es pk
insert into Accion values("4",null);//no puede ser nula ya que fecha es pk

insert into Accion(dia) values("2021-08-30");
insert into Accion(dia) values("2021-06-20");
***************************PORHACER***************************
/*Hacer dos inserciones en Objetivo.*/
insert into Objetivo values("00006","00002");
insert into Objetivo values("00006","00002");

/*Hacer dos inserciones en Hacer que referencien a dos acciones, usuarios y objetivos diferentes*/
insert into Hacer values("00006","00002");
insert into Hacer values("00006","00002");

/*Hacer una inserción en Exito y otra en Fracaso*/
insert into Exito values("00006","00002");
insert into Fracaso values("00006","00002");

update Empleado SET cod_d="D001" WHERE cod_e="00001";



    
