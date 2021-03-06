/*1.- El departamento de Recursos Humanos requiere crear sentencias SQL para insertar, actualizar y eliminar datos de empleados. Como prueba se utilizar� la tabla Mis_Empleados antes de remitir las sentencias al departamento de Recursos Humanos.*/

insert into HR.Mis_Empleados(id,apellidos,nombre,codigo,salario)
values (1,'lulu','mini','2016',16)
update HR.Mis_Empleados
	set apellidos='lulu'
	where id=1;

delete from HR.Mis_Empleados
where id=1 ;
	
/*2.- Crear la tabla Mis_Empleados utilizando la siguiente estructura.*/
create table HR.Mis_Empleados (
 id numeric(4) not null ,
 apellidos varchar(25) null,
 nombre varchar(25) null,
 codigo varchar(10) null,
 salario numeric(9,2) null
)
/*drop table HR.Mis_Empleados */


/*3.- Generar una sentencia de inserci�n */

insert into HR.Mis_Empleados(id,apellidos,nombre,codigo,salario)
values (1,'Vargas Canseco','Raul','Rvargas',895)

	insert into HR.Mis_Empleados(id,apellidos,nombre,codigo,salario)
	values (2,'Castro Feria ','Maria','mcastro',860)
	
/*4.- Generar un script que permita que mediante utilizaci�n de variables de sustituci�n, la inserci�n de
informaci�n en la tabla Mis_Empleados. */
insert into HR.Mis_Empleados(id,apellidos,nombre,codigo,salario)
values (&id,&apellidos,&nombre,&codigo,&salario)

/*5* Adicionar nuevos registros/
insert into HR.Mis_Empleados(id,apellidos,nombre,codigo,salario)
values (3,'Gomez Alban','Juan Pablo','Jgomez',1100)

insert into HR.Mis_Empleados(id,apellidos,nombre,codigo,salario)
values (4,'Quiroz Ardiles','Judith','Jquiroz',750)

insert into HR.Mis_Empleados(id,apellidos,nombre,codigo,salario)
values (5,'Soria Peralta','Pedro','Pasoria',1550)

/*6.- Cambios en una tabla*/


/*7.- Cambiar el nombre del empleado n� 3 a Benjam�n. */
update HR.Mis_Empleados
set apellidos='Benjamin'
where id=3;

/*8.- Elevar el salario a $ 1,000 a todos los empleados que tengan un salario menor a esa cantidad*/
update HR.Mis_Empleados
set salario=1000
where &salario >salario;

/*9.- Eliminar el registro del empleado Mar�a Castro*/
delete from HR.Mis_Empleados
	where id=2 ;

/*10.- Revisar los cambios echos*/

/*11.- Confirmar los cambios a la tabla*/

/*12.- Adicionar el siguiente registro a la tabla*/
insert into HR.Mis_Empleados(id,apellidos,nombre,codigo,salario)
	values (6,'Hurtado Gamboa','Ernesto','ehurtado',1400)

/*13.- Revisar la adicion realizada*/

/*14.- Crear un punto de restauraci�n intermedio para esta transacci�n */
BACKUP LOG

/*15.- Borrar los registros de la tabla MIS_EMPLEADOS*/
truncate table HR.Mis_Empleados ;
/*16 Revisar los cambios realizados*/

/*17.- Descartar los cambios hechos a la tabla sin descartar la �ltima adici�n hecha*/
ROLLBACK TO SAVEPOINT
/*18 Revisar nuevamente los registros de la tabla MIS_EMPLEADOS */

/*19 Confirmar todos los cambios hechos a la tabla MIS_EMPLEADOS. */

/*20.- Modificar el script del punto 4.4. a fin de que se genere autom�ticamente el CODIGO del empleado que lo conforman la primera letra de su nombre y la primera palabra de su apellido */
insert into HR.Mis_Empleados(id,apellidos,nombre,codigo,salario)
values (&id,apellidos,&nombre,&codigo,&salario)
select id,apellidos,nombre,codigo,salario
where id = SUBSTR(apellidos,1,1) and id =SUBSTR(nombre,1,1)

/*21 Adicionar el siguiente registro a la tabla a fin de corroborar el funcionamiento del script anterior */
insert into HR.Mis_Empleados(id,apellidos,nombre,codigo,salario)
	values (&id,apellidos,&nombre,&codigo,&salario)
	
/*22 Revisar los cambios realizados. Y finalmente confirmar todos los cambios hechos a la tabla MIS_EMPLEADOS.*/
COMMIT TRANSACTION ;