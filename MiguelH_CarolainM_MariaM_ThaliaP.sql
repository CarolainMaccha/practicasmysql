
/*Uso database*/
drop database if exists Despedidas;
create database Despedidas;
use Despedidas;
/*crear tabla de nombre "Packs"*/
create table Packs(
    nombrePack varchar(20) not null primary key,
    rango  enum( 'economico' , 'standard' , 'deluxe','deluxe ++','premium')not null,
    precio decimal(6,2)not null
    );
/*crear tabla de nombre "Actividades"*/
create table Actividades(
    nombreActividades varchar(20) not null primary key,
    categoria  enum( 'deportes' , 'gastronomicas','espectaculos','relajación')not null
    );
/*crear tabla de nombre "Destino"*/
create table Destino(
    nombreDestino varchar(20) not null primary key,
    clima  enum('calido','frio','tropical','templado')not null
    );

/*crear tabla de nombre "Clientes"*/
create table Clientes(
    DNI varchar(9) not null primary key,
    nombreCliente varchar(10)not null,
    telefono numeric(9)not null
    );
/*crear tabla de nombre "Compran"*/
create table Compran(
    DNI varchar(9) not null,
    nombrePack varchar(20)not null,
    valoraciones numeric(2)check (valoraciones BETWEEN 1 AND 10),
    Fecha_compra date default"2022-06-26",
    Fecha_viaje date default"2022-06-26",
    constraint FK_DNI_CLIENTE foreign key (DNI) references Clientes(DNI)on delete cascade on update cascade,
    constraint FK_NOMBRE_PACK_COMPRADO foreign key (nombrePack) references Packs(nombrePack)on delete cascade on update   cascade,
    primary key(DNI,nombrePack)
    );
/*crear tabla de nombre "Contiene"*/
create table Contiene(
    nombre_incluido varchar(15) not null primary key,
    nombre_incluidor varchar(15)not null,
    constraint FK_NOMBRE_INCLUIDO foreign key (nombre_incluido) references Packs(nombrePack)on delete cascade on update   cascade,
constraint FK_NOMBRE_INCLUIDOR foreign key (nombre_incluidor) references Packs(nombrePack)on delete cascade on update   cascade
    );
/*crear tabla de nombre "Tiene"*/
create table Tiene(
    nombrePack varchar(20)not null,
    nombreActividades varchar(20) not null,
    constraint FK_NOMBRE_PACK_PERTENECE foreign key (nombrePack) references Packs(nombrePack)on delete cascade on update   cascade,
    constraint FK_NOMBRE_ACTIVIDADES foreign key (nombreActividades) references Actividades(nombreActividades)on delete cascade on update   cascade,
    primary key(nombreActividades,nombrePack)
    );
/*crear tabla de nombre "Personal"*/
create table Personal(
    nombreEmpleado varchar(20) not null,
    DNI varchar(9) not null primary key,
    seguridadSocial varchar(12)not null unique
    );
/*crear tabla de nombre "Dirigido_por"*/
create table Dirigido_por(
    DNI varchar(9) not null,
    nombreActividades varchar(20) not null,
    primary key(DNI,nombreActividades),
 constraint FK_EMPLEADO_DIRIGE foreign key (DNI) references Personal(DNI)on delete cascade on update   cascade,
 constraint FK_NOMBRE_ACTIVIDADES_DIRIGIDAS foreign key (nombreActividades) references Actividades(nombreActividades)on delete cascade on update   cascade  
    );
/*crear tabla de nombre "Transporte"*/
create table Transporte(
    ID numeric(6) not null primary key,
    empresa varchar(15) not null,
    tipo enum('viaje','local')not null,
    vehiculo enum( 'autobus' , 'avion' , 'tren','barco','limusina','coche','taxi')not null   
    );
/*crear tabla de nombre "Viaja"*/
create table Viaja(
    nombrePack varchar(20)not null,
    ID numeric(6) not null,
    nombreDestino varchar(20) not null,
    primary key(nombrePack,ID,nombreDestino),
    constraint FK_NOMBRE_PACK_VIAJA foreign key (nombrePack) references Packs(nombrePack)on delete cascade on update   cascade,
    constraint FK_ID_TRANSPORTE foreign key (ID) references Transporte(ID)on delete cascade on update   cascade
    );

/*crear tabla de nombre "Hoteles"*/
create table Hoteles(
    nombreHotel varchar(15)not null primary key,
    telefono numeric(9)not null,
    direccion varchar(40)not null,
    nombreDestino varchar(20)not null,
    constraint FK_DESTINO foreign key(nombreDestino)references Destino(nombreDestino)on delete cascade on update cascade
    );





    
