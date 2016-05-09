/*1*/
	
create table HR.Departamento (
 id numeric (7) not null primary key,
 nombre varchar(25) null
 )
/*2*/
insert into HR.Departamento (id,nombre)
	values (1,'Logistica')
/*3*/

create table HR.Empleados (
 id numeric (7)  null ,
 apellidos varchar(25) null,
 nombres varchar(25) null,
 dept_id numeric(7) null,

)


ALTER TABLE HR.Empleados  ADD CONSTRAINT empleados_despatamento_FK  FOREIGN KEY (dept_id) 
REFERENCES HR.Departamento (id)
/*4*/

create table HR.Empleados2 (
 employee_id numeric(7)  null ,
 first_name varchar(25) null,
 last_name varchar(25) null,
 salary numeric(7) null,
 department_id numeric(7)
)

/*5*/
go
revoke  select on object::HR.Empleados2 from lu
go

/**
CREATE LOGIN lu

      WITH PASSWORD = 'lu';

USE HumanResource 

CREATE USER lu FOR LOGIN lu

GO

GRANT SELECT ON HR.Empleados2 TO lu

GO
**/
/*6*/

insert into HR.Empleados2 (employee_id,first_name,last_name,salary,department_id)
	values (35,'Alberto','Fernandez',4500,10)
/*7*/


grant all   on object :: HR.Empleados2 from lu;

insert into HR.Empleados2(employee_id,first_name,last_name,salary,department_id)
	values (35,'Alberto','Fernandez',4500,10)

/*8*/
drop table HR.Empleados2 ;
