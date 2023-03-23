/*usar database*/
use prueba;
------------------------------------------------------------------
/*crear tabla de nombre "Persona"*/
create table Persona(
    nombre varchar(15) not null,
    apellido1 varchar(15)not null,
    apellido2 varchar(15)null
    );
------------------------------------------------------------------
/*insertar datos*/
insert into Persona values("Pepe","Perez","Perez");

------------------------------------------------------------------
/*ver tabla*/
select * from Persona;
------------------------------------------------------------------
/*eliminar tabla database*/
drop table blabla;
drop database blabla;
----------------------------------------------------------------
/*crear tabla de nombre "Tab1" **NOT NULL Y NULL**/
create table Tab1(
   a int not null,
   b int null
    );
/*insertar datos*/
insert into Tab1 values(4,5);
insert into Tab1 values(14,15);
insert into Tab1 values(1,null);
----------------------------------------------------------------
/*ver como se creo la tabla "Tab1"*/
show create table Tab1;
----------------------------------------------------------------
/*ver la descripción de las filas de la tabla"Tab1"*/
desc Tab1;
----------------------------------------------------------------
/*crear tabla de nombre "Tab2"**DEFAULT SIN NULL*/
create table Tab2(
   a int ,
   b date default"2020-02-02"
    );
/*insertar datos*/
insert into Tab2 values(4,"2022-11-02");
insert into Tab2(a) values(7); //insertar valor al campo a
insert into Tab2(b) values("2022-10-01");//insertar valor al campo b
insert into Tab2 values(2,null);//por defecto admite nulo
----------------------------------------------------------------
/*crear tabla de nombre "Tab3" **DEFAULT CON NOT NULL**/
create table Tab3(
   a int ,
   b date default"2020-02-02" not null
    );
//insertar datos
insert into Tab3 values(1,"2022-11-02");
insert into Tab3(a) values(4); //insertar valor al campo a
insert into Tab3(b) values("2022-10-01");//insertar valor al campo b
insert into Tab3 values(2,null);//no puede ser nulo aunque sea por defecto.
----------------------------------------------------------------
/*crear tabla de nombre "Tab4" **CLAVE PRIMARIA**/
create table Tab4(
   a int primary key,
   b int ,
   c int
    );
//insertar datos
insert into Tab4 values(1,1,1);
insert into Tab4 values(2,2,2);//aqui esta el 2 que es PK
insert into Tab4 values(2,3,3);//solo hay error en este ya que 2 se repite y es PRIMARY KEY.
insert into Tab4 values(3,2,3);
insert into Tab4 values(4,2,2);
----------------------------------------------------------------
/*crear tabla de nombre "Tab5"  **CLAVE PRIMARIA COMPUESTA**/
create table Tab5(
   a int ,
   b int ,
   c int ,
     primary key(a,b)
    );
insert into Tab5 values(1,1,1);
insert into Tab5 values(2,2,2);//puede coincidir un pk
insert into Tab5 values(2,3,3);//puede coincidir un pk
insert into Tab5 values(3,2,3);
insert into Tab5 values(4,2,2);
insert into Tab5 values(4,2,5);//no puede coincidir los dos pk. seria duplicar pk
insert into Tab5 values(4,null,5);//una pk no puede ser null
----------------------------------------------------------------
/*crear tabla de nombre "Tab6" **una pk y un unique**/
create table Tab6(
   a int primary key,
   b int unique ,
   c int
    );
/*insertar datos*/
insert into Tab6 values(1,1,1);
insert into Tab6 values(2,2,2);//aqui esta la pk a 2 y la b 2 unica
insert into Tab6 values(2,3,3);//no puedo insertar ya que la a es pk y ya esta el 2 .
insert into Tab6 values(3,2,3);//no puedo insertar ya que la b es unica y ya esta el 2.
insert into Tab6 values(6,null,3);//detro del unique hay nulos.
----------------------------------------------------------------
/*crear tabla de nombre "Tab7" **unique compuesta y pk**/
create table Tab7(
   a int primary key,
   b int ,
   c int ,
    unique(b,c)
    );
/*insertar datos*/
insert into Tab7 values(1,1,1);
insert into Tab7 values(2,2,2);
insert into Tab7 values(2,3,3);//pk duplicada 2
insert into Tab7 values(3,2,3);
insert into Tab7 values(4,2,2);//se duplica unique 2-2
insert into Tab7 values(4,2,5);
insert into Tab7 values(5,null,5);//unique admite null
----------------------------------------------------------------
/*crear tabla de nombre "Tab8" **no cumple forma boyce-codd**/
create table Tab8(
   a int ,
   b int ,
   c int ,
    primary key(a,b),
    unique(b,c)
    );
*********3.3 RESTRICCIONES DE CLAVE AJENA***************************
/*Eliminar database*/
drop database if exists ejercicio1;












