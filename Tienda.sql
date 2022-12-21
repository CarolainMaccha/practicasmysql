/*usar database*/
drop database if exists TIENDA;
create database TIENDA;
use TIENDA;
/******tabla COMPRADORES*********/
create table COMPRADORES(
   CIF_comprador varchar(11)primary key,
   Nombre_social varchar(30),
   Domicilio_social varchar(30),
   Localidad varchar(30),
   C_postal varchar(5),
   Telefono varchar(9) not null,
   constraint UQ_COMPRADORES_NOMBRE_SOCIAL unique(Nombre_social)
    );
/******tabla ARTICULOS*********/
create table ARTICULOS(
   Referencia_articulo varchar(12),
   Descripcion_articulo varchar(30),
   Precio_unidad decimal(6,2),
   IVA numeric(2),//check (IVA BETWEEN 5 AND 25)
   Existencias_actuales numeric(5)default"0",
   constraint PK_ARTICULOS primary key (Referencia_articulo)
    );
/*****tabla FACTURAS*********/
create table FACTURAS(
   Num_Factura numeric(6),
   Fecha_Factura date default"2005-01-01",
   CIF_cliente varchar(11),
   constraint PK_FACTURAS primary key (Num_factura)
    );
/******tabla LINEAS_FACTURA*********/
create table LINEAS_FACTURA(
   Num_Factura numeric(6),
   Referencia_articulo varchar(12),
   Unidades numeric(3),
   primary key (Referencia_articulo,Num_Factura),
   constraint FK_LINEAS_FACTURAS foreign key (Num_Factura)references FACTURAS (Num_Factura) on delete cascade,
   constraint FK_LINEAS_ARTICULOS foreign key (Referencia_articulo) references ARTICULOS (Referencia_articulo)
    );
/*****Añadir columna a la tabla FACTURAS**/
   alter table FACTURAS add column cod_oficina numeric(4);
/*****Añadir FK a la tabla FACTURAS**/
   alter table FACTURAS add constraint FK_FACTURA_COMPRADORES foreign key(CIF_cliente)references COMPRADORES(CIF_comprador);
/**Cambiar en la tabla COMPRADORES el nombre de la columna c_postal por codigo_postal*/
   alter table COMPRADORES rename column c_postal to codigo_postal;Emp
